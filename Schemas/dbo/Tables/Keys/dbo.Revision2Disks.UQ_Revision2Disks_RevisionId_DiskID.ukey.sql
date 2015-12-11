/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
ALTER TABLE [dbo].[Revision2Disks] ADD CONSTRAINT [UQ_Revision2Disks_RevisionId_DiskID] UNIQUE NONCLUSTERED ([RevisionId], [DiskID])
GO
