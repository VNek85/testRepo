/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecDataPolicyID]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecData]'))
ALTER TABLE [dbo].[SecData] DROP CONSTRAINT [FK_SecDataPolicyID]
GO
