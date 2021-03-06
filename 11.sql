/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
CREATE DATABASE [CloudStorageContent_Tests]
GO
USE [CloudStorageContent_Tests]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobHistory]') AND type in (N'U'))
DROP TABLE [dbo].[JobHistory]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Servers]') AND type in (N'U'))
DROP TABLE [dbo].[Servers]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddExecutionLogEntry]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddExecutionLogEntry]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddReportSchedule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddReportSchedule]
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
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLServers]') AND type in (N'U'))
DROP TABLE [dbo].[SQLServers]
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
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Databases]') AND type in (N'U'))
DROP TABLE [dbo].[Databases]
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
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Revision2Disks]') AND type in (N'U'))
DROP TABLE [dbo].[Revision2Disks]
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
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Subscriptions_Catalog]') AND parent_object_id = OBJECT_ID(N'[dbo].[Subscriptions]'))
ALTER TABLE [dbo].[Subscriptions] DROP CONSTRAINT [FK_Subscriptions_Catalog]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportSchedule_Report]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportSchedule]'))
ALTER TABLE [dbo].[ReportSchedule] DROP CONSTRAINT [FK_ReportSchedule_Report]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSourceItemID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSource]'))
ALTER TABLE [dbo].[DataSource] DROP CONSTRAINT [FK_DataSourceItemID]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Catalog_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Catalog]'))
ALTER TABLE [dbo].[Catalog] DROP CONSTRAINT [FK_Catalog_Policy]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Catalog_ParentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Catalog]'))
ALTER TABLE [dbo].[Catalog] DROP CONSTRAINT [FK_Catalog_ParentID]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Catalog_ModifiedByID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Catalog]'))
ALTER TABLE [dbo].[Catalog] DROP CONSTRAINT [FK_Catalog_ModifiedByID]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Catalog_LinkSourceID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Catalog]'))
ALTER TABLE [dbo].[Catalog] DROP CONSTRAINT [FK_Catalog_LinkSourceID]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Catalog_CreatedByID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Catalog]'))
ALTER TABLE [dbo].[Catalog] DROP CONSTRAINT [FK_Catalog_CreatedByID]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Catalog]') AND type in (N'U'))
DROP TABLE [dbo].[Catalog]
GO
CREATE TABLE [dbo].[Catalog] (
	[ItemID]			[uniqueidentifier]	 NOT NULL,
	[Path]				[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Name]				[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[ParentID]			[uniqueidentifier]	 NULL,
	[Type]				[int]				 NOT NULL,
	[Content]			[image]				 NULL,
	[Intermediate]		[uniqueidentifier]	 NULL,
	[SnapshotDataID]	[uniqueidentifier]	 NULL,
	[LinkSourceID]		[uniqueidentifier]	 NULL,
	[Property]			[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Description]		[nvarchar](512)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Hidden]			[bit]				 NULL,
	[CreatedByID]		[uniqueidentifier]	 NOT NULL,
	[CreationDate]		[datetime]			 NOT NULL,
	[ModifiedByID]		[uniqueidentifier]	 NOT NULL,
	[ModifiedDate]		[datetime]			 NOT NULL,
	[MimeType]			[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[SnapshotLimit]		[int]				 NULL,
	[Parameter]			[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[PolicyID]			[uniqueidentifier]	 NOT NULL,
	[PolicyRoot]		[bit]				 NOT NULL,
	[ExecutionFlag]		[int]				 NOT NULL,
	[ExecutionTime]		[datetime]			 NULL,
	[SubType]			[nvarchar](128)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ComponentID]		[uniqueidentifier]	 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Catalog] ADD CONSTRAINT [PK_Catalog] PRIMARY KEY NONCLUSTERED ([ItemID])
GO
CREATE TABLE [dbo].[Policies] (
	[PolicyID]		[uniqueidentifier]	 NOT NULL,
	[PolicyFlag]	[tinyint]			 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Policies] ADD CONSTRAINT [PK_Policies] PRIMARY KEY CLUSTERED ([PolicyID])
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'RSExecRole' AND type = 'R') 
DROP ROLE [RSExecRole]
GO
CREATE ROLE [RSExecRole] AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'db_owner', N'RSExecRole'
GO
GRANT DELETE ON [dbo].[Policies] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Policies] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Policies] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Policies] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Policies] TO [RSExecRole]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policies]') AND type in (N'U'))
DROP TABLE [dbo].[Policies]
GO
ALTER TABLE [dbo].[Catalog] WITH NOCHECK ADD CONSTRAINT [FK_Catalog_Policy] FOREIGN KEY ([PolicyID]) REFERENCES [dbo].[Policies] ([PolicyID])
GO
ALTER TABLE [dbo].[Catalog] WITH NOCHECK ADD CONSTRAINT [FK_Catalog_ParentID] FOREIGN KEY ([ParentID]) REFERENCES [dbo].[Catalog] ([ItemID])
GO
CREATE TABLE [dbo].[Users] (
	[UserID]		[uniqueidentifier]	 NOT NULL,
	[Sid]			[varbinary](85)		 NULL,
	[UserType]		[int]				 NOT NULL,
	[AuthType]		[int]				 NOT NULL,
	[UserName]		[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK_Users] PRIMARY KEY NONCLUSTERED ([UserID])
GO
CREATE UNIQUE CLUSTERED INDEX [IX_Users] ON [dbo].[Users]([Sid], [UserName], [AuthType]) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[Users] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Users] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Users] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Users] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Users] TO [RSExecRole]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Subscriptions_Owner]') AND parent_object_id = OBJECT_ID(N'[dbo].[Subscriptions]'))
ALTER TABLE [dbo].[Subscriptions] DROP CONSTRAINT [FK_Subscriptions_Owner]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Subscriptions_ModifiedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Subscriptions]'))
ALTER TABLE [dbo].[Subscriptions] DROP CONSTRAINT [FK_Subscriptions_ModifiedBy]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Schedule_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Schedule]'))
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [FK_Schedule_Users]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
ALTER TABLE [dbo].[Catalog] WITH NOCHECK ADD CONSTRAINT [FK_Catalog_ModifiedByID] FOREIGN KEY ([ModifiedByID]) REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Catalog] WITH NOCHECK ADD CONSTRAINT [FK_Catalog_LinkSourceID] FOREIGN KEY ([LinkSourceID]) REFERENCES [dbo].[Catalog] ([ItemID])
GO
ALTER TABLE [dbo].[Catalog] WITH NOCHECK ADD CONSTRAINT [FK_Catalog_CreatedByID] FOREIGN KEY ([CreatedByID]) REFERENCES [dbo].[Users] ([UserID])
GO
CREATE NONCLUSTERED INDEX [IX_SnapshotDataId] ON [dbo].[Catalog]([SnapshotDataID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Parent] ON [dbo].[Catalog]([ParentID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Link] ON [dbo].[Catalog]([LinkSourceID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ComponentLookup] ON [dbo].[Catalog]([Type], [ComponentID]) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_Catalog] ON [dbo].[Catalog]([Path]) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[Catalog] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Catalog] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Catalog] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Catalog] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Catalog] TO [RSExecRole]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExecutionLogStorage]') AND type in (N'U'))
DROP TABLE [dbo].[ExecutionLogStorage]
GO
CREATE TABLE [dbo].[ExecutionLogStorage] (
	[LogEntryId]			[bigint]			 IDENTITY(1, 1) NOT NULL,
	[InstanceName]			[nvarchar](38)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[ReportID]				[uniqueidentifier]	 NULL,
	[UserName]				[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ExecutionId]			[nvarchar](64)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[RequestType]			[tinyint]			 NOT NULL,
	[Format]				[nvarchar](26)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Parameters]			[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ReportAction]			[tinyint]			 NULL,
	[TimeStart]				[datetime]			 NOT NULL,
	[TimeEnd]				[datetime]			 NOT NULL,
	[TimeDataRetrieval]		[int]				 NOT NULL,
	[TimeProcessing]		[int]				 NOT NULL,
	[TimeRendering]			[int]				 NOT NULL,
	[Source]				[tinyint]			 NOT NULL,
	[Status]				[nvarchar](40)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[ByteCount]				[bigint]			 NOT NULL,
	[RowCount]				[bigint]			 NOT NULL,
	[AdditionalInfo]		[xml]				 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExecutionLogStorage] ADD CONSTRAINT [PK__Executio__05F5D745497B2821] PRIMARY KEY CLUSTERED ([LogEntryId])
