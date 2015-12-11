/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetFirstPortionPersistedStream]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetFirstPortionPersistedStream]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFirstPortionPersistedStream]
@SessionID varchar(32)
AS

SELECT 
    TOP 1
    TEXTPTR(P.Content), 
    DATALENGTH(P.Content), 
    P.[Index],
    P.[Name], 
    P.MimeType, 
    P.Extension, 
    P.Encoding,
    P.Error
FROM 
    [ReportServerTempDB].dbo.PersistedStream P WITH (XLOCK)
WHERE 
    P.SessionID = @SessionID
GO
GRANT EXECUTE ON [dbo].[GetFirstPortionPersistedStream] TO [RSExecRole]
GO
