/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PolicyUserRole]') AND name = N'IX_PolicyUserRole') 
DROP INDEX [IX_PolicyUserRole] ON [dbo].[PolicyUserRole]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_PolicyUserRole] ON [dbo].[PolicyUserRole]([RoleID], [UserID], [PolicyID]) ON [PRIMARY]
GO
