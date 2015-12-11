/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DataSets]') AND name = N'PK_DataSet') 
ALTER TABLE [dbo].[DataSets] DROP CONSTRAINT [PK_DataSet]
GO
ALTER TABLE [dbo].[DataSets] ADD CONSTRAINT [PK_DataSet] PRIMARY KEY NONCLUSTERED ([ID])
GO
