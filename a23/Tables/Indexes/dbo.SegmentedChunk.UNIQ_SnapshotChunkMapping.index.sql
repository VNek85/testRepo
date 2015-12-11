/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SegmentedChunk]') AND name = N'UNIQ_SnapshotChunkMapping') 
DROP INDEX [UNIQ_SnapshotChunkMapping] ON [dbo].[SegmentedChunk]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UNIQ_SnapshotChunkMapping] ON [dbo].[SegmentedChunk]([SnapshotDataId], [ChunkType], [ChunkName]) INCLUDE([ChunkFlags], [ChunkId]) ON [PRIMARY]
GO
