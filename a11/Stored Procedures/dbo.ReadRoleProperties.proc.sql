/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadRoleProperties]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadRoleProperties]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ReadRoleProperties]
@RoleName as nvarchar(260)
AS 
SELECT Description, TaskMask, RoleFlags FROM Roles WHERE RoleName = @RoleName
GO
GRANT EXECUTE ON [dbo].[ReadRoleProperties] TO [RSExecRole]
GO
