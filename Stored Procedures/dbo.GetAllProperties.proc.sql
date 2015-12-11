/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [ReportDb2]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAllProperties]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAllProperties]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetAllProperties]
@Path nvarchar (425),
@EditSessionID varchar(32) = NULL,
@OwnerSid as varbinary(85) = NULL, 
@OwnerName as nvarchar(260) = NULL,
@AuthType int
AS
BEGIN

DECLARE @OwnerID uniqueidentifier
if(@EditSessionID is not null)
BEGIN
    EXEC GetUserID @OwnerSid, @OwnerName, @AuthType, @OwnerID OUTPUT
END

select
   Property,
   Description,
   Type,
   DATALENGTH( Content ),
   ItemID, 
   SUSER_SNAME(C.Sid),
   C.UserName,
   CreationDate,
   SUSER_SNAME(M.Sid),
   M.UserName,
   ModifiedDate,
   MimeType,
   ExecutionTime,
   NtSecDescPrimary,
   [LinkSourceID],
   Hidden,
   ExecutionFlag,
   SnapshotLimit, 
   [Name], 
   SubType,
   ComponentID
FROM ExtendedCatalog(@OwnerID, @Path, @EditSessionID) Catalog
   INNER JOIN Users C ON Catalog.CreatedByID = C.UserID
   INNER JOIN Users M ON Catalog.ModifiedByID = M.UserID
   LEFT OUTER JOIN SecData ON Catalog.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType
END
GO
GRANT EXECUTE ON [dbo].[GetAllProperties] TO [RSExecRole]
GO
