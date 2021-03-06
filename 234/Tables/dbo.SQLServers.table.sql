/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLServers]') AND type in (N'U'))
DROP TABLE [dbo].[SQLServers]
GO
CREATE TABLE [dbo].[SQLServers] (
	[Id]				[int]			 IDENTITY(1, 1) NOT NULL,
	[Status]			[int]			 NOT NULL,
	[DateCreated]		[datetime]		 NOT NULL,
	[ServerId]			[int]			 NOT NULL,
	[SQLServerName]		[nvarchar](512)	 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
