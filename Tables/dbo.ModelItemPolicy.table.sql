/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModelItemPolicy]') AND type in (N'U'))
DROP TABLE [dbo].[ModelItemPolicy]
GO
CREATE TABLE [dbo].[ModelItemPolicy] (
	[ID]				[uniqueidentifier]	 NOT NULL,
	[CatalogItemID]		[uniqueidentifier]	 NOT NULL,
	[ModelItemID]		[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[PolicyID]			[uniqueidentifier]	 NOT NULL
) ON [PRIMARY]
GO
