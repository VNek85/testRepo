/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CH_FileName_FileId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Revisions]'))
ALTER TABLE [dbo].[Revisions] DROP CONSTRAINT [CH_FileName_FileId]
GO
ALTER TABLE [dbo].[Revisions] ADD CONSTRAINT [CH_FileName_FileId] CHECK (([FileId]<>(0)))
GO
