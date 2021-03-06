/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[JobHistory]') AND name = N'PK_JobHistory_Id') 
ALTER TABLE [dbo].[JobHistory] DROP CONSTRAINT [PK_JobHistory_Id]
GO
ALTER TABLE [dbo].[JobHistory] ADD CONSTRAINT [PK_JobHistory_Id] PRIMARY KEY CLUSTERED ([Id])
GO
