/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'NT SERVICE\ReportServer' AND type IN (N'S')) 
DROP USER [NT SERVICE\ReportServer]
GO
IF NOT EXISTS ( SELECT * FROM sys.server_principals WHERE type in ('U', 'G', 'S', 'C', 'K') and name = N'NT SERVICE\ReportServer' )
CREATE LOGIN [NT SERVICE\ReportServer] FROM WINDOWS
GO
CREATE USER [NT SERVICE\ReportServer] FOR LOGIN [NT SERVICE\ReportServer] WITH DEFAULT_SCHEMA = [NT SERVICE\ReportServer]
GO
EXEC sp_addrolemember N'RSExecRole', N'NT SERVICE\ReportServer'
GO
