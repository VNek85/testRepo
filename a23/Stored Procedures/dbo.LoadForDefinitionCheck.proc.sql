/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoadForDefinitionCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[LoadForDefinitionCheck]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- For loading compiled definitions to check for internal republishing, this is
-- done before calling GetCompiledDefinition or GetReportForExecution
CREATE PROCEDURE [dbo].[LoadForDefinitionCheck]
@Path					nvarchar(425), 
@AcquireUpdateLocks	bit,
@AuthType				int
AS
IF(@AcquireUpdateLocks = 0) BEGIN
SELECT 
		CompiledDefinition.SnapshotDataID,
		CompiledDefinition.ProcessingFlags,
		SecData.NtSecDescPrimary
	FROM Catalog MainItem
	LEFT OUTER JOIN SecData ON (MainItem.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType)
	LEFT OUTER JOIN Catalog LinkTarget WITH (INDEX = PK_CATALOG) ON (MainItem.LinkSourceID = LinkTarget.ItemID)
	JOIN SnapshotData CompiledDefinition ON (CompiledDefinition.SnapshotDataID = COALESCE(LinkTarget.Intermediate, MainItem.Intermediate))	
	WHERE MainItem.Path = @Path AND (MainItem.Type = 2 /* Report */ OR MainItem.Type = 4 /* Linked Report */)  
END
ELSE BEGIN
	-- acquire upgrade locks, this means that the check is being perform in a 
	-- different transaction context which will be committed before trying to 
	-- perform the actual load, to prevent deadlock in the case where we have to 
	-- republish this new transaction will acquire and hold upgrade locks
SELECT 
		CompiledDefinition.SnapshotDataID,
		CompiledDefinition.ProcessingFlags,
		SecData.NtSecDescPrimary
	FROM Catalog MainItem WITH(UPDLOCK ROWLOCK)
	LEFT OUTER JOIN SecData ON (MainItem.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType)
	LEFT OUTER JOIN Catalog LinkTarget WITH (UPDLOCK ROWLOCK INDEX = PK_CATALOG) ON (MainItem.LinkSourceID = LinkTarget.ItemID)
	JOIN SnapshotData CompiledDefinition WITH(UPDLOCK ROWLOCK) ON (CompiledDefinition.SnapshotDataID = COALESCE(LinkTarget.Intermediate, MainItem.Intermediate))	
	WHERE MainItem.Path = @Path AND (MainItem.Type = 2 /* Report */ OR MainItem.Type = 4 /* Linked Report */)  
END
GO
GRANT EXECUTE ON [dbo].[LoadForDefinitionCheck] TO [RSExecRole]
GO
