/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteDataSets]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteDataSets]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteDataSets]
@ItemID [uniqueidentifier]
AS
DELETE
FROM [DataSets]
WHERE [ItemID] = @ItemID
DELETE
FROM [ReportServerTempDB].dbo.TempDataSets
WHERE [ItemID] = @ItemID
GO
GRANT EXECUTE ON [dbo].[DeleteDataSets] TO [RSExecRole]
GO
