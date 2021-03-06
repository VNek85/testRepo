/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSource]') AND type in (N'U'))
DROP TABLE [dbo].[DataSource]
GO
CREATE TABLE [dbo].[DataSource] (
	[DSID]										[uniqueidentifier]	 NOT NULL,
	[ItemID]									[uniqueidentifier]	 NULL,
	[SubscriptionID]							[uniqueidentifier]	 NULL,
	[Name]										[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Extension]									[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Link]										[uniqueidentifier]	 NULL,
	[CredentialRetrieval]						[int]				 NULL,
	[Prompt]									[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ConnectionString]							[image]				 NULL,
	[OriginalConnectionString]					[image]				 NULL,
	[OriginalConnectStringExpressionBased]		[bit]				 NULL,
	[UserName]									[image]				 NULL,
	[Password]									[image]				 NULL,
	[Flags]										[int]				 NULL,
	[Version]									[int]				 NOT NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[DataSource] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[DataSource] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[DataSource] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[DataSource] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[DataSource] TO [RSExecRole]
GO
