/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DataSets]') AND name = N'IX_DataSet_ItemID_Name') 
DROP INDEX [IX_DataSet_ItemID_Name] ON [dbo].[DataSets]
GO
CREATE CLUSTERED INDEX [IX_DataSet_ItemID_Name] ON [dbo].[DataSets]([ItemID], [Name]) ON [PRIMARY]
GO
