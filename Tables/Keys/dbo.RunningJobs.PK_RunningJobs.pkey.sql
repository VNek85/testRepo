/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[RunningJobs]') AND name = N'PK_RunningJobs') 
ALTER TABLE [dbo].[RunningJobs] DROP CONSTRAINT [PK_RunningJobs]
GO
ALTER TABLE [dbo].[RunningJobs] ADD CONSTRAINT [PK_RunningJobs] PRIMARY KEY CLUSTERED ([JobID])
GO
