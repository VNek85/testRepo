/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
ALTER TABLE [dbo].[Subscriptions] ADD CONSTRAINT [DF__Subscript__Repor__16644E42] DEFAULT ((0)) FOR [ReportZone]
GO
