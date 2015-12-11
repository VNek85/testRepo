/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateRunningJob]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateRunningJob]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateRunningJob]
@JobID as nvarchar(32),
@JobStatus as smallint
AS
SET NOCOUNT OFF
UPDATE RunningJobs SET JobStatus = @JobStatus WHERE JobID = @JobID
GO
GRANT EXECUTE ON [dbo].[UpdateRunningJob] TO [RSExecRole]
GO
