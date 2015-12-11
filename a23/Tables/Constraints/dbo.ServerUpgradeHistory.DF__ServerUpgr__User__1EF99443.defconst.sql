/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ServerUpgr__User__1EF99443]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerUpgradeHistory]'))
ALTER TABLE [dbo].[ServerUpgradeHistory] DROP CONSTRAINT [DF__ServerUpgr__User__1EF99443]
GO
ALTER TABLE [dbo].[ServerUpgradeHistory] ADD CONSTRAINT [DF__ServerUpgr__User__1EF99443] DEFAULT (suser_sname()) FOR [User]
GO
