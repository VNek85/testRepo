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
	[Path]						[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]
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
