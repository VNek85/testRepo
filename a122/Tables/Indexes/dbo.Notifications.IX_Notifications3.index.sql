/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Notifications]') AND name = N'IX_Notifications3') 
DROP INDEX [IX_Notifications3] ON [dbo].[Notifications]
GO
CREATE NONCLUSTERED INDEX [IX_Notifications3] ON [dbo].[Notifications]([NotificationEntered]) ON [PRIMARY]
GO
