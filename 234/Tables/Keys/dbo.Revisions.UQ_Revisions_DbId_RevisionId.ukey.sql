/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
ALTER TABLE [dbo].[Revisions] ADD CONSTRAINT [UQ_Revisions_DbId_RevisionId] UNIQUE NONCLUSTERED ([DatabaseId], [RevisionId])
GO
