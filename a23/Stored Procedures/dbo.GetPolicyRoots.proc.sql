/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetPolicyRoots]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetPolicyRoots]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPolicyRoots]
AS
SELECT 
    [Path],
    [Type]
FROM 
    [Catalog] 
WHERE 
    [PolicyRoot] = 1
GO
GRANT EXECUTE ON [dbo].[GetPolicyRoots] TO [RSExecRole]
GO
