/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Revision2Disks]') AND name = N'PK_Revision2Disks_Id') 
ALTER TABLE [dbo].[Revision2Disks] DROP CONSTRAINT [PK_Revision2Disks_Id]
GO
ALTER TABLE [dbo].[Revision2Disks] ADD CONSTRAINT [PK_Revision2Disks_Id] PRIMARY KEY CLUSTERED ([Id])
GO
