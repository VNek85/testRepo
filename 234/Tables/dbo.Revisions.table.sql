/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Revisions]') AND type in (N'U'))
DROP TABLE [dbo].[Revisions]
GO
CREATE TABLE [dbo].[Revisions] (
	[Id]								[int]				 IDENTITY(1, 1) NOT NULL,
	[Status]							[int]				 NOT NULL,
	[DateCreated]						[datetime]			 NOT NULL,
	[RevisionId]						[uniqueidentifier]	 NOT NULL,
	[RevBackupType]						[tinyint]			 NOT NULL,
	[RevStorageType]					[tinyint]			 NOT NULL,
	[DatabaseId]						[int]				 NOT NULL,
	[DeleteRequest]						[bit]				 NOT NULL,
	[ReuploadAttempts]					[smallint]			 NOT NULL,
	[NeedSendCheckResultToAgent]		[bit]				 NOT NULL,
	[BackupUploadStarted]				[datetime]			 NOT NULL,
	[BackupUploadEnded]					[datetime]			 NULL,
	[ChecksumEnc]						[binary](8)			 NOT NULL,
	[ValidationResultWasSentToUMS]		[bit]				 NOT NULL,
	[FullRevSize]						[bigint]			 NULL,
	[DeltaRevSize]						[bigint]			 NULL,
	[BackupSetId]						[int]				 NOT NULL,
	[FileId]							[int]				 NOT NULL,
	[FileName]							[nvarchar](512)		 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DeleteStatusWasSentToUms]			[bit]				 NOT NULL
) ON [PRIMARY]
GO
