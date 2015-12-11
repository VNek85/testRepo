/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetSnapshotProcessingFlags]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetSnapshotProcessingFlags]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetSnapshotProcessingFlags]
@SnapshotDataID as uniqueidentifier, 
@IsPermanentSnapshot as bit, 
@ProcessingFlags int
AS

if @IsPermanentSnapshot = 1 
BEGIN
	UPDATE SnapshotData
	SET ProcessingFlags = @ProcessingFlags
	WHERE SnapshotDataID = @SnapshotDataID
END ELSE BEGIN
	UPDATE [ReportServerTempDB].dbo.SnapshotData
	SET ProcessingFlags = @ProcessingFlags
	WHERE SnapshotDataID = @SnapshotDataID
END
GO
GRANT EXECUTE ON [dbo].[SetSnapshotProcessingFlags] TO [RSExecRole]
GO
