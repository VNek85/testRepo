/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RebindDataSet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RebindDataSet]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Republishing generates new ID and stores those in the object model, 
-- in order to resolve the data sets we need to rebind the old 
-- data set definition to the current ID
CREATE PROCEDURE [dbo].[RebindDataSet]
@ItemId		uniqueidentifier, 
@Name		nvarchar(260), 
@NewID	uniqueidentifier
AS
UPDATE DataSets
SET ID = @NewID
WHERE ItemID = @ItemId AND [Name] = @Name
GO
GRANT EXECUTE ON [dbo].[RebindDataSet] TO [RSExecRole]
GO
