/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UpgradeInfo]') AND name = N'PK_UpgradeInfo') 
ALTER TABLE [dbo].[UpgradeInfo] DROP CONSTRAINT [PK_UpgradeInfo]
GO
ALTER TABLE [dbo].[UpgradeInfo] ADD CONSTRAINT [PK_UpgradeInfo] PRIMARY KEY CLUSTERED ([Item])
GO
