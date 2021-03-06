/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
CREATE TABLE [dbo].[Users] (
	[UserID]		[uniqueidentifier]	 NOT NULL,
	[Sid]			[varbinary](85)		 NULL,
	[UserType]		[int]				 NOT NULL,
	[AuthType]		[int]				 NOT NULL,
	[UserName]		[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[Users] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Users] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Users] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Users] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Users] TO [RSExecRole]
GO
