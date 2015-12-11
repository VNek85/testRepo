/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RebindDataSource]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RebindDataSource]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Republishing generates new DSID and stores those in the object model, 
-- in order to resolve the data sources we need to rebind the old 
-- data source definition to the current DSID
CREATE PROCEDURE [dbo].[RebindDataSource]
@ItemId		uniqueidentifier, 
@Name		nvarchar(260), 
@NewDSID	uniqueidentifier
AS
UPDATE DataSource
SET DSID = @NewDSID
WHERE ItemID = @ItemId AND [Name] = @Name
GO
GRANT EXECUTE ON [dbo].[RebindDataSource] TO [RSExecRole]
GO
