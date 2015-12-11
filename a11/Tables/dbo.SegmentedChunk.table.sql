/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SegmentedChunk]') AND type in (N'U'))
DROP TABLE [dbo].[SegmentedChunk]
GO
CREATE TABLE [dbo].[SegmentedChunk] (
	[ChunkId]				[uniqueidentifier]	 NOT NULL,
	[SnapshotDataId]		[uniqueidentifier]	 NOT NULL,
	[ChunkFlags]			[tinyint]			 NOT NULL,
	[ChunkName]				[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[ChunkType]				[int]				 NOT NULL,
	[Version]				[smallint]			 NOT NULL,
	[MimeType]				[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[SegmentedChunkId]		[bigint]			 IDENTITY(1, 1) NOT NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[SegmentedChunk] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[SegmentedChunk] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[SegmentedChunk] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[SegmentedChunk] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[SegmentedChunk] TO [RSExecRole]
GO
