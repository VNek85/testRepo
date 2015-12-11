/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteDrillthroughReports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteDrillthroughReports]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteDrillthroughReports]
@ModelID uniqueidentifier,
@ModelItemID nvarchar(425)
AS
 DELETE ModelDrill WHERE ModelID = @ModelID and ModelItemID = @ModelItemID
GO
GRANT EXECUTE ON [dbo].[DeleteDrillthroughReports] TO [RSExecRole]
GO
