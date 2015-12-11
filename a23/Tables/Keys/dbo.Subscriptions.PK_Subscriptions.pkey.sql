/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Subscriptions]') AND name = N'PK_Subscriptions') 
ALTER TABLE [dbo].[Subscriptions] DROP CONSTRAINT [PK_Subscriptions]
GO
ALTER TABLE [dbo].[Subscriptions] ADD CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED ([SubscriptionID])
GO
