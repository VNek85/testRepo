/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteHistoriesWithNoPolicy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteHistoriesWithNoPolicy]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- delete all snapshots for all reports that inherit system History policy
CREATE PROCEDURE [dbo].[DeleteHistoriesWithNoPolicy]
AS
SET NOCOUNT OFF
DELETE
FROM History
WHERE HistoryID in
   (SELECT HistoryID
    FROM History JOIN Catalog on ItemID = ReportID
    WHERE SnapshotLimit is null
   )
GO
GRANT EXECUTE ON [dbo].[DeleteHistoriesWithNoPolicy] TO [RSExecRole]
GO
