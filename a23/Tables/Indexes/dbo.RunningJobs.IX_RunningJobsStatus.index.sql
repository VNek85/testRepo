/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[RunningJobs]') AND name = N'IX_RunningJobsStatus') 
DROP INDEX [IX_RunningJobsStatus] ON [dbo].[RunningJobs]
GO
CREATE NONCLUSTERED INDEX [IX_RunningJobsStatus] ON [dbo].[RunningJobs]([ComputerName], [JobType]) ON [PRIMARY]
GO
