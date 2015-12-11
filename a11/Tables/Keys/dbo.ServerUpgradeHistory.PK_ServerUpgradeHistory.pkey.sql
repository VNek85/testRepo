/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ServerUpgradeHistory]') AND name = N'PK_ServerUpgradeHistory') 
ALTER TABLE [dbo].[ServerUpgradeHistory] DROP CONSTRAINT [PK_ServerUpgradeHistory]
GO
ALTER TABLE [dbo].[ServerUpgradeHistory] ADD CONSTRAINT [PK_ServerUpgradeHistory] PRIMARY KEY CLUSTERED ([UpgradeID] DESC)
GO
