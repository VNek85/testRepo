/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TempChunkExists]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[TempChunkExists]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[TempChunkExists]
	@ChunkId uniqueidentifier
AS
BEGIN
	SELECT COUNT(1) FROM [ReportServerTempDB].dbo.SegmentedChunk
	WHERE ChunkId = @ChunkId
END
GO
GRANT EXECUTE ON [dbo].[TempChunkExists] TO [RSExecRole]
GO
