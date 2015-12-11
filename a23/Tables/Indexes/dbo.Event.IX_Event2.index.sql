/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Event]') AND name = N'IX_Event2') 
DROP INDEX [IX_Event2] ON [dbo].[Event]
GO
CREATE NONCLUSTERED INDEX [IX_Event2] ON [dbo].[Event]([ProcessStart]) ON [PRIMARY]
GO
