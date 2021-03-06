/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
USE [CloudStorageContent_Tests]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MGMT_MNL_TMP_MarkRevisionAsCorrupted]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MGMT_MNL_TMP_MarkRevisionAsCorrupted]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MGMT_MNL_TMP_MarkRevisionAsCorrupted] @RevisionId uniqueidentifier
as
-- Для указанной ревизии портим контрольную сумму и выставляем статус "готова к проверке".
-- В результате она будет признана сбойной и будет удалена вместе с теми, что выложены позже
-- Применяется до тех пор, пока нет возможности корректно удалять ревизии из облака. После будет заменена на другие хранимые процедуры в совокупности с удалением файлов
begin transaction
	update Revisions
	set
		ChecksumEnc = 0x3333333333333333,
		ValidationResultWasSentToUMS = 0
	where RevisionId = @RevisionId
	update Revision2Disks
	set
		ChecksumState = 1
	where RevisionId = @RevisionId
commit transaction
GO
