/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Batch]') AND type in (N'U'))
DROP TABLE [dbo].[Batch]
GO
CREATE TABLE [dbo].[Batch] (
	[BatchID]		[uniqueidentifier]	 NOT NULL,
	[AddedOn]		[datetime]			 NOT NULL,
	[Action]		[varchar](32)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Item]			[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Parent]		[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Param]			[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[BoolParam]		[bit]				 NULL,
	[Content]		[image]				 NULL,
	[Properties]	[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[Batch] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Batch] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Batch] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Batch] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Batch] TO [RSExecRole]
GO
