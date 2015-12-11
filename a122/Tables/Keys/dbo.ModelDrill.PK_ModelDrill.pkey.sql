/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ModelDrill]') AND name = N'PK_ModelDrill') 
ALTER TABLE [dbo].[ModelDrill] DROP CONSTRAINT [PK_ModelDrill]
GO
ALTER TABLE [dbo].[ModelDrill] ADD CONSTRAINT [PK_ModelDrill] PRIMARY KEY NONCLUSTERED ([ModelDrillID])
GO
