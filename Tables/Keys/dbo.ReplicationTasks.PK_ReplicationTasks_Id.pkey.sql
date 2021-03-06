/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ReplicationTasks]') AND name = N'PK_ReplicationTasks_Id') 
ALTER TABLE [dbo].[ReplicationTasks] DROP CONSTRAINT [PK_ReplicationTasks_Id]
GO
ALTER TABLE [dbo].[ReplicationTasks] ADD CONSTRAINT [PK_ReplicationTasks_Id] PRIMARY KEY CLUSTERED ([Id])
GO
