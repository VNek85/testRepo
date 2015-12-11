/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__DBUpgradeH__User__1387E197]') AND parent_object_id = OBJECT_ID(N'[dbo].[DBUpgradeHistory]'))
ALTER TABLE [dbo].[DBUpgradeHistory] DROP CONSTRAINT [DF__DBUpgradeH__User__1387E197]
GO
ALTER TABLE [dbo].[DBUpgradeHistory] ADD CONSTRAINT [DF__DBUpgradeH__User__1387E197] DEFAULT (suser_sname()) FOR [User]
GO
