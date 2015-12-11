/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCompiledDefinition]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateCompiledDefinition]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateCompiledDefinition]
	@Path				NVARCHAR(425),
	@OldSnapshotId		UNIQUEIDENTIFIER,
	@NewSnapshotId		UNIQUEIDENTIFIER,
	@ItemId				UNIQUEIDENTIFIER OUTPUT
AS BEGIN
	-- we have a clustered unique index on [Path] which the QO 
	-- should match for the filter
	UPDATE [dbo].[Catalog]
	SET [Intermediate] = @NewSnapshotId,
		@ItemId = [ItemID]
	WHERE [Path] = @Path AND 
	      ([Intermediate] = @OldSnapshotId OR (@OldSnapshotId IS NULL AND [Intermediate] IS NULL));
	
	DECLARE @UpdatedReferences INT ;
	SELECT @UpdatedReferences = @@ROWCOUNT ;
	
	IF(@UpdatedReferences <> 0)
	BEGIN
		UPDATE [dbo].[SnapshotData]
		SET [PermanentRefcount] = [PermanentRefcount] + @UpdatedReferences,
			[TransientRefcount] = [TransientRefcount] - 1
		WHERE [SnapshotDataID] = @NewSnapshotId ;
		
		UPDATE [dbo].[SnapshotData]
		SET [PermanentRefcount] = [PermanentRefcount] - @UpdatedReferences
		WHERE [SnapshotDataID] = @OldSnapshotId ;
	END
END

GRANT EXECUTE ON [dbo].[UpdateCompiledDefinition] TO RSExecRole
GO
