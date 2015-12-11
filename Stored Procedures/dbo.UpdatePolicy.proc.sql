/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdatePolicy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdatePolicy]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdatePolicy]
@PolicyID as uniqueidentifier,
@PrimarySecDesc as image,
@SecondarySecDesc as ntext = NULL,
@AuthType int
AS
UPDATE SecData SET NtSecDescPrimary = @PrimarySecDesc,
NtSecDescSecondary = @SecondarySecDesc 
WHERE SecData.PolicyID = @PolicyID
AND SecData.AuthType = @AuthType
GO
GRANT EXECUTE ON [dbo].[UpdatePolicy] TO [RSExecRole]
GO
