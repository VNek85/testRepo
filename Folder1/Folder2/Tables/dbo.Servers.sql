/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Servers]') AND type in (N'U'))
DROP TABLE [dbo].[Servers]
GO
CREATE TABLE [dbo].[Servers] (
	[Id]				[int]				 IDENTITY(1, 1) NOT NULL,
	[Status]			[int]				 NOT NULL,
	[DateCreated]		[datetime]			 NOT NULL,
	[ServerName]		[nvarchar](512)		 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AgentId]			[uniqueidentifier]	 NOT NULL,
	CONSTRAINT [PK_Servers_Id] PRIMARY KEY CLUSTERED ([Id]),
	CONSTRAINT [UQ_Servers_AgentID] UNIQUE NONCLUSTERED ([AgentId])
) ON [PRIMARY]
GO
