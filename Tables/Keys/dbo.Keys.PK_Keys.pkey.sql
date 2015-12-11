/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Keys]') AND name = N'PK_Keys') 
ALTER TABLE [dbo].[Keys] DROP CONSTRAINT [PK_Keys]
GO
ALTER TABLE [dbo].[Keys] ADD CONSTRAINT [PK_Keys] PRIMARY KEY CLUSTERED ([InstallationID], [Client])
GO
