/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetMachineName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetMachineName]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetMachineName]
@MachineName nvarchar(256),
@InstallationID uniqueidentifier
AS

UPDATE [dbo].[Keys]
SET MachineName = @MachineName
WHERE [InstallationID] = @InstallationID and [Client] = 1
GO
GRANT EXECUTE ON [dbo].[SetMachineName] TO [RSExecRole]
GO
