/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Notificat__Repor__1758727B]') AND parent_object_id = OBJECT_ID(N'[dbo].[Notifications]'))
ALTER TABLE [dbo].[Notifications] DROP CONSTRAINT [DF__Notificat__Repor__1758727B]
GO
ALTER TABLE [dbo].[Notifications] ADD CONSTRAINT [DF__Notificat__Repor__1758727B] DEFAULT ((0)) FOR [ReportZone]
GO
