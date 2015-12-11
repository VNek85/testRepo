/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ModelItemPolicy]') AND name = N'PK_ModelItemPolicy') 
ALTER TABLE [dbo].[ModelItemPolicy] DROP CONSTRAINT [PK_ModelItemPolicy]
GO
ALTER TABLE [dbo].[ModelItemPolicy] ADD CONSTRAINT [PK_ModelItemPolicy] PRIMARY KEY NONCLUSTERED ([ID])
GO
