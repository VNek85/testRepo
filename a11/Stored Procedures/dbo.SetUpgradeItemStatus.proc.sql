/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUpgradeItemStatus]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetUpgradeItemStatus]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetUpgradeItemStatus]
@ItemName nvarchar(260),
@Status nvarchar(512)
AS
UPDATE 
    [UpgradeInfo]
SET
    [Status] = @Status
WHERE
    [Item] = @ItemName
GO
GRANT EXECUTE ON [dbo].[SetUpgradeItemStatus] TO [RSExecRole]
GO
