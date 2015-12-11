/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetRoles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetRoles]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetRoles]
@RoleFlags as tinyint = NULL
AS
SELECT
    RoleName,
    Description,
    TaskMask
FROM
    Roles
WHERE
    (@RoleFlags is NULL) OR
    (RoleFlags = @RoleFlags)
GO
GRANT EXECUTE ON [dbo].[GetRoles] TO [RSExecRole]
GO
