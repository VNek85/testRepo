/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PolicyUserRole]') AND name = N'PK_PolicyUserRole') 
ALTER TABLE [dbo].[PolicyUserRole] DROP CONSTRAINT [PK_PolicyUserRole]
GO
ALTER TABLE [dbo].[PolicyUserRole] ADD CONSTRAINT [PK_PolicyUserRole] PRIMARY KEY NONCLUSTERED ([ID])
GO
