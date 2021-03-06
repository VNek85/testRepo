/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Databases]') AND type in (N'U'))
DROP TABLE [dbo].[Databases]
GO
CREATE TABLE [dbo].[Databases] (
	[Id]					[int]			 NOT NULL,
	[Status]				[int]			 NOT NULL,
	[DateCreated]			[datetime]		 NOT NULL,
	[SQLServerId]			[int]			 NOT NULL,
	[DatabaseName]			[nvarchar](512)	 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ReplicationStatus]		[int]			 NOT NULL
) ON [PRIMARY]
GO
