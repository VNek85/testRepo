/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenSegmentedChunk]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[OpenSegmentedChunk]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[OpenSegmentedChunk]
	@SnapshotId		uniqueidentifier,
	@IsPermanent	bit,
	@ChunkName		nvarchar(260), 
	@ChunkType		int, 
	@ChunkId        uniqueidentifier out, 
	@ChunkFlags     tinyint out
as begin    
	if (@IsPermanent = 1) begin		
		select	@ChunkId = ChunkId,
				@ChunkFlags = ChunkFlags
		from dbo.SegmentedChunk chunk
		where chunk.SnapshotDataId = @SnapshotId and chunk.ChunkName = @ChunkName and chunk.ChunkType = @ChunkType
		
		select	csm.SegmentId, 				
				csm.LogicalByteCount as LogicalSegmentLength, 
				csm.ActualByteCount as ActualSegmentLength		
		from ChunkSegmentMapping csm		
		where csm.ChunkId = @ChunkId
		order by csm.StartByte asc
	end
	else begin
		select	@ChunkId = ChunkId,
				@ChunkFlags = ChunkFlags
		from [ReportServerTempDB].dbo.SegmentedChunk chunk
		where chunk.SnapshotDataId = @SnapshotId and chunk.ChunkName = @ChunkName and chunk.ChunkType = @ChunkType

		if @ChunkFlags & 0x4 > 0 begin
			-- Shallow copy: read chunk segments from catalog 
			select	csm.SegmentId, 				
					csm.LogicalByteCount as LogicalSegmentLength, 
					csm.ActualByteCount as ActualSegmentLength		
			from ChunkSegmentMapping csm		
			where csm.ChunkId = @ChunkId
			order by csm.StartByte asc
		end
		else begin
			-- Regular copy: read chunk segments from temp db
			select	csm.SegmentId, 				
					csm.LogicalByteCount as LogicalSegmentLength, 
					csm.ActualByteCount as ActualSegmentLength		
			from [ReportServerTempDB].dbo.ChunkSegmentMapping csm		
			where csm.ChunkId = @ChunkId
			order by csm.StartByte asc
		end
	end
end
GO
GRANT EXECUTE ON [dbo].[OpenSegmentedChunk] TO [RSExecRole]
GO
