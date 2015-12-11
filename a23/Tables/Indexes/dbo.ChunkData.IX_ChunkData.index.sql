/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ChunkData]') AND name = N'IX_ChunkData') 
DROP INDEX [IX_ChunkData] ON [dbo].[ChunkData]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_ChunkData] ON [dbo].[ChunkData]([SnapshotDataID], [ChunkType], [ChunkName]) ON [PRIMARY]
GO
