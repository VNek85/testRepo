/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ModelDrillModel]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModelDrill]'))
ALTER TABLE [dbo].[ModelDrill] DROP CONSTRAINT [FK_ModelDrillModel]
GO
ALTER TABLE [dbo].[ModelDrill] WITH NOCHECK ADD CONSTRAINT [FK_ModelDrillModel] FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Catalog] ([ItemID]) ON DELETE CASCADE
GO
