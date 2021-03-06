/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Revision2Disks]') AND name = N'UQ_Revision2Disks_RevisionId_DiskID') 
ALTER TABLE [dbo].[Revision2Disks] DROP CONSTRAINT [UQ_Revision2Disks_RevisionId_DiskID]
GO
ALTER TABLE [dbo].[Revision2Disks] ADD CONSTRAINT [UQ_Revision2Disks_RevisionId_DiskID] UNIQUE NONCLUSTERED ([RevisionId], [DiskID])
GO
