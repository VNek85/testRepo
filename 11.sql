/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
CREATE DATABASE [CloudStorageContent_Tests]
GO
USE [CloudStorageContent_Tests]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DatabaseId_Databases_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Revisions]'))
ALTER TABLE [dbo].[Revisions] DROP CONSTRAINT [FK_DatabaseId_Databases_Id]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Databases_SQLServers_SQLServerId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Databases]'))
ALTER TABLE [dbo].[Databases] DROP CONSTRAINT [FK_Databases_SQLServers_SQLServerId]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Databases]') AND type in (N'U'))
DROP TABLE [dbo].[Databases]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobHistory]') AND type in (N'U'))
DROP TABLE [dbo].[JobHistory]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LockObjects_Revisions_RevisionId]') AND parent_object_id = OBJECT_ID(N'[dbo].[LockObjects]'))
ALTER TABLE [dbo].[LockObjects] DROP CONSTRAINT [FK_LockObjects_Revisions_RevisionId]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LockObjects]') AND type in (N'U'))
DROP TABLE [dbo].[LockObjects]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReplicationTasks_Revision2Disks_RevisionId_SourceDiskID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReplicationTasks]'))
ALTER TABLE [dbo].[ReplicationTasks] DROP CONSTRAINT [FK_ReplicationTasks_Revision2Disks_RevisionId_SourceDiskID]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReplicationTasks]') AND type in (N'U'))
DROP TABLE [dbo].[ReplicationTasks]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Revision2Disks_Revisions_RevisionId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Revision2Disks]'))
ALTER TABLE [dbo].[Revision2Disks] DROP CONSTRAINT [FK_Revision2Disks_Revisions_RevisionId]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Revision2Disks]') AND type in (N'U'))
DROP TABLE [dbo].[Revision2Disks]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Revisions]') AND type in (N'U'))
DROP TABLE [dbo].[Revisions]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SQLServers_Servers_ServerId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SQLServers]'))
ALTER TABLE [dbo].[SQLServers] DROP CONSTRAINT [FK_SQLServers_Servers_ServerId]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Servers]') AND type in (N'U'))
DROP TABLE [dbo].[Servers]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLServers]') AND type in (N'U'))
DROP TABLE [dbo].[SQLServers]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MGMT_MNL_TMP_MarkRevisionAsCorrupted]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MGMT_MNL_TMP_MarkRevisionAsCorrupted]
GO
IF  EXISTS (SELECT * FROM sys.routes WHERE name = N'AutoCreatedLocal') 
DROP ROUTE [AutoCreatedLocal]
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET ANSI_NULLS OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET ANSI_PADDING OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET ARITHABORT OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET ENABLE_BROKER
GO
ALTER DATABASE [CloudStorageContent_Tests]
COLLATE SQL_Latin1_General_CP1_CI_AS
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET COMPATIBILITY_LEVEL = 110
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET CONTAINMENT = NONE
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET DB_CHAINING OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET READ_WRITE
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET CURSOR_DEFAULT GLOBAL
GO
exec sp_fulltext_database enable
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET RECOVERY FULL
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET MULTI_USER
WITH ROLLBACK IMMEDIATE
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CloudStorageContent_Tests]
SET TRUSTWORTHY OFF
GO
CREATE TABLE [dbo].[Databases] (
	[Id]					[int]			 NOT NULL,
	[Status]				[int]			 NOT NULL,
	[DateCreated]			[datetime]		 NOT NULL,
	[SQLServerId]			[int]			 NOT NULL,
	[DatabaseName]			[nvarchar](512)	 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ReplicationStatus]		[int]			 NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Databases] ADD CONSTRAINT [PK_Databases_Id] PRIMARY KEY CLUSTERED ([Id])
GO
CREATE TABLE [dbo].[SQLServers] (
	[Id]				[int]			 IDENTITY(1, 1) NOT NULL,
	[Status]			[int]			 NOT NULL,
	[DateCreated]		[datetime]		 NOT NULL,
	[ServerId]			[int]			 NOT NULL,
	[SQLServerName]		[nvarchar](512)	 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SQLServers] ADD CONSTRAINT [PK_SQLServers_Id] PRIMARY KEY CLUSTERED ([Id])
GO
CREATE TABLE [dbo].[Servers] (
	[Id]				[int]				 IDENTITY(1, 1) NOT NULL,
	[Status]			[int]				 NOT NULL,
	[DateCreated]		[datetime]			 NOT NULL,
	[ServerName]		[nvarchar](512)		 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AgentId]			[uniqueidentifier]	 NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Servers] ADD CONSTRAINT [PK_Servers_Id] PRIMARY KEY CLUSTERED ([Id])
GO
ALTER TABLE [dbo].[Servers] ADD CONSTRAINT [UQ_Servers_AgentID] UNIQUE NONCLUSTERED ([AgentId])
GO
ALTER TABLE [dbo].[SQLServers] ADD CONSTRAINT [FK_SQLServers_Servers_ServerId] FOREIGN KEY ([ServerId]) REFERENCES [dbo].[Servers] ([Id])
GO
ALTER TABLE [dbo].[Databases] ADD CONSTRAINT [FK_Databases_SQLServers_SQLServerId] FOREIGN KEY ([SQLServerId]) REFERENCES [dbo].[SQLServers] ([Id])
GO
CREATE TABLE [dbo].[JobHistory] (
	[Id]				[int]			 IDENTITY(1, 1) NOT NULL,
	[Name]				[nvarchar](512)	 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StartDate]			[datetime]		 NOT NULL,
	[EndDate]			[datetime]		 NOT NULL,
	[LastResult]		[int]			 NOT NULL,
	[NextStartDate]		[datetime]		 NOT NULL,
	[JobCode]			[int]			 NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[JobHistory] ADD CONSTRAINT [PK_JobHistory_Id] PRIMARY KEY CLUSTERED ([Id])
