/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ChunkData]') AND name = N'PK_ChunkData') 
ALTER TABLE [dbo].[ChunkData] DROP CONSTRAINT [PK_ChunkData]
GO
ALTER TABLE [dbo].[ChunkData] ADD CONSTRAINT [PK_ChunkData] PRIMARY KEY NONCLUSTERED ([ChunkID])
GO
