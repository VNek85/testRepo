/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReportSchedule]') AND type in (N'U'))
DROP TABLE [dbo].[ReportSchedule]
GO
CREATE TABLE [dbo].[ReportSchedule] (
	[ScheduleID]		[uniqueidentifier]	 NOT NULL,
	[ReportID]			[uniqueidentifier]	 NOT NULL,
	[SubscriptionID]	[uniqueidentifier]	 NULL,
	[ReportAction]		[int]				 NOT NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[ReportSchedule] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ReportSchedule] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ReportSchedule] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ReportSchedule] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ReportSchedule] TO [RSExecRole]
GO
