/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
ALTER TABLE [dbo].[Revisions] ADD CONSTRAINT [CH_RevBackupType] CHECK (([RevBackupType]>(0)))
GO
