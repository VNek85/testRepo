/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Segment]') AND name = N'IX_SegmentMetadata') 
DROP INDEX [IX_SegmentMetadata] ON [dbo].[Segment]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SegmentMetadata] ON [dbo].[Segment]([SegmentId]) ON [PRIMARY]
GO
