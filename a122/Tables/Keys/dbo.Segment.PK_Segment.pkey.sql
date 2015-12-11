/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Segment]') AND name = N'PK_Segment') 
ALTER TABLE [dbo].[Segment] DROP CONSTRAINT [PK_Segment]
GO
ALTER TABLE [dbo].[Segment] ADD CONSTRAINT [PK_Segment] PRIMARY KEY CLUSTERED ([SegmentId])
GO
