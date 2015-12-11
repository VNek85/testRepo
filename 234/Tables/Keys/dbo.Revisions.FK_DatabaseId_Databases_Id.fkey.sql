/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DatabaseId_Databases_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Revisions]'))
ALTER TABLE [dbo].[Revisions] DROP CONSTRAINT [FK_DatabaseId_Databases_Id]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DatabaseId_Databases_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Revisions]'))
ALTER TABLE [dbo].[Revisions] DROP CONSTRAINT [FK_DatabaseId_Databases_Id]
GO
