/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteAllModelItemPolicies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteAllModelItemPolicies]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteAllModelItemPolicies]
@Path as nvarchar(450)
AS 

DELETE Policies
FROM
   Policies AS P
   INNER JOIN ModelItemPolicy AS MIP ON P.PolicyID = MIP.PolicyID
   INNER JOIN Catalog AS C ON MIP.CatalogItemID = C.ItemID
WHERE
   C.[Path] = @Path
GO
GRANT EXECUTE ON [dbo].[DeleteAllModelItemPolicies] TO [RSExecRole]
GO
