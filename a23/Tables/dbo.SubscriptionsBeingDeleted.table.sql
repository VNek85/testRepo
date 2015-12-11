/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubscriptionsBeingDeleted]') AND type in (N'U'))
DROP TABLE [dbo].[SubscriptionsBeingDeleted]
GO
CREATE TABLE [dbo].[SubscriptionsBeingDeleted] (
	[SubscriptionID]	[uniqueidentifier]	 NOT NULL,
	[CreationDate]		[datetime]			 NOT NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[SubscriptionsBeingDeleted] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[SubscriptionsBeingDeleted] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[SubscriptionsBeingDeleted] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[SubscriptionsBeingDeleted] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[SubscriptionsBeingDeleted] TO [RSExecRole]
GO
