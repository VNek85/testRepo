/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Notifications]') AND type in (N'U'))
DROP TABLE [dbo].[Notifications]
GO
CREATE TABLE [dbo].[Notifications] (
	[NotificationID]				[uniqueidentifier]	 NOT NULL,
	[SubscriptionID]				[uniqueidentifier]	 NOT NULL,
	[ActivationID]					[uniqueidentifier]	 NULL,
	[ReportID]						[uniqueidentifier]	 NOT NULL,
	[SnapShotDate]					[datetime]			 NULL,
	[ExtensionSettings]				[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Locale]						[nvarchar](128)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Parameters]					[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ProcessStart]					[datetime]			 NULL,
	[NotificationEntered]			[datetime]			 NOT NULL,
	[ProcessAfter]					[datetime]			 NULL,
	[Attempt]						[int]				 NULL,
	[SubscriptionLastRunTime]		[datetime]			 NOT NULL,
	[DeliveryExtension]				[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[SubscriptionOwnerID]			[uniqueidentifier]	 NOT NULL,
	[IsDataDriven]					[bit]				 NOT NULL,
	[BatchID]						[uniqueidentifier]	 NULL,
	[ProcessHeartbeat]				[datetime]			 NULL,
	[Version]						[int]				 NOT NULL,
	[ReportZone]					[int]				 NOT NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[Notifications] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Notifications] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Notifications] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Notifications] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Notifications] TO [RSExecRole]
GO
