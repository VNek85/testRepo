/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ModelItemPolicy]') AND name = N'IX_ModelItemPolicy') 
DROP INDEX [IX_ModelItemPolicy] ON [dbo].[ModelItemPolicy]
GO
CREATE CLUSTERED INDEX [IX_ModelItemPolicy] ON [dbo].[ModelItemPolicy]([CatalogItemID], [ModelItemID]) ON [PRIMARY]
GO
