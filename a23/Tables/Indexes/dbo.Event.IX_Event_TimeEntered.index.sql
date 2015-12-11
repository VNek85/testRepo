/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Event]') AND name = N'IX_Event_TimeEntered') 
DROP INDEX [IX_Event_TimeEntered] ON [dbo].[Event]
GO
CREATE NONCLUSTERED INDEX [IX_Event_TimeEntered] ON [dbo].[Event]([TimeEntered]) ON [PRIMARY]
GO
