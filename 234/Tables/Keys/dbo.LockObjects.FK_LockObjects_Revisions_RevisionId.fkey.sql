/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LockObjects_Revisions_RevisionId]') AND parent_object_id = OBJECT_ID(N'[dbo].[LockObjects]'))
ALTER TABLE [dbo].[LockObjects] DROP CONSTRAINT [FK_LockObjects_Revisions_RevisionId]
GO
ALTER TABLE [dbo].[LockObjects] ADD CONSTRAINT [FK_LockObjects_Revisions_RevisionId] FOREIGN KEY ([RevisionId]) REFERENCES [dbo].[Revisions] ([RevisionId])
GO
