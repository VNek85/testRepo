/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SubscriptionsBeingDeleted]') AND name = N'PK_SubscriptionsBeingDeleted') 
ALTER TABLE [dbo].[SubscriptionsBeingDeleted] DROP CONSTRAINT [PK_SubscriptionsBeingDeleted]
GO
ALTER TABLE [dbo].[SubscriptionsBeingDeleted] ADD CONSTRAINT [PK_SubscriptionsBeingDeleted] PRIMARY KEY CLUSTERED ([SubscriptionID])
GO
