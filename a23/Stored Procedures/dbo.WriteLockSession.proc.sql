/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportServer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WriteLockSession]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WriteLockSession]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WriteLockSession]
@SessionID as varchar(32),
@Persisted bit,
@CheckLockVersion bit = 0,
@LockVersion int
AS
SET NOCOUNT OFF ; 
IF @Persisted = 1
BEGIN
	IF @CheckLockVersion = 0
	BEGIN
		UPDATE [ReportServerTempDB].dbo.SessionLock WITH (ROWLOCK)
		SET SessionID = SessionID
		WHERE SessionID = @SessionID;
	END
	ELSE
	BEGIN
		DECLARE @ActualLockVersion as int
			
		UPDATE [ReportServerTempDB].dbo.SessionLock WITH (ROWLOCK)
		SET SessionID = SessionID,
		LockVersion = LockVersion + 1
		WHERE SessionID = @SessionID	
		AND LockVersion = @LockVersion ;
			
		IF (@@ROWCOUNT = 0)
		BEGIN 
			SELECT @ActualLockVersion = LockVersion 
			FROM [ReportServerTempDB].dbo.SessionLock WITH (ROWLOCK)
			WHERE SessionID = @SessionID;
							
			IF (@ActualLockVersion <> @LockVersion)
				RAISERROR ('Invalid version locked', 16,1)
			END 
		END
	END
ELSE
BEGIN
	INSERT INTO [ReportServerTempDB].dbo.SessionLock WITH (ROWLOCK) (SessionID) VALUES (@SessionID)
END
GO
GRANT EXECUTE ON [dbo].[WriteLockSession] TO [RSExecRole]
GO
