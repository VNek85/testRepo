/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChunkData]') AND type in (N'U'))
DROP TABLE [dbo].[ChunkData]
GO
CREATE TABLE [dbo].[ChunkData] (
	[ChunkID]			[uniqueidentifier]	 NOT NULL,
	[SnapshotDataID]	[uniqueidentifier]	 NOT NULL,
	[ChunkFlags]		[tinyint]			 NULL,
	[ChunkName]			[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ChunkType]			[int]				 NULL,
	[Version]			[smallint]			 NULL,
	[MimeType]			[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Content]			[image]				 NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[ChunkData] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ChunkData] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ChunkData] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ChunkData] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ChunkData] TO [RSExecRole]
GO
