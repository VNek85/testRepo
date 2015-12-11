/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Subscript__Repor__16644E42]') AND parent_object_id = OBJECT_ID(N'[dbo].[Subscriptions]'))
ALTER TABLE [dbo].[Subscriptions] DROP CONSTRAINT [DF__Subscript__Repor__16644E42]
GO
ALTER TABLE [dbo].[Subscriptions] ADD CONSTRAINT [DF__Subscript__Repor__16644E42] DEFAULT ((0)) FOR [ReportZone]
GO
