/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
ALTER TABLE [dbo].[Keys] ADD CONSTRAINT [PK_Keys] PRIMARY KEY CLUSTERED ([InstallationID], [Client])
GO
