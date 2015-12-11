/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND name = N'IX_Roles') 
DROP INDEX [IX_Roles] ON [dbo].[Roles]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_Roles] ON [dbo].[Roles]([RoleName]) ON [PRIMARY]
GO
