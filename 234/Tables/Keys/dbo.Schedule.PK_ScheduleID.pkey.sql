/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
ALTER TABLE [dbo].[Schedule] ADD CONSTRAINT [PK_ScheduleID] PRIMARY KEY CLUSTERED ([ScheduleID])
GO
