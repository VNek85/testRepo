/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SegmentedChunk]') AND name = N'IX_ChunkId_SnapshotDataId') 
DROP INDEX [IX_ChunkId_SnapshotDataId] ON [dbo].[SegmentedChunk]
GO
CREATE NONCLUSTERED INDEX [IX_ChunkId_SnapshotDataId] ON [dbo].[SegmentedChunk]([ChunkId], [SnapshotDataId]) ON [PRIMARY]
GO
