/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Batch]') AND name = N'IX_Batch_1') 
DROP INDEX [IX_Batch_1] ON [dbo].[Batch]
GO
CREATE NONCLUSTERED INDEX [IX_Batch_1] ON [dbo].[Batch]([AddedOn]) ON [PRIMARY]
GO
