/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[LockObjects]') AND name = N'PK_LockObjects') 
ALTER TABLE [dbo].[LockObjects] DROP CONSTRAINT [PK_LockObjects]
GO
ALTER TABLE [dbo].[LockObjects] ADD CONSTRAINT [PK_LockObjects] PRIMARY KEY CLUSTERED ([Id])
GO
