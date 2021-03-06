/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Revisions]') AND name = N'IX_Revisions_DatabaseId') 
DROP INDEX [IX_Revisions_DatabaseId] ON [dbo].[Revisions]
GO
CREATE NONCLUSTERED INDEX [IX_Revisions_DatabaseId] ON [dbo].[Revisions]([DatabaseId]) INCLUDE([RevisionId]) ON [PRIMARY]
GO
