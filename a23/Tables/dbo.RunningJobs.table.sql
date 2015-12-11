/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RunningJobs]') AND type in (N'U'))
DROP TABLE [dbo].[RunningJobs]
GO
CREATE TABLE [dbo].[RunningJobs] (
	[JobID]				[nvarchar](32)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[StartDate]			[datetime]			 NOT NULL,
	[ComputerName]		[nvarchar](32)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[RequestName]		[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[RequestPath]		[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[UserId]			[uniqueidentifier]	 NOT NULL,
	[Description]		[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Timeout]			[int]				 NOT NULL,
	[JobAction]			[smallint]			 NOT NULL,
	[JobType]			[smallint]			 NOT NULL,
	[JobStatus]			[smallint]			 NOT NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[RunningJobs] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[RunningJobs] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[RunningJobs] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[RunningJobs] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[RunningJobs] TO [RSExecRole]
GO
