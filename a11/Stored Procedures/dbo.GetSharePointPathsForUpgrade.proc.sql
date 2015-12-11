/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSharePointPathsForUpgrade]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSharePointPathsForUpgrade]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSharePointPathsForUpgrade]
AS
BEGIN
SELECT DISTINCT SUBSTRING([Path], 1, LEN([Path])-LEN([Name]) - 1) as Prefix, LEN([Path])-LEN([Name]) as PrefixLen
  FROM [Catalog]
  WHERE LEN([Path]) > 0 AND [Path] NOT LIKE '/{%'
  ORDER BY PrefixLen DESC
END
GO
GRANT EXECUTE ON [dbo].[GetSharePointPathsForUpgrade] TO [RSExecRole]
GO
