/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetParameters]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetParameters]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetParameters]
@Path nvarchar (425),
@Parameter ntext
AS
UPDATE Catalog
SET [Parameter] = @Parameter
WHERE Path = @Path
EXEC FlushReportFromCache @Path
GO
GRANT EXECUTE ON [dbo].[SetParameters] TO [RSExecRole]
GO
