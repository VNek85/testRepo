/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SQLServers_Servers_ServerId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SQLServers]'))
ALTER TABLE [dbo].[SQLServers] DROP CONSTRAINT [FK_SQLServers_Servers_ServerId]
GO
ALTER TABLE [dbo].[SQLServers] ADD CONSTRAINT [FK_SQLServers_Servers_ServerId] FOREIGN KEY ([ServerId]) REFERENCES [dbo].[Servers] ([Id])
GO
