/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
ALTER TABLE [dbo].[ReplicationTasks] ADD CONSTRAINT [PK_ReplicationTasks_Id] PRIMARY KEY CLUSTERED ([Id])
GO
