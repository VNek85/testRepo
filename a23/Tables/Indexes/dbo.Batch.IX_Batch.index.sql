/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Batch]') AND name = N'IX_Batch') 
DROP INDEX [IX_Batch] ON [dbo].[Batch]
GO
CREATE CLUSTERED INDEX [IX_Batch] ON [dbo].[Batch]([BatchID], [AddedOn]) ON [PRIMARY]
GO
