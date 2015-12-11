/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[History]') AND name = N'PK_History') 
ALTER TABLE [dbo].[History] DROP CONSTRAINT [PK_History]
GO
ALTER TABLE [dbo].[History] ADD CONSTRAINT [PK_History] PRIMARY KEY NONCLUSTERED ([HistoryID])
GO