GO
CREATE NONCLUSTERED INDEX [IX_ExecutionLog] ON [dbo].[ExecutionLogStorage]([TimeStart], [LogEntryId]) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[ExecutionLogStorage] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ExecutionLogStorage] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ExecutionLogStorage] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ExecutionLogStorage] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ExecutionLogStorage] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddExecutionLogEntry]
@InstanceName nvarchar(38),
@Report nvarchar(260),
@UserSid varbinary(85) = NULL,
@UserName nvarchar(260),
@AuthType int,
@RequestType tinyint,
@Format nvarchar(26),
@Parameters ntext,
@TimeStart DateTime,
@TimeEnd DateTime,
@TimeDataRetrieval int,
@TimeProcessing int,
@TimeRendering int,
@Source tinyint,
@Status nvarchar(40),
@ByteCount bigint,
@RowCount bigint,
@ExecutionId nvarchar(64) = null,
@ReportAction tinyint, 
@AdditionalInfo xml = null
AS

-- Unless is is specifically 'False', it's true
if exists (select * from ConfigurationInfo where [Name] = 'EnableExecutionLogging' and [Value] like 'False')
begin
return
end

Declare @ReportID uniqueidentifier
select @ReportID = ItemID from Catalog with (nolock) where Path = @Report

insert into ExecutionLogStorage
(InstanceName, ReportID, UserName, ExecutionId, RequestType, [Format], Parameters, ReportAction, TimeStart, TimeEnd, TimeDataRetrieval, TimeProcessing, TimeRendering, Source, Status, ByteCount, [RowCount], AdditionalInfo)
Values
(@InstanceName, @ReportID, @UserName, @ExecutionId, @RequestType, @Format, @Parameters, @ReportAction, @TimeStart, @TimeEnd, @TimeDataRetrieval, @TimeProcessing, @TimeRendering, @Source, @Status, @ByteCount, @RowCount, @AdditionalInfo)
GO
GRANT EXECUTE ON [dbo].[AddExecutionLogEntry] TO [RSExecRole]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportSchedule_Schedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportSchedule]'))
ALTER TABLE [dbo].[ReportSchedule] DROP CONSTRAINT [FK_ReportSchedule_Schedule]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule]') AND type in (N'U'))
DROP TABLE [dbo].[Schedule]
GO
CREATE TABLE [dbo].[Schedule] (
	[ScheduleID]				[uniqueidentifier]	 NOT NULL,
	[Name]						[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[StartDate]					[datetime]			 NOT NULL,
	[Flags]						[int]				 NOT NULL,
	[NextRunTime]				[datetime]			 NULL,
	[LastRunTime]				[datetime]			 NULL,
	[EndDate]					[datetime]			 NULL,
	[RecurrenceType]			[int]				 NULL,
	[MinutesInterval]			[int]				 NULL,
	[DaysInterval]				[int]				 NULL,
	[WeeksInterval]				[int]				 NULL,
	[DaysOfWeek]				[int]				 NULL,
	[DaysOfMonth]				[int]				 NULL,
	[Month]						[int]				 NULL,
	[MonthlyWeek]				[int]				 NULL,
	[State]						[int]				 NULL,
	[LastRunStatus]				[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ScheduledRunTimeout]		[int]				 NULL,
	[CreatedById]				[uniqueidentifier]	 NOT NULL,
	[EventType]					[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[EventData]					[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Type]						[int]				 NOT NULL,
	[ConsistancyCheck]			[datetime]			 NULL,
	[Path]						[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportSchedule_Subscriptions]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportSchedule]'))
ALTER TABLE [dbo].[ReportSchedule] DROP CONSTRAINT [FK_ReportSchedule_Subscriptions]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReportSchedule]') AND type in (N'U'))
DROP TABLE [dbo].[ReportSchedule]
GO
CREATE TABLE [dbo].[ReportSchedule] (
	[ScheduleID]		[uniqueidentifier]	 NOT NULL,
	[ReportID]			[uniqueidentifier]	 NOT NULL,
	[SubscriptionID]	[uniqueidentifier]	 NULL,
	[ReportAction]		[int]				 NOT NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[ReportSchedule_Schedule] ON [dbo].[ReportSchedule]
AFTER DELETE
AS

-- if the deleted row is the last connection between a schedule and a report delete the schedule
-- as long as the schedule is not a shared schedule (type == 0)
delete [Schedule] from 
    [Schedule] S inner join deleted D on S.[ScheduleID] = D.[ScheduleID] 
where
    S.[Type] != 0 and
    not exists (select * from [ReportSchedule] R where S.[ScheduleID] = R.[ScheduleID])
GO
CREATE TABLE [dbo].[Subscriptions] (
	[SubscriptionID]		[uniqueidentifier]	 NOT NULL,
	[OwnerID]				[uniqueidentifier]	 NOT NULL,
	[Report_OID]			[uniqueidentifier]	 NOT NULL,
	[Locale]				[nvarchar](128)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[InactiveFlags]			[int]				 NOT NULL,
	[ExtensionSettings]		[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ModifiedByID]			[uniqueidentifier]	 NOT NULL,
	[ModifiedDate]			[datetime]			 NOT NULL,
	[Description]			[nvarchar](512)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[LastStatus]			[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[EventType]				[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[MatchData]				[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[LastRunTime]			[datetime]			 NULL,
	[Parameters]			[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DataSettings]			[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DeliveryExtension]		[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Version]				[int]				 NOT NULL,
	[ReportZone]			[int]				 NOT NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[Subscription_delete_Schedule] ON [dbo].[Subscriptions] 
AFTER DELETE 
AS
    delete ReportSchedule from ReportSchedule RS inner join deleted D on RS.SubscriptionID = D.SubscriptionID
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSource]') AND type in (N'U'))
DROP TABLE [dbo].[DataSource]
GO
CREATE TABLE [dbo].[DataSource] (
	[DSID]										[uniqueidentifier]	 NOT NULL,
	[ItemID]									[uniqueidentifier]	 NULL,
	[SubscriptionID]							[uniqueidentifier]	 NULL,
	[Name]										[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Extension]									[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Link]										[uniqueidentifier]	 NULL,
	[CredentialRetrieval]						[int]				 NULL,
	[Prompt]									[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ConnectionString]							[image]				 NULL,
	[OriginalConnectionString]					[image]				 NULL,
	[OriginalConnectStringExpressionBased]		[bit]				 NULL,
	[UserName]									[image]				 NULL,
	[Password]									[image]				 NULL,
	[Flags]										[int]				 NULL,
	[Version]									[int]				 NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DataSource] ADD CONSTRAINT [PK_DataSource] PRIMARY KEY CLUSTERED ([DSID])
GO
ALTER TABLE [dbo].[DataSource] WITH NOCHECK ADD CONSTRAINT [FK_DataSourceItemID] FOREIGN KEY ([ItemID]) REFERENCES [dbo].[Catalog] ([ItemID])
GO
CREATE NONCLUSTERED INDEX [IX_DataSourceSubscriptionID] ON [dbo].[DataSource]([SubscriptionID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DataSourceItemID] ON [dbo].[DataSource]([ItemID]) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[DataSource] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[DataSource] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[DataSource] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[DataSource] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[DataSource] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- end session tables
CREATE TRIGGER [dbo].[Subscription_delete_DataSource] ON [dbo].[Subscriptions]
AFTER DELETE 
AS
    delete DataSource from DataSource DS inner join deleted D on DS.SubscriptionID = D.SubscriptionID
GO
ALTER TABLE [dbo].[Subscriptions] ADD CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED ([SubscriptionID])
GO
ALTER TABLE [dbo].[Subscriptions] WITH NOCHECK ADD CONSTRAINT [FK_Subscriptions_Owner] FOREIGN KEY ([OwnerID]) REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Subscriptions] WITH NOCHECK ADD CONSTRAINT [FK_Subscriptions_ModifiedBy] FOREIGN KEY ([ModifiedByID]) REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Subscriptions] WITH NOCHECK ADD CONSTRAINT [FK_Subscriptions_Catalog] FOREIGN KEY ([Report_OID]) REFERENCES [dbo].[Catalog] ([ItemID]) ON DELETE CASCADE NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[Subscriptions] ADD CONSTRAINT [DF__Subscript__Repor__16644E42] DEFAULT ((0)) FOR [ReportZone]
GO
GRANT DELETE ON [dbo].[Subscriptions] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Subscriptions] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Subscriptions] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Subscriptions] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Subscriptions] TO [RSExecRole]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subscriptions]') AND type in (N'U'))
DROP TABLE [dbo].[Subscriptions]
GO
ALTER TABLE [dbo].[ReportSchedule] WITH NOCHECK ADD CONSTRAINT [FK_ReportSchedule_Subscriptions] FOREIGN KEY ([SubscriptionID]) REFERENCES [dbo].[Subscriptions] ([SubscriptionID]) NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[ReportSchedule] NOCHECK CONSTRAINT [FK_ReportSchedule_Subscriptions]
GO
ALTER TABLE [dbo].[Schedule] ADD CONSTRAINT [PK_ScheduleID] PRIMARY KEY CLUSTERED ([ScheduleID])
GO
ALTER TABLE [dbo].[ReportSchedule] ADD CONSTRAINT [FK_ReportSchedule_Schedule] FOREIGN KEY ([ScheduleID]) REFERENCES [dbo].[Schedule] ([ScheduleID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReportSchedule] ADD CONSTRAINT [FK_ReportSchedule_Report] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[Catalog] ([ItemID]) ON DELETE CASCADE
GO
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_SubscriptionID] ON [dbo].[ReportSchedule]([SubscriptionID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_ScheduleID] ON [dbo].[ReportSchedule]([ScheduleID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_ReportID] ON [dbo].[ReportSchedule]([ReportID]) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[ReportSchedule] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ReportSchedule] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ReportSchedule] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ReportSchedule] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ReportSchedule] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[Schedule_UpdateExpiration] ON [dbo].[Schedule]  
AFTER UPDATE
AS 
UPDATE
   EC
