/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExtendedDataSets]') AND type in (N'V'))
DROP VIEW [dbo].[ExtendedDataSets]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[ExtendedDataSets]
AS 
SELECT 
	ID, LinkID, [Name], ItemID
FROM DataSets
UNION ALL
SELECT
	ID, LinkID, [Name], ItemID
FROM [ReportServerTempDB].dbo.TempDataSets
GO
GRANT REFERENCES ON [dbo].[ExtendedDataSets] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ExtendedDataSets] TO [RSExecRole]
GO
