/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Notifications]') AND name = N'IX_Notifications2') 
DROP INDEX [IX_Notifications2] ON [dbo].[Notifications]
GO
CREATE NONCLUSTERED INDEX [IX_Notifications2] ON [dbo].[Notifications]([ProcessStart]) ON [PRIMARY]
GO
