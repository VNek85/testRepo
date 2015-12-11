/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Keys]') AND type in (N'U'))
DROP TABLE [dbo].[Keys]
GO
CREATE TABLE [dbo].[Keys] (
	[MachineName]		[nvarchar](256)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[InstallationID]	[uniqueidentifier]	 NOT NULL,
	[InstanceName]		[nvarchar](32)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Client]			[int]				 NOT NULL,
	[PublicKey]			[image]				 NULL,
	[SymmetricKey]		[image]				 NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[Keys] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Keys] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Keys] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Keys] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Keys] TO [RSExecRole]
GO
