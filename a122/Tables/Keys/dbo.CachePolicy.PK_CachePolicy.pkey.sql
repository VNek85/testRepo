/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CachePolicy]') AND name = N'PK_CachePolicy') 
ALTER TABLE [dbo].[CachePolicy] DROP CONSTRAINT [PK_CachePolicy]
GO
ALTER TABLE [dbo].[CachePolicy] ADD CONSTRAINT [PK_CachePolicy] PRIMARY KEY NONCLUSTERED ([CachePolicyID])
GO
