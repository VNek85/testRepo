/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ServerParametersInstance]') AND name = N'PK_ServerParametersInstance') 
ALTER TABLE [dbo].[ServerParametersInstance] DROP CONSTRAINT [PK_ServerParametersInstance]
GO
ALTER TABLE [dbo].[ServerParametersInstance] ADD CONSTRAINT [PK_ServerParametersInstance] PRIMARY KEY CLUSTERED ([ServerParametersID])
GO
