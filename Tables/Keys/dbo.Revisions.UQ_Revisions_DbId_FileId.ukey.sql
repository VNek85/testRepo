/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Revisions]') AND name = N'UQ_Revisions_DbId_FileId') 
ALTER TABLE [dbo].[Revisions] DROP CONSTRAINT [UQ_Revisions_DbId_FileId]
GO
ALTER TABLE [dbo].[Revisions] ADD CONSTRAINT [UQ_Revisions_DbId_FileId] UNIQUE NONCLUSTERED ([DatabaseId], [FileId])
GO
