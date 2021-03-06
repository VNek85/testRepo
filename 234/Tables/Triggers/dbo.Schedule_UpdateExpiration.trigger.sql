/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Schedule_UpdateExpiration]')) 
DROP TRIGGER [dbo].[Schedule_UpdateExpiration]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[Schedule_UpdateExpiration] ON [dbo].[Schedule]  
AFTER UPDATE
AS 
UPDATE
   EC
SET
   AbsoluteExpiration = I.NextRunTime
FROM
   [ReportServerTempDB].dbo.ExecutionCache AS EC
   INNER JOIN ReportSchedule AS RS ON EC.ReportID = RS.ReportID
   INNER JOIN inserted AS I ON RS.ScheduleID = I.ScheduleID AND RS.ReportAction = 3
GO
