/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Revisions]') AND name = N'PK_Revisions_Id') 
ALTER TABLE [dbo].[Revisions] DROP CONSTRAINT [PK_Revisions_Id]
GO
ALTER TABLE [dbo].[Revisions] ADD CONSTRAINT [PK_Revisions_Id] PRIMARY KEY CLUSTERED ([Id])
GO
