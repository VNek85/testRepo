/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChunkSegmentMapping]') AND type in (N'U'))
DROP TABLE [dbo].[ChunkSegmentMapping]
GO
CREATE TABLE [dbo].[ChunkSegmentMapping] (
	[ChunkId]				[uniqueidentifier]	 NOT NULL,
	[SegmentId]				[uniqueidentifier]	 NOT NULL,
	[StartByte]				[bigint]			 NOT NULL,
	[LogicalByteCount]		[int]				 NOT NULL,
	[ActualByteCount]		[int]				 NOT NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[ChunkSegmentMapping] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ChunkSegmentMapping] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ChunkSegmentMapping] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ChunkSegmentMapping] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ChunkSegmentMapping] TO [RSExecRole]
GO
