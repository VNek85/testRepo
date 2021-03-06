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
	[Operation]			[smallint]			 NOT NULL,
	CONSTRAINT [PK_LockObjects] PRIMARY KEY CLUSTERED ([Id]),
	CONSTRAINT [UQ_LockObjects_1] UNIQUE NONCLUSTERED ([RevisionId], [DiskId], [Operation])
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LockObjects] ADD CONSTRAINT [FK_LockObjects_Revisions_RevisionId] FOREIGN KEY ([RevisionId]) REFERENCES [dbo].[Revisions] ([RevisionId])
GO
