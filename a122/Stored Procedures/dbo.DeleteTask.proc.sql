/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteTask]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteTask]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteTask]
@ScheduleID uniqueidentifier
AS
SET NOCOUNT OFF
-- Delete the task with the given task id
DELETE FROM Schedule
WHERE [ScheduleID] = @ScheduleID
GO
GRANT EXECUTE ON [dbo].[DeleteTask] TO [RSExecRole]
GO
