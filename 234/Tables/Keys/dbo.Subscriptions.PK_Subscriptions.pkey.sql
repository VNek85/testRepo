/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
ALTER TABLE [dbo].[Subscriptions] ADD CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED ([SubscriptionID])
GO
