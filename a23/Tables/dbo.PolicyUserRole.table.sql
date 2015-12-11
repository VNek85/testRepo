/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyUserRole]') AND type in (N'U'))
DROP TABLE [dbo].[PolicyUserRole]
GO
CREATE TABLE [dbo].[PolicyUserRole] (
	[ID]			[uniqueidentifier]	 NOT NULL,
	[RoleID]		[uniqueidentifier]	 NOT NULL,
	[UserID]		[uniqueidentifier]	 NOT NULL,
	[PolicyID]		[uniqueidentifier]	 NOT NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[PolicyUserRole] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[PolicyUserRole] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[PolicyUserRole] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[PolicyUserRole] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[PolicyUserRole] TO [RSExecRole]
GO
