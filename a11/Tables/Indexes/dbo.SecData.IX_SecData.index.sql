/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SecData]') AND name = N'IX_SecData') 
DROP INDEX [IX_SecData] ON [dbo].[SecData]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_SecData] ON [dbo].[SecData]([PolicyID], [AuthType]) ON [PRIMARY]
GO
