/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetItemID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSets]'))
ALTER TABLE [dbo].[DataSets] DROP CONSTRAINT [FK_DataSetItemID]
GO
