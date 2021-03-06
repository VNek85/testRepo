/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SQLServers]') AND name = N'PK_SQLServers_Id') 
ALTER TABLE [dbo].[SQLServers] DROP CONSTRAINT [PK_SQLServers_Id]
GO
ALTER TABLE [dbo].[SQLServers] ADD CONSTRAINT [PK_SQLServers_Id] PRIMARY KEY CLUSTERED ([Id])
GO
