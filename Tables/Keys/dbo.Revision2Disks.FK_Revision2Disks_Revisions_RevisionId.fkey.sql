/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Revision2Disks_Revisions_RevisionId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Revision2Disks]'))
ALTER TABLE [dbo].[Revision2Disks] DROP CONSTRAINT [FK_Revision2Disks_Revisions_RevisionId]
GO
ALTER TABLE [dbo].[Revision2Disks] ADD CONSTRAINT [FK_Revision2Disks_Revisions_RevisionId] FOREIGN KEY ([RevisionId]) REFERENCES [dbo].[Revisions] ([RevisionId])
GO
