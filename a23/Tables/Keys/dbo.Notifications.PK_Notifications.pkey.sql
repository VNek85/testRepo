/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Notifications]') AND name = N'PK_Notifications') 
ALTER TABLE [dbo].[Notifications] DROP CONSTRAINT [PK_Notifications]
GO
ALTER TABLE [dbo].[Notifications] ADD CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED ([NotificationID])
GO
