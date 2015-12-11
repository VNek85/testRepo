/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeepCopySegment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeepCopySegment]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeepCopySegment]
	@ChunkId		uniqueidentifier,
	@IsPermanent	bit,
	@SegmentId		uniqueidentifier,
	@NewSegmentId	uniqueidentifier out
as
begin
	select @NewSegmentId = newid() ;
	if (@IsPermanent = 1) begin
		insert Segment(SegmentId, Content)
		select @NewSegmentId, seg.Content
		from Segment seg
		where seg.SegmentId = @SegmentId ;
				
		update ChunkSegmentMapping
		set SegmentId = @NewSegmentId
		where ChunkId = @ChunkId and SegmentId = @SegmentId ;
	end
	else begin
		insert [ReportServerTempDB].dbo.Segment(SegmentId, Content)
		select @NewSegmentId, seg.Content
		from [ReportServerTempDB].dbo.Segment seg
		where seg.SegmentId = @SegmentId ;
		
		update [ReportServerTempDB].dbo.ChunkSegmentMapping
		set SegmentId = @NewSegmentId
		where ChunkId = @ChunkId and SegmentId = @SegmentId ; 
	end
end
GO
GRANT EXECUTE ON [dbo].[DeepCopySegment] TO [RSExecRole]
GO
