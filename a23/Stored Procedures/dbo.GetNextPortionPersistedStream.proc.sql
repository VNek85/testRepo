/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetNextPortionPersistedStream]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetNextPortionPersistedStream]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetNextPortionPersistedStream]
@DataPointer binary(16),
@DataIndex int,
@Length int
AS

READTEXT [ReportServerTempDB].dbo.PersistedStream.Content @DataPointer @DataIndex @Length
GO
GRANT EXECUTE ON [dbo].[GetNextPortionPersistedStream] TO [RSExecRole]
GO
