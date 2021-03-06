/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LockObjects]') AND type in (N'U'))
DROP TABLE [dbo].[LockObjects]
GO
CREATE TABLE [dbo].[LockObjects] (
	[Id]				[int]				 IDENTITY(1, 1) NOT NULL,
	[DateCreated]		[datetime]			 NOT NULL,
	[RevisionId]		[uniqueidentifier]	 NOT NULL,
	[DiskId]			[uniqueidentifier]	 NOT NULL,
	[Operation]			[smallint]			 NOT NULL
) ON [PRIMARY]
GO
