/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'NT SERVICE\ReportServer') 
DROP SCHEMA [NT SERVICE\ReportServer]
GO
CREATE SCHEMA [NT SERVICE\ReportServer] AUTHORIZATION [NT SERVICE\ReportServer]
GO
