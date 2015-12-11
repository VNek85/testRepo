/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DataSource]') AND name = N'PK_DataSource') 
ALTER TABLE [dbo].[DataSource] DROP CONSTRAINT [PK_DataSource]
GO
ALTER TABLE [dbo].[DataSource] ADD CONSTRAINT [PK_DataSource] PRIMARY KEY CLUSTERED ([DSID])
GO
