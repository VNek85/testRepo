/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUpgradeItems]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUpgradeItems]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUpgradeItems]
AS
SELECT 
    [Item],
    [Status]
FROM 
    [UpgradeInfo]
GO
GRANT EXECUTE ON [dbo].[GetUpgradeItems] TO [RSExecRole]
GO
