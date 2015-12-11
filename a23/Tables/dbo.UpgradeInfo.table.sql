/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpgradeInfo]') AND type in (N'U'))
DROP TABLE [dbo].[UpgradeInfo]
GO
CREATE TABLE [dbo].[UpgradeInfo] (
	[Item]		[nvarchar](260)	 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Status]	[nvarchar](512)	 COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]
GO
