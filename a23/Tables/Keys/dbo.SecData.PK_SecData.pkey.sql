/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SecData]') AND name = N'PK_SecData') 
ALTER TABLE [dbo].[SecData] DROP CONSTRAINT [PK_SecData]
GO
ALTER TABLE [dbo].[SecData] ADD CONSTRAINT [PK_SecData] PRIMARY KEY NONCLUSTERED ([SecDataID])
GO
