/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
ALTER TABLE [dbo].[LockObjects] ADD CONSTRAINT [UQ_LockObjects_1] UNIQUE NONCLUSTERED ([RevisionId], [DiskId], [Operation])
GO
