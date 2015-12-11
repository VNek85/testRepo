/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Event]') AND type in (N'U'))
DROP TABLE [dbo].[Event]
GO
CREATE TABLE [dbo].[Event] (
	[EventID]				[uniqueidentifier]	 NOT NULL,
	[EventType]				[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[EventData]				[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[TimeEntered]			[datetime]			 NOT NULL,
	[ProcessStart]			[datetime]			 NULL,
	[ProcessHeartbeat]		[datetime]			 NULL,
	[BatchID]				[uniqueidentifier]	 NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[Event] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Event] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Event] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Event] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Event] TO [RSExecRole]
GO
