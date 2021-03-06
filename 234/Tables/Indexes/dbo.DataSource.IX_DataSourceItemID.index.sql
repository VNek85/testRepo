/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DataSource]') AND name = N'IX_DataSourceItemID') 
DROP INDEX [IX_DataSourceItemID] ON [dbo].[DataSource]
GO
CREATE NONCLUSTERED INDEX [IX_DataSourceItemID] ON [dbo].[DataSource]([ItemID]) ON [PRIMARY]
GO
