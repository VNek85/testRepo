/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteExpiredPersistedStreams]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteExpiredPersistedStreams]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteExpiredPersistedStreams]
AS
SET NOCOUNT OFF
SET DEADLOCK_PRIORITY LOW
declare @now as datetime = GETDATE();
delete top (10) p
from [ReportServerTempDB].dbo.PersistedStream p with(readpast)
where p.RefCount = 0 AND p.ExpirationDate < @now;
GO
GRANT EXECUTE ON [dbo].[DeleteExpiredPersistedStreams] TO [RSExecRole]
GO
