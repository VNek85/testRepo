/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeletePersistedStreams]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeletePersistedStreams]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeletePersistedStreams]
@SessionID varchar(32)
AS
SET NOCOUNT OFF
delete top (10) p
from [ReportServerTempDB].dbo.PersistedStream p
where p.SessionID = @SessionID;
GO
GRANT EXECUTE ON [dbo].[DeletePersistedStreams] TO [RSExecRole]
GO
