/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSnapShotSchedule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSnapShotSchedule]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSnapShotSchedule] 
@ReportID uniqueidentifier
AS

select
    S.[ScheduleID],
    S.[Name],
    S.[StartDate], 
    S.[Flags],
    S.[NextRunTime],
    S.[LastRunTime], 
    S.[EndDate], 
    S.[RecurrenceType],
    S.[MinutesInterval],
    S.[DaysInterval],
    S.[WeeksInterval],
    S.[DaysOfWeek], 
    S.[DaysOfMonth], 
    S.[Month], 
    S.[MonthlyWeek], 
    S.[State], 
    S.[LastRunStatus],
    S.[ScheduledRunTimeout],
    S.[EventType],
    S.[EventData],
    S.[Type],
    S.[Path],
    SUSER_SNAME(Owner.[Sid]),
    Owner.[UserName],
    Owner.[AuthType]
from
    Schedule S with (XLOCK) inner join ReportSchedule RS on S.ScheduleID = RS.ScheduleID
    inner join [Users] Owner on S.[CreatedById] = Owner.[UserID]
where
    RS.ReportAction = 2 and -- 2 == create snapshot
    RS.ReportID = @ReportID
GO
GRANT EXECUTE ON [dbo].[GetSnapShotSchedule] TO [RSExecRole]
GO
