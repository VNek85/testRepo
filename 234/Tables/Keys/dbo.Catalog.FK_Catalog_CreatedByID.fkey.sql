/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Catalog_CreatedByID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Catalog]'))
ALTER TABLE [dbo].[Catalog] DROP CONSTRAINT [FK_Catalog_CreatedByID]
GO
ALTER TABLE [dbo].[Catalog] WITH NOCHECK ADD CONSTRAINT [FK_Catalog_CreatedByID] FOREIGN KEY ([CreatedByID]) REFERENCES [dbo].[Users] ([UserID])
GO
