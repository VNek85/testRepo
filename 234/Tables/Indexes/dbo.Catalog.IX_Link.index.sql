/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Catalog]') AND name = N'IX_Link') 
DROP INDEX [IX_Link] ON [dbo].[Catalog]
GO
CREATE NONCLUSTERED INDEX [IX_Link] ON [dbo].[Catalog]([LinkSourceID]) ON [PRIMARY]
GO
