/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetModelsAndPerspectives]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetModelsAndPerspectives]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetModelsAndPerspectives]
@AuthType int,
@SitePathPrefix nvarchar(520) = '%'
AS

SELECT
    C.[PolicyID],
    SD.[NtSecDescPrimary],
    C.[ItemID],
    C.[Path],
    C.[Description],
    P.[PerspectiveID],
    P.[PerspectiveName],
    P.[PerspectiveDescription]
FROM
    [Catalog] as C
    LEFT OUTER JOIN [ModelPerspective] as P ON C.[ItemID] = P.[ModelID]
    LEFT OUTER JOIN [SecData] AS SD ON C.[PolicyID] = SD.[PolicyID] AND SD.[AuthType] = @AuthType
WHERE
    C.Path like @SitePathPrefix AND C.[Type] = 6 -- Model
ORDER BY
    C.[Path]
GO
GRANT EXECUTE ON [dbo].[GetModelsAndPerspectives] TO [RSExecRole]
GO
