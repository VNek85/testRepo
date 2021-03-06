/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReplicationTasks_Revision2Disks_RevisionId_SourceDiskID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReplicationTasks]'))
ALTER TABLE [dbo].[ReplicationTasks] DROP CONSTRAINT [FK_ReplicationTasks_Revision2Disks_RevisionId_SourceDiskID]
GO
ALTER TABLE [dbo].[ReplicationTasks] ADD CONSTRAINT [FK_ReplicationTasks_Revision2Disks_RevisionId_SourceDiskID] FOREIGN KEY ([RevisionId], [SourceDiskID]) REFERENCES [dbo].[Revision2Disks] ([RevisionId], [DiskID])
GO
