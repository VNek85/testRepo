/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ConfigurationInfo]') AND name = N'PK_ConfigurationInfo') 
ALTER TABLE [dbo].[ConfigurationInfo] DROP CONSTRAINT [PK_ConfigurationInfo]
GO
ALTER TABLE [dbo].[ConfigurationInfo] ADD CONSTRAINT [PK_ConfigurationInfo] PRIMARY KEY NONCLUSTERED ([ConfigInfoID])
GO
