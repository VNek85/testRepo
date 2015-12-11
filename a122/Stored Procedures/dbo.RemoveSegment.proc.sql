/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveSegment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RemoveSegment]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RemoveSegment]
	@DeleteCountPermanent int, 
	@DeleteCountTemp int
as
begin
	SET DEADLOCK_PRIORITY LOW
	
	-- Locking:
	-- Similar idea as in RemovedSegmentedMapping.  Readpast
	-- any Segments which are currently locked and run the 
	-- inner scan with nolock.	
	declare @numDeleted int;
	declare @toDeleteMapping table (
		SegmentId uniqueidentifier );
	
	insert into @toDeleteMapping (SegmentId)	
	select top (@DeleteCountPermanent) SegmentId 
	from Segment with (readpast)	
	where not exists (
		select 1 from ChunkSegmentMapping CSM with (nolock)
		where CSM.SegmentId = Segment.SegmentId
		) ;
		
	delete from Segment with (readpast)
	where Segment.SegmentId in (
		select td.SegmentId from @toDeleteMapping td
		where not exists (
			select 1 from ChunkSegmentMapping CSM
			where CSM.SegmentId = td.SegmentId ));
			
	select @numDeleted = @@rowcount ;
	
	declare @toDeleteTempSegment table (
		SegmentId uniqueidentifier );
	
	insert into @toDeleteTempSegment (SegmentId)		
	select top (@DeleteCountTemp) SegmentId
	from [ReportServerTempDB].dbo.Segment with (readpast)	
	where not exists (
		select 1 from [ReportServerTempDB].dbo.ChunkSegmentMapping CSM with (nolock)
		where CSM.SegmentId = [ReportServerTempDB].dbo.Segment.SegmentId
		) ;
		
	delete from [ReportServerTempDB].dbo.Segment with (readpast)
	where [ReportServerTempDB].dbo.Segment.SegmentId in (
		select td.SegmentId from @toDeleteTempSegment td 
		where not exists (
			select 1 from [ReportServerTempDB].dbo.ChunkSegmentMapping CSM
			where CSM.SegmentId = td.SegmentId
			)) ;
	select @numDeleted = @numDeleted + @@rowcount ;
	
	select @numDeleted;
end
GO
GRANT EXECUTE ON [dbo].[RemoveSegment] TO [RSExecRole]
GO
