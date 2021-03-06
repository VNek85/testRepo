/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Revision2Disks]') AND type in (N'U'))
DROP TABLE [dbo].[Revision2Disks]
GO
CREATE TABLE [dbo].[Revision2Disks] (
	[Id]				[int]				 IDENTITY(1, 1) NOT NULL,
	[Status]			[int]				 NOT NULL,
	[DateCreated]		[datetime]			 NOT NULL,
	[RevisionId]		[uniqueidentifier]	 NOT NULL,
	[DiskID]			[uniqueidentifier]	 NOT NULL,
	[Path]				[nvarchar](1024)	 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ChecksumState]		[int]				 NOT NULL
) ON [PRIMARY]
GO
