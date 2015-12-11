/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SnapshotData]') AND name = N'PK_SnapshotData') 
ALTER TABLE [dbo].[SnapshotData] DROP CONSTRAINT [PK_SnapshotData]
GO
ALTER TABLE [dbo].[SnapshotData] ADD CONSTRAINT [PK_SnapshotData] PRIMARY KEY CLUSTERED ([SnapshotDataID])
GO
