/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetLinkID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSets]'))
ALTER TABLE [dbo].[DataSets] DROP CONSTRAINT [FK_DataSetLinkID]
GO
ALTER TABLE [dbo].[DataSets] WITH NOCHECK ADD CONSTRAINT [FK_DataSetLinkID] FOREIGN KEY ([LinkID]) REFERENCES [dbo].[Catalog] ([ItemID])
GO
