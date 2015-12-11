/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DBUpgradeHistory]') AND name = N'PK_DBUpgradeHistory') 
ALTER TABLE [dbo].[DBUpgradeHistory] DROP CONSTRAINT [PK_DBUpgradeHistory]
GO
ALTER TABLE [dbo].[DBUpgradeHistory] ADD CONSTRAINT [PK_DBUpgradeHistory] PRIMARY KEY CLUSTERED ([UpgradeID] DESC)
GO
