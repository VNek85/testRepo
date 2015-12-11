/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SegmentedChunk]') AND name = N'PK_SegmentedChunk') 
ALTER TABLE [dbo].[SegmentedChunk] DROP CONSTRAINT [PK_SegmentedChunk]
GO
ALTER TABLE [dbo].[SegmentedChunk] ADD CONSTRAINT [PK_SegmentedChunk] PRIMARY KEY CLUSTERED ([SegmentedChunkId])
GO
