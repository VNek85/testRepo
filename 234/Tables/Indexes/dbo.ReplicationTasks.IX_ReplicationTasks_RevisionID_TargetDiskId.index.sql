/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ReplicationTasks]') AND name = N'IX_ReplicationTasks_RevisionID_TargetDiskId') 
DROP INDEX [IX_ReplicationTasks_RevisionID_TargetDiskId] ON [dbo].[ReplicationTasks]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ReplicationTasks_RevisionID_TargetDiskId] ON [dbo].[ReplicationTasks]([RevisionId], [TargetDiskID]) ON [PRIMARY]
GO
