/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policies]') AND type in (N'U'))
DROP TABLE [dbo].[Policies]
GO
CREATE TABLE [dbo].[Policies] (
	[PolicyID]		[uniqueidentifier]	 NOT NULL,
	[PolicyFlag]	[tinyint]			 NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[Policies] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Policies] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Policies] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Policies] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Policies] TO [RSExecRole]
GO
