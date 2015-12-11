/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_SegmentedChunk_ChunkId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SegmentedChunk]'))
ALTER TABLE [dbo].[SegmentedChunk] DROP CONSTRAINT [DF_SegmentedChunk_ChunkId]
GO
ALTER TABLE [dbo].[SegmentedChunk] ADD CONSTRAINT [DF_SegmentedChunk_ChunkId] DEFAULT (newsequentialid()) FOR [ChunkId]
GO
