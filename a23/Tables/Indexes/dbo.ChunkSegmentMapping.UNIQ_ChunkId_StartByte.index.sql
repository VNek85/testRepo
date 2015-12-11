/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ChunkSegmentMapping]') AND name = N'UNIQ_ChunkId_StartByte') 
DROP INDEX [UNIQ_ChunkId_StartByte] ON [dbo].[ChunkSegmentMapping]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UNIQ_ChunkId_StartByte] ON [dbo].[ChunkSegmentMapping]([ChunkId], [StartByte]) INCLUDE([ActualByteCount], [LogicalByteCount]) ON [PRIMARY]
GO
