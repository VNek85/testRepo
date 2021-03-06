/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[LockObjects]') AND name = N'UQ_LockObjects_1') 
ALTER TABLE [dbo].[LockObjects] DROP CONSTRAINT [UQ_LockObjects_1]
GO
ALTER TABLE [dbo].[LockObjects] ADD CONSTRAINT [UQ_LockObjects_1] UNIQUE NONCLUSTERED ([RevisionId], [DiskId], [Operation])
GO
