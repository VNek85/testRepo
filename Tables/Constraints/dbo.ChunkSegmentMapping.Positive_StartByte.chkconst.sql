/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Positive_StartByte]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChunkSegmentMapping]'))
ALTER TABLE [dbo].[ChunkSegmentMapping] DROP CONSTRAINT [Positive_StartByte]
GO
ALTER TABLE [dbo].[ChunkSegmentMapping] ADD CONSTRAINT [Positive_StartByte] CHECK (([StartByte]>=(0)))
GO
