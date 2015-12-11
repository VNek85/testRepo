/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DataSets]') AND name = N'IX_DataSetLinkID') 
DROP INDEX [IX_DataSetLinkID] ON [dbo].[DataSets]
GO
CREATE NONCLUSTERED INDEX [IX_DataSetLinkID] ON [dbo].[DataSets]([LinkID]) ON [PRIMARY]
GO