GO
CREATE TABLE [dbo].[LockObjects] (
	[Id]				[int]				 IDENTITY(1, 1) NOT NULL,
	[DateCreated]		[datetime]			 NOT NULL,
	[RevisionId]		[uniqueidentifier]	 NOT NULL,
	[DiskId]			[uniqueidentifier]	 NOT NULL,
	[Operation]			[smallint]			 NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LockObjects] ADD CONSTRAINT [PK_LockObjects] PRIMARY KEY CLUSTERED ([Id])
GO
ALTER TABLE [dbo].[LockObjects] ADD CONSTRAINT [UQ_LockObjects_1] UNIQUE NONCLUSTERED ([RevisionId], [DiskId], [Operation])
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
ALTER TABLE [dbo].[Revisions] ADD CONSTRAINT [PK_Revisions_Id] PRIMARY KEY CLUSTERED ([Id])
GO
CREATE NONCLUSTERED INDEX [IX_Revisions_DatabaseId] ON [dbo].[Revisions]([DatabaseId]) INCLUDE([RevisionId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Revisions] ADD CONSTRAINT [UQ_Revisions_DbId_FileId] UNIQUE NONCLUSTERED ([DatabaseId], [FileId])
GO
ALTER TABLE [dbo].[Revisions] ADD CONSTRAINT [UQ_Revisions_DbId_RevisionId] UNIQUE NONCLUSTERED ([DatabaseId], [RevisionId])
GO
ALTER TABLE [dbo].[Revisions] ADD CONSTRAINT [UQ_Revisions_RevisionId] UNIQUE NONCLUSTERED ([RevisionId])
GO
ALTER TABLE [dbo].[Revisions] ADD CONSTRAINT [CH_FileName_FileId] CHECK (([FileId]<>(0)))
GO
ALTER TABLE [dbo].[Revisions] ADD CONSTRAINT [CH_FileName_FileName] CHECK (([FileName]<>''))
GO
ALTER TABLE [dbo].[Revisions] ADD CONSTRAINT [CH_RevBackupType] CHECK (([RevBackupType]>(0)))
GO
ALTER TABLE [dbo].[Revisions] ADD CONSTRAINT [FK_DatabaseId_Databases_Id] FOREIGN KEY ([DatabaseId]) REFERENCES [dbo].[Databases] ([Id])
GO
ALTER TABLE [dbo].[LockObjects] ADD CONSTRAINT [FK_LockObjects_Revisions_RevisionId] FOREIGN KEY ([RevisionId]) REFERENCES [dbo].[Revisions] ([RevisionId])
GO
CREATE TABLE [dbo].[ReplicationTasks] (
	[Id]					[int]				 IDENTITY(1, 1) NOT NULL,
	[Status]				[int]				 NOT NULL,
	[DateCreated]			[datetime]			 NOT NULL,
	[RevisionId]			[uniqueidentifier]	 NOT NULL,
	[SourceDiskID]			[uniqueidentifier]	 NOT NULL,
	[TargetStorageID]		[uniqueidentifier]	 NOT NULL,
	[TargetDiskID]			[uniqueidentifier]	 NOT NULL,
	[Priority]				[int]				 NOT NULL,
	[HasHashList]			[bit]				 NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReplicationTasks] ADD CONSTRAINT [PK_ReplicationTasks_Id] PRIMARY KEY CLUSTERED ([Id])
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ReplicationTasks_RevisionID_TargetDiskId] ON [dbo].[ReplicationTasks]([RevisionId], [TargetDiskID]) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Revision2Disks] (
	[Id]				[int]				 IDENTITY(1, 1) NOT NULL,
	[Status]			[int]				 NOT NULL,
	[DateCreated]		[datetime]			 NOT NULL,
	[RevisionId]		[uniqueidentifier]	 NOT NULL,
	[DiskID]			[uniqueidentifier]	 NOT NULL,
	[Path]				[nvarchar](1024)	 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ChecksumState]		[int]				 NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Revision2Disks] ADD CONSTRAINT [PK_Revision2Disks_Id] PRIMARY KEY CLUSTERED ([Id])
GO
ALTER TABLE [dbo].[Revision2Disks] ADD CONSTRAINT [UQ_Revision2Disks_RevisionId_DiskID] UNIQUE NONCLUSTERED ([RevisionId], [DiskID])
GO
ALTER TABLE [dbo].[Revision2Disks] ADD CONSTRAINT [FK_Revision2Disks_Revisions_RevisionId] FOREIGN KEY ([RevisionId]) REFERENCES [dbo].[Revisions] ([RevisionId])
GO
ALTER TABLE [dbo].[ReplicationTasks] ADD CONSTRAINT [FK_ReplicationTasks_Revision2Disks_RevisionId_SourceDiskID] FOREIGN KEY ([RevisionId], [SourceDiskID]) REFERENCES [dbo].[Revision2Disks] ([RevisionId], [DiskID])
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
CREATE ROUTE [AutoCreatedLocal]
AUTHORIZATION [dbo]
WITH
	ADDRESS = 'LOCAL'
GO
