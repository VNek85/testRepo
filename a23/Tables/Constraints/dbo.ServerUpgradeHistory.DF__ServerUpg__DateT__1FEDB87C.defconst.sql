/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ServerUpg__DateT__1FEDB87C]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServerUpgradeHistory]'))
ALTER TABLE [dbo].[ServerUpgradeHistory] DROP CONSTRAINT [DF__ServerUpg__DateT__1FEDB87C]
GO
ALTER TABLE [dbo].[ServerUpgradeHistory] ADD CONSTRAINT [DF__ServerUpg__DateT__1FEDB87C] DEFAULT (getdate()) FOR [DateTime]
GO
