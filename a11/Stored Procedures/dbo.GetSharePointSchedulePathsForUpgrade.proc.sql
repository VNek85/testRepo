/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSharePointSchedulePathsForUpgrade]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSharePointSchedulePathsForUpgrade]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSharePointSchedulePathsForUpgrade]
AS
BEGIN
SELECT DISTINCT [Path], LEN([Path])
  FROM [Schedule]
  WHERE [Path] IS NOT NULL AND [Path] NOT LIKE '/{%'
  ORDER BY LEN([Path]) DESC
END
GO
GRANT EXECUTE ON [dbo].[GetSharePointSchedulePathsForUpgrade] TO [RSExecRole]
GO
