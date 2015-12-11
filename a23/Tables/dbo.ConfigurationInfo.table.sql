/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConfigurationInfo]') AND type in (N'U'))
DROP TABLE [dbo].[ConfigurationInfo]
GO
CREATE TABLE [dbo].[ConfigurationInfo] (
	[ConfigInfoID]		[uniqueidentifier]	 NOT NULL,
	[Name]				[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Value]				[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[ConfigurationInfo] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ConfigurationInfo] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ConfigurationInfo] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ConfigurationInfo] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ConfigurationInfo] TO [RSExecRole]
GO
