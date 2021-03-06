/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Subscription_delete_DataSource]')) 
DROP TRIGGER [dbo].[Subscription_delete_DataSource]
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
