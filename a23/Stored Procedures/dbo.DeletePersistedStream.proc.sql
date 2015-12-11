/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeletePersistedStream]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeletePersistedStream]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeletePersistedStream]
@SessionID varchar(32),
@Index int
AS

delete from [ReportServerTempDB].dbo.PersistedStream where SessionID = @SessionID and [Index] = @Index
GO
GRANT EXECUTE ON [dbo].[DeletePersistedStream] TO [RSExecRole]
GO
