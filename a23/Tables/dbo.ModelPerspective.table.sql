/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModelPerspective]') AND type in (N'U'))
DROP TABLE [dbo].[ModelPerspective]
GO
CREATE TABLE [dbo].[ModelPerspective] (
	[ID]						[uniqueidentifier]	 NOT NULL,
	[ModelID]					[uniqueidentifier]	 NOT NULL,
	[PerspectiveID]				[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[PerspectiveName]			[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[PerspectiveDescription]	[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[ModelPerspective] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ModelPerspective] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ModelPerspective] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ModelPerspective] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ModelPerspective] TO [RSExecRole]
GO
