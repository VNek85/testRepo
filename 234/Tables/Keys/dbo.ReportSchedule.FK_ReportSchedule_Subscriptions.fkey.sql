/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportSchedule_Subscriptions]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportSchedule]'))
ALTER TABLE [dbo].[ReportSchedule] DROP CONSTRAINT [FK_ReportSchedule_Subscriptions]
GO
ALTER TABLE [dbo].[ReportSchedule] WITH NOCHECK ADD CONSTRAINT [FK_ReportSchedule_Subscriptions] FOREIGN KEY ([SubscriptionID]) REFERENCES [dbo].[Subscriptions] ([SubscriptionID]) NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[ReportSchedule] NOCHECK CONSTRAINT [FK_ReportSchedule_Subscriptions]
GO
