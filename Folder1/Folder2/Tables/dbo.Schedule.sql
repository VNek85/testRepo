/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule]') AND type in (N'U'))
DROP TABLE [dbo].[Schedule]
GO
CREATE TABLE [dbo].[Schedule] (
	[ScheduleID]				[uniqueidentifier]	 NOT NULL,
	[Name]						[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[StartDate]					[datetime]			 NOT NULL,
	[Flags]						[int]				 NOT NULL,
	[NextRunTime]				[datetime]			 NULL,
	[LastRunTime]				[datetime]			 NULL,
	[EndDate]					[datetime]			 NULL,
	[RecurrenceType]			[int]				 NULL,
	[MinutesInterval]			[int]				 NULL,
	[DaysInterval]				[int]				 NULL,
	[WeeksInterval]				[int]				 NULL,
	[DaysOfWeek]				[int]				 NULL,
	[DaysOfMonth]				[int]				 NULL,
	[Month]						[int]				 NULL,
	[MonthlyWeek]				[int]				 NULL,
	[State]						[int]				 NULL,
	[LastRunStatus]				[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ScheduledRunTimeout]		[int]				 NULL,
	[CreatedById]				[uniqueidentifier]	 NOT NULL,
	[EventType]					[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[EventData]					[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Type]						[int]				 NOT NULL,
	[ConsistancyCheck]			[datetime]			 NULL,
	[Path]						[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	CONSTRAINT [PK_ScheduleID] PRIMARY KEY CLUSTERED ([ScheduleID]),
	CONSTRAINT [IX_Schedule] UNIQUE NONCLUSTERED ([Name], [Path])
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[Schedule_UpdateExpiration] ON [dbo].[Schedule]  
AFTER UPDATE
AS 
UPDATE
   EC
SET
   AbsoluteExpiration = I.NextRunTime
FROM
   [ReportServerTempDB].dbo.ExecutionCache AS EC
   INNER JOIN ReportSchedule AS RS ON EC.ReportID = RS.ReportID
   INNER JOIN inserted AS I ON RS.ScheduleID = I.ScheduleID AND RS.ReportAction = 3
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[Schedule_DeleteAgentJob] ON [dbo].[Schedule]  
AFTER DELETE
AS 
DECLARE id_cursor CURSOR
FOR
    SELECT ScheduleID from deleted
OPEN id_cursor

DECLARE @next_id uniqueidentifier
FETCH NEXT FROM id_cursor INTO @next_id
WHILE (@@FETCH_STATUS <> -1) -- -1 == FETCH statement failed or the row was beyond the result set.
BEGIN
    if (@@FETCH_STATUS <> -2) -- - 2 == Row fetched is missing.
    BEGIN
        exec msdb.dbo.sp_delete_job @job_name = @next_id -- delete the schedule
    END
    FETCH NEXT FROM id_cursor INTO @next_id
END
CLOSE id_cursor
DEALLOCATE id_cursor
GO
ALTER TABLE [dbo].[Schedule] WITH NOCHECK ADD CONSTRAINT [FK_Schedule_Users] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([UserID])
GO
GRANT DELETE ON [dbo].[Schedule] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Schedule] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Schedule] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Schedule] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Schedule] TO [RSExecRole]
GO
