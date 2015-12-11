/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModelDrill]') AND type in (N'U'))
DROP TABLE [dbo].[ModelDrill]
GO
CREATE TABLE [dbo].[ModelDrill] (
	[ModelDrillID]		[uniqueidentifier]	 NOT NULL,
	[ModelID]			[uniqueidentifier]	 NOT NULL,
	[ReportID]			[uniqueidentifier]	 NOT NULL,
	[ModelItemID]		[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Type]				[tinyint]			 NOT NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[ModelDrill] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ModelDrill] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ModelDrill] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ModelDrill] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ModelDrill] TO [RSExecRole]
GO
