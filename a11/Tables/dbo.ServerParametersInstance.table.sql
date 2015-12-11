/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerParametersInstance]') AND type in (N'U'))
DROP TABLE [dbo].[ServerParametersInstance]
GO
CREATE TABLE [dbo].[ServerParametersInstance] (
	[ServerParametersID]	[nvarchar](32)	 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[ParentID]				[nvarchar](32)	 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Path]					[nvarchar](425)	 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[CreateDate]			[datetime]		 NOT NULL,
	[ModifiedDate]			[datetime]		 NOT NULL,
	[Timeout]				[int]			 NOT NULL,
	[Expiration]			[datetime]		 NOT NULL,
	[ParametersValues]		[image]			 NOT NULL
) ON [PRIMARY]
GO
