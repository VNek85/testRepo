/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Segment_SegmentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Segment]'))
ALTER TABLE [dbo].[Segment] DROP CONSTRAINT [DF_Segment_SegmentId]
GO
ALTER TABLE [dbo].[Segment] ADD CONSTRAINT [DF_Segment_SegmentId] DEFAULT (newsequentialid()) FOR [SegmentId]
GO
