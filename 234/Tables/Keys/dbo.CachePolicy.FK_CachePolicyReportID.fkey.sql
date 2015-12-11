/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CachePolicyReportID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CachePolicy]'))
ALTER TABLE [dbo].[CachePolicy] DROP CONSTRAINT [FK_CachePolicyReportID]
GO
