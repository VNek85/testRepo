/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteDataSources]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteDataSources]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteDataSources]
@ItemID [uniqueidentifier]
AS

DELETE
FROM [DataSource]
WHERE [ItemID] = @ItemID or [SubscriptionID] = @ItemID 
DELETE
FROM [ReportServerTempDB].dbo.TempDataSources
WHERE [ItemID] = @ItemID
GO
GRANT EXECUTE ON [dbo].[DeleteDataSources] TO [RSExecRole]
GO
