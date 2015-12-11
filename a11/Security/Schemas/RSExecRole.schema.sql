/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'RSExecRole') 
DROP SCHEMA [RSExecRole]
GO
CREATE SCHEMA [RSExecRole] AUTHORIZATION [RSExecRole]
GO
