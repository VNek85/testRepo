/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateRdlChunk]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateRdlChunk]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateRdlChunk]
	@ItemId UNIQUEIDENTIFIER, 
	@SnapshotId UNIQUEIDENTIFIER, 
	@IsPermanentSnapshot BIT, 
	@ChunkName NVARCHAR(260), 
	@ChunkFlags TINYINT, 
	@ChunkType INT, 
	@Version SMALLINT, 
	@MimeType NVARCHAR(260) = NULL
AS
BEGIN

-- If the chunk already exists then bail out early
IF EXISTS (
    SELECT 1 
    FROM [SegmentedChunk]
    WHERE   SnapshotDataId = @SnapshotId AND 
            ChunkName = @ChunkName AND 
            ChunkType = @ChunkType
    )
    RETURN ;

-- This is a 3-step process.  First we need to get the RDL out of the Catalog
-- table where it is stored in the Content row.  Note the join to make sure
-- that if ItemId is a Linked Report we go back to the main report to get the RDL.
-- Once we have the RDL stored in @SegmentData, we then invoke the CreateSegmentedChunk
-- stored proc which will create an empty segmented chunk for us and return the ChunkId.
-- finally, once we have a ChunkId, we can invoke CreateChunkSegment to actually put the 
-- content into the chunk.  Note that we do not every actually break the chunk into multiple
-- sgements but instead we always use one.  
DECLARE @SegmentData VARBINARY(MAX) ;
DECLARE @SegmentByteCount INT ;
SELECT @SegmentData = CONVERT(VARBINARY(MAX), ISNULL(Linked.Content, Original.Content))
FROM [Catalog] Original
LEFT OUTER JOIN [Catalog] Linked WITH (INDEX(PK_Catalog)) ON (Original.LinkSourceId = Linked.ItemId)
WHERE [Original].[ItemId] = @ItemId ;

SELECT @SegmentByteCount = DATALENGTH(@SegmentData) ;

DECLARE @ChunkId UNIQUEIDENTIFIER ;
EXEC [CreateSegmentedChunk]
    @SnapshotId = @SnapshotId,
    @IsPermanent = @IsPermanentSnapshot,
    @ChunkName = @ChunkName, 
    @ChunkFlags = @ChunkFlags, 
    @ChunkType = @ChunkType,
    @Version = @Version,
    @MimeType = @MimeType,
    @Machine = NULL,
    @ChunkId = @ChunkId out ;

DECLARE @SegmentId UNIQUEIDENTIFIER ; 
EXEC [CreateChunkSegment]
    @SnapshotId = @SnapshotId, 
    @IsPermanent = @IsPermanentSnapshot,
    @ChunkId = @ChunkId, 
    @Content = @SegmentData,
    @StartByte = 0, 
    @Length = @SegmentByteCount,
    @LogicalByteCount = @SegmentByteCount,
    @SegmentId = @SegmentId out
END
GO
GRANT EXECUTE ON [dbo].[CreateRdlChunk] TO [RSExecRole]
GO
