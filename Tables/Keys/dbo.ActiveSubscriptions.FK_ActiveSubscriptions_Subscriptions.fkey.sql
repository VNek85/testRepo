/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActiveSubscriptions_Subscriptions]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActiveSubscriptions]'))
ALTER TABLE [dbo].[ActiveSubscriptions] DROP CONSTRAINT [FK_ActiveSubscriptions_Subscriptions]
GO
ALTER TABLE [dbo].[ActiveSubscriptions] WITH NOCHECK ADD CONSTRAINT [FK_ActiveSubscriptions_Subscriptions] FOREIGN KEY ([SubscriptionID]) REFERENCES [dbo].[Subscriptions] ([SubscriptionID]) ON DELETE CASCADE
GO
