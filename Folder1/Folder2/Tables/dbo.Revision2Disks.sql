/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
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
	[ChecksumState]		[int]				 NOT NULL,
	CONSTRAINT [PK_Revision2Disks_Id] PRIMARY KEY CLUSTERED ([Id]),
	CONSTRAINT [UQ_Revision2Disks_RevisionId_DiskID] UNIQUE NONCLUSTERED ([RevisionId], [DiskID])
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Revision2Disks] ADD CONSTRAINT [FK_Revision2Disks_Revisions_RevisionId] FOREIGN KEY ([RevisionId]) REFERENCES [dbo].[Revisions] ([RevisionId])
GO
