/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Catalog]') AND type in (N'U'))
DROP TABLE [dbo].[Catalog]
GO
CREATE TABLE [dbo].[Catalog] (
	[ItemID]			[uniqueidentifier]	 NOT NULL,
	[Path]				[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Name]				[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[ParentID]			[uniqueidentifier]	 NULL,
	[Type]				[int]				 NOT NULL,
	[Content]			[image]				 NULL,
	[Intermediate]		[uniqueidentifier]	 NULL,
	[SnapshotDataID]	[uniqueidentifier]	 NULL,
	[LinkSourceID]		[uniqueidentifier]	 NULL,
	[Property]			[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Description]		[nvarchar](512)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Hidden]			[bit]				 NULL,
	[CreatedByID]		[uniqueidentifier]	 NOT NULL,
	[CreationDate]		[datetime]			 NOT NULL,
	[ModifiedByID]		[uniqueidentifier]	 NOT NULL,
	[ModifiedDate]		[datetime]			 NOT NULL,
	[MimeType]			[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[SnapshotLimit]		[int]				 NULL,
	[Parameter]			[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[PolicyID]			[uniqueidentifier]	 NOT NULL,
	[PolicyRoot]		[bit]				 NOT NULL,
	[ExecutionFlag]		[int]				 NOT NULL,
	[ExecutionTime]		[datetime]			 NULL,
	[SubType]			[nvarchar](128)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ComponentID]		[uniqueidentifier]	 NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[Catalog] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Catalog] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Catalog] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Catalog] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Catalog] TO [RSExecRole]
GO
