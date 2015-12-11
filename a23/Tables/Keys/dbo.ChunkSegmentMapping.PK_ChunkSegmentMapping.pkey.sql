/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ChunkSegmentMapping]') AND name = N'PK_ChunkSegmentMapping') 
ALTER TABLE [dbo].[ChunkSegmentMapping] DROP CONSTRAINT [PK_ChunkSegmentMapping]
GO
ALTER TABLE [dbo].[ChunkSegmentMapping] ADD CONSTRAINT [PK_ChunkSegmentMapping] PRIMARY KEY CLUSTERED ([ChunkId], [SegmentId])
GO
