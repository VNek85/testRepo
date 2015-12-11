/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[History]') AND type in (N'U'))
DROP TABLE [dbo].[History]
GO
CREATE TABLE [dbo].[History] (
	[HistoryID]			[uniqueidentifier]	 NOT NULL,
	[ReportID]			[uniqueidentifier]	 NOT NULL,
	[SnapshotDataID]	[uniqueidentifier]	 NOT NULL,
	[SnapshotDate]		[datetime]			 NOT NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[History] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[History] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[History] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[History] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[History] TO [RSExecRole]
GO
