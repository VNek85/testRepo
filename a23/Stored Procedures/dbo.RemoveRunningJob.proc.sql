/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveRunningJob]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RemoveRunningJob]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RemoveRunningJob]
@JobID as nvarchar(32)
AS
SET NOCOUNT OFF
DELETE FROM RunningJobs WHERE JobID = @JobID
GO
GRANT EXECUTE ON [dbo].[RemoveRunningJob] TO [RSExecRole]
GO
