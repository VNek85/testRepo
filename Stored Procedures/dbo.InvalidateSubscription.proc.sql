/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvalidateSubscription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InvalidateSubscription]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InvalidateSubscription] 
@SubscriptionID uniqueidentifier,
@Flags int,
@LastStatus nvarchar(260)
AS

-- Mark all subscriptions for this report as inactive for the given flags
update 
    Subscriptions 
set 
    [InactiveFlags] = S.[InactiveFlags] | @Flags,
    [LastStatus] = @LastStatus
from 
    Subscriptions S 
where 
    SubscriptionID = @SubscriptionID
GO
GRANT EXECUTE ON [dbo].[InvalidateSubscription] TO [RSExecRole]
GO
