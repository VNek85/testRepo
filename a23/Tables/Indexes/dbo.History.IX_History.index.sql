/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[History]') AND name = N'IX_History') 
DROP INDEX [IX_History] ON [dbo].[History]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_History] ON [dbo].[History]([ReportID], [SnapshotDate]) ON [PRIMARY]
GO
