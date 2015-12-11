/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Schedule]') AND name = N'IX_Schedule') 
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [IX_Schedule]
GO
ALTER TABLE [dbo].[Schedule] ADD CONSTRAINT [IX_Schedule] UNIQUE NONCLUSTERED ([Name], [Path])
GO
