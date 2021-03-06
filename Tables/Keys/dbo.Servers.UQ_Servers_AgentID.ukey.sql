/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Servers]') AND name = N'UQ_Servers_AgentID') 
ALTER TABLE [dbo].[Servers] DROP CONSTRAINT [UQ_Servers_AgentID]
GO
ALTER TABLE [dbo].[Servers] ADD CONSTRAINT [UQ_Servers_AgentID] UNIQUE NONCLUSTERED ([AgentId])
GO
