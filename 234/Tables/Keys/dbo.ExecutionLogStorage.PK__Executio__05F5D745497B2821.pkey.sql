/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
ALTER TABLE [dbo].[ExecutionLogStorage] ADD CONSTRAINT [PK__Executio__05F5D745497B2821] PRIMARY KEY CLUSTERED ([LogEntryId])
GO
