/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ExecutionLogStorage]') AND name = N'PK__Executio__05F5D745497B2821') 
ALTER TABLE [dbo].[ExecutionLogStorage] DROP CONSTRAINT [PK__Executio__05F5D745497B2821]
GO
ALTER TABLE [dbo].[ExecutionLogStorage] ADD CONSTRAINT [PK__Executio__05F5D745497B2821] PRIMARY KEY CLUSTERED ([LogEntryId])
GO
