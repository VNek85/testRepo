/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ActiveSubscriptions]') AND name = N'PK_ActiveSubscriptions') 
ALTER TABLE [dbo].[ActiveSubscriptions] DROP CONSTRAINT [PK_ActiveSubscriptions]
GO
ALTER TABLE [dbo].[ActiveSubscriptions] ADD CONSTRAINT [PK_ActiveSubscriptions] PRIMARY KEY CLUSTERED ([ActiveID])
GO
