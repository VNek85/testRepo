/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
CREATE TABLE [dbo].[Roles] (
	[RoleID]			[uniqueidentifier]	 NOT NULL,
	[RoleName]			[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Description]		[nvarchar](512)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[TaskMask]			[nvarchar](32)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[RoleFlags]			[tinyint]			 NOT NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[Roles] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Roles] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Roles] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Roles] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Roles] TO [RSExecRole]
GO
