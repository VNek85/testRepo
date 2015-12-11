/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SnapshotData]') AND type in (N'U'))
DROP TABLE [dbo].[SnapshotData]
GO
CREATE TABLE [dbo].[SnapshotData] (
	[SnapshotDataID]		[uniqueidentifier]	 NOT NULL,
	[CreatedDate]			[datetime]			 NOT NULL,
	[ParamsHash]			[int]				 NULL,
	[QueryParams]			[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[EffectiveParams]		[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Description]			[nvarchar](512)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DependsOnUser]			[bit]				 NULL,
	[PermanentRefcount]		[int]				 NOT NULL,
	[TransientRefcount]		[int]				 NOT NULL,
	[ExpirationDate]		[datetime]			 NOT NULL,
	[PageCount]				[int]				 NULL,
	[HasDocMap]				[bit]				 NULL,
	[PaginationMode]		[smallint]			 NULL,
	[ProcessingFlags]		[int]				 NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[SnapshotData] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[SnapshotData] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[SnapshotData] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[SnapshotData] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[SnapshotData] TO [RSExecRole]
GO
