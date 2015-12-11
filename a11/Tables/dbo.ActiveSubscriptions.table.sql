/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActiveSubscriptions]') AND type in (N'U'))
DROP TABLE [dbo].[ActiveSubscriptions]
GO
CREATE TABLE [dbo].[ActiveSubscriptions] (
	[ActiveID]				[uniqueidentifier]	 NOT NULL,
	[SubscriptionID]		[uniqueidentifier]	 NOT NULL,
	[TotalNotifications]	[int]				 NULL,
	[TotalSuccesses]		[int]				 NOT NULL,
	[TotalFailures]			[int]				 NOT NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[ActiveSubscriptions] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ActiveSubscriptions] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ActiveSubscriptions] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ActiveSubscriptions] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ActiveSubscriptions] TO [RSExecRole]
GO
