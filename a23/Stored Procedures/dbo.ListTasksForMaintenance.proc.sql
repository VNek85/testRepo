/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListTasksForMaintenance]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ListTasksForMaintenance]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ListTasksForMaintenance]
AS

declare @date datetime
set @date = GETUTCDATE()

update
    [Schedule]
set
    [ConsistancyCheck] = @date
from 
(
  SELECT TOP 20 [ScheduleID] FROM [Schedule] WITH(UPDLOCK) WHERE [ConsistancyCheck] is NULL
) AS t1
WHERE [Schedule].[ScheduleID] = t1.[ScheduleID]

select top 20
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
        S.[Path]
from
    [Schedule] S
where
    [ConsistancyCheck] = @date
GO
GRANT EXECUTE ON [dbo].[ListTasksForMaintenance] TO [RSExecRole]
GO
