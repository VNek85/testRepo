/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
ALTER TABLE [dbo].[Servers] ADD CONSTRAINT [UQ_Servers_AgentID] UNIQUE NONCLUSTERED ([AgentId])
GO
