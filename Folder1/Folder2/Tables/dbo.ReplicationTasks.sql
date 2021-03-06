/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
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
	[HasHashList]			[bit]				 NOT NULL,
	CONSTRAINT [PK_ReplicationTasks_Id] PRIMARY KEY CLUSTERED ([Id])
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ReplicationTasks_RevisionID_TargetDiskId] ON [dbo].[ReplicationTasks]([RevisionId], [TargetDiskID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReplicationTasks] ADD CONSTRAINT [FK_ReplicationTasks_Revision2Disks_RevisionId_SourceDiskID] FOREIGN KEY ([RevisionId], [SourceDiskID]) REFERENCES [dbo].[Revision2Disks] ([RevisionId], [DiskID])
GO
