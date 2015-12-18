/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'RSExecRole' AND type = 'R') 
DROP ROLE [RSExecRole]
GO
CREATE ROLE [RSExecRole] AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'db_owner', N'RSExecRole'
GO
