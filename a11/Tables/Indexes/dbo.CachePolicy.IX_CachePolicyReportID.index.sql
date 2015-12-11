/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CachePolicy]') AND name = N'IX_CachePolicyReportID') 
DROP INDEX [IX_CachePolicyReportID] ON [dbo].[CachePolicy]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_CachePolicyReportID] ON [dbo].[CachePolicy]([ReportID]) ON [PRIMARY]
GO
