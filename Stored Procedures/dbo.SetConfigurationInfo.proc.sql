/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetConfigurationInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetConfigurationInfo]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetConfigurationInfo]
@Name nvarchar (260),
@Value ntext
AS
DELETE
FROM [ConfigurationInfo]
WHERE [Name] = @Name

IF @Value is not null BEGIN
   INSERT
   INTO ConfigurationInfo
   VALUES ( newid(), @Name, @Value )
END
GO
GRANT EXECUTE ON [dbo].[SetConfigurationInfo] TO [RSExecRole]
GO
