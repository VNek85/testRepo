/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Servers]') AND name = N'PK_Servers_Id') 
ALTER TABLE [dbo].[Servers] DROP CONSTRAINT [PK_Servers_Id]
GO
ALTER TABLE [dbo].[Servers] ADD CONSTRAINT [PK_Servers_Id] PRIMARY KEY CLUSTERED ([Id])
GO
