/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
ALTER TABLE [dbo].[JobHistory] ADD CONSTRAINT [PK_JobHistory_Id] PRIMARY KEY CLUSTERED ([Id])
GO
