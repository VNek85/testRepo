/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ServerParametersInstance]') AND name = N'IX_ServerParametersInstanceExpiration') 
DROP INDEX [IX_ServerParametersInstanceExpiration] ON [dbo].[ServerParametersInstance]
GO
CREATE NONCLUSTERED INDEX [IX_ServerParametersInstanceExpiration] ON [dbo].[ServerParametersInstance]([Expiration] DESC) ON [PRIMARY]
GO
