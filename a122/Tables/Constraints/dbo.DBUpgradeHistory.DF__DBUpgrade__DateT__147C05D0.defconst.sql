/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__DBUpgrade__DateT__147C05D0]') AND parent_object_id = OBJECT_ID(N'[dbo].[DBUpgradeHistory]'))
ALTER TABLE [dbo].[DBUpgradeHistory] DROP CONSTRAINT [DF__DBUpgrade__DateT__147C05D0]
GO
ALTER TABLE [dbo].[DBUpgradeHistory] ADD CONSTRAINT [DF__DBUpgrade__DateT__147C05D0] DEFAULT (getdate()) FOR [DateTime]
GO
