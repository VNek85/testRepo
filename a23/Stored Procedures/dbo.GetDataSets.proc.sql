/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDataSets]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetDataSets]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDataSets]
@ItemID [uniqueidentifier],
@AuthType int
AS
BEGIN

SELECT 
	DS.ID, 
	DS.LinkID,
	DS.[Name],
	C.Path,
	SD.NtSecDescPrimary,
	C.Intermediate,
	C.[Parameter]
FROM
   ExtendedDataSets AS DS 
   LEFT OUTER JOIN Catalog C ON DS.[LinkID] = C.[ItemID]
   LEFT OUTER JOIN [SecData] AS SD ON C.[PolicyID] = SD.[PolicyID] AND SD.AuthType = @AuthType
WHERE
   DS.[ItemID] = @ItemID
END
GO
GRANT EXECUTE ON [dbo].[GetDataSets] TO [RSExecRole]
GO
