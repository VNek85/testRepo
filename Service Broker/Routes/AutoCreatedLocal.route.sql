/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF  EXISTS (SELECT * FROM sys.routes WHERE name = N'AutoCreatedLocal') 
DROP ROUTE [AutoCreatedLocal]
GO
CREATE ROUTE [AutoCreatedLocal]
AUTHORIZATION [dbo]
WITH
	ADDRESS = 'LOCAL'
GO
