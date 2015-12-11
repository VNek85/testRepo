/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PoliciesPolicyID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModelItemPolicy]'))
ALTER TABLE [dbo].[ModelItemPolicy] DROP CONSTRAINT [FK_PoliciesPolicyID]
GO
ALTER TABLE [dbo].[ModelItemPolicy] WITH NOCHECK ADD CONSTRAINT [FK_PoliciesPolicyID] FOREIGN KEY ([PolicyID]) REFERENCES [dbo].[Policies] ([PolicyID]) ON DELETE CASCADE
GO
