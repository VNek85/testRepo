/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ConfigurationInfo]') AND name = N'IX_ConfigurationInfo') 
DROP INDEX [IX_ConfigurationInfo] ON [dbo].[ConfigurationInfo]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_ConfigurationInfo] ON [dbo].[ConfigurationInfo]([Name]) ON [PRIMARY]
GO
