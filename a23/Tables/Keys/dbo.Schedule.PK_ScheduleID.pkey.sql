/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Schedule]') AND name = N'PK_ScheduleID') 
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [PK_ScheduleID]
GO
ALTER TABLE [dbo].[Schedule] ADD CONSTRAINT [PK_ScheduleID] PRIMARY KEY CLUSTERED ([ScheduleID])
GO
