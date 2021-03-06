/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Catalog]') AND name = N'IX_SnapshotDataId') 
DROP INDEX [IX_SnapshotDataId] ON [dbo].[Catalog]
GO
CREATE NONCLUSTERED INDEX [IX_SnapshotDataId] ON [dbo].[Catalog]([SnapshotDataID]) ON [PRIMARY]
GO
