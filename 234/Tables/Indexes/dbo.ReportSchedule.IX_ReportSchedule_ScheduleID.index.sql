/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ReportSchedule]') AND name = N'IX_ReportSchedule_ScheduleID') 
DROP INDEX [IX_ReportSchedule_ScheduleID] ON [dbo].[ReportSchedule]
GO
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_ScheduleID] ON [dbo].[ReportSchedule]([ScheduleID]) ON [PRIMARY]
GO
