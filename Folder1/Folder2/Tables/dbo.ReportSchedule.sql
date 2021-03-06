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
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[ReportSchedule_Schedule] ON [dbo].[ReportSchedule]
AFTER DELETE
AS

-- if the deleted row is the last connection between a schedule and a report delete the schedule
-- as long as the schedule is not a shared schedule (type == 0)
delete [Schedule] from 
    [Schedule] S inner join deleted D on S.[ScheduleID] = D.[ScheduleID] 
where
    S.[Type] != 0 and
    not exists (select * from [ReportSchedule] R where S.[ScheduleID] = R.[ScheduleID])
GO
ALTER TABLE [dbo].[ReportSchedule] WITH NOCHECK ADD CONSTRAINT [FK_ReportSchedule_Subscriptions] FOREIGN KEY ([SubscriptionID]) REFERENCES [dbo].[Subscriptions] ([SubscriptionID]) NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[ReportSchedule] NOCHECK CONSTRAINT [FK_ReportSchedule_Subscriptions]
GO
ALTER TABLE [dbo].[ReportSchedule] ADD CONSTRAINT [FK_ReportSchedule_Schedule] FOREIGN KEY ([ScheduleID]) REFERENCES [dbo].[Schedule] ([ScheduleID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReportSchedule] ADD CONSTRAINT [FK_ReportSchedule_Report] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[Catalog] ([ItemID]) ON DELETE CASCADE
GO
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_SubscriptionID] ON [dbo].[ReportSchedule]([SubscriptionID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_ScheduleID] ON [dbo].[ReportSchedule]([ScheduleID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_ReportID] ON [dbo].[ReportSchedule]([ReportID]) ON [PRIMARY]
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
