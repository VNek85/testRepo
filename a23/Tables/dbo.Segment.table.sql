/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Segment]') AND type in (N'U'))
DROP TABLE [dbo].[Segment]
GO
CREATE TABLE [dbo].[Segment] (
	[SegmentId]		[uniqueidentifier]	 NOT NULL,
	[Content]		[varbinary](max)	 NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[Segment] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Segment] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Segment] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Segment] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Segment] TO [RSExecRole]
GO
