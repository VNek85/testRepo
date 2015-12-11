/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveSubscriptionFromBeingDeleted]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RemoveSubscriptionFromBeingDeleted]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RemoveSubscriptionFromBeingDeleted] 
@SubscriptionID uniqueidentifier
AS
delete from [SubscriptionsBeingDeleted] where SubscriptionID = @SubscriptionID
GO
GRANT EXECUTE ON [dbo].[RemoveSubscriptionFromBeingDeleted] TO [RSExecRole]
GO
