/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobHistory]') AND type in (N'U'))
DROP TABLE [dbo].[JobHistory]
GO
CREATE TABLE [dbo].[JobHistory] (
	[Id]				[int]			 IDENTITY(1, 1) NOT NULL,
	[Name]				[nvarchar](512)	 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StartDate]			[datetime]		 NOT NULL,
	[EndDate]			[datetime]		 NOT NULL,
	[LastResult]		[int]			 NOT NULL,
	[NextStartDate]		[datetime]		 NOT NULL,
	[JobCode]			[int]			 NOT NULL
) ON [PRIMARY]
GO
