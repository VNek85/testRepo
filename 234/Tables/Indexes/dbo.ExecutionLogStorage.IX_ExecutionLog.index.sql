/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ExecutionLogStorage]') AND name = N'IX_ExecutionLog') 
DROP INDEX [IX_ExecutionLog] ON [dbo].[ExecutionLogStorage]
GO
CREATE NONCLUSTERED INDEX [IX_ExecutionLog] ON [dbo].[ExecutionLogStorage]([TimeStart], [LogEntryId]) ON [PRIMARY]
GO
