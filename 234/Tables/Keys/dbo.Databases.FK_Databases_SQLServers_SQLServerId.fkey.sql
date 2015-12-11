/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Databases_SQLServers_SQLServerId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Databases]'))
ALTER TABLE [dbo].[Databases] DROP CONSTRAINT [FK_Databases_SQLServers_SQLServerId]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Databases_SQLServers_SQLServerId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Databases]'))
ALTER TABLE [dbo].[Databases] DROP CONSTRAINT [FK_Databases_SQLServers_SQLServerId]
GO
