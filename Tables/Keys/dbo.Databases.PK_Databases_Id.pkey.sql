/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Databases]') AND name = N'PK_Databases_Id') 
ALTER TABLE [dbo].[Databases] DROP CONSTRAINT [PK_Databases_Id]
GO
ALTER TABLE [dbo].[Databases] ADD CONSTRAINT [PK_Databases_Id] PRIMARY KEY CLUSTERED ([Id])
GO
