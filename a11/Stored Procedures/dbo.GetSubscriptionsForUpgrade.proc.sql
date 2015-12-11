/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSubscriptionsForUpgrade]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSubscriptionsForUpgrade]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSubscriptionsForUpgrade]
@CurrentVersion int
AS
SELECT 
    [SubscriptionID]
FROM 
    [Subscriptions]
WHERE
    [Version] != @CurrentVersion
GO
GRANT EXECUTE ON [dbo].[GetSubscriptionsForUpgrade] TO [RSExecRole]
GO
