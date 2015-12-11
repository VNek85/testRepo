/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PolicyUserRole_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyUserRole]'))
ALTER TABLE [dbo].[PolicyUserRole] DROP CONSTRAINT [FK_PolicyUserRole_Policy]
GO
ALTER TABLE [dbo].[PolicyUserRole] WITH NOCHECK ADD CONSTRAINT [FK_PolicyUserRole_Policy] FOREIGN KEY ([PolicyID]) REFERENCES [dbo].[Policies] ([PolicyID]) ON DELETE CASCADE
GO
