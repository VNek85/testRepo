/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CachePolicy]') AND type in (N'U'))
DROP TABLE [dbo].[CachePolicy]
GO
CREATE TABLE [dbo].[CachePolicy] (
	[CachePolicyID]			[uniqueidentifier]	 NOT NULL,
	[ReportID]				[uniqueidentifier]	 NOT NULL,
	[ExpirationFlags]		[int]				 NOT NULL,
	[CacheExpiration]		[int]				 NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[CachePolicy] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[CachePolicy] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[CachePolicy] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[CachePolicy] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[CachePolicy] TO [RSExecRole]
GO
