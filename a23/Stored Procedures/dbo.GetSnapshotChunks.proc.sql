/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSnapshotChunks]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSnapshotChunks]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSnapshotChunks]
@SnapshotDataID uniqueidentifier,
@IsPermanentSnapshot bit
AS

IF @IsPermanentSnapshot != 0 BEGIN

SELECT ChunkName, ChunkType, ChunkFlags, MimeType, Version, datalength(Content)
FROM ChunkData
WHERE   
    SnapshotDataID = @SnapshotDataID
    
END ELSE BEGIN

SELECT ChunkName, ChunkType, ChunkFlags, MimeType, Version, datalength(Content)
FROM [ReportServerTempDB].dbo.ChunkData
WHERE   
    SnapshotDataID = @SnapshotDataID
END
GO
GRANT EXECUTE ON [dbo].[GetSnapshotChunks] TO [RSExecRole]
GO
