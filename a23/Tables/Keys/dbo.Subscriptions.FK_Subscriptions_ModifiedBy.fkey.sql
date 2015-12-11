/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Subscriptions_ModifiedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Subscriptions]'))
ALTER TABLE [dbo].[Subscriptions] DROP CONSTRAINT [FK_Subscriptions_ModifiedBy]
GO
ALTER TABLE [dbo].[Subscriptions] WITH NOCHECK ADD CONSTRAINT [FK_Subscriptions_ModifiedBy] FOREIGN KEY ([ModifiedByID]) REFERENCES [dbo].[Users] ([UserID])
GO
