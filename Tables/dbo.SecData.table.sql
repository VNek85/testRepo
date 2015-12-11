/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecData]') AND type in (N'U'))
DROP TABLE [dbo].[SecData]
GO
CREATE TABLE [dbo].[SecData] (
	[SecDataID]				[uniqueidentifier]	 NOT NULL,
	[PolicyID]				[uniqueidentifier]	 NOT NULL,
	[AuthType]				[int]				 NOT NULL,
	[XmlDescription]		[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[NtSecDescPrimary]		[image]				 NOT NULL,
	[NtSecDescSecondary]	[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[SecData] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[SecData] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[SecData] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[SecData] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[SecData] TO [RSExecRole]
GO
