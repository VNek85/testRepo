/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Catalog]') AND name = N'IX_ComponentLookup') 
DROP INDEX [IX_ComponentLookup] ON [dbo].[Catalog]
GO
CREATE NONCLUSTERED INDEX [IX_ComponentLookup] ON [dbo].[Catalog]([Type], [ComponentID]) ON [PRIMARY]
GO
