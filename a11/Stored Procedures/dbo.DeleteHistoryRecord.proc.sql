/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteHistoryRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteHistoryRecord]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- delete one historical snapshot
CREATE PROCEDURE [dbo].[DeleteHistoryRecord]
@ReportID uniqueidentifier,
@SnapshotDate DateTime
AS
SET NOCOUNT OFF
DELETE
FROM History
WHERE ReportID = @ReportID AND SnapshotDate = @SnapshotDate
GO
GRANT EXECUTE ON [dbo].[DeleteHistoryRecord] TO [RSExecRole]
GO
