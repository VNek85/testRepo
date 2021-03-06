/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subscriptions]') AND type in (N'U'))
DROP TABLE [dbo].[Subscriptions]
GO
CREATE TABLE [dbo].[Subscriptions] (
	[SubscriptionID]		[uniqueidentifier]	 NOT NULL,
	[OwnerID]				[uniqueidentifier]	 NOT NULL,
	[Report_OID]			[uniqueidentifier]	 NOT NULL,
	[Locale]				[nvarchar](128)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[InactiveFlags]			[int]				 NOT NULL,
	[ExtensionSettings]		[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ModifiedByID]			[uniqueidentifier]	 NOT NULL,
	[ModifiedDate]			[datetime]			 NOT NULL,
	[Description]			[nvarchar](512)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[LastStatus]			[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[EventType]				[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[MatchData]				[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[LastRunTime]			[datetime]			 NULL,
	[Parameters]			[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DataSettings]			[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DeliveryExtension]		[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Version]				[int]				 NOT NULL,
	[ReportZone]			[int]				 NOT NULL CONSTRAINT [DF__Subscript__Repor__16644E42] DEFAULT ((0)),
	CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED ([SubscriptionID])
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[Subscription_delete_Schedule] ON [dbo].[Subscriptions] 
AFTER DELETE 
AS
    delete ReportSchedule from ReportSchedule RS inner join deleted D on RS.SubscriptionID = D.SubscriptionID
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- end session tables
CREATE TRIGGER [dbo].[Subscription_delete_DataSource] ON [dbo].[Subscriptions]
AFTER DELETE 
AS
    delete DataSource from DataSource DS inner join deleted D on DS.SubscriptionID = D.SubscriptionID
GO
ALTER TABLE [dbo].[Subscriptions] WITH NOCHECK ADD CONSTRAINT [FK_Subscriptions_Owner] FOREIGN KEY ([OwnerID]) REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Subscriptions] WITH NOCHECK ADD CONSTRAINT [FK_Subscriptions_ModifiedBy] FOREIGN KEY ([ModifiedByID]) REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Subscriptions] WITH NOCHECK ADD CONSTRAINT [FK_Subscriptions_Catalog] FOREIGN KEY ([Report_OID]) REFERENCES [dbo].[Catalog] ([ItemID]) ON DELETE CASCADE NOT FOR REPLICATION
GO
GRANT DELETE ON [dbo].[Subscriptions] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Subscriptions] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Subscriptions] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Subscriptions] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Subscriptions] TO [RSExecRole]
GO
