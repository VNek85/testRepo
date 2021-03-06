/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReplicationTasks]') AND type in (N'U'))
DROP TABLE [dbo].[ReplicationTasks]
GO
CREATE TABLE [dbo].[ReplicationTasks] (
	[Id]					[int]				 IDENTITY(1, 1) NOT NULL,
	[Status]				[int]				 NOT NULL,
	[DateCreated]			[datetime]			 NOT NULL,
	[RevisionId]			[uniqueidentifier]	 NOT NULL,
	[SourceDiskID]			[uniqueidentifier]	 NOT NULL,
	[TargetStorageID]		[uniqueidentifier]	 NOT NULL,
	[TargetDiskID]			[uniqueidentifier]	 NOT NULL,
	[Priority]				[int]				 NOT NULL,
	[HasHashList]			[bit]				 NOT NULL
) ON [PRIMARY]
GO
