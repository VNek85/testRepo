/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerUpgradeHistory]') AND type in (N'U'))
DROP TABLE [dbo].[ServerUpgradeHistory]
GO
CREATE TABLE [dbo].[ServerUpgradeHistory] (
	[UpgradeID]			[bigint]		 IDENTITY(1, 1) NOT NULL,
	[ServerVersion]		[nvarchar](25)	 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[User]				[nvarchar](128)	 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DateTime]			[datetime]		 NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[ServerUpgradeHistory] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ServerUpgradeHistory] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ServerUpgradeHistory] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ServerUpgradeHistory] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ServerUpgradeHistory] TO [RSExecRole]
GO
