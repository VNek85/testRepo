/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateEditSession]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateEditSession]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateEditSession]
    @EditSessionID varchar(32),
    @ContextPath nvarchar(440), 	
    @Name nvarchar(440),	
    @OwnerSid varbinary(85) = NULL, 
    @OwnerName nvarchar(260), 
    @Content varbinary(max), 
    @Description nvarchar(max) = NULL, 
    @Intermediate uniqueidentifier,
    @Property nvarchar(max), 
    @Parameter nvarchar(max),
    @AuthType int, 
    @Timeout int, 
    @DataCacheHash varbinary(64) = NULL,
    @NewItemID uniqueidentifier out
as begin
    DECLARE @OwnerID uniqueidentifier ;
    EXEC GetUserID @OwnerSid, @OwnerName, @AuthType, @OwnerID OUTPUT ;	
    
    UPDATE [ReportServerTempDB].dbo.SnapshotData
    SET  PermanentRefcount = PermanentRefcount + 1, TransientRefcount = TransientRefcount - 1 
    WHERE SnapshotData.SnapshotDataID = @Intermediate	
    
    SELECT @NewItemID = NEWID();
    
    -- copy in the report metadata
    insert into [ReportServerTempDB].dbo.TempCatalog (
        EditSessionID, 
        TempCatalogID, 
        ContextPath, 
        [Name],		
        Content, 
        Description,
        Intermediate, 
        IntermediateIsPermanent,
        Property, 
        Parameter,
        OwnerID, 
        CreationTime, 
        ExpirationTime, 
        DataCacheHash )	
    values (			 
        @EditSessionID, 
        @NewItemID, 
        @ContextPath, 
        @Name,		
        @Content, 
        @Description,
        @Intermediate, 
        convert(bit, 0),
        @Property, 
        @Parameter,
        @OwnerID, 
        GETDATE(), 
        DATEADD(n, @Timeout, GETDATE()), 
        @DataCacheHash)
END
GO
GRANT EXECUTE ON [dbo].[CreateEditSession] TO [RSExecRole]
GO
