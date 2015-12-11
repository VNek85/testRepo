/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[History]') AND name = N'IX_SnapshotDataID') 
DROP INDEX [IX_SnapshotDataID] ON [dbo].[History]
GO
CREATE NONCLUSTERED INDEX [IX_SnapshotDataID] ON [dbo].[History]([SnapshotDataID]) ON [PRIMARY]
GO
