/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ModelDrill]') AND name = N'IX_ModelDrillModelID') 
DROP INDEX [IX_ModelDrillModelID] ON [dbo].[ModelDrill]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_ModelDrillModelID] ON [dbo].[ModelDrill]([ModelID], [ReportID], [ModelDrillID]) ON [PRIMARY]
GO
