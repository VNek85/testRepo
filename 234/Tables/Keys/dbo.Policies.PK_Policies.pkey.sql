/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
ALTER TABLE [dbo].[Policies] ADD CONSTRAINT [PK_Policies] PRIMARY KEY CLUSTERED ([PolicyID])
GO
