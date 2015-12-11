/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PolicyUserRole_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyUserRole]'))
ALTER TABLE [dbo].[PolicyUserRole] DROP CONSTRAINT [FK_PolicyUserRole_User]
GO
