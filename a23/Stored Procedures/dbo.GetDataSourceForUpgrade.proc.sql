/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDataSourceForUpgrade]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetDataSourceForUpgrade]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDataSourceForUpgrade]
@CurrentVersion int
AS
SELECT 
    [DSID]
FROM 
    [DataSource]
WHERE
    [Version] != @CurrentVersion
GO
GRANT EXECUTE ON [dbo].[GetDataSourceForUpgrade] TO [RSExecRole]
GO