SET
   AbsoluteExpiration = I.NextRunTime
FROM
   [ReportServerTempDB].dbo.ExecutionCache AS EC
   INNER JOIN ReportSchedule AS RS ON EC.ReportID = RS.ReportID
   INNER JOIN inserted AS I ON RS.ScheduleID = I.ScheduleID AND RS.ReportAction = 3
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[Schedule_DeleteAgentJob] ON [dbo].[Schedule]  
AFTER DELETE
AS 
DECLARE id_cursor CURSOR
FOR
    SELECT ScheduleID from deleted
OPEN id_cursor

DECLARE @next_id uniqueidentifier
FETCH NEXT FROM id_cursor INTO @next_id
WHILE (@@FETCH_STATUS <> -1) -- -1 == FETCH statement failed or the row was beyond the result set.
BEGIN
    if (@@FETCH_STATUS <> -2) -- - 2 == Row fetched is missing.
    BEGIN
        exec msdb.dbo.sp_delete_job @job_name = @next_id -- delete the schedule
    END
    FETCH NEXT FROM id_cursor INTO @next_id
END
CLOSE id_cursor
DEALLOCATE id_cursor
GO
ALTER TABLE [dbo].[Schedule] ADD CONSTRAINT [IX_Schedule] UNIQUE NONCLUSTERED ([Name], [Path])
GO
ALTER TABLE [dbo].[Schedule] WITH NOCHECK ADD CONSTRAINT [FK_Schedule_Users] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([UserID])
GO
GRANT DELETE ON [dbo].[Schedule] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Schedule] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Schedule] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Schedule] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Schedule] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddReportSchedule]
@ScheduleID uniqueidentifier,
@ReportID uniqueidentifier,
@SubscriptionID uniqueidentifier = NULL,
@Action int
AS

-- VSTS #139366: SQL Deadlock in AddReportSchedule stored procedure
-- Hold lock on [Schedule].[ScheduleID] to prevent deadlock
-- with Schedule_UpdateExpiration Schedule's after update trigger
select 1 from [Schedule] with (HOLDLOCK) where [Schedule].[ScheduleID] = @ScheduleID

Insert into ReportSchedule ([ScheduleID], [ReportID], [SubscriptionID], [ReportAction]) values (@ScheduleID, @ReportID, @SubscriptionID, @Action)
GO
GRANT EXECUTE ON [dbo].[AddReportSchedule] TO [RSExecRole]
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
