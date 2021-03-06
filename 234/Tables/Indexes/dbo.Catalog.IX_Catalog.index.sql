/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Catalog]') AND name = N'IX_Catalog') 
DROP INDEX [IX_Catalog] ON [dbo].[Catalog]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_Catalog] ON [dbo].[Catalog]([Path]) ON [PRIMARY]
GO
