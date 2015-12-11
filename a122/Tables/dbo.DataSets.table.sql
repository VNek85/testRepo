/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSets]') AND type in (N'U'))
DROP TABLE [dbo].[DataSets]
GO
CREATE TABLE [dbo].[DataSets] (
	[ID]		[uniqueidentifier]	 NOT NULL,
	[ItemID]	[uniqueidentifier]	 NOT NULL,
	[LinkID]	[uniqueidentifier]	 NULL,
	[Name]		[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[DataSets] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[DataSets] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[DataSets] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[DataSets] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[DataSets] TO [RSExecRole]
GO
