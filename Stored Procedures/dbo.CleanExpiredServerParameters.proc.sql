/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanExpiredServerParameters]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CleanExpiredServerParameters]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CleanExpiredServerParameters]
@ParametersCleaned INT OUTPUT
AS
  DECLARE @now as DATETIME
  SET @now = GETDATE()

DELETE FROM [dbo].[ServerParametersInstance] 
WHERE ServerParametersID IN 
(  SELECT TOP 20 ServerParametersID FROM [dbo].[ServerParametersInstance]
  WHERE Expiration < @now
)

SET @ParametersCleaned = @@ROWCOUNT
GO
GRANT EXECUTE ON [dbo].[CleanExpiredServerParameters] TO [RSExecRole]
GO
