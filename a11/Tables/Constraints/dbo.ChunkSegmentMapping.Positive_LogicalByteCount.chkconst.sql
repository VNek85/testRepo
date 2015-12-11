/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Positive_LogicalByteCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChunkSegmentMapping]'))
ALTER TABLE [dbo].[ChunkSegmentMapping] DROP CONSTRAINT [Positive_LogicalByteCount]
GO
ALTER TABLE [dbo].[ChunkSegmentMapping] ADD CONSTRAINT [Positive_LogicalByteCount] CHECK (([LogicalByteCount]>=(0)))
GO
