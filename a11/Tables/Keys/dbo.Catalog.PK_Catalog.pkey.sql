/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Catalog]') AND name = N'PK_Catalog') 
ALTER TABLE [dbo].[Catalog] DROP CONSTRAINT [PK_Catalog]
GO
ALTER TABLE [dbo].[Catalog] ADD CONSTRAINT [PK_Catalog] PRIMARY KEY NONCLUSTERED ([ItemID])
GO
