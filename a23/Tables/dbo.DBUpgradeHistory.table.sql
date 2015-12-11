/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DBUpgradeHistory]') AND type in (N'U'))
DROP TABLE [dbo].[DBUpgradeHistory]
GO
CREATE TABLE [dbo].[DBUpgradeHistory] (
	[UpgradeID]		[bigint]		 IDENTITY(1, 1) NOT NULL,
	[DbVersion]		[nvarchar](25)	 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[User]			[nvarchar](128)	 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DateTime]		[datetime]		 NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[DBUpgradeHistory] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[DBUpgradeHistory] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[DBUpgradeHistory] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[DBUpgradeHistory] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[DBUpgradeHistory] TO [RSExecRole]
GO
