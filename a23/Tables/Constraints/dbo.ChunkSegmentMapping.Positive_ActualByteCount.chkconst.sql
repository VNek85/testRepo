/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Positive_ActualByteCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChunkSegmentMapping]'))
ALTER TABLE [dbo].[ChunkSegmentMapping] DROP CONSTRAINT [Positive_ActualByteCount]
GO
ALTER TABLE [dbo].[ChunkSegmentMapping] ADD CONSTRAINT [Positive_ActualByteCount] CHECK (([ActualByteCount]>=(0)))
GO
