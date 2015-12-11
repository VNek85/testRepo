/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ModelPerspective]') AND name = N'IX_ModelPerspective') 
DROP INDEX [IX_ModelPerspective] ON [dbo].[ModelPerspective]
GO
CREATE CLUSTERED INDEX [IX_ModelPerspective] ON [dbo].[ModelPerspective]([ModelID]) ON [PRIMARY]
GO
