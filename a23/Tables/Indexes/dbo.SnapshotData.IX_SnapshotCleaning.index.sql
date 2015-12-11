/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SnapshotData]') AND name = N'IX_SnapshotCleaning') 
DROP INDEX [IX_SnapshotCleaning] ON [dbo].[SnapshotData]
GO
CREATE NONCLUSTERED INDEX [IX_SnapshotCleaning] ON [dbo].[SnapshotData]([PermanentRefcount]) ON [PRIMARY]
GO
