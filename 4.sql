/*
Run this script on SQL Server 2008 or later. There may be flaws if running on earlier versions of SQL Server.
*/
CREATE DATABASE [CloudStorageContent_Tests]
GO
USE [CloudStorageContent_Tests]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActiveSubscriptions_Subscriptions]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActiveSubscriptions]'))
ALTER TABLE [dbo].[ActiveSubscriptions] DROP CONSTRAINT [FK_ActiveSubscriptions_Subscriptions]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActiveSubscriptions]') AND type in (N'U'))
DROP TABLE [dbo].[ActiveSubscriptions]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Batch]') AND type in (N'U'))
DROP TABLE [dbo].[Batch]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CachePolicyReportID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CachePolicy]'))
ALTER TABLE [dbo].[CachePolicy] DROP CONSTRAINT [FK_CachePolicyReportID]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CachePolicy]') AND type in (N'U'))
DROP TABLE [dbo].[CachePolicy]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Catalog_CreatedByID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Catalog]'))
ALTER TABLE [dbo].[Catalog] DROP CONSTRAINT [FK_Catalog_CreatedByID]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Catalog_LinkSourceID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Catalog]'))
ALTER TABLE [dbo].[Catalog] DROP CONSTRAINT [FK_Catalog_LinkSourceID]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Catalog_ModifiedByID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Catalog]'))
ALTER TABLE [dbo].[Catalog] DROP CONSTRAINT [FK_Catalog_ModifiedByID]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Catalog_ParentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Catalog]'))
ALTER TABLE [dbo].[Catalog] DROP CONSTRAINT [FK_Catalog_ParentID]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Catalog_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Catalog]'))
ALTER TABLE [dbo].[Catalog] DROP CONSTRAINT [FK_Catalog_Policy]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSourceItemID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSource]'))
ALTER TABLE [dbo].[DataSource] DROP CONSTRAINT [FK_DataSourceItemID]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportSchedule_Report]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportSchedule]'))
ALTER TABLE [dbo].[ReportSchedule] DROP CONSTRAINT [FK_ReportSchedule_Report]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Subscriptions_Catalog]') AND parent_object_id = OBJECT_ID(N'[dbo].[Subscriptions]'))
ALTER TABLE [dbo].[Subscriptions] DROP CONSTRAINT [FK_Subscriptions_Catalog]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetItemID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSets]'))
ALTER TABLE [dbo].[DataSets] DROP CONSTRAINT [FK_DataSetItemID]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetLinkID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSets]'))
ALTER TABLE [dbo].[DataSets] DROP CONSTRAINT [FK_DataSetLinkID]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ModelDrillModel]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModelDrill]'))
ALTER TABLE [dbo].[ModelDrill] DROP CONSTRAINT [FK_ModelDrillModel]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ModelDrillReport]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModelDrill]'))
ALTER TABLE [dbo].[ModelDrill] DROP CONSTRAINT [FK_ModelDrillReport]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ModelPerspectiveModel]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModelPerspective]'))
ALTER TABLE [dbo].[ModelPerspective] DROP CONSTRAINT [FK_ModelPerspectiveModel]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Catalog]') AND type in (N'U'))
DROP TABLE [dbo].[Catalog]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChunkData]') AND type in (N'U'))
DROP TABLE [dbo].[ChunkData]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChunkSegmentMapping]') AND type in (N'U'))
DROP TABLE [dbo].[ChunkSegmentMapping]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConfigurationInfo]') AND type in (N'U'))
DROP TABLE [dbo].[ConfigurationInfo]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSets]') AND type in (N'U'))
DROP TABLE [dbo].[DataSets]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSource]') AND type in (N'U'))
DROP TABLE [dbo].[DataSource]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DBUpgradeHistory]') AND type in (N'U'))
DROP TABLE [dbo].[DBUpgradeHistory]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExecutionLogStorage]') AND type in (N'U'))
DROP TABLE [dbo].[ExecutionLogStorage]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[History]') AND type in (N'U'))
DROP TABLE [dbo].[History]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Keys]') AND type in (N'U'))
DROP TABLE [dbo].[Keys]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModelDrill]') AND type in (N'U'))
DROP TABLE [dbo].[ModelDrill]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PoliciesPolicyID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModelItemPolicy]'))
ALTER TABLE [dbo].[ModelItemPolicy] DROP CONSTRAINT [FK_PoliciesPolicyID]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModelItemPolicy]') AND type in (N'U'))
DROP TABLE [dbo].[ModelItemPolicy]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModelPerspective]') AND type in (N'U'))
DROP TABLE [dbo].[ModelPerspective]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Notifications_Subscriptions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Notifications]'))
ALTER TABLE [dbo].[Notifications] DROP CONSTRAINT [FK_Notifications_Subscriptions]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Notifications]') AND type in (N'U'))
DROP TABLE [dbo].[Notifications]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PolicyUserRole_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyUserRole]'))
ALTER TABLE [dbo].[PolicyUserRole] DROP CONSTRAINT [FK_PolicyUserRole_Policy]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecDataPolicyID]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecData]'))
ALTER TABLE [dbo].[SecData] DROP CONSTRAINT [FK_SecDataPolicyID]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policies]') AND type in (N'U'))
DROP TABLE [dbo].[Policies]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PolicyUserRole_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyUserRole]'))
ALTER TABLE [dbo].[PolicyUserRole] DROP CONSTRAINT [FK_PolicyUserRole_Role]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PolicyUserRole_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyUserRole]'))
ALTER TABLE [dbo].[PolicyUserRole] DROP CONSTRAINT [FK_PolicyUserRole_User]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyUserRole]') AND type in (N'U'))
DROP TABLE [dbo].[PolicyUserRole]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportSchedule_Schedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportSchedule]'))
ALTER TABLE [dbo].[ReportSchedule] DROP CONSTRAINT [FK_ReportSchedule_Schedule]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportSchedule_Subscriptions]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportSchedule]'))
ALTER TABLE [dbo].[ReportSchedule] DROP CONSTRAINT [FK_ReportSchedule_Subscriptions]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReportSchedule]') AND type in (N'U'))
DROP TABLE [dbo].[ReportSchedule]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RunningJobs]') AND type in (N'U'))
DROP TABLE [dbo].[RunningJobs]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Schedule_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Schedule]'))
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [FK_Schedule_Users]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule]') AND type in (N'U'))
DROP TABLE [dbo].[Schedule]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecData]') AND type in (N'U'))
DROP TABLE [dbo].[SecData]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Segment]') AND type in (N'U'))
DROP TABLE [dbo].[Segment]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SegmentedChunk]') AND type in (N'U'))
DROP TABLE [dbo].[SegmentedChunk]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerParametersInstance]') AND type in (N'U'))
DROP TABLE [dbo].[ServerParametersInstance]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServerUpgradeHistory]') AND type in (N'U'))
DROP TABLE [dbo].[ServerUpgradeHistory]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SnapshotData]') AND type in (N'U'))
DROP TABLE [dbo].[SnapshotData]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Subscriptions_ModifiedBy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Subscriptions]'))
ALTER TABLE [dbo].[Subscriptions] DROP CONSTRAINT [FK_Subscriptions_ModifiedBy]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Subscriptions_Owner]') AND parent_object_id = OBJECT_ID(N'[dbo].[Subscriptions]'))
ALTER TABLE [dbo].[Subscriptions] DROP CONSTRAINT [FK_Subscriptions_Owner]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subscriptions]') AND type in (N'U'))
DROP TABLE [dbo].[Subscriptions]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubscriptionsBeingDeleted]') AND type in (N'U'))
DROP TABLE [dbo].[SubscriptionsBeingDeleted]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpgradeInfo]') AND type in (N'U'))
DROP TABLE [dbo].[UpgradeInfo]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddBatchRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddBatchRecord]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddDataSet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddDataSet]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddDataSource]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddDataSource]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddEvent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddEvent]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddExecutionLogEntry]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddExecutionLogEntry]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddHistoryRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddHistoryRecord]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddModelPerspective]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddModelPerspective]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddPersistedStream]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddPersistedStream]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddReportSchedule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddReportSchedule]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddReportToCache]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddReportToCache]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddRunningJob]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddRunningJob]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddSubscriptionToBeingDeleted]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddSubscriptionToBeingDeleted]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AnnounceOrGetKey]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AnnounceOrGetKey]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangeStateOfDataSource]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ChangeStateOfDataSource]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckSessionLock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckSessionLock]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanAllHistories]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CleanAllHistories]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanBatchRecords]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CleanBatchRecords]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanBrokenSnapshots]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CleanBrokenSnapshots]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanEventRecords]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CleanEventRecords]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanExpiredCache]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CleanExpiredCache]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanExpiredEditSessions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CleanExpiredEditSessions]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanExpiredJobs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CleanExpiredJobs]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanExpiredServerParameters]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CleanExpiredServerParameters]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanExpiredSessions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CleanExpiredSessions]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanHistoryForReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CleanHistoryForReport]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanNotificationRecords]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CleanNotificationRecords]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanOrphanedPolicies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CleanOrphanedPolicies]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanOrphanedSnapshots]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CleanOrphanedSnapshots]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClearScheduleConsistancyFlags]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClearScheduleConsistancyFlags]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClearSessionSnapshot]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClearSessionSnapshot]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CopyChunks]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CopyChunks]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CopyChunksOfType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CopyChunksOfType]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateCacheUpdateNotifications]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateCacheUpdateNotifications]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateChunkAndGetPointer]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateChunkAndGetPointer]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateChunkSegment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateChunkSegment]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateDataDrivenNotification]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateDataDrivenNotification]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateEditSession]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateEditSession]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateNewActiveSubscription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateNewActiveSubscription]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateNewSnapshotVersion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateNewSnapshotVersion]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateObject]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateObject]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateRdlChunk]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateRdlChunk]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateRole]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateSegmentedChunk]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateSegmentedChunk]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateSession]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateSession]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateSnapShotNotifications]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateSnapShotNotifications]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateSubscription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateSubscription]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateTask]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateTask]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateTimeBasedSubscriptionNotification]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateTimeBasedSubscriptionNotification]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateTimeBasedSubscriptionSchedule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateTimeBasedSubscriptionSchedule]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DecreaseTransientSnapshotRefcount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DecreaseTransientSnapshotRefcount]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeepCopySegment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeepCopySegment]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteActiveSubscription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteActiveSubscription]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteAllHistoryForReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteAllHistoryForReport]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteAllModelItemPolicies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteAllModelItemPolicies]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteBatchRecords]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteBatchRecords]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteDataSets]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteDataSets]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteDataSources]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteDataSources]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteDrillthroughReports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteDrillthroughReports]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteEncryptedContent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteEncryptedContent]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteEvent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteEvent]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteExpiredPersistedStreams]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteExpiredPersistedStreams]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteHistoriesWithNoPolicy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteHistoriesWithNoPolicy]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteHistoryRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteHistoryRecord]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteKey]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteKey]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteModelItemPolicy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteModelItemPolicy]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteModelPerspectives]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteModelPerspectives]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteNotification]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteNotification]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteObject]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteObject]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteOneChunk]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteOneChunk]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeletePersistedStream]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeletePersistedStream]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeletePersistedStreams]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeletePersistedStreams]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeletePolicy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeletePolicy]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteReportSchedule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteReportSchedule]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteRole]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteSnapshotAndChunks]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteSnapshotAndChunks]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteSubscription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteSubscription]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteTask]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteTask]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteTimeBasedSubscriptionSchedule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteTimeBasedSubscriptionSchedule]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeliveryRemovedInactivateSubscription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeliveryRemovedInactivateSubscription]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DereferenceSessionSnapshot]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DereferenceSessionSnapshot]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnforceCacheLimits]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[EnforceCacheLimits]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExpireExecutionLogEntries]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ExpireExecutionLogEntries]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExtendEditSessionLifetime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ExtendEditSessionLifetime]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindItemsByDataSet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FindItemsByDataSet]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindItemsByDataSource]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FindItemsByDataSource]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindItemsByDataSourceRecursive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FindItemsByDataSourceRecursive]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindObjectsByLink]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FindObjectsByLink]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindObjectsNonRecursive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FindObjectsNonRecursive]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindObjectsRecursive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FindObjectsRecursive]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindParents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FindParents]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FlushCacheByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FlushCacheByID]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FlushReportFromCache]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FlushReportFromCache]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Get_sqlagent_job_status]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Get_sqlagent_job_status]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAllConfigurationInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAllConfigurationInfo]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAllProperties]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAllProperties]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAnnouncedKey]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAnnouncedKey]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAReportsReportAction]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAReportsReportAction]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetBatchRecords]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetBatchRecords]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetCacheOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetCacheOptions]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetCacheSchedule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetCacheSchedule]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetChildrenBeforeDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetChildrenBeforeDelete]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetChunkInformation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetChunkInformation]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetChunkPointerAndLength]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetChunkPointerAndLength]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetCompiledDefinition]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetCompiledDefinition]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDataSetForExecution]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetDataSetForExecution]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDataSets]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetDataSets]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDataSourceForUpgrade]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetDataSourceForUpgrade]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDatasourceInfoForReencryption]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetDatasourceInfoForReencryption]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDataSources]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetDataSources]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDBVersion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetDBVersion]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDrillthroughReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetDrillthroughReport]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDrillthroughReports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetDrillthroughReports]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetExecutionOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetExecutionOptions]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetFirstPortionPersistedStream]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetFirstPortionPersistedStream]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetIDPairsByLink]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetIDPairsByLink]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetModelDefinition]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetModelDefinition]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetModelItemInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetModelItemInfo]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetModelPerspectives]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetModelPerspectives]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetModelsAndPerspectives]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetModelsAndPerspectives]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetMyRunningJobs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetMyRunningJobs]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetNameById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetNameById]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetNextPortionPersistedStream]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetNextPortionPersistedStream]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetObjectContent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetObjectContent]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetOneConfigurationInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetOneConfigurationInfo]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetParameters]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetParameters]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetPoliciesForRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetPoliciesForRole]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetPolicy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetPolicy]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetPolicyRoots]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetPolicyRoots]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetPrincipalID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetPrincipalID]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetReportForExecution]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetReportForExecution]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetReportParametersForExecution]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetReportParametersForExecution]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetRoles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetRoles]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSchedulesReports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSchedulesReports]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetServerParameters]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetServerParameters]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSessionData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSessionData]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSharePointPathsForUpgrade]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSharePointPathsForUpgrade]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSharePointSchedulePathsForUpgrade]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSharePointSchedulePathsForUpgrade]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSnapshotChunks]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSnapshotChunks]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSnapshotFromHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSnapshotFromHistory]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSnapshotPromotedInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSnapshotPromotedInfo]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSnapShotSchedule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSnapShotSchedule]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSubscription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSubscription]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSubscriptionInfoForReencryption]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSubscriptionInfoForReencryption]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSubscriptionsForUpgrade]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSubscriptionsForUpgrade]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSystemPolicy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSystemPolicy]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTaskProperties]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetTaskProperties]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTimeBasedSubscriptionReportAction]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetTimeBasedSubscriptionReportAction]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTimeBasedSubscriptionSchedule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetTimeBasedSubscriptionSchedule]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUpgradeItems]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUpgradeItems]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserID]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserIDByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserIDByName]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserIDBySid]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserIDBySid]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IncreaseTransientSnapshotRefcount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[IncreaseTransientSnapshotRefcount]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertUnreferencedSnapshot]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InsertUnreferencedSnapshot]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvalidateSubscription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InvalidateSubscription]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IsSegmentedChunk]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[IsSegmentedChunk]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ListHistory]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListInfoForReencryption]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ListInfoForReencryption]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListInstallations]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ListInstallations]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListRunningJobs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ListRunningJobs]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListScheduledReports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ListScheduledReports]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListSubscriptionIDs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ListSubscriptionIDs]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListSubscriptionsUsingDataSource]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ListSubscriptionsUsingDataSource]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListTasks]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ListTasks]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListTasksForMaintenance]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ListTasksForMaintenance]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListUsedDeliveryProviders]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ListUsedDeliveryProviders]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoadForDefinitionCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[LoadForDefinitionCheck]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoadForRepublishing]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[LoadForRepublishing]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LockPersistedStream]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[LockPersistedStream]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LockSnapshotForUpgrade]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[LockSnapshotForUpgrade]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MarkSnapshotAsDependentOnUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MarkSnapshotAsDependentOnUser]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MigrateExecutionLog]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MigrateExecutionLog]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MoveObject]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MoveObject]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ObjectExists]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ObjectExists]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenSegmentedChunk]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[OpenSegmentedChunk]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PromoteSnapshotInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PromoteSnapshotInfo]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadChunkPortion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadChunkPortion]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadChunkSegment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadChunkSegment]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadRoleProperties]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadRoleProperties]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RebindDataSet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RebindDataSet]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RebindDataSource]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RebindDataSource]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveReportFromSession]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RemoveReportFromSession]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveRunningJob]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RemoveRunningJob]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveSegment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RemoveSegment]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveSegmentedMapping]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RemoveSegmentedMapping]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveSubscriptionFromBeingDeleted]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RemoveSubscriptionFromBeingDeleted]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetAllProperties]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetAllProperties]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetCacheLastUsed]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetCacheLastUsed]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetCacheOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetCacheOptions]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetConfigurationInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetConfigurationInfo]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetDrillthroughReports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetDrillthroughReports]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetExecutionOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetExecutionOptions]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetHistoryLimit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetHistoryLimit]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetKeysForInstallation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetKeysForInstallation]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetLastModified]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetLastModified]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetMachineName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetMachineName]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetModelItemPolicy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetModelItemPolicy]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetNotificationAttempt]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetNotificationAttempt]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetObjectContent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetObjectContent]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetParameters]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetParameters]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetPersistedStreamError]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetPersistedStreamError]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetPolicy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetPolicy]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetReencryptedDatasourceInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetReencryptedDatasourceInfo]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetReencryptedSubscriptionInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetReencryptedSubscriptionInfo]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetRoleProperties]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetRoleProperties]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetSessionCredentials]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetSessionCredentials]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetSessionData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetSessionData]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetSessionParameters]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetSessionParameters]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetSnapshotChunksVersion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetSnapshotChunksVersion]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetSnapshotProcessingFlags]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetSnapshotProcessingFlags]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetSystemPolicy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetSystemPolicy]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUpgradeItemStatus]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetUpgradeItemStatus]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShallowCopyChunk]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShallowCopyChunk]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StoreServerParameters]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[StoreServerParameters]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TempChunkExists]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[TempChunkExists]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateActiveSubscription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateActiveSubscription]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCompiledDefinition]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateCompiledDefinition]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdatePolicy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdatePolicy]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdatePolicyPrincipal]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdatePolicyPrincipal]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdatePolicyRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdatePolicyRole]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateRunningJob]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateRunningJob]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateScheduleNextRunTime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateScheduleNextRunTime]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateSnapshot]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateSnapshot]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateSnapshotPaginationInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateSnapshotPaginationInfo]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateSnapshotReferences]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateSnapshotReferences]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateSubscription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateSubscription]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateSubscriptionLastRunInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateSubscriptionLastRunInfo]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateSubscriptionStatus]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateSubscriptionStatus]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateTask]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateTask]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpgradeSharePointPaths]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpgradeSharePointPaths]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpgradeSharePointSchedulePaths]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpgradeSharePointSchedulePaths]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WriteChunkPortion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WriteChunkPortion]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WriteChunkSegment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WriteChunkSegment]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WriteFirstPortionPersistedStream]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WriteFirstPortionPersistedStream]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WriteLockSession]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WriteLockSession]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WriteNextPortionPersistedStream]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WriteNextPortionPersistedStream]
GO
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'NT SERVICE\ReportServer') 
DROP SCHEMA [NT SERVICE\ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'NT SERVICE\ReportServer' AND type IN (N'S')) 
DROP USER [NT SERVICE\ReportServer]
GO
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'RSExecRole') 
DROP SCHEMA [RSExecRole]
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'RSExecRole' AND type = 'R') 
DROP ROLE [RSExecRole]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExtendedCatalog]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ExtendedCatalog]
GO
IF  EXISTS (SELECT * FROM sys.routes WHERE name = N'AutoCreatedLocal') 
DROP ROUTE [AutoCreatedLocal]
GO
ALTER DATABASE [ReportDb2]
SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ReportDb2]
SET ANSI_NULLS OFF
GO
ALTER DATABASE [ReportDb2]
SET ANSI_PADDING OFF
GO
ALTER DATABASE [ReportDb2]
SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ReportDb2]
SET ARITHABORT OFF
GO
ALTER DATABASE [ReportDb2]
SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ReportDb2]
SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ReportDb2]
SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ReportDb2]
SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ReportDb2]
SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ReportDb2]
SET DISABLE_BROKER
GO
ALTER DATABASE [ReportDb2]
COLLATE Latin1_General_CI_AS_KS_WS
GO
ALTER DATABASE [ReportDb2]
SET COMPATIBILITY_LEVEL = 110
GO
ALTER DATABASE [ReportDb2]
SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ReportDb2]
SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ReportDb2]
SET DB_CHAINING OFF
GO
ALTER DATABASE [ReportDb2]
SET READ_WRITE
GO
ALTER DATABASE [ReportDb2]
SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ReportDb2]
SET CURSOR_DEFAULT GLOBAL
GO
exec sp_fulltext_database enable
GO
ALTER DATABASE [ReportDb2]
SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ReportDb2]
SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ReportDb2]
SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ReportDb2]
SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ReportDb2]
SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ReportDb2]
SET RECOVERY FULL
GO
ALTER DATABASE [ReportDb2]
SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ReportDb2]
SET MULTI_USER
WITH ROLLBACK IMMEDIATE
GO
ALTER DATABASE [ReportDb2]
SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ReportDb2]
SET TRUSTWORTHY OFF
GO
CREATE USER [NT SERVICE\ReportServer] FOR LOGIN [NT SERVICE\ReportServer] WITH DEFAULT_SCHEMA = [NT SERVICE\ReportServer]
GO
CREATE ROLE [RSExecRole] AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'RSExecRole', N'NT SERVICE\ReportServer'
GO
EXEC sp_addrolemember N'db_owner', N'RSExecRole'
GO
CREATE SCHEMA [NT SERVICE\ReportServer] AUTHORIZATION [NT SERVICE\ReportServer]
GO
CREATE SCHEMA [RSExecRole] AUTHORIZATION [RSExecRole]
GO
CREATE TABLE [dbo].[ActiveSubscriptions] (
	[ActiveID]				[uniqueidentifier]	 NOT NULL,
	[SubscriptionID]		[uniqueidentifier]	 NOT NULL,
	[TotalNotifications]	[int]				 NULL,
	[TotalSuccesses]		[int]				 NOT NULL,
	[TotalFailures]			[int]				 NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActiveSubscriptions] ADD CONSTRAINT [PK_ActiveSubscriptions] PRIMARY KEY CLUSTERED ([ActiveID])
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
CREATE NONCLUSTERED INDEX [IX_DataSourceItemID] ON [dbo].[DataSource]([ItemID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DataSourceSubscriptionID] ON [dbo].[DataSource]([SubscriptionID]) ON [PRIMARY]
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
CREATE UNIQUE CLUSTERED INDEX [IX_Catalog] ON [dbo].[Catalog]([Path]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ComponentLookup] ON [dbo].[Catalog]([Type], [ComponentID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Link] ON [dbo].[Catalog]([LinkSourceID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Parent] ON [dbo].[Catalog]([ParentID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SnapshotDataId] ON [dbo].[Catalog]([SnapshotDataID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Catalog] ADD CONSTRAINT [PK_Catalog] PRIMARY KEY NONCLUSTERED ([ItemID])
GO
CREATE TABLE [dbo].[Users] (
	[UserID]		[uniqueidentifier]	 NOT NULL,
	[Sid]			[varbinary](85)		 NULL,
	[UserType]		[int]				 NOT NULL,
	[AuthType]		[int]				 NOT NULL,
	[UserName]		[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_Users] ON [dbo].[Users]([Sid], [UserName], [AuthType]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK_Users] PRIMARY KEY NONCLUSTERED ([UserID])
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
ALTER TABLE [dbo].[Catalog] WITH NOCHECK ADD CONSTRAINT [FK_Catalog_CreatedByID] FOREIGN KEY ([CreatedByID]) REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Catalog] WITH NOCHECK ADD CONSTRAINT [FK_Catalog_LinkSourceID] FOREIGN KEY ([LinkSourceID]) REFERENCES [dbo].[Catalog] ([ItemID])
GO
ALTER TABLE [dbo].[Catalog] WITH NOCHECK ADD CONSTRAINT [FK_Catalog_ModifiedByID] FOREIGN KEY ([ModifiedByID]) REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Catalog] WITH NOCHECK ADD CONSTRAINT [FK_Catalog_ParentID] FOREIGN KEY ([ParentID]) REFERENCES [dbo].[Catalog] ([ItemID])
GO
CREATE TABLE [dbo].[Policies] (
	[PolicyID]		[uniqueidentifier]	 NOT NULL,
	[PolicyFlag]	[tinyint]			 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Policies] ADD CONSTRAINT [PK_Policies] PRIMARY KEY CLUSTERED ([PolicyID])
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
ALTER TABLE [dbo].[Catalog] WITH NOCHECK ADD CONSTRAINT [FK_Catalog_Policy] FOREIGN KEY ([PolicyID]) REFERENCES [dbo].[Policies] ([PolicyID])
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
ALTER TABLE [dbo].[DataSource] WITH NOCHECK ADD CONSTRAINT [FK_DataSourceItemID] FOREIGN KEY ([ItemID]) REFERENCES [dbo].[Catalog] ([ItemID])
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
CREATE TABLE [dbo].[ReportSchedule] (
	[ScheduleID]		[uniqueidentifier]	 NOT NULL,
	[ReportID]			[uniqueidentifier]	 NOT NULL,
	[SubscriptionID]	[uniqueidentifier]	 NULL,
	[ReportAction]		[int]				 NOT NULL
) ON [PRIMARY]
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
ALTER TABLE [dbo].[Schedule] ADD CONSTRAINT [PK_ScheduleID] PRIMARY KEY CLUSTERED ([ScheduleID])
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
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_ReportID] ON [dbo].[ReportSchedule]([ReportID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_ScheduleID] ON [dbo].[ReportSchedule]([ScheduleID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_SubscriptionID] ON [dbo].[ReportSchedule]([SubscriptionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportSchedule] ADD CONSTRAINT [FK_ReportSchedule_Report] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[Catalog] ([ItemID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReportSchedule] ADD CONSTRAINT [FK_ReportSchedule_Schedule] FOREIGN KEY ([ScheduleID]) REFERENCES [dbo].[Schedule] ([ScheduleID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReportSchedule] WITH NOCHECK ADD CONSTRAINT [FK_ReportSchedule_Subscriptions] FOREIGN KEY ([SubscriptionID]) REFERENCES [dbo].[Subscriptions] ([SubscriptionID]) NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[ReportSchedule] NOCHECK CONSTRAINT [FK_ReportSchedule_Subscriptions]
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
CREATE TRIGGER [dbo].[Subscription_delete_Schedule] ON [dbo].[Subscriptions] 
AFTER DELETE 
AS
    delete ReportSchedule from ReportSchedule RS inner join deleted D on RS.SubscriptionID = D.SubscriptionID
GO
ALTER TABLE [dbo].[Subscriptions] ADD CONSTRAINT [DF__Subscript__Repor__16644E42] DEFAULT ((0)) FOR [ReportZone]
GO
ALTER TABLE [dbo].[Subscriptions] WITH NOCHECK ADD CONSTRAINT [FK_Subscriptions_Catalog] FOREIGN KEY ([Report_OID]) REFERENCES [dbo].[Catalog] ([ItemID]) ON DELETE CASCADE NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[Subscriptions] WITH NOCHECK ADD CONSTRAINT [FK_Subscriptions_ModifiedBy] FOREIGN KEY ([ModifiedByID]) REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Subscriptions] WITH NOCHECK ADD CONSTRAINT [FK_Subscriptions_Owner] FOREIGN KEY ([OwnerID]) REFERENCES [dbo].[Users] ([UserID])
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
ALTER TABLE [dbo].[ActiveSubscriptions] WITH NOCHECK ADD CONSTRAINT [FK_ActiveSubscriptions_Subscriptions] FOREIGN KEY ([SubscriptionID]) REFERENCES [dbo].[Subscriptions] ([SubscriptionID]) ON DELETE CASCADE
GO
GRANT DELETE ON [dbo].[ActiveSubscriptions] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ActiveSubscriptions] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ActiveSubscriptions] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ActiveSubscriptions] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ActiveSubscriptions] TO [RSExecRole]
GO
CREATE TABLE [dbo].[Batch] (
	[BatchID]		[uniqueidentifier]	 NOT NULL,
	[AddedOn]		[datetime]			 NOT NULL,
	[Action]		[varchar](32)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Item]			[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Parent]		[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Param]			[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[BoolParam]		[bit]				 NULL,
	[Content]		[image]				 NULL,
	[Properties]	[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_Batch] ON [dbo].[Batch]([BatchID], [AddedOn]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Batch_1] ON [dbo].[Batch]([AddedOn]) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[Batch] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Batch] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Batch] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Batch] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Batch] TO [RSExecRole]
GO
CREATE TABLE [dbo].[CachePolicy] (
	[CachePolicyID]			[uniqueidentifier]	 NOT NULL,
	[ReportID]				[uniqueidentifier]	 NOT NULL,
	[ExpirationFlags]		[int]				 NOT NULL,
	[CacheExpiration]		[int]				 NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_CachePolicyReportID] ON [dbo].[CachePolicy]([ReportID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CachePolicy] ADD CONSTRAINT [PK_CachePolicy] PRIMARY KEY NONCLUSTERED ([CachePolicyID])
GO
ALTER TABLE [dbo].[CachePolicy] WITH NOCHECK ADD CONSTRAINT [FK_CachePolicyReportID] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[Catalog] ([ItemID]) ON DELETE CASCADE
GO
GRANT DELETE ON [dbo].[CachePolicy] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[CachePolicy] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[CachePolicy] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[CachePolicy] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[CachePolicy] TO [RSExecRole]
GO
CREATE TABLE [dbo].[ChunkData] (
	[ChunkID]			[uniqueidentifier]	 NOT NULL,
	[SnapshotDataID]	[uniqueidentifier]	 NOT NULL,
	[ChunkFlags]		[tinyint]			 NULL,
	[ChunkName]			[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ChunkType]			[int]				 NULL,
	[Version]			[smallint]			 NULL,
	[MimeType]			[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Content]			[image]				 NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_ChunkData] ON [dbo].[ChunkData]([SnapshotDataID], [ChunkType], [ChunkName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChunkData] ADD CONSTRAINT [PK_ChunkData] PRIMARY KEY NONCLUSTERED ([ChunkID])
GO
GRANT DELETE ON [dbo].[ChunkData] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ChunkData] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ChunkData] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ChunkData] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ChunkData] TO [RSExecRole]
GO
CREATE TABLE [dbo].[ChunkSegmentMapping] (
	[ChunkId]				[uniqueidentifier]	 NOT NULL,
	[SegmentId]				[uniqueidentifier]	 NOT NULL,
	[StartByte]				[bigint]			 NOT NULL,
	[LogicalByteCount]		[int]				 NOT NULL,
	[ActualByteCount]		[int]				 NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChunkSegmentMapping] ADD CONSTRAINT [PK_ChunkSegmentMapping] PRIMARY KEY CLUSTERED ([ChunkId], [SegmentId])
GO
CREATE NONCLUSTERED INDEX [IX_ChunkSegmentMapping_SegmentId] ON [dbo].[ChunkSegmentMapping]([SegmentId]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UNIQ_ChunkId_StartByte] ON [dbo].[ChunkSegmentMapping]([ChunkId], [StartByte]) INCLUDE([ActualByteCount], [LogicalByteCount]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChunkSegmentMapping] ADD CONSTRAINT [Positive_ActualByteCount] CHECK (([ActualByteCount]>=(0)))
GO
ALTER TABLE [dbo].[ChunkSegmentMapping] ADD CONSTRAINT [Positive_LogicalByteCount] CHECK (([LogicalByteCount]>=(0)))
GO
ALTER TABLE [dbo].[ChunkSegmentMapping] ADD CONSTRAINT [Positive_StartByte] CHECK (([StartByte]>=(0)))
GO
GRANT DELETE ON [dbo].[ChunkSegmentMapping] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ChunkSegmentMapping] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ChunkSegmentMapping] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ChunkSegmentMapping] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ChunkSegmentMapping] TO [RSExecRole]
GO
CREATE TABLE [dbo].[ConfigurationInfo] (
	[ConfigInfoID]		[uniqueidentifier]	 NOT NULL,
	[Name]				[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Value]				[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_ConfigurationInfo] ON [dbo].[ConfigurationInfo]([Name]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConfigurationInfo] ADD CONSTRAINT [PK_ConfigurationInfo] PRIMARY KEY NONCLUSTERED ([ConfigInfoID])
GO
GRANT DELETE ON [dbo].[ConfigurationInfo] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ConfigurationInfo] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ConfigurationInfo] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ConfigurationInfo] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ConfigurationInfo] TO [RSExecRole]
GO
CREATE TABLE [dbo].[DataSets] (
	[ID]		[uniqueidentifier]	 NOT NULL,
	[ItemID]	[uniqueidentifier]	 NOT NULL,
	[LinkID]	[uniqueidentifier]	 NULL,
	[Name]		[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_DataSet_ItemID_Name] ON [dbo].[DataSets]([ItemID], [Name]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DataSetLinkID] ON [dbo].[DataSets]([LinkID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DataSets] ADD CONSTRAINT [PK_DataSet] PRIMARY KEY NONCLUSTERED ([ID])
GO
ALTER TABLE [dbo].[DataSets] WITH NOCHECK ADD CONSTRAINT [FK_DataSetItemID] FOREIGN KEY ([ItemID]) REFERENCES [dbo].[Catalog] ([ItemID])
GO
ALTER TABLE [dbo].[DataSets] WITH NOCHECK ADD CONSTRAINT [FK_DataSetLinkID] FOREIGN KEY ([LinkID]) REFERENCES [dbo].[Catalog] ([ItemID])
GO
GRANT DELETE ON [dbo].[DataSets] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[DataSets] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[DataSets] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[DataSets] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[DataSets] TO [RSExecRole]
GO
CREATE TABLE [dbo].[DBUpgradeHistory] (
	[UpgradeID]		[bigint]		 IDENTITY(1, 1) NOT NULL,
	[DbVersion]		[nvarchar](25)	 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[User]			[nvarchar](128)	 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DateTime]		[datetime]		 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DBUpgradeHistory] ADD CONSTRAINT [DF__DBUpgradeH__User__1387E197] DEFAULT (suser_sname()) FOR [User]
GO
ALTER TABLE [dbo].[DBUpgradeHistory] ADD CONSTRAINT [DF__DBUpgrade__DateT__147C05D0] DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[DBUpgradeHistory] ADD CONSTRAINT [PK_DBUpgradeHistory] PRIMARY KEY CLUSTERED ([UpgradeID] DESC)
GO
GRANT DELETE ON [dbo].[DBUpgradeHistory] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[DBUpgradeHistory] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[DBUpgradeHistory] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[DBUpgradeHistory] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[DBUpgradeHistory] TO [RSExecRole]
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
CREATE TABLE [dbo].[History] (
	[HistoryID]			[uniqueidentifier]	 NOT NULL,
	[ReportID]			[uniqueidentifier]	 NOT NULL,
	[SnapshotDataID]	[uniqueidentifier]	 NOT NULL,
	[SnapshotDate]		[datetime]			 NOT NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[History_Notifications] ON [dbo].[History]  
AFTER INSERT
AS 
   insert
      into [dbo].[Event]
      ([EventID], [EventType], [EventData], [TimeEntered]) 
      select NewID(), 'ReportHistorySnapshotCreated', inserted.[HistoryID], GETUTCDATE()
   from inserted
GO
CREATE TABLE [dbo].[SnapshotData] (
	[SnapshotDataID]		[uniqueidentifier]	 NOT NULL,
	[CreatedDate]			[datetime]			 NOT NULL,
	[ParamsHash]			[int]				 NULL,
	[QueryParams]			[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[EffectiveParams]		[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Description]			[nvarchar](512)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DependsOnUser]			[bit]				 NULL,
	[PermanentRefcount]		[int]				 NOT NULL,
	[TransientRefcount]		[int]				 NOT NULL,
	[ExpirationDate]		[datetime]			 NOT NULL,
	[PageCount]				[int]				 NULL,
	[HasDocMap]				[bit]				 NULL,
	[PaginationMode]		[smallint]			 NULL,
	[ProcessingFlags]		[int]				 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SnapshotData] ADD CONSTRAINT [PK_SnapshotData] PRIMARY KEY CLUSTERED ([SnapshotDataID])
GO
CREATE NONCLUSTERED INDEX [IX_SnapshotCleaning] ON [dbo].[SnapshotData]([PermanentRefcount]) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[SnapshotData] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[SnapshotData] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[SnapshotData] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[SnapshotData] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[SnapshotData] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[HistoryDelete_SnapshotRefcount] ON [dbo].[History] 
AFTER DELETE
AS
   UPDATE [dbo].[SnapshotData]
   SET [PermanentRefcount] = [PermanentRefcount] - 1
   FROM [SnapshotData] SD INNER JOIN deleted D on SD.[SnapshotDataID] = D.[SnapshotDataID]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_History] ON [dbo].[History]([ReportID], [SnapshotDate]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SnapshotDataID] ON [dbo].[History]([SnapshotDataID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[History] ADD CONSTRAINT [PK_History] PRIMARY KEY NONCLUSTERED ([HistoryID])
GO
GRANT DELETE ON [dbo].[History] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[History] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[History] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[History] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[History] TO [RSExecRole]
GO
CREATE TABLE [dbo].[Keys] (
	[MachineName]		[nvarchar](256)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[InstallationID]	[uniqueidentifier]	 NOT NULL,
	[InstanceName]		[nvarchar](32)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Client]			[int]				 NOT NULL,
	[PublicKey]			[image]				 NULL,
	[SymmetricKey]		[image]				 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Keys] ADD CONSTRAINT [PK_Keys] PRIMARY KEY CLUSTERED ([InstallationID], [Client])
GO
GRANT DELETE ON [dbo].[Keys] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Keys] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Keys] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Keys] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Keys] TO [RSExecRole]
GO
CREATE TABLE [dbo].[ModelDrill] (
	[ModelDrillID]		[uniqueidentifier]	 NOT NULL,
	[ModelID]			[uniqueidentifier]	 NOT NULL,
	[ReportID]			[uniqueidentifier]	 NOT NULL,
	[ModelItemID]		[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Type]				[tinyint]			 NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_ModelDrillModelID] ON [dbo].[ModelDrill]([ModelID], [ReportID], [ModelDrillID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModelDrill] ADD CONSTRAINT [PK_ModelDrill] PRIMARY KEY NONCLUSTERED ([ModelDrillID])
GO
ALTER TABLE [dbo].[ModelDrill] WITH NOCHECK ADD CONSTRAINT [FK_ModelDrillModel] FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Catalog] ([ItemID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModelDrill] WITH NOCHECK ADD CONSTRAINT [FK_ModelDrillReport] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[Catalog] ([ItemID])
GO
GRANT DELETE ON [dbo].[ModelDrill] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ModelDrill] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ModelDrill] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ModelDrill] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ModelDrill] TO [RSExecRole]
GO
CREATE TABLE [dbo].[ModelItemPolicy] (
	[ID]				[uniqueidentifier]	 NOT NULL,
	[CatalogItemID]		[uniqueidentifier]	 NOT NULL,
	[ModelItemID]		[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[PolicyID]			[uniqueidentifier]	 NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_ModelItemPolicy] ON [dbo].[ModelItemPolicy]([CatalogItemID], [ModelItemID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModelItemPolicy] ADD CONSTRAINT [PK_ModelItemPolicy] PRIMARY KEY NONCLUSTERED ([ID])
GO
ALTER TABLE [dbo].[ModelItemPolicy] WITH NOCHECK ADD CONSTRAINT [FK_PoliciesPolicyID] FOREIGN KEY ([PolicyID]) REFERENCES [dbo].[Policies] ([PolicyID]) ON DELETE CASCADE
GO
CREATE TABLE [dbo].[ModelPerspective] (
	[ID]						[uniqueidentifier]	 NOT NULL,
	[ModelID]					[uniqueidentifier]	 NOT NULL,
	[PerspectiveID]				[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[PerspectiveName]			[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[PerspectiveDescription]	[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_ModelPerspective] ON [dbo].[ModelPerspective]([ModelID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModelPerspective] WITH NOCHECK ADD CONSTRAINT [FK_ModelPerspectiveModel] FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Catalog] ([ItemID]) ON DELETE CASCADE
GO
GRANT DELETE ON [dbo].[ModelPerspective] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ModelPerspective] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ModelPerspective] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ModelPerspective] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ModelPerspective] TO [RSExecRole]
GO
CREATE TABLE [dbo].[Notifications] (
	[NotificationID]				[uniqueidentifier]	 NOT NULL,
	[SubscriptionID]				[uniqueidentifier]	 NOT NULL,
	[ActivationID]					[uniqueidentifier]	 NULL,
	[ReportID]						[uniqueidentifier]	 NOT NULL,
	[SnapShotDate]					[datetime]			 NULL,
	[ExtensionSettings]				[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Locale]						[nvarchar](128)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Parameters]					[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ProcessStart]					[datetime]			 NULL,
	[NotificationEntered]			[datetime]			 NOT NULL,
	[ProcessAfter]					[datetime]			 NULL,
	[Attempt]						[int]				 NULL,
	[SubscriptionLastRunTime]		[datetime]			 NOT NULL,
	[DeliveryExtension]				[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[SubscriptionOwnerID]			[uniqueidentifier]	 NOT NULL,
	[IsDataDriven]					[bit]				 NOT NULL,
	[BatchID]						[uniqueidentifier]	 NULL,
	[ProcessHeartbeat]				[datetime]			 NULL,
	[Version]						[int]				 NOT NULL,
	[ReportZone]					[int]				 NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Notifications] ADD CONSTRAINT [DF__Notificat__Repor__1758727B] DEFAULT ((0)) FOR [ReportZone]
GO
ALTER TABLE [dbo].[Notifications] ADD CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED ([NotificationID])
GO
CREATE NONCLUSTERED INDEX [IX_Notifications] ON [dbo].[Notifications]([ProcessAfter]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Notifications2] ON [dbo].[Notifications]([ProcessStart]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Notifications3] ON [dbo].[Notifications]([NotificationEntered]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Notifications] WITH NOCHECK ADD CONSTRAINT [FK_Notifications_Subscriptions] FOREIGN KEY ([SubscriptionID]) REFERENCES [dbo].[Subscriptions] ([SubscriptionID]) ON DELETE CASCADE
GO
GRANT DELETE ON [dbo].[Notifications] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Notifications] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Notifications] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Notifications] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Notifications] TO [RSExecRole]
GO
CREATE TABLE [dbo].[PolicyUserRole] (
	[ID]			[uniqueidentifier]	 NOT NULL,
	[RoleID]		[uniqueidentifier]	 NOT NULL,
	[UserID]		[uniqueidentifier]	 NOT NULL,
	[PolicyID]		[uniqueidentifier]	 NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_PolicyUserRole] ON [dbo].[PolicyUserRole]([RoleID], [UserID], [PolicyID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PolicyUserRole] ADD CONSTRAINT [PK_PolicyUserRole] PRIMARY KEY NONCLUSTERED ([ID])
GO
ALTER TABLE [dbo].[PolicyUserRole] WITH NOCHECK ADD CONSTRAINT [FK_PolicyUserRole_Policy] FOREIGN KEY ([PolicyID]) REFERENCES [dbo].[Policies] ([PolicyID]) ON DELETE CASCADE
GO
CREATE TABLE [dbo].[Roles] (
	[RoleID]			[uniqueidentifier]	 NOT NULL,
	[RoleName]			[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Description]		[nvarchar](512)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[TaskMask]			[nvarchar](32)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[RoleFlags]			[tinyint]			 NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_Roles] ON [dbo].[Roles]([RoleName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Roles] ADD CONSTRAINT [PK_Roles] PRIMARY KEY NONCLUSTERED ([RoleID])
GO
GRANT DELETE ON [dbo].[Roles] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Roles] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Roles] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Roles] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Roles] TO [RSExecRole]
GO
ALTER TABLE [dbo].[PolicyUserRole] WITH NOCHECK ADD CONSTRAINT [FK_PolicyUserRole_Role] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[PolicyUserRole] WITH NOCHECK ADD CONSTRAINT [FK_PolicyUserRole_User] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID])
GO
GRANT DELETE ON [dbo].[PolicyUserRole] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[PolicyUserRole] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[PolicyUserRole] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[PolicyUserRole] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[PolicyUserRole] TO [RSExecRole]
GO
CREATE TABLE [dbo].[RunningJobs] (
	[JobID]				[nvarchar](32)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[StartDate]			[datetime]			 NOT NULL,
	[ComputerName]		[nvarchar](32)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[RequestName]		[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[RequestPath]		[nvarchar](425)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[UserId]			[uniqueidentifier]	 NOT NULL,
	[Description]		[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Timeout]			[int]				 NOT NULL,
	[JobAction]			[smallint]			 NOT NULL,
	[JobType]			[smallint]			 NOT NULL,
	[JobStatus]			[smallint]			 NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RunningJobs] ADD CONSTRAINT [PK_RunningJobs] PRIMARY KEY CLUSTERED ([JobID])
GO
CREATE NONCLUSTERED INDEX [IX_RunningJobsStatus] ON [dbo].[RunningJobs]([ComputerName], [JobType]) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[RunningJobs] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[RunningJobs] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[RunningJobs] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[RunningJobs] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[RunningJobs] TO [RSExecRole]
GO
CREATE TABLE [dbo].[SecData] (
	[SecDataID]				[uniqueidentifier]	 NOT NULL,
	[PolicyID]				[uniqueidentifier]	 NOT NULL,
	[AuthType]				[int]				 NOT NULL,
	[XmlDescription]		[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[NtSecDescPrimary]		[image]				 NOT NULL,
	[NtSecDescSecondary]	[ntext]				 COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_SecData] ON [dbo].[SecData]([PolicyID], [AuthType]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SecData] ADD CONSTRAINT [PK_SecData] PRIMARY KEY NONCLUSTERED ([SecDataID])
GO
ALTER TABLE [dbo].[SecData] WITH NOCHECK ADD CONSTRAINT [FK_SecDataPolicyID] FOREIGN KEY ([PolicyID]) REFERENCES [dbo].[Policies] ([PolicyID]) ON DELETE CASCADE
GO
GRANT DELETE ON [dbo].[SecData] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[SecData] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[SecData] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[SecData] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[SecData] TO [RSExecRole]
GO
CREATE TABLE [dbo].[Segment] (
	[SegmentId]		[uniqueidentifier]	 NOT NULL,
	[Content]		[varbinary](max)	 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Segment] ADD CONSTRAINT [DF_Segment_SegmentId] DEFAULT (newsequentialid()) FOR [SegmentId]
GO
ALTER TABLE [dbo].[Segment] ADD CONSTRAINT [PK_Segment] PRIMARY KEY CLUSTERED ([SegmentId])
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SegmentMetadata] ON [dbo].[Segment]([SegmentId]) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[Segment] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[Segment] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[Segment] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[Segment] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[Segment] TO [RSExecRole]
GO
CREATE TABLE [dbo].[SegmentedChunk] (
	[ChunkId]				[uniqueidentifier]	 NOT NULL,
	[SnapshotDataId]		[uniqueidentifier]	 NOT NULL,
	[ChunkFlags]			[tinyint]			 NOT NULL,
	[ChunkName]				[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[ChunkType]				[int]				 NOT NULL,
	[Version]				[smallint]			 NOT NULL,
	[MimeType]				[nvarchar](260)		 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[SegmentedChunkId]		[bigint]			 IDENTITY(1, 1) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SegmentedChunk] ADD CONSTRAINT [DF_SegmentedChunk_ChunkId] DEFAULT (newsequentialid()) FOR [ChunkId]
GO
ALTER TABLE [dbo].[SegmentedChunk] ADD CONSTRAINT [PK_SegmentedChunk] PRIMARY KEY CLUSTERED ([SegmentedChunkId])
GO
CREATE NONCLUSTERED INDEX [IX_ChunkId_SnapshotDataId] ON [dbo].[SegmentedChunk]([ChunkId], [SnapshotDataId]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UNIQ_SnapshotChunkMapping] ON [dbo].[SegmentedChunk]([SnapshotDataId], [ChunkType], [ChunkName]) INCLUDE([ChunkFlags], [ChunkId]) ON [PRIMARY]
GO
GRANT DELETE ON [dbo].[SegmentedChunk] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[SegmentedChunk] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[SegmentedChunk] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[SegmentedChunk] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[SegmentedChunk] TO [RSExecRole]
GO
CREATE TABLE [dbo].[ServerParametersInstance] (
	[ServerParametersID]	[nvarchar](32)	 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[ParentID]				[nvarchar](32)	 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Path]					[nvarchar](425)	 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[CreateDate]			[datetime]		 NOT NULL,
	[ModifiedDate]			[datetime]		 NOT NULL,
	[Timeout]				[int]			 NOT NULL,
	[Expiration]			[datetime]		 NOT NULL,
	[ParametersValues]		[image]			 NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ServerParametersInstance] ADD CONSTRAINT [PK_ServerParametersInstance] PRIMARY KEY CLUSTERED ([ServerParametersID])
GO
CREATE NONCLUSTERED INDEX [IX_ServerParametersInstanceExpiration] ON [dbo].[ServerParametersInstance]([Expiration] DESC) ON [PRIMARY]
GO
CREATE TABLE [dbo].[ServerUpgradeHistory] (
	[UpgradeID]			[bigint]		 IDENTITY(1, 1) NOT NULL,
	[ServerVersion]		[nvarchar](25)	 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[User]				[nvarchar](128)	 COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DateTime]			[datetime]		 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ServerUpgradeHistory] ADD CONSTRAINT [DF__ServerUpgr__User__1EF99443] DEFAULT (suser_sname()) FOR [User]
GO
ALTER TABLE [dbo].[ServerUpgradeHistory] ADD CONSTRAINT [DF__ServerUpg__DateT__1FEDB87C] DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[ServerUpgradeHistory] ADD CONSTRAINT [PK_ServerUpgradeHistory] PRIMARY KEY CLUSTERED ([UpgradeID] DESC)
GO
GRANT DELETE ON [dbo].[ServerUpgradeHistory] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[ServerUpgradeHistory] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[ServerUpgradeHistory] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ServerUpgradeHistory] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[ServerUpgradeHistory] TO [RSExecRole]
GO
CREATE TABLE [dbo].[SubscriptionsBeingDeleted] (
	[SubscriptionID]	[uniqueidentifier]	 NOT NULL,
	[CreationDate]		[datetime]			 NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SubscriptionsBeingDeleted] ADD CONSTRAINT [PK_SubscriptionsBeingDeleted] PRIMARY KEY CLUSTERED ([SubscriptionID])
GO
GRANT DELETE ON [dbo].[SubscriptionsBeingDeleted] TO [RSExecRole]
GO
GRANT INSERT ON [dbo].[SubscriptionsBeingDeleted] TO [RSExecRole]
GO
GRANT REFERENCES ON [dbo].[SubscriptionsBeingDeleted] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[SubscriptionsBeingDeleted] TO [RSExecRole]
GO
GRANT UPDATE ON [dbo].[SubscriptionsBeingDeleted] TO [RSExecRole]
GO
CREATE TABLE [dbo].[UpgradeInfo] (
	[Item]		[nvarchar](260)	 COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Status]	[nvarchar](512)	 COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UpgradeInfo] ADD CONSTRAINT [PK_UpgradeInfo] PRIMARY KEY CLUSTERED ([Item])
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddBatchRecord]
@BatchID uniqueidentifier,
@UserName nvarchar(260),
@Action varchar(32),
@Item nvarchar(425) = NULL,
@Parent nvarchar(425) = NULL,
@Param nvarchar(425) = NULL,
@BoolParam bit = NULL,
@Content image = NULL,
@Properties ntext = NULL
AS

IF @Action='BatchStart' BEGIN
   INSERT
   INTO [Batch] (BatchID, AddedOn, [Action], Item, Parent, Param, BoolParam, Content, Properties)
   VALUES (@BatchID, GETUTCDATE(), @Action, @UserName, @Parent, @Param, @BoolParam, @Content, @Properties)
END ELSE BEGIN
   IF EXISTS (SELECT * FROM Batch WHERE BatchID = @BatchID AND [Action] = 'BatchStart' AND Item = @UserName) BEGIN
      INSERT
      INTO [Batch] (BatchID, AddedOn, [Action], Item, Parent, Param, BoolParam, Content, Properties)
      VALUES (@BatchID, GETUTCDATE(), @Action, @Item, @Parent, @Param, @BoolParam, @Content, @Properties)
   END ELSE BEGIN
      RAISERROR( 'Batch does not exist', 16, 1 )
   END
END
GO
GRANT EXECUTE ON [dbo].[AddBatchRecord] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ExtendEditSessionLifetime]
    @EditSessionID varchar(32), 
    @Minutes int = NULL
AS
BEGIN
    if(@Minutes is null)
    begin
        declare @v nvarchar(max) ;
        select @v = convert(nvarchar(max), [Value]) from [dbo].[ConfigurationInfo] where [Name] = 'EditSessionTimeout' ;
        select @Minutes = convert(int, @v) / 60;  -- timeout stored in seconds
        
        if (@Minutes is null)
        begin
            select @Minutes = 120 ;
        end
        
        if(@Minutes < 1)
        begin
            select @Minutes = 1;
        end
    end
        
    update [ReportServerTempDB].dbo.TempCatalog
    set ExpirationTime = DATEADD(n, @Minutes, GETDATE()) 
    where EditSessionID = @EditSessionID ;
END

GRANT EXECUTE ON [dbo].[ExtendEditSessionLifetime] TO RSExecRole
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddDataSet]
@ID [uniqueidentifier],
@ItemID [uniqueidentifier],
@EditSessionID varchar(32) = NULL,
@Name [nvarchar] (260), 
@LinkID [uniqueidentifier] = NULL, -- link id is trusted, if it is provided - we use it
@LinkPath [nvarchar] (425) = NULL, -- if LinkId is not provided we try to look up LinkPath
@AuthType [int]
AS

DECLARE @ActualLinkID uniqueidentifier
SET @ActualLinkID = NULL

IF (@LinkID is NULL) AND (@LinkPath is not NULL) BEGIN
   SELECT
      ItemID, NtSecDescPrimary
   FROM
      Catalog LEFT OUTER JOIN SecData ON Catalog.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType
   WHERE
      Path = @LinkPath
   SET @ActualLinkID = (SELECT ItemID FROM Catalog WHERE Path = @LinkPath)
END
ELSE BEGIN
   SET @ActualLinkID = @LinkID
END

IF(@EditSessionID is not null)
BEGIN
    INSERT 
        INTO [ReportServerTempDB].dbo.TempDataSets
            (ID, ItemID, [Name], LinkID)
        VALUES
            (@ID, @ItemID, @Name, @ActualLinkID)
    
    EXEC ExtendEditSessionLifetime @EditSessionID
END
ELSE
BEGIN
INSERT
    INTO DataSets
            (ID, ItemID, [Name], LinkID)
        VALUES
            (@ID, @ItemID, @Name, @ActualLinkID)
END
GO
GRANT EXECUTE ON [dbo].[AddDataSet] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddDataSource]
@DSID [uniqueidentifier],
@ItemID [uniqueidentifier] = NULL, -- null for future suport dynamic delivery
@SubscriptionID [uniqueidentifier] = NULL,
@EditSessionID varchar(32) = NULL,
@Name [nvarchar] (260) = NULL, -- only for scoped data sources, MUST be NULL for standalone!!!
@Extension [nvarchar] (260) = NULL,
@LinkID [uniqueidentifier] = NULL, -- link id is trusted, if it is provided - we use it
@LinkPath [nvarchar] (425) = NULL, -- if LinkId is not provided we try to look up LinkPath
@CredentialRetrieval [int],
@Prompt [ntext] = NULL,
@ConnectionString [image] = NULL,
@OriginalConnectionString [image] = NULL,
@OriginalConnectStringExpressionBased [bit] = NULL,
@UserName [image] = NULL,
@Password [image] = NULL,
@Flags [int],
@AuthType [int],
@Version [int]
AS

DECLARE @ActualLinkID uniqueidentifier
SET @ActualLinkID = NULL

IF (@LinkID is NULL) AND (@LinkPath is not NULL) BEGIN
   SELECT
      Type, ItemID, NtSecDescPrimary
   FROM
      Catalog LEFT OUTER JOIN SecData ON Catalog.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType
   WHERE
      Path = @LinkPath
   SET @ActualLinkID = (SELECT ItemID FROM Catalog WHERE Path = @LinkPath)
END
ELSE BEGIN
   SET @ActualLinkID = @LinkID
END

IF(@EditSessionID is not null)
BEGIN
    INSERT 
        INTO [ReportServerTempDB].dbo.TempDataSources
            (DSID, ItemID, [Name], Extension, Link, CredentialRetrieval, 
            Prompt, ConnectionString, OriginalConnectionString, OriginalConnectStringExpressionBased, 
            UserName, Password, Flags, Version)
        VALUES
            (@DSID, @ItemID, @Name, @Extension, @ActualLinkID,
            @CredentialRetrieval, @Prompt,
            @ConnectionString, @OriginalConnectionString, @OriginalConnectStringExpressionBased,
            @UserName, @Password, @Flags, @Version)
    
    EXEC ExtendEditSessionLifetime @EditSessionID
END
ELSE
BEGIN
INSERT
    INTO DataSource
        ([DSID], [ItemID], [SubscriptionID], [Name], [Extension], [Link],
        [CredentialRetrieval], [Prompt],
        [ConnectionString], [OriginalConnectionString], [OriginalConnectStringExpressionBased], 
        [UserName], [Password], [Flags], [Version])
    VALUES
        (@DSID, @ItemID, @SubscriptionID, @Name, @Extension, @ActualLinkID,
        @CredentialRetrieval, @Prompt,
        @ConnectionString, @OriginalConnectionString, @OriginalConnectStringExpressionBased,
        @UserName, @Password, @Flags, @Version)
   
END
GO
GRANT EXECUTE ON [dbo].[AddDataSource] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddEvent] 
@EventType nvarchar (260),
@EventData nvarchar (260)
AS

insert into [Event] 
    ([EventID], [EventType], [EventData], [TimeEntered], [ProcessStart], [BatchID]) 
values
    (NewID(), @EventType, @EventData, GETUTCDATE(), NULL, NULL)
GO
GRANT EXECUTE ON [dbo].[AddEvent] TO [RSExecRole]
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
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- add new record to History table
CREATE PROCEDURE [dbo].[AddHistoryRecord]
@HistoryID uniqueidentifier,
@ReportID uniqueidentifier,
@SnapshotDate datetime,
@SnapshotDataID uniqueidentifier,
@SnapshotTransientRefcountChange int
AS
INSERT
INTO History (HistoryID, ReportID, SnapshotDataID, SnapshotDate)
VALUES (@HistoryID, @ReportID, @SnapshotDataID, @SnapshotDate)

IF @@ERROR = 0
BEGIN
   UPDATE SnapshotData
   -- Snapshots, when created, have transient refcount set to 1. Here create permanent reference
   -- here so we need to increase permanent refcount and decrease transient refcount. However,
   -- if it was already referenced by the execution snapshot, transient refcount was already
   -- decreased. Hence, there's a parameter @SnapshotTransientRefcountChange that is 0 or -1.
   SET PermanentRefcount = PermanentRefcount + 1, TransientRefcount = TransientRefcount + @SnapshotTransientRefcountChange
   WHERE SnapshotData.SnapshotDataID = @SnapshotDataID
END
GO
GRANT EXECUTE ON [dbo].[AddHistoryRecord] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddModelPerspective]
@ModelID as uniqueidentifier,
@PerspectiveID as ntext,
@PerspectiveName as ntext = null,
@PerspectiveDescription as ntext = null
AS

INSERT
INTO [ModelPerspective]
    ([ID], [ModelID], [PerspectiveID], [PerspectiveName], [PerspectiveDescription])
VALUES
    (newid(), @ModelID, @PerspectiveID, @PerspectiveName, @PerspectiveDescription)
GO
GRANT EXECUTE ON [dbo].[AddModelPerspective] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddPersistedStream]
@SessionID varchar(32),
@Index int
AS

DECLARE @RefCount int
DECLARE @id varchar(32)
DECLARE @ExpirationDate datetime

set @RefCount = 0
set @ExpirationDate = DATEADD(day, 2, GETDATE())

set @id = (select SessionID from [ReportServerTempDB].dbo.SessionData where SessionID = @SessionID)

if @id is not null
begin
set @RefCount = 1
end

INSERT INTO [ReportServerTempDB].dbo.PersistedStream (SessionID, [Index], [RefCount], [ExpirationDate]) VALUES (@SessionID, @Index, @RefCount, @ExpirationDate)
GO
GRANT EXECUTE ON [dbo].[AddPersistedStream] TO [RSExecRole]
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
CREATE PROCEDURE [dbo].[EnforceCacheLimits]
    @ItemID uniqueidentifier, 
    @Cap int = 0
AS
BEGIN
    IF (@Cap > 0)
    BEGIN
        DECLARE @AffectedSnapshots TABLE (SnapshotDataID UNIQUEIDENTIFIER) ;
        DECLARE @Now DATETIME ;
        SELECT @Now = GETDATE() ;
        BEGIN TRANSACTION		
            -- remove entries which are not in the top N based on the last used time
            -- don't count expired entries, don't purge them either (allow cleanup thread to handle expired entries)
            DELETE FROM [ReportServerTempDB].dbo.ExecutionCache
            OUTPUT DELETED.SnapshotDataID INTO @AffectedSnapshots(SnapshotDataID)
            WHERE	ExecutionCache.ReportID = @ItemID AND 
                    ExecutionCache.AbsoluteExpiration > @Now AND
                    ExecutionCache.ExecutionCacheID NOT IN (
                        SELECT TOP (@Cap) EC.ExecutionCacheID
                        FROM [ReportServerTempDB].dbo.ExecutionCache EC
                        WHERE	EC.ReportID = @ItemID AND 
                                EC.AbsoluteExpiration > @Now
                        ORDER BY EC.LastUsedTime DESC) ;
            
            UPDATE [ReportServerTempDB].dbo.SnapshotData
            SET PermanentRefCount = PermanentRefCount - 1
            WHERE SnapshotData.SnapshotDataID in (SELECT SnapshotDataID FROM @AffectedSnapshots) ;
        COMMIT				
    END
END
GO
GRANT EXECUTE ON [dbo].[EnforceCacheLimits] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddReportToCache]
@ReportID as uniqueidentifier,
@ExecutionDate datetime,
@SnapshotDataID uniqueidentifier,
@CacheLimit int = 0,
@EditSessionTimeout int = NULL,
@QueryParamsHash int,
@ExpirationDate datetime OUTPUT,
@ScheduleID uniqueidentifier OUTPUT
AS
DECLARE @ExpirationFlags as int
DECLARE @Timeout as int

SET @ExpirationDate = NULL
SET @ScheduleID = NULL
SET @ExpirationFlags = (SELECT ExpirationFlags FROM CachePolicy WHERE ReportID = @ReportID)
IF @EditSessionTimeout IS NOT NULL
BEGIN
    SET @ExpirationFlags = 1 -- use timeout based expiration
    SET @Timeout = @EditSessionTimeout
    SET @ExpirationDate = DATEADD(n, @Timeout, @ExecutionDate)
END
ELSE IF @ExpirationFlags = 1 -- timeout based
BEGIN
    SET @Timeout = (SELECT CacheExpiration FROM CachePolicy WHERE ReportID = @ReportID)
    SET @ExpirationDate = DATEADD(n, @Timeout, @ExecutionDate)
END
ELSE IF @ExpirationFlags = 2 -- schedule based
BEGIN
    SELECT @ScheduleID=s.ScheduleID, @ExpirationDate=s.NextRunTime 
    FROM Schedule s WITH(UPDLOCK) INNER JOIN ReportSchedule rs ON rs.ScheduleID = s.ScheduleID and rs.ReportAction = 3 WHERE rs.ReportID = @ReportID
END
ELSE
BEGIN
    -- Ignore NULL case. It means that a user set the Report not to be cached after the report execution fired.
    IF @ExpirationFlags IS NOT NULL
    BEGIN
        RAISERROR('Invalid cache flags', 16, 1)
    END
    RETURN
END

-- mark any existing entries for this parameter combination to expire very soon in the future
-- note that we do not explicitly delete them here to avoid a race with execution sessions which 
-- have discovered these cache entries but have not as of yet increased their transient refcounts
DECLARE @NewExpirationTime DATETIME ;
SELECT @NewExpirationTime = DATEADD(n, 1, GETDATE()) ;

BEGIN TRANSACTION

UPDATE	[ReportServerTempDB].dbo.ExecutionCache 
SET		AbsoluteExpiration = @NewExpirationTime
WHERE	AbsoluteExpiration > @NewExpirationTime AND
		ReportID = @ReportID AND 
		ParamsHash = @QueryParamsHash

-- add to the report cache
INSERT INTO [ReportServerTempDB].dbo.ExecutionCache
(ExecutionCacheID, ReportID, ExpirationFlags, AbsoluteExpiration, RelativeExpiration, SnapshotDataID, LastUsedTime, ParamsHash)
VALUES
(newid(), @ReportID, @ExpirationFlags, @ExpirationDate, @Timeout, @SnapshotDataID, @ExecutionDate, @QueryParamsHash)

UPDATE [ReportServerTempDB].dbo.SnapshotData
SET PermanentRefcount = PermanentRefcount + 1,
    IsCached = CONVERT(BIT, 1), 
    TransientRefcount = CASE 
                        WHEN @EditSessionTimeout IS NOT NULL THEN TransientRefcount - 1
                        ELSE TransientRefCount
                        END
WHERE SnapshotDataID = @SnapshotDataID;   
EXEC EnforceCacheLimits @ReportID, @CacheLimit ;

COMMIT
GO
GRANT EXECUTE ON [dbo].[AddReportToCache] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- looks up any user name by its SID, if not it creates a regular user
CREATE PROCEDURE [dbo].[GetUserIDBySid]
@UserSid varbinary(85),
@UserName nvarchar(260),
@AuthType int,
@UserID uniqueidentifier OUTPUT
AS
SELECT @UserID = (SELECT UserID FROM Users WHERE Sid = @UserSid AND AuthType = @AuthType)
IF @UserID IS NULL
   BEGIN
      SET @UserID = newid()
      INSERT INTO Users
      (UserID, Sid, UserType, AuthType, UserName)
      VALUES 
      (@UserID, @UserSid, 0, @AuthType, @UserName)
   END
GO
GRANT EXECUTE ON [dbo].[GetUserIDBySid] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- looks up any user name by its User Name, if not it creates a regular user
CREATE PROCEDURE [dbo].[GetUserIDByName]
@UserName nvarchar(260),
@AuthType int,
@UserID uniqueidentifier OUTPUT
AS
SELECT @UserID = (SELECT UserID FROM Users WHERE UserName = @UserName AND AuthType = @AuthType)
IF @UserID IS NULL
   BEGIN
      SET @UserID = newid()
      INSERT INTO Users
      (UserID, Sid, UserType, AuthType, UserName)
      VALUES 
      (@UserID, NULL, 0,    @AuthType, @UserName)
   END
GO
GRANT EXECUTE ON [dbo].[GetUserIDByName] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- looks up any user name, if not it creates a regular user - uses Sid
CREATE PROCEDURE [dbo].[GetUserID]
@UserSid varbinary(85) = NULL,
@UserName nvarchar(260),
@AuthType int,
@UserID uniqueidentifier OUTPUT
AS
    IF @AuthType = 1 -- Windows
    BEGIN
        EXEC GetUserIDBySid @UserSid, @UserName, @AuthType, @UserID OUTPUT
    END
    ELSE
    BEGIN
        EXEC GetUserIDByName @UserName, @AuthType, @UserID OUTPUT
    END
GO
GRANT EXECUTE ON [dbo].[GetUserID] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddRunningJob]
@JobID as nvarchar(32),
@StartDate as datetime,
@ComputerName as nvarchar(32),
@RequestName as nvarchar(425),
@RequestPath as nvarchar(425),
@UserSid varbinary(85) = NULL,
@UserName nvarchar(260),
@AuthType int,
@Description as ntext  = NULL,
@Timeout as int,
@JobAction as smallint,
@JobType as smallint,
@JobStatus as smallint
AS
SET NOCOUNT OFF
DECLARE @UserID uniqueidentifier
EXEC GetUserID @UserSid, @UserName, @AuthType, @UserID OUTPUT

INSERT INTO RunningJobs (JobID, StartDate, ComputerName, RequestName, RequestPath, UserID, Description, Timeout, JobAction, JobType, JobStatus )
VALUES             (@JobID, @StartDate, @ComputerName,  @RequestName, @RequestPath, @UserID, @Description, @Timeout, @JobAction, @JobType, @JobStatus)
GO
GRANT EXECUTE ON [dbo].[AddRunningJob] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddSubscriptionToBeingDeleted] 
@SubscriptionID uniqueidentifier
AS
-- Delete subscription if it is already in this table
-- Delete orphaned subscriptions, based on the age criteria: > 10 minutes
delete from [SubscriptionsBeingDeleted] 
where (SubscriptionID = @SubscriptionID) or (DATEDIFF( minute, [CreationDate], GetUtcDate() ) > 10)

-- Add subscription being deleted into the DeletedSubscription table
insert into [SubscriptionsBeingDeleted] VALUES(@SubscriptionID, GetUtcDate())
GO
GRANT EXECUTE ON [dbo].[AddSubscriptionToBeingDeleted] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AnnounceOrGetKey]
@MachineName nvarchar(256),
@InstanceName nvarchar(32),
@InstallationID uniqueidentifier,
@PublicKey image,
@NumAnnouncedServices int OUTPUT
AS

-- Acquire lock
IF NOT EXISTS (SELECT * FROM [dbo].[Keys] WITH(XLOCK) WHERE [Client] < 0)
BEGIN
    RAISERROR('Keys lock row not found', 16, 1)
    RETURN
END

-- Get the number of services that have already announced their presence
SELECT @NumAnnouncedServices = count(*)
FROM [dbo].[Keys]
WHERE [Client] = 1

DECLARE @StoredInstallationID uniqueidentifier
DECLARE @StoredInstanceName nvarchar(32)

SELECT @StoredInstallationID = [InstallationID], @StoredInstanceName = [InstanceName]
FROM [dbo].[Keys]
WHERE [InstallationID] = @InstallationID AND [Client] = 1

IF @StoredInstallationID IS NULL -- no record present
BEGIN
    INSERT INTO [dbo].[Keys]
        ([MachineName], [InstanceName], [InstallationID], [Client], [PublicKey], [SymmetricKey])
    VALUES
        (@MachineName, @InstanceName, @InstallationID, 1, @PublicKey, null)
END
ELSE
BEGIN
    IF @StoredInstanceName IS NULL
    BEGIN
        UPDATE [dbo].[Keys]
        SET [InstanceName] = @InstanceName
        WHERE [InstallationID] = @InstallationID AND [Client] = 1
    END
END

SELECT [MachineName], [SymmetricKey], [PublicKey]
FROM [Keys]
WHERE [InstallationID] = @InstallationID and [Client] = 1
GO
GRANT EXECUTE ON [dbo].[AnnounceOrGetKey] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ChangeStateOfDataSource]
@ItemID [uniqueidentifier],
@Enable bit
AS
IF @Enable != 0 BEGIN
   UPDATE [DataSource]
      SET
         [Flags] = [Flags] | 1
   WHERE [ItemID] = @ItemID
END
ELSE
BEGIN
   UPDATE [DataSource]
      SET
         [Flags] = [Flags] & 0x7FFFFFFE
   WHERE [ItemID] = @ItemID
END
GO
GRANT EXECUTE ON [dbo].[ChangeStateOfDataSource] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CheckSessionLock]
@SessionID as varchar(32),
@LockVersion  int OUTPUT
AS
DECLARE @Selected nvarchar(32)
SELECT @Selected=SessionID, @LockVersion = LockVersion FROM [ReportServerTempDB].dbo.SessionLock WITH (ROWLOCK) WHERE SessionID = @SessionID
GO
GRANT EXECUTE ON [dbo].[CheckSessionLock] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- delete snapshots exceeding # of snapshots for the whole system
CREATE PROCEDURE [dbo].[CleanAllHistories]
@SnapshotLimit int
AS
SET NOCOUNT OFF
DELETE FROM History
WHERE HistoryID in 
    (SELECT HistoryID
     FROM History JOIN Catalog AS ReportJoinSnapshot ON ItemID = ReportID
     WHERE SnapshotLimit IS NULL and SnapshotDate < 
        (SELECT MIN(SnapshotDate)
         FROM 
            (SELECT TOP (@SnapshotLimit) SnapshotDate
             FROM History AS InnerSnapshot
             WHERE InnerSnapshot.ReportID = ReportJoinSnapshot.ItemID
             ORDER BY SnapshotDate DESC
            ) AS TopSnapshots
        )
    )
GO
GRANT EXECUTE ON [dbo].[CleanAllHistories] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CleanBatchRecords]
@MaxAgeMinutes int
AS
SET NOCOUNT OFF
DELETE FROM [Batch]
where BatchID in
   ( SELECT BatchID
     FROM [Batch]
     WHERE AddedOn < DATEADD(minute, -(@MaxAgeMinutes), GETUTCDATE()) )
GO
GRANT EXECUTE ON [dbo].[CleanBatchRecords] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CleanBrokenSnapshots]
@Machine nvarchar(512),
@SnapshotsCleaned int OUTPUT,
@ChunksCleaned int OUTPUT,
@TempSnapshotID uniqueidentifier OUTPUT
AS
    SET DEADLOCK_PRIORITY LOW
    DECLARE @now AS datetime
    SELECT @now = GETDATE()
    
    CREATE TABLE #tempSnapshot (SnapshotDataID uniqueidentifier)
    INSERT INTO #tempSnapshot SELECT TOP 1 SnapshotDataID 
    FROM SnapshotData  WITH (NOLOCK) 
    where SnapshotData.PermanentRefcount <= 0 
    AND ExpirationDate < @now
    SET @SnapshotsCleaned = @@ROWCOUNT

    DELETE ChunkData FROM ChunkData INNER JOIN #tempSnapshot
    ON ChunkData.SnapshotDataID = #tempSnapshot.SnapshotDataID
    SET @ChunksCleaned = @@ROWCOUNT

    DELETE SnapshotData FROM SnapshotData INNER JOIN #tempSnapshot
    ON SnapshotData.SnapshotDataID = #tempSnapshot.SnapshotDataID
    
    TRUNCATE TABLE #tempSnapshot

    INSERT INTO #tempSnapshot SELECT TOP 1 SnapshotDataID 
    FROM [ReportServerTempDB].dbo.SnapshotData  WITH (NOLOCK) 
    where [ReportServerTempDB].dbo.SnapshotData.PermanentRefcount <= 0 
    AND [ReportServerTempDB].dbo.SnapshotData.ExpirationDate < @now
    AND [ReportServerTempDB].dbo.SnapshotData.Machine = @Machine
    SET @SnapshotsCleaned = @SnapshotsCleaned + @@ROWCOUNT

    SELECT @TempSnapshotID = (SELECT SnapshotDataID FROM #tempSnapshot)

    DELETE [ReportServerTempDB].dbo.ChunkData FROM [ReportServerTempDB].dbo.ChunkData INNER JOIN #tempSnapshot
    ON [ReportServerTempDB].dbo.ChunkData.SnapshotDataID = #tempSnapshot.SnapshotDataID
    SET @ChunksCleaned = @ChunksCleaned + @@ROWCOUNT

    DELETE [ReportServerTempDB].dbo.SnapshotData FROM [ReportServerTempDB].dbo.SnapshotData INNER JOIN #tempSnapshot
    ON [ReportServerTempDB].dbo.SnapshotData.SnapshotDataID = #tempSnapshot.SnapshotDataID
GO
GRANT EXECUTE ON [dbo].[CleanBrokenSnapshots] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CleanEventRecords] 
@MaxAgeMinutes int
AS
-- Reset all notifications which have been add over n minutes ago
Update [Event] set [ProcessStart] = NULL, [ProcessHeartbeat] = NULL
where [EventID] in
   ( SELECT [EventID]
     FROM [Event]
     WHERE [ProcessHeartbeat] < DATEADD(minute, -(@MaxAgeMinutes), GETUTCDATE()) )
GO
GRANT EXECUTE ON [dbo].[CleanEventRecords] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CleanExpiredCache]
AS
SET NOCOUNT OFF
DECLARE @now as datetime
SET @now = DATEADD(minute, -1, GETDATE())

UPDATE SN
SET
   PermanentRefcount = PermanentRefcount - 1
FROM
   [ReportServerTempDB].dbo.SnapshotData AS SN
   INNER JOIN [ReportServerTempDB].dbo.ExecutionCache AS EC ON SN.SnapshotDataID = EC.SnapshotDataID
WHERE
   EC.AbsoluteExpiration < @now
   
DELETE EC
FROM
   [ReportServerTempDB].dbo.ExecutionCache AS EC
WHERE
   EC.AbsoluteExpiration < @now
GO
GRANT EXECUTE ON [dbo].[CleanExpiredCache] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CleanExpiredEditSessions]
    @MaxToClean int = 10, 
    @NumCleaned int OUTPUT
AS BEGIN
    SET DEADLOCK_PRIORITY LOW 
    
    declare @now datetime;
    select @now = GETDATE();
    
    declare @DeletedItems table (ItemID uniqueidentifier not null primary key, Intermediate uniqueidentifier null)
    declare @DeletedCacheSnapshots table (SnapshotDataID uniqueidentifier null)
            
    begin transaction
        insert into @DeletedItems 
        select top(@MaxToClean) TempCatalogID, Intermediate
        from [ReportServerTempDB].dbo.TempCatalog TC WITH(UPDLOCK)
        where ExpirationTime < @now and not exists (
            select 1 
            from [ReportServerTempDB].dbo.SessionData SD WITH (INDEX (IX_EditSessionID)) 
            where SD.EditSessionID = TC.EditSessionID ) ;
        
        delete from [ReportServerTempDB].dbo.TempDataSources	
        where ItemID in (
            select ItemID from @DeletedItems ) ;

        delete from [ReportServerTempDB].dbo.TempDataSets	
        where ItemID in (
            select ItemID from @DeletedItems ) ;
            
        delete from [ReportServerTempDB].dbo.TempCatalog
        where TempCatalogID in (
            select ItemID from @DeletedItems ) ;
            
        delete from [ReportServerTempDB].dbo.ExecutionCache		
        output deleted.SnapshotDataID into @DeletedCacheSnapshots(SnapshotDataID)
        where ReportID in (
            select ItemID from @DeletedItems );
            
        update [ReportServerTempDB].dbo.SnapshotData
        set PermanentRefcount = PermanentRefcount - 1
        where SnapshotData.SnapshotDataID in 
            (select Intermediate from @DeletedItems 
             union 
             select SnapshotDataID from @DeletedCacheSnapshots) ;
    commit
    
    select @NumCleaned = count(1) from @DeletedItems ;
END
GO
GRANT EXECUTE ON [dbo].[CleanExpiredEditSessions] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CleanExpiredJobs]
AS
SET NOCOUNT OFF
DELETE FROM RunningJobs WHERE DATEADD(s, Timeout, StartDate) < GETDATE()
GO
GRANT EXECUTE ON [dbo].[CleanExpiredJobs] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CleanExpiredServerParameters]
@ParametersCleaned INT OUTPUT
AS
  DECLARE @now as DATETIME
  SET @now = GETDATE()

DELETE FROM [dbo].[ServerParametersInstance] 
WHERE ServerParametersID IN 
(  SELECT TOP 20 ServerParametersID FROM [dbo].[ServerParametersInstance]
  WHERE Expiration < @now
)

SET @ParametersCleaned = @@ROWCOUNT
GO
GRANT EXECUTE ON [dbo].[CleanExpiredServerParameters] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CleanExpiredSessions]
@SessionsCleaned int OUTPUT
AS
SET DEADLOCK_PRIORITY LOW

set @SessionsCleaned = 0;
declare @maxCleanCount int = 200;
declare @rc int;
declare @now as datetime = GETDATE();
declare @DeletedSessions table (
  SessionID varchar(32) collate Latin1_General_CI_AS_KS_WS primary key,
  SnapshotDataID uniqueidentifier,
  CompiledDefinition uniqueidentifier
);

-- Delete expired sessions
--
-- In this session, we attempt to delete the first batch of expired 
-- sessions. A session is considered expired if its Expiration date 
-- and time is reached and that there are no locks on its corresponding 
-- row in the SessionLock table. As you can see we ensure that there 
-- are no locks on the corresponding SessionLock row by providing the 
-- READPAST hint. The ROWLOCK hint here ensures that we only take ROWLOCKS
--
-- Delete operation is executed in the batches of 20 to avoid lock 
-- escalations. See http://support.microsoft.com/kb/323630 for more 
-- details.
while @SessionsCleaned < @maxCleanCount
begin
  
  -- Delete the locks first
  delete top(20) sl
  output s.SessionID, s.SnapshotDataID, s.CompiledDefinition into @DeletedSessions
  from [ReportServerTempDB].dbo.SessionLock sl with(rowlock, readpast)
  join [ReportServerTempDB].dbo.SessionData s with(readpast) on sl.SessionID = s.SessionID
  where s.Expiration <= @now;
  
  set @rc = @@ROWCOUNT;
  if @rc = 0 break;
  set @SessionsCleaned = @SessionsCleaned + @rc;

  -- Now delete the sessions that correspond to those locks
  delete top(20) l
  from [ReportServerTempDB].dbo.SessionData l
  join @DeletedSessions s on s.SessionID = l.SessionID;
end

-- Delete sessions with no corresponding locks (orphaned sessions)
--
-- In this section we attempt to find and delete any SessionData 
-- rows that do not have a corresponding SessionLock row. 
-- These rows are considered orphan and should be deleted. 
-- As you can see below, the SessionData table is queried using 
-- the READPAST hint. This means that SessionData rows that have 
-- locks on do not prevent this query from being executed. Also 
-- note that SessionLock is read using NOLOCK instead of READPAST. 
-- This is important because we need a true view on all rows that 
-- exists in the SessionLock table whether they are locked or not.
--
-- Delete operation is executed in the batches of 20 to avoid lock 
-- escalations. See http://support.microsoft.com/kb/323630 for more 
-- details.
while @SessionsCleaned < @maxCleanCount
begin
  delete top(20) s
  output deleted.SessionID, deleted.SnapshotDataID, deleted.CompiledDefinition into @DeletedSessions
  from [ReportServerTempDB].dbo.SessionData s with(readpast)
  left join [ReportServerTempDB].dbo.SessionLock sl with(nolock) on sl.SessionID = s.SessionID
  where sl.SessionID is null and s.Expiration <= @now;
  
  set @rc = @@ROWCOUNT;
  set @SessionsCleaned = @SessionsCleaned + @rc;
  if @rc < 20 break;
end

-- Was there anything to clean-up?
if @SessionsCleaned = 0 return;

-- Delete persisted streams
--
-- Delete operation is executed in the batches of 20 to avoid lock 
-- escalations. See http://support.microsoft.com/kb/323630 for more 
-- details.
deletePersistedStreams:
delete top(20) ps
from [ReportServerTempDB].dbo.PersistedStream as ps
join @DeletedSessions sd on ps.SessionID = sd.SessionID;
if @@ROWCOUNT = 20 goto deletePersistedStreams;

-- Update ref counts
UPDATE SN
SET
   TransientRefcount = TransientRefcount-1
FROM
   [ReportServerTempDB].dbo.SnapshotData AS SN
   JOIN @DeletedSessions AS SE ON SN.SnapshotDataID = SE.CompiledDefinition;

UPDATE SN
SET
   TransientRefcount = TransientRefcount-
      (SELECT COUNT(*)
       FROM @DeletedSessions AS SE1
       WHERE SE1.SnapshotDataID = SN.SnapshotDataID)
FROM
   SnapshotData AS SN
   JOIN @DeletedSessions AS SE ON SN.SnapshotDataID = SE.SnapshotDataID;

UPDATE SN
SET
   TransientRefcount = TransientRefcount-
      (SELECT COUNT(*)
       FROM @DeletedSessions AS SE1
       WHERE SE1.SnapshotDataID = SN.SnapshotDataID)
FROM
   [ReportServerTempDB].dbo.SnapshotData AS SN
   JOIN @DeletedSessions AS SE ON SN.SnapshotDataID = SE.SnapshotDataID;
GO
GRANT EXECUTE ON [dbo].[CleanExpiredSessions] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- delete snapshots exceeding # of snapshots. won't work if @SnapshotLimit = 0
CREATE PROCEDURE [dbo].[CleanHistoryForReport]
@SnapshotLimit int,
@ReportID uniqueidentifier
AS
SET NOCOUNT OFF
DELETE FROM History
WHERE ReportID = @ReportID and SnapshotDate < 
    (SELECT MIN(SnapshotDate)
     FROM 
        (SELECT TOP (@SnapshotLimit) SnapshotDate
         FROM History
         WHERE ReportID = @ReportID
         ORDER BY SnapshotDate DESC
        ) AS TopSnapshots
    )
GO
GRANT EXECUTE ON [dbo].[CleanHistoryForReport] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CleanNotificationRecords] 
@MaxAgeMinutes int
AS
-- Reset all notifications which have been add over n minutes ago
Update [Notifications] set [ProcessStart] = NULL, [ProcessHeartbeat] = NULL, [Attempt] = 1
where [NotificationID] in
   ( SELECT [NotificationID]
     FROM [Notifications]
     WHERE [ProcessHeartbeat] < DATEADD(minute, -(@MaxAgeMinutes), GETUTCDATE()) and [Attempt] is NULL )

Update [Notifications] set [ProcessStart] = NULL, [ProcessHeartbeat] = NULL, [Attempt] = [Attempt] + 1
where [NotificationID] in
   ( SELECT [NotificationID]
     FROM [Notifications]
     WHERE [ProcessHeartbeat] < DATEADD(minute, -(@MaxAgeMinutes), GETUTCDATE()) and [Attempt] is not NULL )
GO
GRANT EXECUTE ON [dbo].[CleanNotificationRecords] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Cleaning orphan policies
CREATE PROCEDURE [dbo].[CleanOrphanedPolicies]
AS
SET NOCOUNT OFF
DELETE
   [Policies]
WHERE
   [Policies].[PolicyFlag] = 0
   AND
   NOT EXISTS (SELECT ItemID FROM [Catalog] WHERE [Catalog].[PolicyID] = [Policies].[PolicyID])

DELETE
   [Policies]
FROM
   [Policies]
   INNER JOIN [ModelItemPolicy] ON [ModelItemPolicy].[PolicyID] = [Policies].[PolicyID]
WHERE
   NOT EXISTS (SELECT ItemID
               FROM [Catalog] 
               WHERE [Catalog].[ItemID] = [ModelItemPolicy].[CatalogItemID])
GO
GRANT EXECUTE ON [dbo].[CleanOrphanedPolicies] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CleanOrphanedSnapshots]
@Machine nvarchar(512),
@PermanentSnapshotCount int, 
@TemporarySnapshotCount int,
@PermanentChunkCount int, 
@TemporaryChunkCount int, 
@PermanentMappingCount int, 
@TemporaryMappingCount int, 
@PermanentSegmentCount int, 
@TemporarySegmentCount int,
@SnapshotsCleaned int OUTPUT,
@ChunksCleaned int OUTPUT,
@MappingsCleaned int OUTPUT,
@SegmentsCleaned int OUTPUT
AS 
    SELECT	@SnapshotsCleaned = 0, 
        @ChunksCleaned = 0, 
        @MappingsCleaned = 0, 
        @SegmentsCleaned = 0 ;
    
    -- use readpast rather than NOLOCK.  using 
    -- nolock could cause us to identify snapshots
    -- which have had the refcount decremented but
    -- the transaction is uncommitted which is dangerous.
    
    SET DEADLOCK_PRIORITY LOW
    
    -- cleanup of segmented chunk information happens 
    -- top->down.  meaning we delete chunk metadata, then 
    -- mappings, then segment data.  the reason for doing
    -- this is because it minimizes the io read cost since
    -- each delete step tells us the work that we need to 
    -- do in the next step.  however, there is the potential 
    -- for failure at any step which can leave orphaned data 
    -- structures.  we have another cleanup tasks 
    -- which will scavenge this orphaned data and clean it up
    -- so we don't need to be 100% robust here.  this also 
    -- means that we can play tricks like using readpast in the 
    -- dml operations so that concurrent deletes will minimize
    -- blocking of each other.	
    -- also, we optimize this cleanup for the scenario where the chunk is
    -- not shared.  this means that if we detect that a chunk is shared
    -- we will not delete any of its mappings.  there is potential for this
    -- to miss removing a chunk because it is shared and we are concurrently
    -- deleting the other snapshot (both see the chunk as shared...).  however
    -- we don't deal with that case here, and will instead orphan the chunk
    -- mappings and segments.  that is ok, we will just remove them when we 
    -- scan for orphaned mappings/segments.
    	
    declare @cleanedSnapshots table (SnapshotDataId uniqueidentifier primary key) ;
    declare @cleanedChunks table (ChunkId uniqueidentifier) ; 
    declare @cleanedChunks2 table (ChunkId uniqueidentifier primary key) ; 
    declare @cleanedSegments table (ChunkId uniqueidentifier, SegmentId uniqueidentifier) ;   	
    declare @deleteCount int ;   	   	
    
    begin transaction
    -- remove the actual snapshot entry
    -- we do this transacted with cleaning up chunk 
    -- data because we do not lazily clean up old ChunkData table.
    -- we also do this before cleaning up segmented chunk data to 
    -- get this SnapshotData record out of the table so another parallel 
    -- cleanup task does not attempt to delete it which would just cause 
    -- contention and reduce cleanup throughput.	
    DELETE TOP (@PermanentSnapshotCount) SnapshotData 
    output deleted.SnapshotDataID into @cleanedSnapshots (SnapshotDataId)
    FROM SnapshotData with(readpast) 
    WHERE   SnapshotData.PermanentRefCount <= 0 AND
            SnapshotData.TransientRefCount <= 0 ; 
    SET @SnapshotsCleaned = @@ROWCOUNT ;    
    
    -- clean up RS2000/RS2005 chunks
    set @deleteCount = 20;
    while (@deleteCount = 20)
    begin
        delete top(20) c
        from ChunkData c
        join @cleanedSnapshots cs ON c.SnapshotDataID = cs.SnapshotDataId;
        
        set @deleteCount = @@ROWCOUNT;
        SET @ChunksCleaned = @ChunksCleaned + @deleteCount;
    end
    commit
   	
   	-- clean up chunks
   	set @deleteCount = @PermanentChunkCount;
   	while (@deleteCount = @PermanentChunkCount)
   	begin		
   	    delete top (@PermanentChunkCount) SC 
   	    output deleted.ChunkId into @cleanedChunks(ChunkId)
   	    from SegmentedChunk SC with (readpast)	
   	    join @cleanedSnapshots cs on SC.SnapshotDataId = cs.SnapshotDataId ;	
   	    set @deleteCount = @@ROWCOUNT ; 
   	    set @ChunksCleaned =  @ChunksCleaned + @deleteCount ;
   	end ;

    -- This is added based on the Execution Plan. It should speed 
    -- up the "clean up unused mapping" operation below.
    insert into @cleanedChunks2
    select distinct ChunkId from @cleanedChunks;
	
	-- clean up unused mappings
    set @deleteCount = @PermanentMappingCount;
    while (@deleteCount = @PermanentMappingCount)
    begin		
        delete top(@PermanentMappingCount) CSM
        output deleted.ChunkId, deleted.SegmentId into @cleanedSegments (ChunkId, SegmentId)
        from ChunkSegmentMapping CSM with (readpast)
        join @cleanedChunks2 cc ON CSM.ChunkId = cc.ChunkId
        where not exists (
            select 1 from SegmentedChunk SC with(nolock)
            where SC.ChunkId = cc.ChunkId ) 
        and not exists (
            select 1 from [ReportServerTempDB].dbo.SegmentedChunk TSC with(nolock)
            where TSC.ChunkId = cc.ChunkId ) ;
        set @deleteCount = @@ROWCOUNT ;
        set @MappingsCleaned = @MappingsCleaned + @deleteCount ;
    end ;
	
    -- clean up segments
    set @deleteCount = @PermanentSegmentCount;
    while (@deleteCount = @PermanentSegmentCount)
    begin
        delete top (@PermanentSegmentCount) S
        from Segment S with (readpast)
        join @cleanedSegments cs on S.SegmentId = cs.SegmentId
        where not exists (
            select 1 from ChunkSegmentMapping csm with (nolock)
            where csm.SegmentId = cs.SegmentId ) ;
        set @deleteCount = @@ROWCOUNT ;
        set @SegmentsCleaned = @SegmentsCleaned + @deleteCount ;
    end
    
    DELETE FROM @cleanedSnapshots ;
    DELETE FROM @cleanedChunks ;
    DELETE FROM @cleanedSegments ;
       	
    begin transaction	
    DELETE TOP (@TemporarySnapshotCount) [ReportServerTempDB].dbo.SnapshotData 
    output deleted.SnapshotDataID into @cleanedSnapshots(SnapshotDataId)
    FROM [ReportServerTempDB].dbo.SnapshotData with(readpast) 
    WHERE   [ReportServerTempDB].dbo.SnapshotData.PermanentRefCount <= 0 AND
            [ReportServerTempDB].dbo.SnapshotData.TransientRefCount <= 0 AND
            [ReportServerTempDB].dbo.SnapshotData.Machine = @Machine ;
    SET @SnapshotsCleaned = @SnapshotsCleaned + @@ROWCOUNT ;
    
    DELETE [ReportServerTempDB].dbo.ChunkData FROM [ReportServerTempDB].dbo.ChunkData 
	INNER JOIN @cleanedSnapshots cs
    ON [ReportServerTempDB].dbo.ChunkData.SnapshotDataID = cs.SnapshotDataId
    SET @ChunksCleaned = @ChunksCleaned + @@ROWCOUNT	
    commit
     
   	set @deleteCount = 1 ; 
   	while (@deleteCount > 0)
   	begin		
		delete SC 
		output deleted.ChunkId into @cleanedChunks(ChunkId)
		from [ReportServerTempDB].dbo.SegmentedChunk SC with (readpast)	
		join @cleanedSnapshots cs on SC.SnapshotDataId = cs.SnapshotDataId ;	
		set @deleteCount = @@ROWCOUNT ; 
		set @ChunksCleaned =  @ChunksCleaned + @deleteCount ;
	end ;
	
	-- clean up unused mappings
	set @deleteCount = 1 ;	
	while (@deleteCount > 0)
	begin		
		delete top(@TemporaryMappingCount) CSM
		output deleted.ChunkId, deleted.SegmentId into @cleanedSegments (ChunkId, SegmentId)
		from [ReportServerTempDB].dbo.ChunkSegmentMapping CSM with (readpast)
		join @cleanedChunks cc ON CSM.ChunkId = cc.ChunkId
		where not exists (
			select 1 from [ReportServerTempDB].dbo.SegmentedChunk SC
			where SC.ChunkId = cc.ChunkId ) ;
		set @deleteCount = @@ROWCOUNT ;
		set @MappingsCleaned = @MappingsCleaned + @deleteCount ;
	end ;
		
	select distinct ChunkId from @cleanedSegments ;
		
	-- clean up segments
	set @deleteCount = 1
	while (@deleteCount > 0)
	begin
		delete top (@TemporarySegmentCount) S
		from [ReportServerTempDB].dbo.Segment S with (readpast)
		join @cleanedSegments cs on S.SegmentId = cs.SegmentId
		where not exists (
			select 1 from [ReportServerTempDB].dbo.ChunkSegmentMapping csm
			where csm.SegmentId = cs.SegmentId ) ;
		set @deleteCount = @@ROWCOUNT ;
		set @SegmentsCleaned = @SegmentsCleaned + @deleteCount ;
	end
GO
GRANT EXECUTE ON [dbo].[CleanOrphanedSnapshots] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClearScheduleConsistancyFlags]
AS
update [Schedule] with (tablock, xlock) set [ConsistancyCheck] = NULL
GO
GRANT EXECUTE ON [dbo].[ClearScheduleConsistancyFlags] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DereferenceSessionSnapshot]
@SessionID as varchar(32),
@OwnerID as uniqueidentifier
AS

UPDATE SN
SET TransientRefcount = TransientRefcount - 1
FROM
   SnapshotData AS SN
   INNER JOIN [ReportServerTempDB].dbo.SessionData AS SE ON SN.SnapshotDataID = SE.SnapshotDataID
WHERE
   SE.SessionID = @SessionID AND
   SE.OwnerID = @OwnerID
   
UPDATE SN
SET TransientRefcount = TransientRefcount - 1
FROM
   [ReportServerTempDB].dbo.SnapshotData AS SN
   INNER JOIN [ReportServerTempDB].dbo.SessionData AS SE ON SN.SnapshotDataID = SE.SnapshotDataID
WHERE
   SE.SessionID = @SessionID AND
   SE.OwnerID = @OwnerID
GO
GRANT EXECUTE ON [dbo].[DereferenceSessionSnapshot] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClearSessionSnapshot]
@SessionID as varchar(32),
@OwnerSid as varbinary(85) = NULL,
@OwnerName as nvarchar(260),
@AuthType as int,
@Expiration as datetime
AS

DECLARE @OwnerID uniqueidentifier
EXEC GetUserID @OwnerSid, @OwnerName, @AuthType, @OwnerID OUTPUT

EXEC DereferenceSessionSnapshot @SessionID, @OwnerID

UPDATE SE
SET
   SE.SnapshotDataID = null,
   SE.IsPermanentSnapshot = null,
   SE.SnapshotExpirationDate = null,
   SE.ShowHideInfo = null,
   SE.HasInteractivity = null,
   SE.AutoRefreshSeconds = null,
   SE.Expiration = @Expiration
FROM
   [ReportServerTempDB].dbo.SessionData AS SE
WHERE
   SE.SessionID = @SessionID AND
   SE.OwnerID = @OwnerID
GO
GRANT EXECUTE ON [dbo].[ClearSessionSnapshot] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CopyChunks]
	@OldSnapshotId UNIQUEIDENTIFIER, 
	@NewSnapshotId UNIQUEIDENTIFIER,
	@IsPermanentSnapshot BIT
AS
BEGIN
	IF(@IsPermanentSnapshot = 1) BEGIN	
		-- copy non-segmented chunks
		INSERT [dbo].[ChunkData] (
			ChunkId, 
			SnapshotDataId, 
			ChunkFlags, 
			ChunkName, 
			ChunkType,
			Version, 
			MimeType, 
			Content
			)
		SELECT 
			NEWID(), 
			@NewSnapshotId, 
			[c].[ChunkFlags], 
			[c].[ChunkName], 
			[c].[ChunkType],
			[c].[Version], 
			[c].[MimeType], 
			[c].[Content]
		FROM [dbo].[ChunkData] [c] WHERE [c].[SnapshotDataId] = @OldSnapshotId
		
		-- copy segmented chunks... real easy just add the mapping
		INSERT [dbo].[SegmentedChunk](
			ChunkId, 
			SnapshotDataId, 
			ChunkName, 
			ChunkType,
			Version,
			MimeType,
			ChunkFlags
			)
		SELECT 
			ChunkId,
			@NewSnapshotId,
			ChunkName,
			ChunkType,
			Version,
			MimeType,
			ChunkFlags
		FROM [dbo].[SegmentedChunk] WITH (INDEX (UNIQ_SnapshotChunkMapping))
		WHERE [SnapshotDataId] = @OldSnapshotId
	END
	ELSE BEGIN
		-- copy non-segmented chunks
		INSERT [ReportServerTempDB].dbo.[ChunkData] (
			ChunkId, 
			SnapshotDataId, 
			ChunkFlags, 
			ChunkName, 
			ChunkType,
			Version, 
			MimeType, 
			Content
			)
		SELECT 
			NEWID(), 
			@NewSnapshotId, 
			[c].[ChunkFlags], 
			[c].[ChunkName], 
			[c].[ChunkType],
			[c].[Version], 
			[c].[MimeType], 
			[c].[Content]
		FROM [ReportServerTempDB].dbo.[ChunkData] [c] WHERE [c].[SnapshotDataId] = @OldSnapshotId
				
		-- copy segmented chunks... real easy just add the mapping
		INSERT [ReportServerTempDB].[dbo].[SegmentedChunk](
			ChunkId, 
			SnapshotDataId, 
			ChunkName, 
			ChunkType,
			Version,
			MimeType,
			ChunkFlags, 
			Machine
			)
		SELECT 
			ChunkId,
			@NewSnapshotId,
			ChunkName,
			ChunkType,
			Version,
			MimeType,
			ChunkFlags, 
			Machine
		FROM [ReportServerTempDB].dbo.[SegmentedChunk] WITH (INDEX (UNIQ_SnapshotChunkMapping))
		WHERE [SnapshotDataId] = @OldSnapshotId
	END
END
GO
GRANT EXECUTE ON [dbo].[CopyChunks] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CopyChunksOfType]
@FromSnapshotID uniqueidentifier,
@FromIsPermanent bit,
@ToSnapshotID uniqueidentifier,
@ToIsPermanent bit,
@ChunkType int, 
@ChunkName nvarchar(260) = NULL, 
@TargetChunkName nvarchar(260) = NULL
AS

DECLARE @Machine nvarchar(512)

IF @FromIsPermanent != 0 AND @ToIsPermanent = 0 BEGIN

	-- copy the contiguous chunks
    INSERT INTO [ReportServerTempDB].dbo.ChunkData
        (ChunkID, SnapshotDataID, ChunkName, ChunkType, MimeType, Version, ChunkFlags, Content)
    SELECT
         newid(), @ToSnapshotID, COALESCE(@TargetChunkName, S.ChunkName), S.ChunkType, S.MimeType, S.Version, S.ChunkFlags, S.Content
    FROM
        ChunkData AS S
    WHERE   
        S.SnapshotDataID = @FromSnapshotID AND
        (S.ChunkType = @ChunkType OR @ChunkType IS NULL) AND
        (S.ChunkName = @ChunkName OR @ChunkName IS NUll) AND
    NOT EXISTS(
        SELECT T.ChunkName
        FROM [ReportServerTempDB].dbo.ChunkData AS T -- exclude the ones in the target
        WHERE
            T.ChunkName = COALESCE(@TargetChunkName, S.ChunkName) AND
            T.ChunkType = S.ChunkType AND
            T.SnapshotDataID = @ToSnapshotID)
     

	-- the chunks will be cleaned up by the machine in which they are being allocated to
	select @Machine = Machine from [ReportServerTempDB].dbo.SnapshotData SD where SD.SnapshotDataID = @ToSnapshotID
		
	INSERT INTO [ReportServerTempDB].dbo.SegmentedChunk
		(SnapshotDataId, ChunkId, ChunkFlags, ChunkName, ChunkType, Version, MimeType, Machine)	
	SELECT
		@ToSnapshotID, SC.ChunkId, SC.ChunkFlags | 0x4, COALESCE(@TargetChunkName, SC.ChunkName), SC.ChunkType, SC.Version, SC.MimeType, @Machine
	FROM SegmentedChunk SC WITH(INDEX (UNIQ_SnapshotChunkMapping))
	WHERE 
		SC.SnapshotDataId = @FromSnapshotID AND
		(SC.ChunkType = @ChunkType OR @ChunkType IS NULL) AND
		(SC.ChunkName = @ChunkName OR @ChunkName IS NULL) AND
		NOT EXISTS(
			-- exclude chunks already in the target
			SELECT TSC.ChunkName
			FROM [ReportServerTempDB].dbo.SegmentedChunk TSC
			-- JOIN [ReportServerTempDB].dbo.SnapshotChunkMapping TSCM ON (TSC.ChunkId = TSCM.ChunkId)
			WHERE 
				TSC.ChunkName = COALESCE(@TargetChunkName, SC.ChunkName) AND
				TSC.ChunkType = SC.ChunkType AND
				TSC.SnapshotDataId = @ToSnapshotID
			)

 END ELSE IF @FromIsPermanent = 0 AND @ToIsPermanent = 0 BEGIN	
	-- the chunks exist on the node in which they were originally allocated on, they should
	-- be cleaned up by that node
	select @Machine = Machine from [ReportServerTempDB].dbo.SnapshotData SD where SD.SnapshotDataID = @FromSnapshotID

    INSERT INTO [ReportServerTempDB].dbo.ChunkData
        (ChunkId, SnapshotDataID, ChunkName, ChunkType, MimeType, Version, ChunkFlags, Content)
    SELECT
        newid(), @ToSnapshotID, COALESCE(@TargetChunkName, S.ChunkName), S.ChunkType, S.MimeType, S.Version, S.ChunkFlags, S.Content
    FROM
        [ReportServerTempDB].dbo.ChunkData AS S
    WHERE   
        S.SnapshotDataID = @FromSnapshotID AND
        (S.ChunkType = @ChunkType OR @ChunkType IS NULL) AND
        (S.ChunkName = @ChunkName OR @ChunkName IS NULL) AND
        NOT EXISTS(
            SELECT T.ChunkName
            FROM [ReportServerTempDB].dbo.ChunkData AS T -- exclude the ones in the target
            WHERE
                T.ChunkName = COALESCE(@TargetChunkName, S.ChunkName) AND
                T.ChunkType = S.ChunkType AND
                T.SnapshotDataID = @ToSnapshotID)
                            
    -- copy the segmented chunks, copying the segmented
    -- chunks really just needs to update the mappings        
    INSERT INTO [ReportServerTempDB].dbo.SegmentedChunk
		(SnapshotDataId, ChunkId, ChunkName, ChunkType, Version, ChunkFlags, MimeType, Machine)
	SELECT 
		@ToSnapshotID, ChunkId, COALESCE(@TargetChunkName, C.ChunkName), C.ChunkType, C.Version, C.ChunkFlags, C.MimeType, @Machine	
	FROM [ReportServerTempDB].dbo.SegmentedChunk C WITH(INDEX (UNIQ_SnapshotChunkMapping))
	WHERE	C.SnapshotDataId = @FromSnapshotID AND
			(C.ChunkType = @ChunkType OR @ChunkType IS NULL) AND	
			(C.ChunkName = @ChunkName OR @ChunkName IS NULL) AND
			NOT EXISTS(
				-- exclude chunks that are already mapped into this snapshot
				SELECT T.ChunkId
				FROM [ReportServerTempDB].dbo.SegmentedChunk T
				WHERE	T.SnapshotDataId = @ToSnapshotID and 
						T.ChunkName = COALESCE(@TargetChunkName, C.ChunkName) and 
						T.ChunkType = C.ChunkType
				)

END ELSE IF @FromIsPermanent != 0 AND @ToIsPermanent != 0 BEGIN

    INSERT INTO ChunkData
        (ChunkID, SnapshotDataID, ChunkName, ChunkType, MimeType, Version, ChunkFlags, Content)
    SELECT
        newid(), @ToSnapshotID, COALESCE(@TargetChunkName, S.ChunkName), S.ChunkType, S.MimeType, S.Version, S.ChunkFlags, S.Content
    FROM
        ChunkData AS S
    WHERE   
        S.SnapshotDataID = @FromSnapshotID AND
        (S.ChunkType = @ChunkType OR @ChunkType IS NULL) AND
        (S.ChunkName = @ChunkName OR @ChunkName IS NULL) AND
        NOT EXISTS(
            SELECT T.ChunkName
            FROM ChunkData AS T -- exclude the ones in the target
            WHERE
                T.ChunkName = COALESCE(@TargetChunkName, S.ChunkName) AND
                T.ChunkType = S.ChunkType AND
                T.SnapshotDataID = @ToSnapshotID)
                
    -- copy the segmented chunks, copying the segmented
    -- chunks really just needs to update the mappings
    INSERT INTO SegmentedChunk
		(SnapshotDataId, ChunkId, ChunkName, ChunkType, Version, ChunkFlags, C.MimeType)
	SELECT 
		@ToSnapshotID, ChunkId, COALESCE(@TargetChunkName, C.ChunkName), C.ChunkType, C.Version, C.ChunkFlags, C.MimeType	
	FROM SegmentedChunk C WITH(INDEX (UNIQ_SnapshotChunkMapping))
	WHERE	C.SnapshotDataId = @FromSnapshotID AND
			(C.ChunkType = @ChunkType OR @ChunkType IS NULL) AND	
			(C.ChunkName = @ChunkName OR @ChunkName IS NULL) AND
			NOT EXISTS(
				-- exclude chunks that are already mapped into this snapshot
				SELECT T.ChunkId
				FROM SegmentedChunk T
				WHERE	T.SnapshotDataId = @ToSnapshotID and 
						T.ChunkName = COALESCE(@TargetChunkName, C.ChunkName) and 
						T.ChunkType = C.ChunkType
				)

END ELSE IF @FromIsPermanent = 0 AND @ToIsPermanent != 0 BEGIN
    INSERT INTO ChunkData
        (ChunkId, SnapshotDataID, ChunkName, ChunkType, MimeType, Version, ChunkFlags, Content)
    SELECT
        newid(), @ToSnapshotID, COALESCE(@TargetChunkName, S.ChunkName), S.ChunkType, S.MimeType, S.Version, S.ChunkFlags, S.Content
    FROM
        [ReportServerTempDB].dbo.ChunkData AS S
    WHERE   
        S.SnapshotDataID = @FromSnapshotID AND
        (S.ChunkType = @ChunkType OR @ChunkType IS NULL) AND
        (S.ChunkName = @ChunkName OR @ChunkName IS NULL) AND
        NOT EXISTS(
            SELECT T.ChunkName
            FROM ChunkData AS T -- exclude the ones in the target
            WHERE
                T.ChunkName = COALESCE(@TargetChunkName, S.ChunkName) AND
                T.ChunkType = S.ChunkType AND
                T.SnapshotDataID = @ToSnapshotID)
                            
    declare @mapping_temp table (ChunkId uniqueidentifier not null primary key)
    
    INSERT INTO SegmentedChunk
        (SnapshotDataId, ChunkId, ChunkName, ChunkType, Version, ChunkFlags, MimeType)
    OUTPUT inserted.ChunkId INTO @mapping_temp
    SELECT 
        @ToSnapshotID, ChunkId, COALESCE(@TargetChunkName, C.ChunkName), C.ChunkType, C.Version, C.ChunkFlags, C.MimeType
    FROM [ReportServerTempDB].dbo.SegmentedChunk C WITH(INDEX (UNIQ_SnapshotChunkMapping))
    WHERE   
        C.SnapshotDataId = @FromSnapshotID AND
        (C.ChunkType = @ChunkType OR @ChunkType IS NULL) AND    
        (C.ChunkName = @ChunkName OR @ChunkName IS NULL)  AND
        NOT EXISTS(
            -- exclude chunks that are already mapped into this snapshot
            SELECT T.ChunkId
            FROM SegmentedChunk T
            WHERE    T.SnapshotDataId = @ToSnapshotID and 
               T.ChunkName = COALESCE(@TargetChunkName, C.ChunkName) and 
               T.ChunkType = C.ChunkType
        )
            
     declare @segment_temp table (SegmentId uniqueidentifier not null primary key)            
     
     INSERT INTO ChunkSegmentMapping
         (ChunkId, SegmentId, StartByte, LogicalByteCount, ActualByteCount)
     OUTPUT inserted.SegmentId INTO @segment_temp
     SELECT CM.ChunkId, SegmentId, StartByte, LogicalByteCount, ActualByteCount
     FROM [ReportServerTempDB].dbo.ChunkSegmentMapping CM 
     INNER JOIN @mapping_temp as MT on MT.ChunkId = CM.ChunkId 
     WHERE 
        NOT EXISTS(
			-- exclude segment mappings that already exist in the target snapshot
            SELECT CMT.ChunkId
            FROM ChunkSegmentMapping CMT
            WHERE 
               CMT.ChunkId = CM.ChunkId 
               and CMT.SegmentId = CM.SegmentId
        )
           
     INSERT INTO Segment
         (SegmentId, Content)
     SELECT CS.SegmentId, Content
     FROM [ReportServerTempDB].dbo.Segment CS
     INNER JOIN @segment_temp as ST ON CS.SegmentId = ST.SegmentId
     WHERE 
        NOT EXISTS(
			-- exclude segments that already exist in the target snapshot
            SELECT CST.SegmentId
            FROM Segment CST
            WHERE 
               CST.SegmentId = CS.SegmentId
        )
END
GO
GRANT EXECUTE ON [dbo].[CopyChunksOfType] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateCacheUpdateNotifications] 
@ReportID uniqueidentifier,
@LastRunTime datetime
AS

update [Subscriptions]
set
    [LastRunTime] = @LastRunTime
from
    [Subscriptions] S 
where 
    S.[Report_OID] = @ReportID and S.EventType = 'SnapshotUpdated' and InactiveFlags = 0


-- Find all valid subscriptions for the given report and create a new notification row for
-- each subscription
insert into [Notifications] 
    (
    [NotificationID], 
    [SubscriptionID],
    [ActivationID],
    [ReportID],
    [ReportZone],
    [SnapShotDate],
    [ExtensionSettings],
    [Locale],
    [Parameters],
    [NotificationEntered],
    [SubscriptionLastRunTime],
    [DeliveryExtension],
    [SubscriptionOwnerID],
    [IsDataDriven],
    [Version]
    ) 
select 
    NewID(),
    S.[SubscriptionID],
    NULL,
    S.[Report_OID],
    S.[ReportZone],
    NULL,
    S.[ExtensionSettings],
    S.[Locale],
    S.[Parameters],
    GETUTCDATE(), 
    S.[LastRunTime],
    S.[DeliveryExtension],
    S.[OwnerID],
    0,
    S.[Version]
from 
    [Subscriptions] S  inner join Catalog C on S.[Report_OID] = C.[ItemID]
where 
    C.[ItemID] = @ReportID and S.EventType = 'SnapshotUpdated' and InactiveFlags = 0 and
    S.[DataSettings] is null

-- Create any data driven subscription by creating a data driven event
insert into [Event]
    (
    [EventID],
    [EventType],
    [EventData],
    [TimeEntered]
    )
select
    NewID(),
    'DataDrivenSubscription',
    S.SubscriptionID,
    GETUTCDATE()
from
    [Subscriptions] S  inner join Catalog C on S.[Report_OID] = C.[ItemID]
where 
    C.[ItemID] = @ReportID and S.EventType = 'SnapshotUpdated' and InactiveFlags = 0 and
    S.[DataSettings] is not null
GO
GRANT EXECUTE ON [dbo].[CreateCacheUpdateNotifications] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateChunkAndGetPointer]
@SnapshotDataID uniqueidentifier,
@IsPermanentSnapshot bit,
@ChunkName nvarchar(260),
@ChunkType int,
@MimeType nvarchar(260) = NULL,
@Version smallint,
@Content image,
@ChunkFlags tinyint = NULL,
@ChunkPointer binary(16) OUTPUT
AS

DECLARE @ChunkID uniqueidentifier
SET @ChunkID = NEWID()

IF @IsPermanentSnapshot != 0 BEGIN

    DELETE ChunkData
    WHERE
        SnapshotDataID = @SnapshotDataID AND
        ChunkName = @ChunkName AND
        ChunkType = @ChunkType

    INSERT
    INTO ChunkData
        (ChunkID, SnapshotDataID, ChunkName, ChunkType, MimeType, Version, ChunkFlags, Content)
    VALUES
        (@ChunkID, @SnapshotDataID, @ChunkName, @ChunkType, @MimeType, @Version, @ChunkFlags, @Content)

    SELECT @ChunkPointer = TEXTPTR(Content)
                FROM ChunkData
                WHERE ChunkData.ChunkID = @ChunkID

END ELSE BEGIN

    DELETE [ReportServerTempDB].dbo.ChunkData
    WHERE
        SnapshotDataID = @SnapshotDataID AND
        ChunkName = @ChunkName AND
        ChunkType = @ChunkType

    INSERT
    INTO [ReportServerTempDB].dbo.ChunkData
        (ChunkID, SnapshotDataID, ChunkName, ChunkType, MimeType, Version, ChunkFlags, Content)
    VALUES
        (@ChunkID, @SnapshotDataID, @ChunkName, @ChunkType, @MimeType, @Version, @ChunkFlags, @Content)

    SELECT @ChunkPointer = TEXTPTR(Content)
                FROM [ReportServerTempDB].dbo.ChunkData AS CH
                WHERE CH.ChunkID = @ChunkID
END
GO
GRANT EXECUTE ON [dbo].[CreateChunkAndGetPointer] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateChunkSegment]
	@SnapshotId			uniqueidentifier,	
	@IsPermanent		bit, 
	@ChunkId			uniqueidentifier,
	@Content			varbinary(max) = 0x0,
	@StartByte			bigint, 
	@Length				int = 0,
	@LogicalByteCount	int = 0,
	@SegmentId			uniqueidentifier out
as begin
	declare @output table (SegmentId uniqueidentifier, ActualByteCount int) ;
	declare @ActualByteCount int ;
	if(@IsPermanent = 1) begin	
		insert Segment(Content) 
		output inserted.SegmentId, datalength(inserted.Content) into @output
		values (substring(@Content, 1, @Length)) ;
		
		select top 1    @SegmentId = SegmentId, 
		                @ActualByteCount = ActualByteCount
		from @output ;
		
		insert ChunkSegmentMapping(ChunkId, SegmentId, StartByte, LogicalByteCount, ActualByteCount)
		values (@ChunkId, @SegmentId, @StartByte, @LogicalByteCount, @ActualByteCount) ;
	end
	else begin
		insert [ReportServerTempDB].dbo.Segment(Content) 
		output inserted.SegmentId, datalength(inserted.Content) into @output
		values (substring(@Content, 1, @Length)) ;
		
		select top 1    @SegmentId = SegmentId, 
		                @ActualByteCount = ActualByteCount
		from @output ;
		
		insert [ReportServerTempDB].dbo.ChunkSegmentMapping(ChunkId, SegmentId, StartByte, LogicalByteCount, ActualByteCount)
		values (@ChunkId, @SegmentId, @StartByte, @LogicalByteCount, @ActualByteCount) ;
	end
end
GO
GRANT EXECUTE ON [dbo].[CreateChunkSegment] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateDataDrivenNotification]
@SubscriptionID uniqueidentifier,
@ActiveationID uniqueidentifier,
@ReportID uniqueidentifier,
@ReportZone int,
@ExtensionSettings ntext,
@Locale nvarchar(128),
@Parameters ntext,
@LastRunTime datetime,
@DeliveryExtension nvarchar(260),
@OwnerSid varbinary (85) = null,
@OwnerName nvarchar(260),
@OwnerAuthType int,
@Version int
AS

declare @OwnerID as uniqueidentifier

EXEC GetUserID @OwnerSid,@OwnerName, @OwnerAuthType, @OwnerID OUTPUT

-- Verify if subscription is being deleted
if exists (select 1 from [dbo].[SubscriptionsBeingDeleted] where [SubscriptionID]=@SubscriptionID)
BEGIN
    RAISERROR( N'The subscription is being deleted', 16, 1)
    return;
END

-- Verify if subscription was deleted or deactivated
if not exists (select 1 from [dbo].[Subscriptions] where [SubscriptionID]=@SubscriptionID and [InactiveFlags] = 0)
BEGIN
    RAISERROR( N'The subscription was deleted or deactivated', 16, 1)
    return;
END

-- Insert into the notification table
insert into [Notifications] 
    (
    [NotificationID], 
    [SubscriptionID],
    [ActivationID],
    [ReportID],
    [ReportZone],
    [SnapShotDate],
    [ExtensionSettings],
    [Locale],
    [Parameters],
    [NotificationEntered],
    [SubscriptionLastRunTime],
    [DeliveryExtension],
    [SubscriptionOwnerID],
    [IsDataDriven],
    [Version]
    )
values
    (
    NewID(),
    @SubscriptionID,
    @ActiveationID,
    @ReportID,
    @ReportZone,
    NULL,
    @ExtensionSettings,
    @Locale,
    @Parameters,
    GETUTCDATE(),
    @LastRunTime,
    @DeliveryExtension,
    @OwnerID,
    1,
    @Version
    )
GO
GRANT EXECUTE ON [dbo].[CreateDataDrivenNotification] TO [RSExecRole]
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
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateNewActiveSubscription]
@ActiveID uniqueidentifier,
@SubscriptionID uniqueidentifier
AS


-- Insert into the activesubscription table
insert into [ActiveSubscriptions] 
    (
    [ActiveID], 
    [SubscriptionID],
    [TotalNotifications],
    [TotalSuccesses],
    [TotalFailures]
    )
values
    (
    @ActiveID,
    @SubscriptionID,
    NULL,
    0,
    0
    )
GO
GRANT EXECUTE ON [dbo].[CreateNewActiveSubscription] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateNewSnapshotVersion]
	@OldSnapshotId UNIQUEIDENTIFIER, 
	@NewSnapshotId UNIQUEIDENTIFIER,
	@IsPermanentSnapshot BIT, 
	@Machine NVARCHAR(512)
AS
BEGIN
	IF(@IsPermanentSnapshot = 1) BEGIN	
		INSERT [dbo].[SnapshotData] (
			SnapshotDataId, 
			CreatedDate, 
			ParamsHash, 
			QueryParams, 
			EffectiveParams, 
			Description, 
			DependsOnUser, 
			PermanentRefCount, 
			TransientRefCount, 
			ExpirationDate, 
			PageCount, 
			HasDocMap, 
			PaginationMode, 
			ProcessingFlags
			)
		SELECT 
			@NewSnapshotId,
			[sn].CreatedDate, 
			[sn].ParamsHash,
			[sn].QueryParams, 
			[sn].EffectiveParams, 
			[sn].Description, 
			[sn].DependsOnUser, 	
			0,
			1,		-- always create with transient refcount of 1
			[sn].ExpirationDate,
			[sn].PageCount, 
			[sn].HasDocMap, 
			[sn].PaginationMode,
			[sn].ProcessingFlags
		FROM [dbo].[SnapshotData] [sn] 
		WHERE [sn].SnapshotDataId = @OldSnapshotId
	END
	ELSE BEGIN	
		INSERT [ReportServerTempDB].dbo.[SnapshotData] (
			SnapshotDataId, 
			CreatedDate, 
			ParamsHash, 
			QueryParams, 
			EffectiveParams, 
			Description, 
			DependsOnUser, 
			PermanentRefCount, 
			TransientRefCount, 
			ExpirationDate, 
			PageCount, 
			HasDocMap, 
			PaginationMode, 
			ProcessingFlags,
			Machine,
			IsCached
			)
		SELECT 
			@NewSnapshotId,
			[sn].CreatedDate, 
			[sn].ParamsHash,
			[sn].QueryParams, 
			[sn].EffectiveParams, 
			[sn].Description, 
			[sn].DependsOnUser, 	
			0,
			1,		-- always create with transient refcount of 1
			[sn].ExpirationDate,
			[sn].PageCount, 
			[sn].HasDocMap, 
			[sn].PaginationMode, 
			[sn].ProcessingFlags,
			@Machine,
			[sn].IsCached
		FROM [ReportServerTempDB].dbo.[SnapshotData] [sn] 
		WHERE [sn].SnapshotDataId = @OldSnapshotId
	END
	
	EXEC [dbo].[CopyChunks] 
		@OldSnapshotId = @OldSnapshotId, 
		@NewSnapshotId = @NewSnapshotId, 
		@IsPermanentSnapshot = @IsPermanentSnapshot
END
GO
GRANT EXECUTE ON [dbo].[CreateNewSnapshotVersion] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- This SP should never be called with a policy ID unless it is guarenteed that
-- the parent will not be deleted before the insert (such as while running this script)
CREATE PROCEDURE [dbo].[CreateObject]
@ItemID uniqueidentifier,
@Name nvarchar (425),
@Path nvarchar (425),
@ParentID uniqueidentifier,
@Type int,
@Content image = NULL,
@Intermediate uniqueidentifier = NULL,
@LinkSourceID uniqueidentifier = NULL,
@Property ntext = NULL,
@Parameter ntext = NULL,
@Description ntext = NULL,
@Hidden bit = NULL,
@CreatedBySid varbinary(85) = NULL,
@CreatedByName nvarchar(260),
@AuthType int,
@CreationDate datetime,
@ModificationDate datetime,
@MimeType nvarchar (260) = NULL,
@SnapshotLimit int = NULL,
@PolicyRoot int = 0,
@PolicyID uniqueidentifier = NULL,
@ExecutionFlag int = 1, -- allow live execution, don't keep history
@SubType nvarchar(128) = NULL,
@ComponentID uniqueidentifier = NULL
AS

DECLARE @CreatedByID uniqueidentifier
EXEC GetUserID @CreatedBySid, @CreatedByName, @AuthType, @CreatedByID OUTPUT

UPDATE Catalog
SET ModifiedByID = @CreatedByID, ModifiedDate = @ModificationDate
WHERE ItemID = @ParentID

-- If no policyID, use the parent's
IF @PolicyID is NULL BEGIN
   SET @PolicyID = (SELECT PolicyID FROM [dbo].[Catalog] WHERE Catalog.ItemID = @ParentID)
END

-- If there is no policy ID then we are guarenteed not to have a parent
IF @PolicyID is NULL BEGIN
RAISERROR ('Parent Not Found', 16, 1)
return
END

INSERT INTO Catalog (ItemID,  Path,  Name,  ParentID,  Type,  Content,  Intermediate,  LinkSourceID,  Property,  Description,  Hidden,  CreatedByID,  CreationDate,  ModifiedByID,  ModifiedDate,  MimeType,  SnapshotLimit,  [Parameter],  PolicyID,  PolicyRoot, ExecutionFlag, SubType, ComponentID)
VALUES             (@ItemID, @Path, @Name, @ParentID, @Type, @Content, @Intermediate, @LinkSourceID, @Property, @Description, @Hidden, @CreatedByID, @CreationDate, @CreatedByID,  @ModificationDate, @MimeType, @SnapshotLimit, @Parameter, @PolicyID, @PolicyRoot , @ExecutionFlag, @SubType, @ComponentID)

IF @Intermediate IS NOT NULL AND @@ERROR = 0 BEGIN
   UPDATE SnapshotData
   SET PermanentRefcount = PermanentRefcount + 1, TransientRefcount = TransientRefcount - 1
   WHERE SnapshotData.SnapshotDataID = @Intermediate
END
GO
GRANT EXECUTE ON [dbo].[CreateObject] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateSegmentedChunk]
	@SnapshotId		uniqueidentifier,
	@IsPermanent	bit, 
	@ChunkName		nvarchar(260),
	@ChunkFlags		tinyint, 
	@ChunkType		int, 
	@Version		smallint, 
	@MimeType		nvarchar(260) = null, 
	@Machine		nvarchar(512),
	@ChunkId		uniqueidentifier out
as begin
	declare @output table (ChunkId uniqueidentifier) ;
	if (@IsPermanent = 1) begin
		delete SegmentedChunk
		where SnapshotDataId = @SnapshotId and ChunkName = @ChunkName and ChunkType = @ChunkType
		
		delete ChunkData
		where SnapshotDataID = @SnapshotId and ChunkName = @ChunkName and ChunkType = @ChunkType
							
		insert SegmentedChunk(SnapshotDataId, ChunkFlags, ChunkName, ChunkType, Version, MimeType)
		output inserted.ChunkId into @output
		values (@SnapshotId, @ChunkFlags, @ChunkName, @ChunkType, @Version, @MimeType) ;
	end
	else begin
		delete [ReportServerTempDB].dbo.SegmentedChunk
		where SnapshotDataId = @SnapshotId and ChunkName = @ChunkName and ChunkType = @ChunkType
		
		delete [ReportServerTempDB].dbo.ChunkData
		where SnapshotDataID = @SnapshotId and ChunkName = @ChunkName and ChunkType = @ChunkType

		insert [ReportServerTempDB].dbo.SegmentedChunk(SnapshotDataId, ChunkFlags, ChunkName, ChunkType, Version, MimeType, Machine)
		output inserted.ChunkId into @output
		values (@SnapshotId, @ChunkFlags, @ChunkName, @ChunkType, @Version, @MimeType, @Machine) ;
	end
	select top 1 @ChunkId = ChunkId from @output
end
GO
GRANT EXECUTE ON [dbo].[CreateSegmentedChunk] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateRdlChunk]
	@ItemId UNIQUEIDENTIFIER, 
	@SnapshotId UNIQUEIDENTIFIER, 
	@IsPermanentSnapshot BIT, 
	@ChunkName NVARCHAR(260), 
	@ChunkFlags TINYINT, 
	@ChunkType INT, 
	@Version SMALLINT, 
	@MimeType NVARCHAR(260) = NULL
AS
BEGIN

-- If the chunk already exists then bail out early
IF EXISTS (
    SELECT 1 
    FROM [SegmentedChunk]
    WHERE   SnapshotDataId = @SnapshotId AND 
            ChunkName = @ChunkName AND 
            ChunkType = @ChunkType
    )
    RETURN ;

-- This is a 3-step process.  First we need to get the RDL out of the Catalog
-- table where it is stored in the Content row.  Note the join to make sure
-- that if ItemId is a Linked Report we go back to the main report to get the RDL.
-- Once we have the RDL stored in @SegmentData, we then invoke the CreateSegmentedChunk
-- stored proc which will create an empty segmented chunk for us and return the ChunkId.
-- finally, once we have a ChunkId, we can invoke CreateChunkSegment to actually put the 
-- content into the chunk.  Note that we do not every actually break the chunk into multiple
-- sgements but instead we always use one.  
DECLARE @SegmentData VARBINARY(MAX) ;
DECLARE @SegmentByteCount INT ;
SELECT @SegmentData = CONVERT(VARBINARY(MAX), ISNULL(Linked.Content, Original.Content))
FROM [Catalog] Original
LEFT OUTER JOIN [Catalog] Linked WITH (INDEX(PK_Catalog)) ON (Original.LinkSourceId = Linked.ItemId)
WHERE [Original].[ItemId] = @ItemId ;

SELECT @SegmentByteCount = DATALENGTH(@SegmentData) ;

DECLARE @ChunkId UNIQUEIDENTIFIER ;
EXEC [CreateSegmentedChunk]
    @SnapshotId = @SnapshotId,
    @IsPermanent = @IsPermanentSnapshot,
    @ChunkName = @ChunkName, 
    @ChunkFlags = @ChunkFlags, 
    @ChunkType = @ChunkType,
    @Version = @Version,
    @MimeType = @MimeType,
    @Machine = NULL,
    @ChunkId = @ChunkId out ;

DECLARE @SegmentId UNIQUEIDENTIFIER ; 
EXEC [CreateChunkSegment]
    @SnapshotId = @SnapshotId, 
    @IsPermanent = @IsPermanentSnapshot,
    @ChunkId = @ChunkId, 
    @Content = @SegmentData,
    @StartByte = 0, 
    @Length = @SegmentByteCount,
    @LogicalByteCount = @SegmentByteCount,
    @SegmentId = @SegmentId out
END
GO
GRANT EXECUTE ON [dbo].[CreateRdlChunk] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateRole]
@RoleID as uniqueidentifier,
@RoleName as nvarchar(260),
@Description as nvarchar(512) = null,
@TaskMask as nvarchar(32),
@RoleFlags as tinyint
AS
INSERT INTO Roles
(RoleID, RoleName, Description, TaskMask, RoleFlags)
VALUES
(@RoleID, @RoleName, @Description, @TaskMask, @RoleFlags)
GO
GRANT EXECUTE ON [dbo].[CreateRole] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Writes or updates session record
CREATE PROCEDURE [dbo].[CreateSession]
@SessionID as varchar(32),
@CompiledDefinition as uniqueidentifier = NULL,
@SnapshotDataID as uniqueidentifier = NULL,
@IsPermanentSnapshot as bit = NULL,
@ReportPath as nvarchar(464) = NULL,
@Timeout as int,
@AutoRefreshSeconds as int = NULL,
@DataSourceInfo as image = NULL,
@OwnerName as nvarchar (260),
@OwnerSid as varbinary (85) = NULL,
@AuthType as int,
@EffectiveParams as ntext = NULL,
@HistoryDate as datetime = NULL,
@PageHeight as float = NULL,
@PageWidth as float = NULL,
@TopMargin as float = NULL,
@BottomMargin as float = NULL,
@LeftMargin as float = NULL,
@RightMargin as float = NULL,
@AwaitingFirstExecution as bit = NULL,
@EditSessionID as varchar(32) = NULL,
@SitePath as nvarchar(440) = NULL,
@SiteZone as int,
@DataSetInfo as varbinary(max) = NULL,
@ReportDefinitionPath as nvarchar(464) = NULL
AS

UPDATE PS
SET PS.RefCount = 1
FROM
    [ReportServerTempDB].dbo.PersistedStream as PS
WHERE
    PS.SessionID = @SessionID	
    
UPDATE SN
SET TransientRefcount = TransientRefcount + 1
FROM
   SnapshotData AS SN
WHERE
   SN.SnapshotDataID = @SnapshotDataID
   
UPDATE SN
SET TransientRefcount = TransientRefcount + 1
FROM
   [ReportServerTempDB].dbo.SnapshotData AS SN
WHERE
   SN.SnapshotDataID = @SnapshotDataID

DECLARE @OwnerID uniqueidentifier
EXEC GetUserID @OwnerSid, @OwnerName, @AuthType, @OwnerID OUTPUT

DECLARE @now datetime
SET @now = GETDATE()

INSERT
   INTO [ReportServerTempDB].dbo.SessionData (
      SessionID,
      CompiledDefinition,
      SnapshotDataID,
      IsPermanentSnapshot,
      ReportPath,
      Timeout,
      AutoRefreshSeconds,
      Expiration,
      DataSourceInfo,
      OwnerID,
      EffectiveParams,
      CreationTime,
      HistoryDate,
      PageHeight,
      PageWidth,
      TopMargin,
      BottomMargin,
      LeftMargin,
      RightMargin,
      AwaitingFirstExecution,
      EditSessionID,
      SitePath,
      SiteZone,
      DataSetInfo,
      ReportDefinitionPath )      
   VALUES (
      @SessionID,
      @CompiledDefinition,
      @SnapshotDataID,
      @IsPermanentSnapshot,
      @ReportPath,
      @Timeout,
      @AutoRefreshSeconds,
      DATEADD(s, @Timeout, @now),
      @DataSourceInfo,
      @OwnerID,
      @EffectiveParams,
      @now,
      @HistoryDate,
      @PageHeight,
      @PageWidth,
      @TopMargin,
      @BottomMargin,
      @LeftMargin,
      @RightMargin,
      @AwaitingFirstExecution, 
      @EditSessionID,
      @SitePath,
      @SiteZone,
      @DataSetInfo,
      @ReportDefinitionPath )
      
INSERT INTO [ReportServerTempDB].dbo.SessionLock(SessionID)
VALUES (@SessionID)
GO
GRANT EXECUTE ON [dbo].[CreateSession] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateSnapShotNotifications] 
@HistoryID uniqueidentifier,
@LastRunTime datetime
AS
update [Subscriptions]
set
    [LastRunTime] = @LastRunTime
from
    History SS inner join [Subscriptions] S on S.[Report_OID] = SS.[ReportID]
where 
    SS.[HistoryID] = @HistoryID and S.EventType = 'ReportHistorySnapshotCreated' and InactiveFlags = 0


-- Find all valid subscriptions for the given report and create a new notification row for
-- each subscription
insert into [Notifications] 
    (
    [NotificationID], 
    [SubscriptionID],
    [ActivationID],
    [ReportID],
    [ReportZone],
    [SnapShotDate],
    [ExtensionSettings],
    [Locale],
    [Parameters],
    [NotificationEntered],
    [SubscriptionLastRunTime],
    [DeliveryExtension],
    [SubscriptionOwnerID],
    [IsDataDriven],
    [Version]
    ) 
select 
    NewID(),
    S.[SubscriptionID],
    NULL,
    S.[Report_OID],
    S.[ReportZone],
    NULL,
    S.[ExtensionSettings],
    S.[Locale],
    S.[Parameters],
    GETUTCDATE(), 
    S.[LastRunTime],
    S.[DeliveryExtension],
    S.[OwnerID],
    0,
    S.[Version]
from 
    [Subscriptions] S with (READPAST) inner join History H on S.[Report_OID] = H.[ReportID]
where 
    H.[HistoryID] = @HistoryID and S.EventType = 'ReportHistorySnapshotCreated' and InactiveFlags = 0 and
    S.[DataSettings] is null

-- Create any data driven subscription by creating a data driven event
insert into [Event]
    (
    [EventID],
    [EventType],
    [EventData],
    [TimeEntered]
    )
select
    NewID(),
    'DataDrivenSubscription',
    S.SubscriptionID,
    GETUTCDATE()
from
    [Subscriptions] S with (READPAST) inner join History H on S.[Report_OID] = H.[ReportID]
where 
    H.[HistoryID] = @HistoryID and S.EventType = 'ReportHistorySnapshotCreated' and InactiveFlags = 0 and
    S.[DataSettings] is not null
GO
GRANT EXECUTE ON [dbo].[CreateSnapShotNotifications] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateSubscription]
@id uniqueidentifier,
@Locale nvarchar (128),
@Report_Name nvarchar (425),
@ReportZone int,
@OwnerSid varbinary (85) = NULL,
@OwnerName nvarchar(260),
@OwnerAuthType int,
@DeliveryExtension nvarchar (260) = NULL,
@InactiveFlags int,
@ExtensionSettings ntext = NULL,
@ModifiedBySid varbinary (85) = NULL,
@ModifiedByName nvarchar(260),
@ModifiedByAuthType int,
@ModifiedDate datetime,
@Description nvarchar(512) = NULL,
@LastStatus nvarchar(260) = NULL,
@EventType nvarchar(260),
@MatchData ntext = NULL,
@Parameters ntext = NULL,
@DataSettings ntext = NULL,
@Version int

AS

-- Create a subscription with the given data.  The name must match a name in the
-- Catalog table and it must be a report type (2) or linked report (4)

DECLARE @Report_OID uniqueidentifier
DECLARE @OwnerID uniqueidentifier
DECLARE @ModifiedByID uniqueidentifier
DECLARE @TempDeliveryID uniqueidentifier

--Get the report id for this subscription
select @Report_OID = (select [ItemID] from [Catalog] where [Catalog].[Path] = @Report_Name and ([Catalog].[Type] = 2 or [Catalog].[Type] = 4 or [Catalog].[Type] = 8))

EXEC GetUserID @OwnerSid, @OwnerName, @OwnerAuthType, @OwnerID OUTPUT
EXEC GetUserID @ModifiedBySid, @ModifiedByName, @ModifiedByAuthType, @ModifiedByID OUTPUT

if (@Report_OID is NULL)
begin
RAISERROR('Report Not Found', 16, 1)
return
end

Insert into Subscriptions
    (
        [SubscriptionID], 
        [OwnerID],
        [Report_OID], 
        [ReportZone],
        [Locale],
        [DeliveryExtension],
        [InactiveFlags],
        [ExtensionSettings],
        [ModifiedByID],
        [ModifiedDate],
        [Description],
        [LastStatus],
        [EventType],
        [MatchData],
        [LastRunTime],
        [Parameters],
        [DataSettings],
    [Version]
    )
values
    (@id, @OwnerID, @Report_OID, @ReportZone, @Locale, @DeliveryExtension, @InactiveFlags, @ExtensionSettings, @ModifiedByID, @ModifiedDate,
     @Description, @LastStatus, @EventType, @MatchData, NULL, @Parameters, @DataSettings, @Version)
GO
GRANT EXECUTE ON [dbo].[CreateSubscription] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateTask]
@ScheduleID uniqueidentifier,
@Name nvarchar (260),
@StartDate datetime,
@Flags int,
@NextRunTime datetime = NULL,
@LastRunTime datetime = NULL,
@EndDate datetime = NULL,
@RecurrenceType int = NULL,
@MinutesInterval int = NULL,
@DaysInterval int = NULL,
@WeeksInterval int = NULL,
@DaysOfWeek int = NULL,
@DaysOfMonth int = NULL,
@Month int = NULL,
@MonthlyWeek int = NULL,
@State int = NULL,
@LastRunStatus nvarchar (260) = NULL,
@ScheduledRunTimeout int = NULL,
@UserSid varbinary (85) = null,
@UserName nvarchar(260),
@AuthType int,
@EventType nvarchar (260),
@EventData nvarchar (260),
@Type int ,
@Path nvarchar (425) = NULL
AS

DECLARE @UserID uniqueidentifier

EXEC GetUserID @UserSid, @UserName, @AuthType, @UserID OUTPUT

-- Create a task with the given data. 
Insert into Schedule 
    (
        [ScheduleID], 
        [Name],
        [StartDate],
        [Flags],
        [NextRunTime],
        [LastRunTime], 
        [EndDate], 
        [RecurrenceType], 
        [MinutesInterval],
        [DaysInterval],
        [WeeksInterval],
        [DaysOfWeek], 
        [DaysOfMonth], 
        [Month], 
        [MonthlyWeek],
        [State], 
        [LastRunStatus],
        [ScheduledRunTimeout],
        [CreatedById],
        [EventType],
        [EventData],
        [Type],
        [Path]
    )
values
    (@ScheduleID, @Name, @StartDate, @Flags, @NextRunTime, @LastRunTime, @EndDate, @RecurrenceType, @MinutesInterval,
     @DaysInterval, @WeeksInterval, @DaysOfWeek, @DaysOfMonth, @Month, @MonthlyWeek, @State, @LastRunStatus,
     @ScheduledRunTimeout, @UserID, @EventType, @EventData, @Type, @Path)
GO
GRANT EXECUTE ON [dbo].[CreateTask] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateTimeBasedSubscriptionNotification]
@SubscriptionID uniqueidentifier,
@LastRunTime datetime,
@LastStatus nvarchar(260)
as

insert into [Notifications] 
    (
    [NotificationID], 
    [SubscriptionID],
    [ActivationID],
    [ReportID],
    [ReportZone],
    [SnapShotDate],
    [ExtensionSettings],
    [Locale],
    [Parameters],
    [NotificationEntered],
    [SubscriptionLastRunTime],
    [DeliveryExtension],
    [SubscriptionOwnerID],
    [IsDataDriven],
    [Version]
    ) 
select 
    NewID(),
    S.[SubscriptionID],
    NULL,
    S.[Report_OID],
    S.[ReportZone],
    NULL,
    S.[ExtensionSettings],
    S.[Locale],
    S.[Parameters],
    GETUTCDATE(), 
    @LastRunTime,
    S.[DeliveryExtension],
    S.[OwnerID],
    0,
    S.[Version]
from 
    [Subscriptions] S 
where 
    S.[SubscriptionID] = @SubscriptionID and InactiveFlags = 0 and
    S.[DataSettings] is null


-- Create any data driven subscription by creating a data driven event
insert into [Event]
    (
    [EventID],
    [EventType],
    [EventData],
    [TimeEntered]
    )
select
    NewID(),
    'DataDrivenSubscription',
    S.SubscriptionID,
    GETUTCDATE()
from
    [Subscriptions] S 
where 
    S.[SubscriptionID] = @SubscriptionID and InactiveFlags = 0 and
    S.[DataSettings] is not null

update [Subscriptions]
set
    [LastRunTime] = @LastRunTime,
    [LastStatus] = @LastStatus
where 
    [SubscriptionID] = @SubscriptionID and InactiveFlags = 0
GO
GRANT EXECUTE ON [dbo].[CreateTimeBasedSubscriptionNotification] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CreateTimeBasedSubscriptionSchedule]
@SubscriptionID as uniqueidentifier,
@ScheduleID uniqueidentifier,
@Schedule_Name nvarchar (260),
@ItemPath nvarchar (425),
@Action int,
@StartDate datetime,
@Flags int,
@NextRunTime datetime = NULL,
@LastRunTime datetime = NULL,
@EndDate datetime = NULL,
@RecurrenceType int = NULL,
@MinutesInterval int = NULL,
@DaysInterval int = NULL,
@WeeksInterval int = NULL,
@DaysOfWeek int = NULL,
@DaysOfMonth int = NULL,
@Month int = NULL,
@MonthlyWeek int = NULL,
@State int = NULL,
@LastRunStatus nvarchar (260) = NULL,
@ScheduledRunTimeout int = NULL,
@UserSid varbinary (85) = NULL,
@UserName nvarchar(260),
@AuthType int,
@EventType nvarchar (260),
@EventData nvarchar (260),
@Path nvarchar (425) = NULL
AS

EXEC CreateTask @ScheduleID, @Schedule_Name, @StartDate, @Flags, @NextRunTime, @LastRunTime, 
        @EndDate, @RecurrenceType, @MinutesInterval, @DaysInterval, @WeeksInterval, @DaysOfWeek, 
        @DaysOfMonth, @Month, @MonthlyWeek, @State, @LastRunStatus, 
        @ScheduledRunTimeout, @UserSid, @UserName, @AuthType, @EventType, @EventData, 1 /*scoped type*/, @Path

if @@ERROR = 0
begin
	-- add a row to the reportSchedule table
	declare @ItemID uniqueidentifier
	select @ItemID = [ItemID] from [Catalog] with (HOLDLOCK) where [Catalog].[Path] = @ItemPath and ([Catalog].[Type] = 2 or [Catalog].[Type] = 4 or [Catalog].[Type] = 8)
	EXEC AddReportSchedule @ScheduleID, @ItemID, @SubscriptionID, @Action
end
GO
GRANT EXECUTE ON [dbo].[CreateTimeBasedSubscriptionSchedule] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DecreaseTransientSnapshotRefcount]
@SnapshotDataID as uniqueidentifier,
@IsPermanentSnapshot as bit
AS
SET NOCOUNT OFF
if @IsPermanentSnapshot = 1
BEGIN
   UPDATE SnapshotData
   SET TransientRefcount = TransientRefcount - 1
   WHERE SnapshotDataID = @SnapshotDataID
END ELSE BEGIN
   UPDATE [ReportServerTempDB].dbo.SnapshotData
   SET TransientRefcount = TransientRefcount - 1
   WHERE SnapshotDataID = @SnapshotDataID
END
GO
GRANT EXECUTE ON [dbo].[DecreaseTransientSnapshotRefcount] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeepCopySegment]
	@ChunkId		uniqueidentifier,
	@IsPermanent	bit,
	@SegmentId		uniqueidentifier,
	@NewSegmentId	uniqueidentifier out
as
begin
	select @NewSegmentId = newid() ;
	if (@IsPermanent = 1) begin
		insert Segment(SegmentId, Content)
		select @NewSegmentId, seg.Content
		from Segment seg
		where seg.SegmentId = @SegmentId ;
				
		update ChunkSegmentMapping
		set SegmentId = @NewSegmentId
		where ChunkId = @ChunkId and SegmentId = @SegmentId ;
	end
	else begin
		insert [ReportServerTempDB].dbo.Segment(SegmentId, Content)
		select @NewSegmentId, seg.Content
		from [ReportServerTempDB].dbo.Segment seg
		where seg.SegmentId = @SegmentId ;
		
		update [ReportServerTempDB].dbo.ChunkSegmentMapping
		set SegmentId = @NewSegmentId
		where ChunkId = @ChunkId and SegmentId = @SegmentId ; 
	end
end
GO
GRANT EXECUTE ON [dbo].[DeepCopySegment] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteActiveSubscription]
@ActiveID uniqueidentifier
AS

delete from ActiveSubscriptions where ActiveID = @ActiveID
GO
GRANT EXECUTE ON [dbo].[DeleteActiveSubscription] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- delete all snapshots for a report
CREATE PROCEDURE [dbo].[DeleteAllHistoryForReport]
@ReportID uniqueidentifier
AS
SET NOCOUNT OFF
DELETE
FROM History
WHERE HistoryID in
   (SELECT HistoryID
    FROM History JOIN Catalog on ItemID = ReportID
    WHERE ReportID = @ReportID
   )
GO
GRANT EXECUTE ON [dbo].[DeleteAllHistoryForReport] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteAllModelItemPolicies]
@Path as nvarchar(450)
AS 

DELETE Policies
FROM
   Policies AS P
   INNER JOIN ModelItemPolicy AS MIP ON P.PolicyID = MIP.PolicyID
   INNER JOIN Catalog AS C ON MIP.CatalogItemID = C.ItemID
WHERE
   C.[Path] = @Path
GO
GRANT EXECUTE ON [dbo].[DeleteAllModelItemPolicies] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteBatchRecords]
@BatchID uniqueidentifier
AS
SET NOCOUNT OFF
DELETE
FROM [Batch]
WHERE BatchID = @BatchID
GO
GRANT EXECUTE ON [dbo].[DeleteBatchRecords] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteDataSets]
@ItemID [uniqueidentifier]
AS
DELETE
FROM [DataSets]
WHERE [ItemID] = @ItemID
DELETE
FROM [ReportServerTempDB].dbo.TempDataSets
WHERE [ItemID] = @ItemID
GO
GRANT EXECUTE ON [dbo].[DeleteDataSets] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteDataSources]
@ItemID [uniqueidentifier]
AS

DELETE
FROM [DataSource]
WHERE [ItemID] = @ItemID or [SubscriptionID] = @ItemID 
DELETE
FROM [ReportServerTempDB].dbo.TempDataSources
WHERE [ItemID] = @ItemID
GO
GRANT EXECUTE ON [dbo].[DeleteDataSources] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteDrillthroughReports]
@ModelID uniqueidentifier,
@ModelItemID nvarchar(425)
AS
 DELETE ModelDrill WHERE ModelID = @ModelID and ModelItemID = @ModelItemID
GO
GRANT EXECUTE ON [dbo].[DeleteDrillthroughReports] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteEncryptedContent]
AS

-- Remove the encryption keys
delete from keys where client >= 0

-- Remove the encrypted content
update datasource
set CredentialRetrieval = 1, -- CredentialRetrieval.Prompt
    ConnectionString = null,
    OriginalConnectionString = null,
    UserName = null,
    Password = null
GO
GRANT EXECUTE ON [dbo].[DeleteEncryptedContent] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteEvent] 
@ID uniqueidentifier
AS
delete from [Event] where [EventID] = @ID
GO
GRANT EXECUTE ON [dbo].[DeleteEvent] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteExpiredPersistedStreams]
AS
SET NOCOUNT OFF
SET DEADLOCK_PRIORITY LOW
declare @now as datetime = GETDATE();
delete top (10) p
from [ReportServerTempDB].dbo.PersistedStream p with(readpast)
where p.RefCount = 0 AND p.ExpirationDate < @now;
GO
GRANT EXECUTE ON [dbo].[DeleteExpiredPersistedStreams] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- delete all snapshots for all reports that inherit system History policy
CREATE PROCEDURE [dbo].[DeleteHistoriesWithNoPolicy]
AS
SET NOCOUNT OFF
DELETE
FROM History
WHERE HistoryID in
   (SELECT HistoryID
    FROM History JOIN Catalog on ItemID = ReportID
    WHERE SnapshotLimit is null
   )
GO
GRANT EXECUTE ON [dbo].[DeleteHistoriesWithNoPolicy] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- delete one historical snapshot
CREATE PROCEDURE [dbo].[DeleteHistoryRecord]
@ReportID uniqueidentifier,
@SnapshotDate DateTime
AS
SET NOCOUNT OFF
DELETE
FROM History
WHERE ReportID = @ReportID AND SnapshotDate = @SnapshotDate
GO
GRANT EXECUTE ON [dbo].[DeleteHistoryRecord] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteKey]
@InstallationID uniqueidentifier
AS

if (@InstallationID = '00000000-0000-0000-0000-000000000000')
RAISERROR('Cannot delete reserved key', 16, 1)

-- Remove the encryption keys
delete from keys where InstallationID = @InstallationID and Client = 1
GO
GRANT EXECUTE ON [dbo].[DeleteKey] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteModelItemPolicy]
@CatalogItemID as uniqueidentifier,
@ModelItemID as nvarchar(425)
AS 
SET NOCOUNT OFF
DECLARE @PolicyID uniqueidentifier
SELECT @PolicyID = (SELECT PolicyID FROM ModelItemPolicy WHERE CatalogItemID = @CatalogItemID AND ModelItemID = @ModelItemID)
DELETE Policies FROM Policies WHERE Policies.PolicyID = @PolicyID
GO
GRANT EXECUTE ON [dbo].[DeleteModelItemPolicy] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteModelPerspectives]
@ModelID as uniqueidentifier
AS

DELETE
FROM [ModelPerspective]
WHERE [ModelID] = @ModelID
GO
GRANT EXECUTE ON [dbo].[DeleteModelPerspectives] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteNotification] 
@ID uniqueidentifier
AS
delete from [Notifications] where [NotificationID] = @ID
GO
GRANT EXECUTE ON [dbo].[DeleteNotification] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteObject]
@Path nvarchar (425),
@Prefix nvarchar (850),
@EditSessionID varchar(32) = NULL,
@OwnerSid as varbinary(85) = NULL, 
@OwnerName as nvarchar(260) = NULL,
@AuthType int
AS

SET NOCOUNT OFF

IF(@EditSessionID is null)
BEGIN
-- Remove reference for intermediate formats
UPDATE SnapshotData
SET PermanentRefcount = PermanentRefcount - 1,
    -- to fix VSTS 384486 keep shared dataset compiled definition for 14 days
    ExpirationDate = case when R.Type = 8 then DATEADD(d, 14, GETDATE()) ELSE ExpirationDate END,
    TransientRefcount = TransientRefcount + case when R.Type = 8 then 1 ELSE 0 END
FROM
   Catalog AS R WITH (XLOCK)
   INNER JOIN [SnapshotData] AS SD ON R.Intermediate = SD.SnapshotDataID
WHERE
   (R.Path = @Path OR R.Path LIKE @Prefix ESCAPE '*')

-- Remove reference for execution snapshots
UPDATE SnapshotData
SET PermanentRefcount = PermanentRefcount - 1
FROM
   Catalog AS R WITH (XLOCK)
   INNER JOIN [SnapshotData] AS SD ON R.SnapshotDataID = SD.SnapshotDataID
WHERE
   (R.Path = @Path OR R.Path LIKE @Prefix ESCAPE '*')

-- Remove history for deleted reports and linked report
DELETE History
FROM
   [Catalog] AS R
   INNER JOIN [History] AS S ON R.ItemID = S.ReportID
WHERE
   (R.Path = @Path OR R.Path LIKE @Prefix ESCAPE '*')
   
-- Remove model drill reports
DELETE ModelDrill
FROM
   [Catalog] AS C
   INNER JOIN [ModelDrill] AS M ON C.ItemID = M.ReportID
WHERE
   (C.Path = @Path OR C.Path LIKE @Prefix ESCAPE '*')
      

-- Adjust data sources
UPDATE [DataSource]
   SET
      [Flags] = [Flags] & 0x7FFFFFFD, -- broken link
      [Link] = NULL
FROM
   [Catalog] AS C
   INNER JOIN [DataSource] AS DS ON C.[ItemID] = DS.[Link]
WHERE
   (C.Path = @Path OR C.Path LIKE @Prefix ESCAPE '*')

-- Clean all data sources
DELETE [DataSource]
FROM
    [Catalog] AS R
    INNER JOIN [DataSource] AS DS ON R.[ItemID] = DS.[ItemID]
WHERE    
    (R.Path = @Path OR R.Path LIKE @Prefix ESCAPE '*')

        -- Adjust temp editsession data sources
        UPDATE [ReportServerTempDB].dbo.TempDataSources
           SET
              Flags = Flags & 0x7FFFFFFD, -- broken link
              Link = NULL
        FROM
           [Catalog] AS C
           INNER JOIN [ReportServerTempDB].dbo.TempDataSources AS DS ON C.[ItemID] = DS.Link
        WHERE
           (C.Path = @Path OR C.Path LIKE @Prefix ESCAPE '*')

-- Adjust shared datasets
UPDATE [DataSets]
   SET
      [LinkID] = NULL
FROM
   [Catalog] AS C
   INNER JOIN [DataSets] AS DS ON C.[ItemID] = DS.[LinkID]
WHERE
   (C.Path = @Path OR C.Path LIKE @Prefix ESCAPE '*')

-- Adjust temp shared datasets
UPDATE [ReportServerTempDB].dbo.TempDataSets
   SET
      [LinkID] = NULL
FROM
   [Catalog] AS C
   INNER JOIN [ReportServerTempDB].dbo.TempDataSets AS DS ON C.[ItemID] = DS.[LinkID]
WHERE
   (C.Path = @Path OR C.Path LIKE @Prefix ESCAPE '*')
   
-- Clean shared datasets
DELETE [DataSets]
FROM
    [Catalog] AS R
    INNER JOIN [DataSets] AS DS ON R.[ItemID] = DS.[ItemID]
WHERE    
    (R.Path = @Path OR R.Path LIKE @Prefix ESCAPE '*')


-- Update linked reports
UPDATE LR
   SET
      LR.LinkSourceID = NULL
FROM
   [Catalog] AS R INNER JOIN [Catalog] AS LR ON R.ItemID = LR.LinkSourceID
WHERE
   (R.Path = @Path OR R.Path LIKE @Prefix ESCAPE '*')
   AND
   (LR.Path NOT LIKE @Prefix ESCAPE '*')

-- Remove references for cache entries
UPDATE SN
SET
   PermanentRefcount = PermanentRefcount - 1
FROM
   [ReportServerTempDB].dbo.SnapshotData AS SN
   INNER JOIN [ReportServerTempDB].dbo.ExecutionCache AS EC on SN.SnapshotDataID = EC.SnapshotDataID
   INNER JOIN Catalog AS C ON EC.ReportID = C.ItemID
WHERE
   (Path = @Path OR Path LIKE @Prefix ESCAPE '*')
   
-- Clean cache entries for items to be deleted   
DELETE EC
FROM
   [ReportServerTempDB].dbo.ExecutionCache AS EC
   INNER JOIN Catalog AS C ON EC.ReportID = C.ItemID
WHERE
   (Path = @Path OR Path LIKE @Prefix ESCAPE '*')

-- Finally delete items
DELETE
FROM
   [Catalog]
WHERE
   (Path = @Path OR Path LIKE @Prefix ESCAPE '*')

EXEC CleanOrphanedPolicies
END
ELSE
BEGIN
        DECLARE @OwnerID uniqueidentifier
        EXEC GetUserID @OwnerSid, @OwnerName, @AuthType, @OwnerID OUTPUT
        
        -- Remove reference for intermediate formats
        UPDATE [ReportServerTempDB].dbo.SnapshotData
        SET PermanentRefcount = PermanentRefcount - 1
        FROM
           [ReportServerTempDB].dbo.TempCatalog AS R WITH (XLOCK)
           INNER JOIN [ReportServerTempDB].dbo.SnapshotData AS SD ON R.Intermediate = SD.SnapshotDataID
        WHERE
           R.ContextPath = @Path
           AND R.EditSessionID = @EditSessionID
           AND R.OwnerID = @OwnerID

        -- Clean all data sources
        DELETE [ReportServerTempDB].dbo.TempDataSources
        FROM
            [ReportServerTempDB].dbo.TempCatalog AS R
            INNER JOIN [ReportServerTempDB].dbo.TempDataSources AS DS ON R.TempCatalogID = DS.ItemID
        WHERE    
            R.ContextPath = @Path
            AND R.EditSessionID = @EditSessionID
            AND R.OwnerID = @OwnerID

		-- Clean shared data sets
        DELETE [ReportServerTempDB].dbo.TempDataSets
        FROM
            [ReportServerTempDB].dbo.TempCatalog AS R
            INNER JOIN [ReportServerTempDB].dbo.TempDataSets AS DS ON R.TempCatalogID = DS.ItemID
        WHERE    
            R.ContextPath = @Path
            AND R.EditSessionID = @EditSessionID
            AND R.OwnerID = @OwnerID
            
        -- Remove references for cache entries
        UPDATE SN
        SET
           PermanentRefcount = PermanentRefcount - 1
        FROM
           [ReportServerTempDB].dbo.SnapshotData AS SN
           INNER JOIN [ReportServerTempDB].dbo.ExecutionCache AS EC on SN.SnapshotDataID = EC.SnapshotDataID
           INNER JOIN [ReportServerTempDB].dbo.TempCatalog AS C ON EC.ReportID = C.TempCatalogID
        WHERE
           ContextPath = @Path
           AND C.EditSessionID = @EditSessionID
           AND C.OwnerID = @OwnerID
           
        -- Clean cache entries for items to be deleted   
        DELETE EC
        FROM
           [ReportServerTempDB].dbo.ExecutionCache AS EC
           INNER JOIN [ReportServerTempDB].dbo.TempCatalog AS C ON EC.ReportID = C.TempCatalogID
        WHERE
            ContextPath = @Path
            AND C.EditSessionID = @EditSessionID
            AND C.OwnerID = @OwnerID

        -- Finally delete items
        DELETE
        FROM
           [ReportServerTempDB].dbo.TempCatalog
        WHERE
            ContextPath = @Path
            AND EditSessionID = @EditSessionID
            AND OwnerID = @OwnerID
END
GO
GRANT EXECUTE ON [dbo].[DeleteObject] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteOneChunk]
@SnapshotID uniqueidentifier,
@IsPermanentSnapshot bit,
@ChunkName nvarchar(260),
@ChunkType int
AS
SET NOCOUNT OFF
-- for segmented chunks we just need to 
-- remove the mapping, the cleanup thread
-- will pick up the rest of the pieces
IF @IsPermanentSnapshot != 0 BEGIN

DELETE ChunkData
WHERE   
    SnapshotDataID = @SnapshotID AND
    ChunkName = @ChunkName AND
    ChunkType = @ChunkType
    
DELETE	SegmentedChunk
WHERE 	
	SnapshotDataId = @SnapshotID AND
	ChunkName = @ChunkName AND
	ChunkType = @ChunkType
    
END ELSE BEGIN

DELETE [ReportServerTempDB].dbo.ChunkData
WHERE   
    SnapshotDataID = @SnapshotID AND
    ChunkName = @ChunkName AND
    ChunkType = @ChunkType

DELETE	[ReportServerTempDB].dbo.SegmentedChunk
WHERE 	
	SnapshotDataId = @SnapshotID AND
	ChunkName = @ChunkName AND
	ChunkType = @ChunkType

END
GO
GRANT EXECUTE ON [dbo].[DeleteOneChunk] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeletePersistedStream]
@SessionID varchar(32),
@Index int
AS

delete from [ReportServerTempDB].dbo.PersistedStream where SessionID = @SessionID and [Index] = @Index
GO
GRANT EXECUTE ON [dbo].[DeletePersistedStream] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeletePersistedStreams]
@SessionID varchar(32)
AS
SET NOCOUNT OFF
delete top (10) p
from [ReportServerTempDB].dbo.PersistedStream p
where p.SessionID = @SessionID;
GO
GRANT EXECUTE ON [dbo].[DeletePersistedStreams] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeletePolicy]
@ItemName as nvarchar(425)
AS 
SET NOCOUNT OFF
DECLARE @OldPolicyID uniqueidentifier
SELECT @OldPolicyID = (SELECT PolicyID FROM Catalog WHERE Catalog.Path = @ItemName)
UPDATE Catalog SET PolicyID = 
(SELECT Parent.PolicyID FROM Catalog Parent, Catalog WHERE Parent.ItemID = Catalog.ParentID AND Catalog.Path = @ItemName),
PolicyRoot = 0
WHERE Catalog.PolicyID = @OldPolicyID
DELETE Policies FROM Policies WHERE Policies.PolicyID = @OldPolicyID
GO
GRANT EXECUTE ON [dbo].[DeletePolicy] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteReportSchedule]
@ScheduleID uniqueidentifier,
@ReportID uniqueidentifier,
@SubscriptionID uniqueidentifier = NULL,
@ReportAction int
AS

IF @SubscriptionID is NULL
BEGIN
delete from ReportSchedule where ScheduleID = @ScheduleID and ReportID = @ReportID and ReportAction = @ReportAction
END
ELSE
BEGIN
delete from ReportSchedule where ScheduleID = @ScheduleID and ReportID = @ReportID and ReportAction = @ReportAction and SubscriptionID = @SubscriptionID
END
GO
GRANT EXECUTE ON [dbo].[DeleteReportSchedule] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Delete all policies associated with this role
CREATE PROCEDURE [dbo].[DeleteRole]
@RoleName nvarchar(260)
AS
SET NOCOUNT OFF
-- if you call this, you must delete/reconstruct all policies associated with this role
DELETE FROM Roles WHERE RoleName = @RoleName
GO
GRANT EXECUTE ON [dbo].[DeleteRole] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteSnapshotAndChunks]
@SnapshotID uniqueidentifier,
@IsPermanentSnapshot bit
AS

-- Delete from Snapshot, ChunkData and SegmentedChunk table.
-- Shared segments are not deleted.
-- TODO: currently this is being called from a bunch of places that handles exceptions.
-- We should try to delete the segments in some of all of those cases as well.
IF @IsPermanentSnapshot != 0 BEGIN

    DELETE ChunkData
    WHERE ChunkData.SnapshotDataID = @SnapshotID
    
    DELETE SegmentedChunk
    WHERE SegmentedChunk.SnapshotDataId = @SnapshotID
    
    DELETE SnapshotData
    WHERE SnapshotData.SnapshotDataID = @SnapshotID
   
END ELSE BEGIN

    DELETE [ReportServerTempDB].dbo.ChunkData
    WHERE SnapshotDataID = @SnapshotID
       
    DELETE [ReportServerTempDB].dbo.SegmentedChunk
    WHERE SnapshotDataId = @SnapshotID

    DELETE [ReportServerTempDB].dbo.SnapshotData
    WHERE SnapshotDataID = @SnapshotID

END
GO
GRANT EXECUTE ON [dbo].[DeleteSnapshotAndChunks] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RemoveSubscriptionFromBeingDeleted] 
@SubscriptionID uniqueidentifier
AS
delete from [SubscriptionsBeingDeleted] where SubscriptionID = @SubscriptionID
GO
GRANT EXECUTE ON [dbo].[RemoveSubscriptionFromBeingDeleted] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteSubscription] 
@SubscriptionID uniqueidentifier
AS
    -- Delete the subscription
    delete from [Subscriptions] where [SubscriptionID] = @SubscriptionID
    -- Delete it from the SubscriptionsBeingDeleted
    EXEC RemoveSubscriptionFromBeingDeleted @SubscriptionID
GO
GRANT EXECUTE ON [dbo].[DeleteSubscription] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteTask]
@ScheduleID uniqueidentifier
AS
SET NOCOUNT OFF
-- Delete the task with the given task id
DELETE FROM Schedule
WHERE [ScheduleID] = @ScheduleID
GO
GRANT EXECUTE ON [dbo].[DeleteTask] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteTimeBasedSubscriptionSchedule]
@SubscriptionID as uniqueidentifier
as

delete ReportSchedule from ReportSchedule RS inner join Subscriptions S on S.[SubscriptionID] = RS.[SubscriptionID]
where
    S.[SubscriptionID] = @SubscriptionID
GO
GRANT EXECUTE ON [dbo].[DeleteTimeBasedSubscriptionSchedule] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeliveryRemovedInactivateSubscription] 
@DeliveryExtension nvarchar(260),
@Status nvarchar(260)
AS
update 
    Subscriptions
set
    [DeliveryExtension] = '',
    [InactiveFlags] = [InactiveFlags] | 1, -- Delivery Provider Removed Flag == 1
    [LastStatus] = @Status
where
    [DeliveryExtension] = @DeliveryExtension
GO
GRANT EXECUTE ON [dbo].[DeliveryRemovedInactivateSubscription] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ExpireExecutionLogEntries]
AS
SET NOCOUNT OFF
-- -1 means no expiration
if exists (select * from ConfigurationInfo where [Name] = 'ExecutionLogDaysKept' and CAST(CAST(Value as nvarchar) as integer) = -1)
begin
return
end

delete from ExecutionLogStorage
where DateDiff(day, TimeStart, getdate()) >= (select CAST(CAST(Value as nvarchar) as integer) from ConfigurationInfo where [Name] = 'ExecutionLogDaysKept')
GO
GRANT EXECUTE ON [dbo].[ExpireExecutionLogEntries] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FindItemsByDataSet]
@ItemID uniqueidentifier,
@AuthType int
AS
SELECT 
    C.Type,
    C.PolicyID,
    SD.NtSecDescPrimary,
    C.Name, 
    C.Path, 
    C.ItemID,
    DATALENGTH( C.Content ) AS [Size],
    C.Description,
    C.CreationDate, 
    C.ModifiedDate,
    SUSER_SNAME(CU.Sid), 
    CU.UserName,
    SUSER_SNAME(MU.Sid),
    MU.UserName,
    C.MimeType,
    C.ExecutionTime,
    C.Hidden,
    C.SubType,
    C.ComponentID
FROM
   Catalog AS C 
   INNER JOIN Users AS CU ON C.CreatedByID = CU.UserID
   INNER JOIN Users AS MU ON C.ModifiedByID = MU.UserID
   LEFT OUTER JOIN SecData AS SD ON C.PolicyID = SD.PolicyID AND SD.AuthType = @AuthType
   INNER JOIN DataSets AS DS ON C.ItemID = DS.ItemID
WHERE
   DS.LinkID = @ItemID
GO
GRANT EXECUTE ON [dbo].[FindItemsByDataSet] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FindItemsByDataSource]
@ItemID uniqueidentifier,
@AuthType int
AS
SELECT 
    C.Type,
    C.PolicyID,
    SD.NtSecDescPrimary,
    C.Name, 
    C.Path, 
    C.ItemID,
    DATALENGTH( C.Content ) AS [Size],
    C.Description,
    C.CreationDate, 
    C.ModifiedDate,
    SUSER_SNAME(CU.Sid), 
    CU.UserName,
    SUSER_SNAME(MU.Sid),
    MU.UserName,
    C.MimeType,
    C.ExecutionTime,
    C.Hidden,
    C.SubType,
    C.ComponentID
FROM
   Catalog AS C 
   INNER JOIN Users AS CU ON C.CreatedByID = CU.UserID
   INNER JOIN Users AS MU ON C.ModifiedByID = MU.UserID
   LEFT OUTER JOIN SecData AS SD ON C.PolicyID = SD.PolicyID AND SD.AuthType = @AuthType
   INNER JOIN DataSource AS DS ON C.ItemID = DS.ItemID
WHERE
   DS.Link = @ItemID
GO
GRANT EXECUTE ON [dbo].[FindItemsByDataSource] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FindItemsByDataSourceRecursive]
@ItemID uniqueidentifier,
@AuthType int
AS
SELECT 
    C.Type,
    C.PolicyID,
    SD.NtSecDescPrimary,
    C.Name, 
    C.Path, 
    C.ItemID,
    DATALENGTH( C.Content ) AS [Size],
    C.Description,
    C.CreationDate, 
    C.ModifiedDate,
    SUSER_SNAME(CU.Sid), 
    CU.UserName,
    SUSER_SNAME(MU.Sid),
    MU.UserName,
    C.MimeType,
    C.ExecutionTime,
    C.Hidden,
    C.SubType,
    C.ComponentID
FROM
   Catalog AS C 
   INNER JOIN Users AS CU ON C.CreatedByID = CU.UserID
   INNER JOIN Users AS MU ON C.ModifiedByID = MU.UserID
   LEFT OUTER JOIN SecData AS SD ON C.PolicyID = SD.PolicyID AND SD.AuthType = @AuthType
   INNER JOIN 
   (
		SELECT ItemID FROM DataSource 
		WHERE Link = @ItemID 
		UNION 
		SELECT ItemID FROM DataSets
		WHERE LinkID IN
		(
			SELECT D1.ItemID
			FROM DataSource D1
			WHERE D1.Link = @ItemID
		)
	)
   AS DS ON C.ItemID = DS.ItemID
GO
GRANT EXECUTE ON [dbo].[FindItemsByDataSourceRecursive] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FindObjectsByLink]
@Link uniqueidentifier,
@AuthType int
AS
SELECT 
    C.Type, 
    C.PolicyID,
    SD.NtSecDescPrimary,
    C.Name, 
    C.Path, 
    C.ItemID, 
    DATALENGTH( C.Content ) AS [Size], 
    C.Description,
    C.CreationDate, 
    C.ModifiedDate, 
    SUSER_SNAME(CU.Sid),
    CU.UserName,
    SUSER_SNAME(MU.Sid),
    MU.UserName,
    C.MimeType,
    C.ExecutionTime,
    C.Hidden,
    C.SubType,
    C.ComponentID
FROM
   Catalog AS C
   INNER JOIN Users AS CU ON C.CreatedByID = CU.UserID
   INNER JOIN Users AS MU ON C.ModifiedByID = MU.UserID
   LEFT OUTER JOIN SecData AS SD ON C.PolicyID = SD.PolicyID AND SD.AuthType = @AuthType
WHERE C.LinkSourceID = @Link
GO
GRANT EXECUTE ON [dbo].[FindObjectsByLink] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FindObjectsNonRecursive]
@Path nvarchar (425),
@AuthType int
AS
SELECT 
    C.Type,
    C.PolicyID,
    SD.NtSecDescPrimary,
    C.Name, 
    C.Path, 
    C.ItemID,
    DATALENGTH( C.Content ) AS [Size],
    C.Description,
    C.CreationDate, 
    C.ModifiedDate,
    SUSER_SNAME(CU.Sid), 
    CU.[UserName],
    SUSER_SNAME(MU.Sid),
    MU.[UserName],
    C.MimeType,
    C.ExecutionTime,
    C.Hidden, 
    C.SubType,
    C.ComponentID
FROM
   Catalog AS C 
   INNER JOIN Catalog AS P ON C.ParentID = P.ItemID
   INNER JOIN Users AS CU ON C.CreatedByID = CU.UserID
   INNER JOIN Users AS MU ON C.ModifiedByID = MU.UserID
   LEFT OUTER JOIN SecData SD ON C.PolicyID = SD.PolicyID AND SD.AuthType = @AuthType
WHERE P.Path = @Path
GO
GRANT EXECUTE ON [dbo].[FindObjectsNonRecursive] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FindObjectsRecursive]
@Prefix nvarchar (850),
@AuthType int
AS
SELECT 
    C.Type,
    C.PolicyID,
    SD.NtSecDescPrimary,
    C.Name,
    C.Path,
    C.ItemID,
    DATALENGTH( C.Content ) AS [Size],
    C.Description,
    C.CreationDate,
    C.ModifiedDate,
    SUSER_SNAME(CU.Sid),
    CU.UserName,
    SUSER_SNAME(MU.Sid),
    MU.UserName,
    C.MimeType,
    C.ExecutionTime,
    C.Hidden,
    C.SubType,
    C.ComponentID
from
   Catalog AS C
   INNER JOIN Users AS CU ON C.CreatedByID = CU.UserID
   INNER JOIN Users AS MU ON C.ModifiedByID = MU.UserID
   LEFT OUTER JOIN SecData AS SD ON C.PolicyID = SD.PolicyID AND SD.AuthType = @AuthType
WHERE C.Path LIKE @Prefix ESCAPE '*'
GO
GRANT EXECUTE ON [dbo].[FindObjectsRecursive] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FindParents]
@Path nvarchar (425),
@AuthType int
AS
WITH Parents (ItemID, ParentID)
AS
(
    SELECT ItemID, ParentID
    FROM Catalog WHERE Path = @Path
    UNION ALL
    SELECT C.ItemID, C.ParentID
    FROM Catalog C
    JOIN Parents P ON (C.ItemID = P.ParentID)
)
SELECT 
    C.Type,
    C.PolicyID,
    SD.NtSecDescPrimary,
    C.Name, 
    C.Path, 
    C.ItemID,
    DATALENGTH( C.Content ) AS [Size],
    C.Description,
    C.CreationDate, 
    C.ModifiedDate,
    SUSER_SNAME(CU.Sid), 
    CU.[UserName],
    SUSER_SNAME(MU.Sid),
    MU.[UserName],
    C.MimeType,
    C.ExecutionTime,
    C.Hidden,
    C.SubType,
    C.ComponentID
FROM
   Catalog AS C
   INNER JOIN Parents P ON (C.ItemID = P.ItemID)
   INNER JOIN Users AS CU ON C.CreatedByID = CU.UserID
   INNER JOIN Users AS MU ON C.ModifiedByID = MU.UserID
   LEFT OUTER JOIN SecData SD ON C.PolicyID = SD.PolicyID AND SD.AuthType = @AuthType
WHERE C.Path <> @Path -- Exclude the target item from the output list
ORDER BY DATALENGTH(C.Path) DESC
GO
GRANT EXECUTE ON [dbo].[FindParents] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FlushCacheByID]
@ItemID as uniqueidentifier
AS
BEGIN

DECLARE @AffectedSnapshots table (SnapshotDataID uniqueidentifier)

DELETE FROM [ReportServerTempDB].dbo.ExecutionCache
OUTPUT DELETED.SnapshotDataID into @AffectedSnapshots
WHERE ReportID = @ItemID

UPDATE [ReportServerTempDB].dbo.SnapshotData
SET PermanentRefcount = PermanentRefcount - 1
WHERE SnapshotDataID IN (SELECT SnapshotDataID FROM @AffectedSnapshots)

END
GO
GRANT EXECUTE ON [dbo].[FlushCacheByID] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FlushReportFromCache]
@Path as nvarchar(425)
AS

SET DEADLOCK_PRIORITY LOW

-- VSTS #139360: SQL Deadlock in GetReportForexecution stored procedure
-- Use temporary table to keep the same order of accessing the ExecutionCache
-- and SnapshotData tables as GetReportForExecution does, that is first
-- delete from the ExecutionCache, then update the SnapshotData 
CREATE TABLE #tempSnapshot (SnapshotDataID uniqueidentifier)
INSERT INTO #tempSnapshot SELECT SN.SnapshotDataID 
FROM
   [ReportServerTempDB].dbo.SnapshotData AS SN WITH (UPDLOCK)
   INNER JOIN [ReportServerTempDB].dbo.ExecutionCache AS EC WITH (UPDLOCK) ON SN.SnapshotDataID = EC.SnapshotDataID
   INNER JOIN Catalog AS C ON EC.ReportID = C.ItemID
WHERE C.Path = @Path

DELETE EC
FROM
   [ReportServerTempDB].dbo.ExecutionCache AS EC
   INNER JOIN #tempSnapshot ON #tempSnapshot.SnapshotDataID = EC.SnapshotDataID

UPDATE SN
   SET SN.PermanentRefcount = SN.PermanentRefcount - 1
FROM
   [ReportServerTempDB].dbo.SnapshotData AS SN
   INNER JOIN #tempSnapshot ON #tempSnapshot.SnapshotDataID = SN.SnapshotDataID
GO
GRANT EXECUTE ON [dbo].[FlushReportFromCache] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Get_sqlagent_job_status]
  -- Individual job parameters
  @job_id                     UNIQUEIDENTIFIER = NULL,  -- If provided will only return info about this job
                                                        --   Note: Only @job_id or @job_name needs to be provided    
  @job_name                   sysname          = NULL,  -- If provided will only return info about this job 
  @owner_login_name           sysname          = NULL   -- If provided will only return jobs for this owner
AS
BEGIN
  DECLARE @retval           INT
  DECLARE @job_owner_sid    VARBINARY(85)
  DECLARE @is_sysadmin      INT

  SET NOCOUNT ON

  -- Remove any leading/trailing spaces from parameters (except @owner_login_name)
  SELECT @job_name         = LTRIM(RTRIM(@job_name)) 

  -- Turn [nullable] empty string parameters into NULLs
  IF (@job_name         = N'') SELECT @job_name = NULL


  -- Verify the job if supplied. This also checks if the caller has rights to view the job 
  IF ((@job_id IS NOT NULL) OR (@job_name IS NOT NULL))
  BEGIN
    EXECUTE @retval = msdb..sp_verify_job_identifiers '@job_name',
                                                      '@job_id',
                                                       @job_name OUTPUT,
                                                       @job_id   OUTPUT
    IF (@retval <> 0)
      RETURN(1) -- Failure

  END
  
  -- If the login name isn't given, set it to the job owner or the current caller 
  IF(@owner_login_name IS NULL)
  BEGIN
        
    SET @owner_login_name = (SELECT SUSER_SNAME(sj.owner_sid) FROM msdb.dbo.sysjobs sj where sj.job_id = @job_id)

    SET @is_sysadmin = ISNULL(IS_SRVROLEMEMBER(N'sysadmin', @owner_login_name), 0)

  END
  ELSE
  BEGIN
    -- Check owner
    IF (SUSER_SID(@owner_login_name) IS NULL)
    BEGIN
      RAISERROR(14262, -1, -1, '@owner_login_name', @owner_login_name)
      RETURN(1) -- Failure
    END

    --only allow sysadmin types to specify the owner
    IF ((ISNULL(IS_SRVROLEMEMBER(N'sysadmin'), 0) <> 1) AND
        (ISNULL(IS_MEMBER(N'SQLAgentAdminRole'), 0) = 1) AND
        (SUSER_SNAME() <> @owner_login_name))
    BEGIN
      --TODO: RAISERROR(14525, -1, -1)
      RETURN(1) -- Failure
    END

    SET @is_sysadmin = 0
  END


  IF (@job_id IS NOT NULL)
  BEGIN
    -- Individual job...
    EXECUTE @retval =  master.dbo.xp_sqlagent_enum_jobs @is_sysadmin, @owner_login_name, @job_id
    IF (@retval <> 0)
      RETURN(1) -- Failure

  END
  ELSE
  BEGIN
    -- Set of jobs...
    EXECUTE @retval =  master.dbo.xp_sqlagent_enum_jobs @is_sysadmin, @owner_login_name
    IF (@retval <> 0)
      RETURN(1) -- Failure

  END

  RETURN(0) -- Success
END
GO
GRANT EXECUTE ON [dbo].[Get_sqlagent_job_status] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetAllConfigurationInfo]
AS
SELECT [Name], [Value]
FROM [ConfigurationInfo]
GO
GRANT EXECUTE ON [dbo].[GetAllConfigurationInfo] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[ExtendedCatalog]
    (@OwnerID as uniqueidentifier, 
     @Path as nvarchar(425), 
     @EditSessionID as varchar(32))
RETURNS TABLE 
AS RETURN 
(
SELECT TOP 1 * FROM (
SELECT 
    C.[ItemID], 
    C.[PolicyID],
    C.[Path],
    C.[Name],
    C.[Description], 
    C.[Property],
    C.[Type], 
    C.[ExecutionFlag], 
    C.[Parameter], 
    C.[Intermediate], 
    CONVERT(BIT, 1) AS IntermediateIsPermanent, 
    C.[SnapshotDataID], 
    C.[LinkSourceID], 
    C.[ExecutionTime], 
    C.[SnapshotLimit],
    C.[CreatedByID], 
    C.[ModifiedByID],
    C.[CreationDate],
    C.[ModifiedDate], 
    C.[MimeType],
    C.[Content],
    C.[Hidden],
    NULL AS [EditSessionID], 
    C.[SubType],
    C.[ComponentID]
FROM [Catalog] C
WHERE C.Path = @Path AND @EditSessionID IS NULL
UNION ALL
SELECT 
    TC.[TempCatalogID], 
    NULL as [PolicyID],
    TC.[ContextPath],
    TC.[Name],
    TC.[Description], 
    TC.[Property],
    2 as [Type], 
    1 as [ExecutionFlag],
    TC.[Parameter], 
    TC.[Intermediate], 
    TC.[IntermediateIsPermanent],
    NULL as [SnapshotDataID], 
    NULL as [LinkSourceID], 
    NULL as [ExecutionTime], 
    0 as [SnapshotLimit],
    TC.[OwnerID] as [CreatedByID],
    TC.[OwnerID] as [ModifiedByID],
    TC.[CreationTime] as [CreationDate],
    TC.[CreationTime] as [ModifiedDate],
    NULL as [MimeType],
    TC.Content,
    convert(bit, 0) as [Hidden],
    TC.[EditSessionID] AS [EditSessionID], 
    NULL as [SubType],
    NULL as [ComponentID]
FROM [ReportServerTempDB].dbo.TempCatalog TC
WHERE	TC.OwnerID = @OwnerID AND
        TC.ContextPath = @Path AND
        TC.EditSessionID = @EditSessionID
) A )
GO
GRANT REFERENCES ON [dbo].[ExtendedCatalog] TO [RSExecRole]
GO
GRANT SELECT ON [dbo].[ExtendedCatalog] TO [RSExecRole]
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
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetAnnouncedKey]
@InstallationID uniqueidentifier
AS

select PublicKey, MachineName, InstanceName
from Keys
where InstallationID = @InstallationID and Client = 1
GO
GRANT EXECUTE ON [dbo].[GetAnnouncedKey] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetAReportsReportAction]
@ReportID uniqueidentifier,
@ReportAction int
AS
select 
        RS.[ReportAction],
        RS.[ScheduleID],
        RS.[ReportID],
        RS.[SubscriptionID],
        C.[Path],
        C.[Type]
from
    [ReportSchedule] RS Inner join [Catalog] C on RS.[ReportID] = C.[ItemID]
where
    C.ItemID = @ReportID and RS.[ReportAction] = @ReportAction
GO
GRANT EXECUTE ON [dbo].[GetAReportsReportAction] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetBatchRecords]
@BatchID uniqueidentifier
AS
SELECT [Action], Item, Parent, Param, BoolParam, Content, Properties
FROM [Batch]
WHERE BatchID = @BatchID
ORDER BY AddedOn
GO
GRANT EXECUTE ON [dbo].[GetBatchRecords] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetCacheOptions]
@Path as nvarchar(425)
AS
    SELECT ExpirationFlags, CacheExpiration, 
    S.[ScheduleID],
    S.[Name],
    S.[StartDate],
    S.[Flags],
    S.[NextRunTime],
    S.[LastRunTime],
    S.[EndDate],
    S.[RecurrenceType],
    S.[MinutesInterval],
    S.[DaysInterval],
    S.[WeeksInterval],
    S.[DaysOfWeek],
    S.[DaysOfMonth],
    S.[Month],
    S.[MonthlyWeek],
    S.[State], 
    S.[LastRunStatus],
    S.[ScheduledRunTimeout],
    S.[EventType],
    S.[EventData],
    S.[Type],
    S.[Path]
    FROM CachePolicy INNER JOIN Catalog ON Catalog.ItemID = CachePolicy.ReportID
    LEFT outer join reportschedule rs on catalog.itemid = rs.reportid and rs.reportaction = 3
    LEFT OUTER JOIN [Schedule] S ON S.ScheduleID = rs.ScheduleID
    LEFT OUTER JOIN [Users] Owner on Owner.UserID = S.[CreatedById]
    WHERE Catalog.Path = @Path
GO
GRANT EXECUTE ON [dbo].[GetCacheOptions] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetCacheSchedule] 
@ReportID uniqueidentifier
AS
SELECT
    S.[ScheduleID],
    S.[Name],
    S.[StartDate], 
    S.[Flags],
    S.[NextRunTime],
    S.[LastRunTime], 
    S.[EndDate], 
    S.[RecurrenceType],
    S.[MinutesInterval],
    S.[DaysInterval],
    S.[WeeksInterval],
    S.[DaysOfWeek], 
    S.[DaysOfMonth], 
    S.[Month], 
    S.[MonthlyWeek], 
    S.[State], 
    S.[LastRunStatus],
    S.[ScheduledRunTimeout],
    S.[EventType],
    S.[EventData],
    S.[Type],
    S.[Path],
    SUSER_SNAME(Owner.[Sid]),
    Owner.[UserName],
    Owner.[AuthType],
    RS.ReportAction
FROM
    Schedule S with (XLOCK) inner join ReportSchedule RS on S.ScheduleID = RS.ScheduleID
    inner join [Users] Owner on S.[CreatedById] = Owner.[UserID]
WHERE
    (RS.ReportAction = 1 or RS.ReportAction = 3) and -- 1 == UpdateCache, 3 == Invalidate cache
    RS.[ReportID] = @ReportID
GO
GRANT EXECUTE ON [dbo].[GetCacheSchedule] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetChildrenBeforeDelete]
@Prefix nvarchar (850),
@AuthType int
AS
SELECT C.PolicyID, C.Type, SD.NtSecDescPrimary
FROM
   Catalog AS C LEFT OUTER JOIN SecData AS SD ON C.PolicyID = SD.PolicyID AND SD.AuthType = @AuthType
WHERE
   C.Path LIKE @Prefix ESCAPE '*'  -- return children only, not item itself
GO
GRANT EXECUTE ON [dbo].[GetChildrenBeforeDelete] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetChunkInformation]
@SnapshotDataID uniqueidentifier,
@IsPermanentSnapshot bit,
@ChunkName nvarchar(260),
@ChunkType int
AS
IF @IsPermanentSnapshot != 0 BEGIN

    SELECT
       MimeType
    FROM
       ChunkData AS CH WITH (HOLDLOCK, ROWLOCK)
    WHERE
       SnapshotDataID = @SnapshotDataID AND
       ChunkName = @ChunkName AND
       ChunkType = @ChunkType      
       
END ELSE BEGIN

    SELECT
       MimeType
    FROM
       [ReportServerTempDB].dbo.ChunkData AS CH WITH (HOLDLOCK, ROWLOCK)
    WHERE
       SnapshotDataID = @SnapshotDataID AND
       ChunkName = @ChunkName AND
       ChunkType = @ChunkType      

END
GO
GRANT EXECUTE ON [dbo].[GetChunkInformation] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetChunkPointerAndLength]
@SnapshotDataID uniqueidentifier,
@IsPermanentSnapshot bit,
@ChunkName nvarchar(260),
@ChunkType int
AS
IF @IsPermanentSnapshot != 0 BEGIN

    SELECT
       TEXTPTR(Content),
       DATALENGTH(Content),
       MimeType,
       ChunkFlags,
       Version
    FROM
       ChunkData AS CH 
    WHERE
       SnapshotDataID = @SnapshotDataID AND
       ChunkName = @ChunkName AND
       ChunkType = @ChunkType      
       
END ELSE BEGIN

    SELECT
       TEXTPTR(Content),
       DATALENGTH(Content),
       MimeType,
       ChunkFlags,
       Version
    FROM
       [ReportServerTempDB].dbo.ChunkData AS CH 
    WHERE
       SnapshotDataID = @SnapshotDataID AND
       ChunkName = @ChunkName AND
       ChunkType = @ChunkType      

END
GO
GRANT EXECUTE ON [dbo].[GetChunkPointerAndLength] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- used to create snapshots
CREATE PROCEDURE [dbo].[GetCompiledDefinition]
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

    SELECT
       MainItem.Type,
       MainItem.Intermediate,
       MainItem.LinkSourceID,
       MainItem.Property,
       MainItem.Description,
       SecData.NtSecDescPrimary,
       MainItem.ItemID,         
       MainItem.ExecutionFlag,  
       LinkTarget.Intermediate,
       LinkTarget.Property,
       LinkTarget.Description,
       MainItem.[SnapshotDataID], 
       MainItem.IntermediateIsPermanent
    FROM ExtendedCatalog(@OwnerID, @Path, @EditSessionID) MainItem
    LEFT OUTER JOIN SecData ON MainItem.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType
    LEFT OUTER JOIN Catalog LinkTarget with (INDEX(PK_Catalog)) on MainItem.LinkSourceID = LinkTarget.ItemID
END
GO
GRANT EXECUTE ON [dbo].[GetCompiledDefinition] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDataSetForExecution]
@ItemID uniqueidentifier,
@ParamsHash int
AS
DECLARE @now AS datetime
SET @now = GETDATE()
SELECT
    SN.SnapshotDataID,
    SN.EffectiveParams,
    SN.QueryParams,
    (SELECT CachePolicy.ExpirationFlags FROM CachePolicy WHERE CachePolicy.ReportID = Cat.ItemID),
    Cat.Property
FROM
    Catalog AS Cat
    LEFT OUTER JOIN
    (
        SELECT 
        TOP 1
            ReportID, 
            SN.SnapshotDataID, 
            EffectiveParams, 
            QueryParams
        FROM [ReportServerTempDB].dbo.ExecutionCache AS EC 
        INNER JOIN [ReportServerTempDB].dbo.SnapshotData AS SN ON EC.SnapshotDataID = SN.SnapshotDataID AND EC.ParamsHash = SN.ParamsHash
        WHERE
            AbsoluteExpiration > @now 
            AND SN.ParamsHash = @ParamsHash
            AND EC.ReportID = @ItemID
        ORDER BY SN.CreatedDate DESC
    ) as SN ON Cat.ItemID = SN.ReportID
WHERE
    Cat.ItemID = @ItemID
GO
GRANT EXECUTE ON [dbo].[GetDataSetForExecution] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDataSets]
@ItemID [uniqueidentifier],
@AuthType int
AS
BEGIN

SELECT 
	DS.ID, 
	DS.LinkID,
	DS.[Name],
	C.Path,
	SD.NtSecDescPrimary,
	C.Intermediate,
	C.[Parameter]
FROM
   ExtendedDataSets AS DS 
   LEFT OUTER JOIN Catalog C ON DS.[LinkID] = C.[ItemID]
   LEFT OUTER JOIN [SecData] AS SD ON C.[PolicyID] = SD.[PolicyID] AND SD.AuthType = @AuthType
WHERE
   DS.[ItemID] = @ItemID
END
GO
GRANT EXECUTE ON [dbo].[GetDataSets] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDataSourceForUpgrade]
@CurrentVersion int
AS
SELECT 
    [DSID]
FROM 
    [DataSource]
WHERE
    [Version] != @CurrentVersion
GO
GRANT EXECUTE ON [dbo].[GetDataSourceForUpgrade] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDatasourceInfoForReencryption]
@DSID as uniqueidentifier
AS

SELECT
    [ConnectionString],
    [OriginalConnectionString],
    [UserName],
    [Password],
    [CredentialRetrieval],
    [Version]
FROM [dbo].[DataSource]
WHERE [DSID] = @DSID
GO
GRANT EXECUTE ON [dbo].[GetDatasourceInfoForReencryption] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDataSources]
@ItemID [uniqueidentifier],
@AuthType int
AS
BEGIN

SELECT -- select data sources and their links (if they exist)
    DS.[DSID],      -- 0
    DS.[ItemID],    -- 1
    DS.[Name],      -- 2
    DS.[Extension], -- 3
    DS.[Link],      -- 4
    DS.[CredentialRetrieval], -- 5
    DS.[Prompt],    -- 6
    DS.[ConnectionString], -- 7
    DS.[OriginalConnectionString], -- 8
    DS.[UserName],  -- 9
    DS.[Password],  -- 10
    DS.[Flags],     -- 11
    DSL.[DSID],     -- 12
    DSL.[ItemID],   -- 13
    DSL.[Name],     -- 14
    DSL.[Extension], -- 15
    DSL.[Link],     -- 16
    DSL.[CredentialRetrieval], -- 17
    DSL.[Prompt],   -- 18
    DSL.[ConnectionString], -- 19
    DSL.[UserName], -- 20
    DSL.[Password], -- 21
    DSL.[Flags],	-- 22
    C.Path,         -- 23
    SD.NtSecDescPrimary, -- 24
    DS.[OriginalConnectStringExpressionBased], -- 25
    DS.[Version], -- 26
    DSL.[Version], -- 27
    (SELECT 1 WHERE EXISTS (SELECT * from [ModelItemPolicy] AS MIP WHERE C.[ItemID] = MIP.[CatalogItemID])) -- 28
FROM
   ExtendedDataSources AS DS 
   LEFT OUTER JOIN 
    (DataSource AS DSL
     INNER JOIN Catalog C ON DSL.[ItemID] = C.[ItemID]
       LEFT OUTER JOIN [SecData] AS SD ON C.[PolicyID] = SD.[PolicyID] AND SD.AuthType = @AuthType)
   ON DS.[Link] = DSL.[ItemID]
WHERE
   DS.[ItemID] = @ItemID or DS.[SubscriptionID] = @ItemID
END
GO
GRANT EXECUTE ON [dbo].[GetDataSources] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDBVersion]    
    @DBVersion nvarchar(32) OUTPUT
    AS
    SET @DBVersion = (select top(1) [ServerVersion] from [dbo].[ServerUpgradeHistory] ORDER BY [UpgradeID] DESC)
GO
GRANT EXECUTE ON [dbo].[GetDBVersion] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDrillthroughReport]
@ModelPath nvarchar(425),
@ModelItemID nvarchar(425),
@Type tinyint
AS
 SELECT 
 CatRep.Path
 FROM ModelDrill 
 INNER JOIN Catalog CatMod ON ModelDrill.ModelID = CatMod.ItemID
 INNER JOIN Catalog CatRep ON ModelDrill.ReportID = CatRep.ItemID
 WHERE CatMod.Path = @ModelPath
 AND ModelItemID = @ModelItemID 
 AND ModelDrill.[Type] = @Type
GO
GRANT EXECUTE ON [dbo].[GetDrillthroughReport] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDrillthroughReports]
@ModelID uniqueidentifier,
@ModelItemID nvarchar(425)
AS
 SELECT 
 ModelDrill.Type, 
 Catalog.Path
 FROM ModelDrill INNER JOIN Catalog ON ModelDrill.ReportID = Catalog.ItemID
 WHERE ModelID = @ModelID
 AND ModelItemID = @ModelItemID
GO
GRANT EXECUTE ON [dbo].[GetDrillthroughReports] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetExecutionOptions]
@Path nvarchar(425)
AS
    SELECT ExecutionFlag, 
    S.[ScheduleID],
    S.[Name],
    S.[StartDate],
    S.[Flags],
    S.[NextRunTime],
    S.[LastRunTime],
    S.[EndDate],
    S.[RecurrenceType],
    S.[MinutesInterval],
    S.[DaysInterval],
    S.[WeeksInterval],
    S.[DaysOfWeek],
    S.[DaysOfMonth],
    S.[Month],
    S.[MonthlyWeek],
    S.[State], 
    S.[LastRunStatus],
    S.[ScheduledRunTimeout],
    S.[EventType],
    S.[EventData],
    S.[Type],
    S.[Path]
    FROM Catalog 
    LEFT OUTER JOIN ReportSchedule ON Catalog.ItemID = ReportSchedule.ReportID AND ReportSchedule.ReportAction = 1
    LEFT OUTER JOIN [Schedule] S ON S.ScheduleID = ReportSchedule.ScheduleID
    LEFT OUTER JOIN [Users] Owner on Owner.UserID = S.[CreatedById]
    WHERE Catalog.Path = @Path
GO
GRANT EXECUTE ON [dbo].[GetExecutionOptions] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFirstPortionPersistedStream]
@SessionID varchar(32)
AS

SELECT 
    TOP 1
    TEXTPTR(P.Content), 
    DATALENGTH(P.Content), 
    P.[Index],
    P.[Name], 
    P.MimeType, 
    P.Extension, 
    P.Encoding,
    P.Error
FROM 
    [ReportServerTempDB].dbo.PersistedStream P WITH (XLOCK)
WHERE 
    P.SessionID = @SessionID
GO
GRANT EXECUTE ON [dbo].[GetFirstPortionPersistedStream] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetIDPairsByLink]
@Link uniqueidentifier
AS
SELECT LinkSourceID, ItemID
FROM Catalog
WHERE LinkSourceID = @Link
GO
GRANT EXECUTE ON [dbo].[GetIDPairsByLink] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetModelDefinition]
@CatalogItemID as uniqueidentifier
AS

SELECT
    C.[Content]
FROM
    [Catalog] AS C
WHERE
    C.[ItemID] = @CatalogItemID
GO
GRANT EXECUTE ON [dbo].[GetModelDefinition] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetModelItemInfo]
@Path nvarchar (425),
@UseUpdateLock bit
AS
	IF(@UseUpdateLock = 0) 
	BEGIN
		SELECT
			C.[Intermediate]
		FROM
			[Catalog] AS C
		WHERE
			C.[Path] = @Path
	END
	ELSE BEGIN
		-- acquire update lock, this means that the operation is being performed in a 
		-- different transaction context which will be committed before trying to 
		-- perform the actual load, to prevent deadlock in the case where we have to 
		-- republish, this new transaction will acquire and hold upgrade locks
		SELECT
			C.[Intermediate]
		FROM
			[Catalog] AS C WITH(UPDLOCK ROWLOCK)
		WHERE
			C.[Path] = @Path
	END

	SELECT
		MIP.[ModelItemID], SD.[NtSecDescPrimary], SD.[XmlDescription]
	FROM
		[Catalog] AS C
		INNER JOIN [ModelItemPolicy] AS MIP ON C.[ItemID] = MIP.[CatalogItemID]
		LEFT OUTER JOIN [SecData] AS SD ON MIP.[PolicyID] = SD.[PolicyID]
	WHERE
		C.[Path] = @Path
GO
GRANT EXECUTE ON [dbo].[GetModelItemInfo] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetModelPerspectives]
@Path nvarchar (425),
@AuthType int
AS

SELECT
    C.[Type],
    SD.[NtSecDescPrimary],
    C.[Description]
FROM
    [Catalog] as C
    LEFT OUTER JOIN [SecData] AS SD ON C.[PolicyID] = SD.[PolicyID] AND SD.[AuthType] = @AuthType
WHERE
    [Path] = @Path

SELECT
    P.[PerspectiveID],
    P.[PerspectiveName],
    P.[PerspectiveDescription]
FROM
    [Catalog] as C
    INNER JOIN [ModelPerspective] as P ON C.[ItemID] = P.[ModelID]
WHERE
    [Path] = @Path
GO
GRANT EXECUTE ON [dbo].[GetModelPerspectives] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetModelsAndPerspectives]
@AuthType int,
@SitePathPrefix nvarchar(520) = '%'
AS

SELECT
    C.[PolicyID],
    SD.[NtSecDescPrimary],
    C.[ItemID],
    C.[Path],
    C.[Description],
    P.[PerspectiveID],
    P.[PerspectiveName],
    P.[PerspectiveDescription]
FROM
    [Catalog] as C
    LEFT OUTER JOIN [ModelPerspective] as P ON C.[ItemID] = P.[ModelID]
    LEFT OUTER JOIN [SecData] AS SD ON C.[PolicyID] = SD.[PolicyID] AND SD.[AuthType] = @AuthType
WHERE
    C.Path like @SitePathPrefix AND C.[Type] = 6 -- Model
ORDER BY
    C.[Path]
GO
GRANT EXECUTE ON [dbo].[GetModelsAndPerspectives] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetMyRunningJobs]
@ComputerName as nvarchar(32),
@JobType as smallint
AS
SELECT JobID, StartDate, ComputerName, RequestName, RequestPath, SUSER_SNAME(Users.[Sid]), Users.[UserName], Description, 
    Timeout, JobAction, JobType, JobStatus, Users.[AuthType]
FROM RunningJobs INNER JOIN Users 
ON RunningJobs.UserID = Users.UserID
WHERE ComputerName = @ComputerName
AND JobType = @JobType
GO
GRANT EXECUTE ON [dbo].[GetMyRunningJobs] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetNameById]
@ItemID uniqueidentifier
AS
SELECT Path
FROM Catalog
WHERE ItemID = @ItemID
GO
GRANT EXECUTE ON [dbo].[GetNameById] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetNextPortionPersistedStream]
@DataPointer binary(16),
@DataIndex int,
@Length int
AS

READTEXT [ReportServerTempDB].dbo.PersistedStream.Content @DataPointer @DataIndex @Length
GO
GRANT EXECUTE ON [dbo].[GetNextPortionPersistedStream] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetObjectContent]
@Path nvarchar (425),
@AuthType int
AS
SELECT Type, Content, LinkSourceID, MimeType, SecData.NtSecDescPrimary, ItemID
FROM Catalog
LEFT OUTER JOIN SecData ON Catalog.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType
WHERE Path = @Path
GO
GRANT EXECUTE ON [dbo].[GetObjectContent] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetOneConfigurationInfo]
@Name nvarchar (260)
AS
SELECT [Value]
FROM [ConfigurationInfo]
WHERE [Name] = @Name
GO
GRANT EXECUTE ON [dbo].[GetOneConfigurationInfo] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetParameters]
@Path nvarchar (425),
@AuthType int
AS
SELECT
   Type,
   [Parameter],
   ItemID,
   SecData.NtSecDescPrimary,
   [LinkSourceID],
   [ExecutionFlag]
FROM Catalog 
LEFT OUTER JOIN SecData ON Catalog.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType
WHERE Path = @Path
GO
GRANT EXECUTE ON [dbo].[GetParameters] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPoliciesForRole]
@RoleName as nvarchar(260),
@AuthType as int
AS 
SELECT
    Policies.PolicyID,
    SecData.XmlDescription, 
    Policies.PolicyFlag,
    Catalog.Type,
    Catalog.Path,
    ModelItemPolicy.CatalogItemID,
    ModelItemPolicy.ModelItemID,
    RelatedRoles.RoleID,
    RelatedRoles.RoleName,
    RelatedRoles.TaskMask,
    RelatedRoles.RoleFlags
FROM
    Roles
    INNER JOIN PolicyUserRole ON Roles.RoleID = PolicyUserRole.RoleID
    INNER JOIN Policies ON PolicyUserRole.PolicyID = Policies.PolicyID
    INNER JOIN PolicyUserRole AS RelatedPolicyUserRole ON Policies.PolicyID = RelatedPolicyUserRole.PolicyID
    INNER JOIN Roles AS RelatedRoles ON RelatedPolicyUserRole.RoleID = RelatedRoles.RoleID
    LEFT OUTER JOIN SecData ON Policies.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType
    LEFT OUTER JOIN Catalog ON Policies.PolicyID = Catalog.PolicyID AND Catalog.PolicyRoot = 1
    LEFT OUTER JOIN ModelItemPolicy ON Policies.PolicyID = ModelItemPolicy.PolicyID
WHERE
    Roles.RoleName = @RoleName
ORDER BY
    Policies.PolicyID
GO
GRANT EXECUTE ON [dbo].[GetPoliciesForRole] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPolicy]
@ItemName as nvarchar(425),
@AuthType int
AS 
SELECT SecData.XmlDescription, Catalog.PolicyRoot , SecData.NtSecDescPrimary, Catalog.Type
FROM Catalog 
INNER JOIN Policies ON Catalog.PolicyID = Policies.PolicyID 
LEFT OUTER JOIN SecData ON Policies.PolicyID = SecData.PolicyID AND AuthType = @AuthType
WHERE Catalog.Path = @ItemName
AND PolicyFlag = 0
GO
GRANT EXECUTE ON [dbo].[GetPolicy] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPolicyRoots]
AS
SELECT 
    [Path],
    [Type]
FROM 
    [Catalog] 
WHERE 
    [PolicyRoot] = 1
GO
GRANT EXECUTE ON [dbo].[GetPolicyRoots] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- looks up a principal, if not there looks up regular users and turns them into principals
-- if not, it creates a principal
CREATE PROCEDURE [dbo].[GetPrincipalID]
@UserSid varbinary(85) = NULL,
@UserName nvarchar(260),
@AuthType int,
@UserID uniqueidentifier OUTPUT
AS
-- windows auth
IF @AuthType = 1
BEGIN
    -- is this a principal?
    SELECT @UserID = (SELECT UserID FROM Users WHERE Sid = @UserSid AND UserType = 1 AND AuthType = @AuthType)
END
ELSE
BEGIN
    -- is this a principal?
    SELECT @UserID = (SELECT UserID FROM Users WHERE UserName = @UserName AND UserType = 1 AND AuthType = @AuthType)
END
IF @UserID IS NULL
   BEGIN
        IF @AuthType = 1 -- Windows
        BEGIN
            -- Is this a regular user
            SELECT @UserID = (SELECT UserID FROM Users WHERE Sid = @UserSid AND UserType = 0 AND AuthType = @AuthType)
        END
        ELSE
        BEGIN
            -- Is this a regular user
            SELECT @UserID = (SELECT UserID FROM Users WHERE UserName = @UserName AND UserType = 0 AND AuthType = @AuthType)
        END
      -- No, create a new principal
      IF @UserID IS NULL
         BEGIN
            SET @UserID = newid()
            INSERT INTO Users
            (UserID, Sid,   UserType, AuthType, UserName)
            VALUES 
            (@UserID, @UserSid, 1,    @AuthType, @UserName)
         END 
      ELSE
         BEGIN
             UPDATE Users SET UserType = 1 WHERE UserID = @UserID
         END
    END
GO
GRANT EXECUTE ON [dbo].[GetPrincipalID] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- gets either the intermediate format or snapshot from cache
CREATE PROCEDURE [dbo].[GetReportForExecution]
@Path nvarchar (425),
@EditSessionID varchar(32) = NULL,
@ParamsHash int,
@OwnerSid as varbinary(85) = NULL, 
@OwnerName as nvarchar(260) = NULL,
@AuthType int
AS
DECLARE @OwnerID uniqueidentifier
if(@EditSessionID is not null)
BEGIN
    EXEC GetUserID @OwnerSid, @OwnerName, @AuthType, @OwnerID OUTPUT
END

DECLARE @now AS datetime
SET @now = GETDATE()

IF ( NOT EXISTS (
    SELECT TOP 1 1
        FROM
            ExtendedCatalog(@OwnerID, @Path, @EditSessionID) AS C
            INNER JOIN [ReportServerTempDB].dbo.ExecutionCache AS EC ON C.ItemID = EC.ReportID
        WHERE
            EC.AbsoluteExpiration > @now AND
            EC.ParamsHash = @ParamsHash
   ) ) 
BEGIN   -- no cache
    SELECT
        Cat.Type,
        Cat.LinkSourceID,
        Cat2.Path,
        Cat.Property,
        Cat.Description,
        SecData.NtSecDescPrimary,
        Cat.ItemID,
        CAST (0 AS BIT), -- not found,
        Cat.Intermediate,
        Cat.ExecutionFlag,
        SD.SnapshotDataID,
        SD.DependsOnUser,
        Cat.ExecutionTime,
        (SELECT Schedule.NextRunTime
         FROM
             Schedule WITH (XLOCK)
             INNER JOIN ReportSchedule ON Schedule.ScheduleID = ReportSchedule.ScheduleID 
         WHERE ReportSchedule.ReportID = Cat.ItemID AND ReportSchedule.ReportAction = 1), -- update snapshot
        (SELECT Schedule.ScheduleID
         FROM
             Schedule
             INNER JOIN ReportSchedule ON Schedule.ScheduleID = ReportSchedule.ScheduleID 
         WHERE ReportSchedule.ReportID = Cat.ItemID AND ReportSchedule.ReportAction = 1), -- update snapshot
        (SELECT CachePolicy.ExpirationFlags FROM CachePolicy WHERE CachePolicy.ReportID = Cat.ItemID),
        Cat2.Intermediate,
        SD.ProcessingFlags,
        Cat.IntermediateIsPermanent
    FROM
        ExtendedCatalog(@OwnerID, @Path, @EditSessionID) AS Cat
        LEFT OUTER JOIN SecData ON Cat.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType
        LEFT OUTER JOIN Catalog AS Cat2 on Cat.LinkSourceID = Cat2.ItemID
        LEFT OUTER JOIN SnapshotData AS SD ON Cat.SnapshotDataID = SD.SnapshotDataID
END
ELSE
BEGIN   -- use cache
    SELECT TOP 1
        Cat.Type,
        Cat.LinkSourceID,
        Cat2.Path,
        Cat.Property,
        Cat.Description,
        SecData.NtSecDescPrimary,
        Cat.ItemID,
        CAST (1 AS BIT), -- found,
        SN.SnapshotDataID,
        SN.DependsOnUser,
        SN.EffectiveParams,  -- offset 10
        SN.CreatedDate,
        EC.AbsoluteExpiration,
        (SELECT CachePolicy.ExpirationFlags FROM CachePolicy WHERE CachePolicy.ReportID = Cat.ItemID),
        (SELECT Schedule.ScheduleID
         FROM
             Schedule WITH (XLOCK)
             INNER JOIN ReportSchedule ON Schedule.ScheduleID = ReportSchedule.ScheduleID 
             WHERE ReportSchedule.ReportID = Cat.ItemID AND ReportSchedule.ReportAction = 1), -- update snapshot
        SN.QueryParams,  -- offset 15
        SN.ProcessingFlags, 
        Cat.IntermediateIsPermanent,
        Cat.Intermediate
    FROM
        ExtendedCatalog(@OwnerID, @Path, @EditSessionID) AS Cat
        INNER JOIN [ReportServerTempDB].dbo.ExecutionCache AS EC ON Cat.ItemID = EC.ReportID
        INNER JOIN [ReportServerTempDB].dbo.SnapshotData AS SN ON EC.SnapshotDataID = SN.SnapshotDataID AND EC.ParamsHash = SN.ParamsHash
        LEFT OUTER JOIN SecData ON Cat.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType
        LEFT OUTER JOIN Catalog AS Cat2 on Cat.LinkSourceID = Cat2.ItemID
    WHERE
        AbsoluteExpiration > @now 
        AND SN.ParamsHash = @ParamsHash
    ORDER BY SN.CreatedDate DESC
END
GO
GRANT EXECUTE ON [dbo].[GetReportForExecution] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- gets either the intermediate format or snapshot from cache
CREATE PROCEDURE [dbo].[GetReportParametersForExecution]
@Path nvarchar (425),
@HistoryID DateTime = NULL,
@AuthType int, 
@OwnerSid as varbinary(85) = NULL, 
@OwnerName as nvarchar(260) = NULL,
@EditSessionID varchar(32) = NULL
AS
BEGIN

DECLARE @OwnerID uniqueidentifier
if(@EditSessionID is not null)
BEGIN
    EXEC GetUserID @OwnerSid, @OwnerName, @AuthType, @OwnerID OUTPUT
END

SELECT
   C.[ItemID],
   C.[Type],
   C.[ExecutionFlag],
   [SecData].[NtSecDescPrimary],
   C.[Parameter],
   C.[Intermediate],
   C.[SnapshotDataID],
   [History].[SnapshotDataID],
   L.[Intermediate],
   C.[LinkSourceID],
   C.[ExecutionTime], 
   C.IntermediateIsPermanent
FROM
   ExtendedCatalog(@OwnerID, @Path, @EditSessionID) AS C
   LEFT OUTER JOIN [SecData] ON C.[PolicyID] = [SecData].[PolicyID] AND [SecData].AuthType = @AuthType
   LEFT OUTER JOIN [History] ON ( C.[ItemID] = [History].[ReportID] AND [History].[SnapshotDate] = @HistoryID )
   LEFT OUTER JOIN [Catalog] AS L WITH (INDEX(PK_Catalog)) ON C.[LinkSourceID] = L.[ItemID]
end
GO
GRANT EXECUTE ON [dbo].[GetReportParametersForExecution] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetRoles]
@RoleFlags as tinyint = NULL
AS
SELECT
    RoleName,
    Description,
    TaskMask
FROM
    Roles
WHERE
    (@RoleFlags is NULL) OR
    (RoleFlags = @RoleFlags)
GO
GRANT EXECUTE ON [dbo].[GetRoles] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSchedulesReports] 
@ID uniqueidentifier
AS

select 
    C.Path
from
    ReportSchedule RS inner join Catalog C on (C.ItemID = RS.ReportID)
where
    ScheduleID = @ID
GO
GRANT EXECUTE ON [dbo].[GetSchedulesReports] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetServerParameters]
@ServerParametersID nvarchar(32)
AS
DECLARE @now as DATETIME
SET @now = GETDATE()
SELECT Child.Path, Child.ParametersValues, Parent.ParametersValues
FROM [dbo].[ServerParametersInstance] Child
LEFT OUTER JOIN [dbo].[ServerParametersInstance] Parent
ON Child.ParentID = Parent.ServerParametersID
WHERE Child.ServerParametersID = @ServerParametersID 
AND Child.Expiration > @now
GO
GRANT EXECUTE ON [dbo].[GetServerParameters] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Get record from session data, update session and snapshot
CREATE PROCEDURE [dbo].[GetSessionData]
@SessionID as varchar(32),
@OwnerSid as varbinary(85) = NULL,
@OwnerName as nvarchar(260),
@AuthType as int,
@SnapshotTimeoutMinutes as int
AS

DECLARE @ExpirationDate as datetime
DECLARE @now as datetime
SET @now = GETDATE()

DECLARE @DBSessionID varchar(32)
DECLARE @SnapshotDataID uniqueidentifier
DECLARE @IsPermanentSnapshot bit
DECLARE @LockVersion int

EXEC CheckSessionLock @SessionID, @LockVersion OUTPUT

DECLARE @ActualOwnerID uniqueidentifier 
DECLARE @OwnerID uniqueidentifier
EXEC GetUserID @OwnerSid, @OwnerName, @AuthType, @OwnerID OUTPUT

SELECT
    @DBSessionID = SE.SessionID,
    @SnapshotDataID = SE.SnapshotDataID,
    @IsPermanentSnapshot = SE.IsPermanentSnapshot,
    @ActualOwnerID = SE.OwnerID,
    @ExpirationDate = SE.Expiration
    
FROM
    [ReportServerTempDB].dbo.SessionData AS SE WITH (XLOCK)
WHERE
    SE.SessionID = @SessionID
    
IF (@DBSessionID IS NULL)
RAISERROR ('Invalid or Expired Session: %s', 16, 1, @SessionID)

IF (@ActualOwnerID <> @OwnerID)
RAISERROR ('Session %s does not belong to %s', 16, 1, @SessionID, @OwnerName)

IF (@ExpirationDate <= @now)
RAISERROR ('Expired Session: %s', 16, 1, @SessionID)

IF @IsPermanentSnapshot != 0 BEGIN -- If session has snapshot and it is permanent

SELECT
    SN.SnapshotDataID,
    SE.ShowHideInfo,
    SE.DataSourceInfo,
    SN.Description,
    SE.EffectiveParams,
    SN.CreatedDate,
    SE.IsPermanentSnapshot,
    SE.CreationTime,
    SE.HasInteractivity,
    SE.Timeout,
    SE.SnapshotExpirationDate,
    SE.ReportPath,
    SE.HistoryDate,
    SE.CompiledDefinition,
    SN.PageCount,
    SN.HasDocMap,
    SE.Expiration,
    SN.EffectiveParams,
    SE.PageHeight,
    SE.PageWidth,
    SE.TopMargin,
    SE.BottomMargin,
    SE.LeftMargin,
    SE.RightMargin,
    SE.AutoRefreshSeconds,
    SE.AwaitingFirstExecution,
    SN.[DependsOnUser], 
	SN.PaginationMode, 
	SN.ProcessingFlags, 
	NULL, -- No compiled definition in tempdb to get flags from
	CONVERT(BIT, 0) AS [FoundInCache], -- permanent snapshot is never from Cache
	SE.SitePath,
	SE.SiteZone,
	SE.DataSetInfo,
	SE.ReportDefinitionPath,
	@LockVersion
FROM
    [ReportServerTempDB].dbo.SessionData AS SE
    INNER JOIN SnapshotData AS SN ON SN.SnapshotDataID = SE.SnapshotDataID
WHERE
   SE.SessionID = @DBSessionID

UPDATE SnapshotData
SET ExpirationDate = DATEADD(n, @SnapshotTimeoutMinutes, @now)
WHERE SnapshotDataID = @SnapshotDataID

END ELSE IF @IsPermanentSnapshot = 0 BEGIN -- If session has snapshot and it is temporary

SELECT
    SN.SnapshotDataID,
    SE.ShowHideInfo,
    SE.DataSourceInfo,
    SN.Description,
    SE.EffectiveParams,
    SN.CreatedDate,
    SE.IsPermanentSnapshot,
    SE.CreationTime,
    SE.HasInteractivity,
    SE.Timeout,
    SE.SnapshotExpirationDate,
    SE.ReportPath,
    SE.HistoryDate,
    SE.CompiledDefinition,
    SN.PageCount,
    SN.HasDocMap,
    SE.Expiration,
    SN.EffectiveParams,
    SE.PageHeight,
    SE.PageWidth,
    SE.TopMargin,
    SE.BottomMargin,
    SE.LeftMargin,
    SE.RightMargin,
    SE.AutoRefreshSeconds,
    SE.AwaitingFirstExecution,
    SN.[DependsOnUser], 
    SN.PaginationMode, 
    SN.ProcessingFlags, 
    COMP.ProcessingFlags,

   
    -- If we are AwaitingFirstExecution, then we haven't executed a 
    -- report and therefore have not been bound to a cached snapshot 
    -- because that binding only happens at report execution time.
    CASE SE.AwaitingFirstExecution WHEN 1 THEN CONVERT(BIT, 0) ELSE SN.IsCached END,
    SE.SitePath,
    SE.SiteZone,
    SE.DataSetInfo,
    SE.ReportDefinitionPath,
    @LockVersion
FROM
    [ReportServerTempDB].dbo.SessionData AS SE
    INNER JOIN [ReportServerTempDB].dbo.SnapshotData AS SN ON SN.SnapshotDataID = SE.SnapshotDataID  
    LEFT OUTER JOIN [ReportServerTempDB].dbo.SnapshotData AS COMP ON SE.CompiledDefinition = COMP.SnapshotDataID      
WHERE
   SE.SessionID = @DBSessionID
   
UPDATE [ReportServerTempDB].dbo.SnapshotData
SET ExpirationDate = DATEADD(n, @SnapshotTimeoutMinutes, @now)
WHERE SnapshotDataID = @SnapshotDataID

END ELSE BEGIN -- If session doesn't have snapshot

SELECT
    null,
    SE.ShowHideInfo,
    SE.DataSourceInfo,
    null,
    SE.EffectiveParams,
    null,
    SE.IsPermanentSnapshot,
    SE.CreationTime,
    SE.HasInteractivity,
    SE.Timeout,
    SE.SnapshotExpirationDate,
    SE.ReportPath,
    SE.HistoryDate,
    SE.CompiledDefinition,
    null,
    null,
    SE.Expiration,
    null,
    SE.PageHeight,
    SE.PageWidth,
    SE.TopMargin,
    SE.BottomMargin,
    SE.LeftMargin,
    SE.RightMargin,
    SE.AutoRefreshSeconds,
    SE.AwaitingFirstExecution,
    null, 
    null, 
    null, 
    COMP.ProcessingFlags,
    CONVERT(BIT, 0) AS [FoundInCache], -- no snapshot, so it can't be from the cache
    SE.SitePath,
    SE.SiteZone,
    SE.DataSetInfo,
    SE.ReportDefinitionPath,
    @LockVersion
FROM
    [ReportServerTempDB].dbo.SessionData AS SE
    LEFT OUTER JOIN [ReportServerTempDB].dbo.SnapshotData AS COMP ON (SE.CompiledDefinition = COMP.SnapshotDataID)
WHERE
   SE.SessionID = @DBSessionID

END


-- We need this update to keep session around while we process it.
UPDATE
   SE 
SET
   Expiration = DATEADD(s, Timeout, GetDate())
FROM
   [ReportServerTempDB].dbo.SessionData AS SE
WHERE
   SE.SessionID = @DBSessionID
GO
GRANT EXECUTE ON [dbo].[GetSessionData] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSharePointPathsForUpgrade]
AS
BEGIN
SELECT DISTINCT SUBSTRING([Path], 1, LEN([Path])-LEN([Name]) - 1) as Prefix, LEN([Path])-LEN([Name]) as PrefixLen
  FROM [Catalog]
  WHERE LEN([Path]) > 0 AND [Path] NOT LIKE '/{%'
  ORDER BY PrefixLen DESC
END
GO
GRANT EXECUTE ON [dbo].[GetSharePointPathsForUpgrade] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSharePointSchedulePathsForUpgrade]
AS
BEGIN
SELECT DISTINCT [Path], LEN([Path])
  FROM [Schedule]
  WHERE [Path] IS NOT NULL AND [Path] NOT LIKE '/{%'
  ORDER BY LEN([Path]) DESC
END
GO
GRANT EXECUTE ON [dbo].[GetSharePointSchedulePathsForUpgrade] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSnapshotChunks]
@SnapshotDataID uniqueidentifier,
@IsPermanentSnapshot bit
AS

IF @IsPermanentSnapshot != 0 BEGIN

SELECT ChunkName, ChunkType, ChunkFlags, MimeType, Version, datalength(Content)
FROM ChunkData
WHERE   
    SnapshotDataID = @SnapshotDataID
    
END ELSE BEGIN

SELECT ChunkName, ChunkType, ChunkFlags, MimeType, Version, datalength(Content)
FROM [ReportServerTempDB].dbo.ChunkData
WHERE   
    SnapshotDataID = @SnapshotDataID
END
GO
GRANT EXECUTE ON [dbo].[GetSnapshotChunks] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSnapshotFromHistory]
@Path nvarchar (425),
@SnapshotDate datetime,
@AuthType int
AS
SELECT
   Catalog.ItemID,
   Catalog.Type,
   SnapshotData.SnapshotDataID, 
   SnapshotData.DependsOnUser,
   SnapshotData.Description,
   SecData.NtSecDescPrimary,
   Catalog.[Property], 
   SnapshotData.ProcessingFlags
FROM 
   SnapshotData 
   INNER JOIN History ON History.SnapshotDataID = SnapshotData.SnapshotDataID
   INNER JOIN Catalog ON History.ReportID = Catalog.ItemID
   LEFT OUTER JOIN SecData ON Catalog.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType
WHERE 
   Catalog.Path = @Path 
   AND History.SnapshotDate = @SnapshotDate
GO
GRANT EXECUTE ON [dbo].[GetSnapshotFromHistory] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSnapshotPromotedInfo]
@SnapshotDataID as uniqueidentifier,
@IsPermanentSnapshot as bit
AS

-- We don't want to hold shared locks if even if we are in a repeatable
-- read transaction, so explicitly use READCOMMITTED lock hint
IF @IsPermanentSnapshot = 1
BEGIN
   SELECT PageCount, HasDocMap, PaginationMode, ProcessingFlags
   FROM SnapshotData WITH (READCOMMITTED)
   WHERE SnapshotDataID = @SnapshotDataID
END ELSE BEGIN
   SELECT PageCount, HasDocMap, PaginationMode, ProcessingFlags
   FROM [ReportServerTempDB].dbo.SnapshotData WITH (READCOMMITTED)
   WHERE SnapshotDataID = @SnapshotDataID
END
GO
GRANT EXECUTE ON [dbo].[GetSnapshotPromotedInfo] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSnapShotSchedule] 
@ReportID uniqueidentifier
AS

select
    S.[ScheduleID],
    S.[Name],
    S.[StartDate], 
    S.[Flags],
    S.[NextRunTime],
    S.[LastRunTime], 
    S.[EndDate], 
    S.[RecurrenceType],
    S.[MinutesInterval],
    S.[DaysInterval],
    S.[WeeksInterval],
    S.[DaysOfWeek], 
    S.[DaysOfMonth], 
    S.[Month], 
    S.[MonthlyWeek], 
    S.[State], 
    S.[LastRunStatus],
    S.[ScheduledRunTimeout],
    S.[EventType],
    S.[EventData],
    S.[Type],
    S.[Path],
    SUSER_SNAME(Owner.[Sid]),
    Owner.[UserName],
    Owner.[AuthType]
from
    Schedule S with (XLOCK) inner join ReportSchedule RS on S.ScheduleID = RS.ScheduleID
    inner join [Users] Owner on S.[CreatedById] = Owner.[UserID]
where
    RS.ReportAction = 2 and -- 2 == create snapshot
    RS.ReportID = @ReportID
GO
GRANT EXECUTE ON [dbo].[GetSnapShotSchedule] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSubscription]
@SubscriptionID uniqueidentifier
AS

-- Grab all of the-- subscription properties given a id 
select 
        S.[SubscriptionID],
        S.[Report_OID],
        S.[ReportZone],
        S.[Locale],
        S.[InactiveFlags],
        S.[DeliveryExtension], 
        S.[ExtensionSettings],
        SUSER_SNAME(Modified.[Sid]), 
        Modified.[UserName],
        S.[ModifiedDate], 
        S.[Description],
        S.[LastStatus],
        S.[EventType],
        S.[MatchData],
        S.[Parameters],
        S.[DataSettings],
        A.[TotalNotifications],
        A.[TotalSuccesses],
        A.[TotalFailures],
        SUSER_SNAME(Owner.[Sid]),
        Owner.[UserName],
        CAT.[Path],
        S.[LastRunTime],
        CAT.[Type],
        SD.NtSecDescPrimary,
        S.[Version],
        Owner.[AuthType]
from
    [Subscriptions] S inner join [Catalog] CAT on S.[Report_OID] = CAT.[ItemID]
    inner join [Users] Owner on S.OwnerID = Owner.UserID
    inner join [Users] Modified on S.ModifiedByID = Modified.UserID
    left outer join [SecData] SD on CAT.PolicyID = SD.PolicyID AND SD.AuthType = Owner.AuthType
    left outer join (select top(1) * from [ActiveSubscriptions] with(NOLOCK) where [SubscriptionID] = @SubscriptionID) A on S.[SubscriptionID] = A.[SubscriptionID]
where
    S.[SubscriptionID] = @SubscriptionID
GO
GRANT EXECUTE ON [dbo].[GetSubscription] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSubscriptionInfoForReencryption]
@SubscriptionID as uniqueidentifier
AS

SELECT [DeliveryExtension], [ExtensionSettings], [Version]
FROM [dbo].[Subscriptions]
WHERE [SubscriptionID] = @SubscriptionID
GO
GRANT EXECUTE ON [dbo].[GetSubscriptionInfoForReencryption] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSubscriptionsForUpgrade]
@CurrentVersion int
AS
SELECT 
    [SubscriptionID]
FROM 
    [Subscriptions]
WHERE
    [Version] != @CurrentVersion
GO
GRANT EXECUTE ON [dbo].[GetSubscriptionsForUpgrade] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSystemPolicy]
@AuthType int
AS 
SELECT SecData.NtSecDescPrimary, SecData.XmlDescription
FROM Policies 
LEFT OUTER JOIN SecData ON Policies.PolicyID = SecData.PolicyID AND AuthType = @AuthType
WHERE PolicyFlag = 1
GO
GRANT EXECUTE ON [dbo].[GetSystemPolicy] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTaskProperties]
@ScheduleID uniqueidentifier
AS
-- Grab all of a tasks properties given a task id
select 
        S.[ScheduleID],
        S.[Name],
        S.[StartDate], 
        S.[Flags],
        S.[NextRunTime],
        S.[LastRunTime], 
        S.[EndDate], 
        S.[RecurrenceType],
        S.[MinutesInterval],
        S.[DaysInterval],
        S.[WeeksInterval],
        S.[DaysOfWeek], 
        S.[DaysOfMonth], 
        S.[Month], 
        S.[MonthlyWeek], 
        S.[State], 
        S.[LastRunStatus],
        S.[ScheduledRunTimeout],
        S.[EventType],
        S.[EventData],
        S.[Type],
        S.[Path],
        SUSER_SNAME(Owner.[Sid]),
        Owner.[UserName],
        Owner.[AuthType]
from
    [Schedule] S with (XLOCK) 
    Inner join [Users] Owner on S.[CreatedById] = Owner.UserID
where
    S.[ScheduleID] = @ScheduleID
GO
GRANT EXECUTE ON [dbo].[GetTaskProperties] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTimeBasedSubscriptionReportAction]
@SubscriptionID uniqueidentifier
AS
select 
        RS.[ReportAction],
        RS.[ScheduleID],
        RS.[ReportID],
        RS.[SubscriptionID],
        C.[Path],
        C.[Type]
from
    [ReportSchedule] RS Inner join [Catalog] C on RS.[ReportID] = C.[ItemID]
where
    RS.[SubscriptionID] = @SubscriptionID
GO
GRANT EXECUTE ON [dbo].[GetTimeBasedSubscriptionReportAction] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTimeBasedSubscriptionSchedule]
@SubscriptionID as uniqueidentifier
AS

select
    S.[ScheduleID],
    S.[Name],
    S.[StartDate], 
    S.[Flags],
    S.[NextRunTime],
    S.[LastRunTime], 
    S.[EndDate], 
    S.[RecurrenceType],
    S.[MinutesInterval], 
    S.[DaysInterval],
    S.[WeeksInterval],
    S.[DaysOfWeek], 
    S.[DaysOfMonth], 
    S.[Month], 
    S.[MonthlyWeek], 
    S.[State], 
    S.[LastRunStatus],
    S.[ScheduledRunTimeout],
    S.[EventType],
    S.[EventData],
    S.[Type],
    S.[Path],
    SUSER_SNAME(Owner.[Sid]),
    Owner.[UserName],
    Owner.[AuthType]
from
    [ReportSchedule] R inner join Schedule S with (XLOCK) on R.[ScheduleID] = S.[ScheduleID]
    Inner join [Users] Owner on S.[CreatedById] = Owner.UserID
where
    R.[SubscriptionID] = @SubscriptionID
GO
GRANT EXECUTE ON [dbo].[GetTimeBasedSubscriptionSchedule] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUpgradeItems]
AS
SELECT 
    [Item],
    [Status]
FROM 
    [UpgradeInfo]
GO
GRANT EXECUTE ON [dbo].[GetUpgradeItems] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[IncreaseTransientSnapshotRefcount]
@SnapshotDataID as uniqueidentifier,
@IsPermanentSnapshot as bit,
@ExpirationMinutes as int
AS
SET NOCOUNT OFF
DECLARE @soon AS datetime
SET @soon = DATEADD(n, @ExpirationMinutes, GETDATE())

if @IsPermanentSnapshot = 1
BEGIN
   UPDATE SnapshotData
   SET ExpirationDate = @soon, TransientRefcount = TransientRefcount + 1
   WHERE SnapshotDataID = @SnapshotDataID
END ELSE BEGIN
   UPDATE [ReportServerTempDB].dbo.SnapshotData
   SET ExpirationDate = @soon, TransientRefcount = TransientRefcount + 1
   WHERE SnapshotDataID = @SnapshotDataID
END
GO
GRANT EXECUTE ON [dbo].[IncreaseTransientSnapshotRefcount] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InsertUnreferencedSnapshot]
@ReportID as uniqueidentifier = NULL,
@EffectiveParams as ntext = NULL,
@QueryParams as ntext = NULL,
@ParamsHash as int = NULL,
@CreatedDate as datetime,
@Description as nvarchar(512) = NULL,
@SnapshotDataID as uniqueidentifier,
@IsPermanentSnapshot as bit,
@ProcessingFlags as int,
@SnapshotTimeoutMinutes as int,
@Machine as nvarchar(512) = NULL
AS
DECLARE @now datetime
SET @now = GETDATE()

IF @IsPermanentSnapshot = 1
BEGIN
   INSERT INTO SnapshotData
      (SnapshotDataID, CreatedDate, EffectiveParams, QueryParams, ParamsHash, Description, PermanentRefcount, TransientRefcount, ExpirationDate, ProcessingFlags)
   VALUES
      (@SnapshotDataID, @CreatedDate, @EffectiveParams, @QueryParams, @ParamsHash, @Description, 0, 1, DATEADD(n, @SnapshotTimeoutMinutes, @now), @ProcessingFlags)
END ELSE BEGIN
   INSERT INTO [ReportServerTempDB].dbo.SnapshotData
      (SnapshotDataID, CreatedDate, EffectiveParams, QueryParams, ParamsHash, Description, PermanentRefcount, TransientRefcount, ExpirationDate, Machine, ProcessingFlags)
   VALUES
      (@SnapshotDataID, @CreatedDate, @EffectiveParams, @QueryParams, @ParamsHash, @Description, 0, 1, DATEADD(n, @SnapshotTimeoutMinutes, @now), @Machine, @ProcessingFlags)
END
GO
GRANT EXECUTE ON [dbo].[InsertUnreferencedSnapshot] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InvalidateSubscription] 
@SubscriptionID uniqueidentifier,
@Flags int,
@LastStatus nvarchar(260)
AS

-- Mark all subscriptions for this report as inactive for the given flags
update 
    Subscriptions 
set 
    [InactiveFlags] = S.[InactiveFlags] | @Flags,
    [LastStatus] = @LastStatus
from 
    Subscriptions S 
where 
    SubscriptionID = @SubscriptionID
GO
GRANT EXECUTE ON [dbo].[InvalidateSubscription] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[IsSegmentedChunk]
	@SnapshotId			uniqueidentifier,
	@IsPermanent		bit, 
	@ChunkName			nvarchar(260), 
	@ChunkType			int, 
	@IsSegmented		bit out
as begin
	-- segmented chunks are read w/nolock
	-- we don't really care about locking in this scenario
	-- we just need to get some metadata which never changes (if it is segmented or not)
	if (@IsPermanent = 1) begin
		select top 1 @IsSegmented = IsSegmented
		from 
		(
			select convert(bit, 0)
			from [ChunkData] c
			where c.ChunkName = @ChunkName and c.ChunkType = @ChunkType and c.SnapshotDataId = @SnapshotId
			union all
			select convert(bit, 1)
			from [SegmentedChunk] c WITH(NOLOCK)			
			where c.ChunkName = @ChunkName and c.ChunkType = @ChunkType and c.SnapshotDataId = @SnapshotId
		) A(IsSegmented)
	end
	else begin
		select top 1 @IsSegmented = IsSegmented
		from 
		(
			select convert(bit, 0)
			from [ReportServerTempDB].dbo.[ChunkData] c
			where c.ChunkName = @ChunkName and c.ChunkType = @ChunkType and c.SnapshotDataId = @SnapshotId
			union all
			select convert(bit, 1)
			from [ReportServerTempDB].dbo.[SegmentedChunk] c WITH(NOLOCK)
			where c.ChunkName = @ChunkName and c.ChunkType = @ChunkType and c.SnapshotDataId = @SnapshotId
		) A(IsSegmented)
	end
end
GO
GRANT EXECUTE ON [dbo].[IsSegmentedChunk] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- list all historical snapshots for a specific report
CREATE PROCEDURE [dbo].[ListHistory]
@ReportID uniqueidentifier
AS
SELECT
   S.SnapshotDate,
   ISNULL((SELECT SUM(DATALENGTH( CD.Content ) ) FROM ChunkData AS CD WHERE CD.SnapshotDataID = S.SnapshotDataID ), 0) + 
   ISNULL(
	(
	 SELECT SUM(DATALENGTH( SEG.Content) ) 	
	 FROM Segment SEG WITH(NOLOCK)
	 JOIN ChunkSegmentMapping CSM WITH(NOLOCK) ON (CSM.SegmentId = SEG.SegmentId)
	 JOIN SegmentedChunk C WITH(NOLOCK) ON (C.ChunkId = CSM.ChunkId AND C.SnapshotDataId = S.SnapshotDataId)
	), 0)	
FROM
   History AS S -- skipping intermediate table SnapshotData
WHERE
   S.ReportID = @ReportID
GO
GRANT EXECUTE ON [dbo].[ListHistory] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ListInfoForReencryption]
AS

SELECT [DSID]
FROM [dbo].[DataSource] WITH (XLOCK, TABLOCK)

SELECT [SubscriptionID]
FROM [dbo].[Subscriptions] WITH (XLOCK, TABLOCK)

SELECT [InstallationID], [PublicKey]
FROM [dbo].[Keys] WITH (XLOCK, TABLOCK)
WHERE [Client] = 1 AND ([SymmetricKey] IS NOT NULL)
GO
GRANT EXECUTE ON [dbo].[ListInfoForReencryption] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ListInstallations]
AS

SELECT
    [MachineName],
    [InstanceName],
    [InstallationID],
    CASE WHEN [SymmetricKey] IS null THEN 0 ELSE 1 END
FROM [dbo].[Keys]
WHERE [Client] = 1
GO
GRANT EXECUTE ON [dbo].[ListInstallations] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ListRunningJobs]
AS
SELECT JobID, StartDate, ComputerName, RequestName, RequestPath, SUSER_SNAME(Users.[Sid]), Users.[UserName], Description, 
    Timeout, JobAction, JobType, JobStatus, Users.[AuthType]
FROM RunningJobs 
INNER JOIN Users 
ON RunningJobs.UserID = Users.UserID
GO
GRANT EXECUTE ON [dbo].[ListRunningJobs] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ListScheduledReports]
@ScheduleID uniqueidentifier
AS
-- List all reports for a schedule
select 
        RS.[ReportAction],
        RS.[ScheduleID],
        RS.[ReportID],
        RS.[SubscriptionID],
        C.[Path],
        C.[Type],
        C.[Name],
        C.[Description],
        C.[ModifiedDate],
        SUSER_SNAME(U.[Sid]),
        U.[UserName],
        DATALENGTH( C.Content ),
        C.ExecutionTime,
        S.[Type],
        SD.[NtSecDescPrimary],
        SU.[ReportZone]

from
    [ReportSchedule] RS Inner join [Catalog] C on RS.[ReportID] = C.[ItemID]
    Inner join [Schedule] S on RS.[ScheduleID] = S.[ScheduleID]
    Inner join [Users] U on C.[ModifiedByID] = U.UserID
    left outer join [SecData] SD on SD.[PolicyID] = C.[PolicyID] AND SD.AuthType = U.AuthType    
    left outer join [Subscriptions] SU on SU.[SubscriptionID] = RS.[SubscriptionID]
where
    RS.[ScheduleID] = @ScheduleID
GO
GRANT EXECUTE ON [dbo].[ListScheduledReports] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ListSubscriptionIDs]
AS

SELECT [SubscriptionID]
FROM [dbo].[Subscriptions] WITH (XLOCK, TABLOCK)
GO
GRANT EXECUTE ON [dbo].[ListSubscriptionIDs] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ListSubscriptionsUsingDataSource]
@DataSourceName nvarchar(450)
AS
select 
    S.[SubscriptionID],
    S.[Report_OID],
    S.[ReportZone],
    S.[Locale],
    S.[InactiveFlags],
    S.[DeliveryExtension], 
    S.[ExtensionSettings],
    SUSER_SNAME(Modified.[Sid]),
    Modified.[UserName],
    S.[ModifiedDate], 
    S.[Description],
    S.[LastStatus],
    S.[EventType],
    S.[MatchData],
    S.[Parameters],
    S.[DataSettings],
    A.[TotalNotifications],
    A.[TotalSuccesses],
    A.[TotalFailures],
    SUSER_SNAME(Owner.[Sid]),
    Owner.[UserName],
    CAT.[Path],
    S.[LastRunTime],
    CAT.[Type],
    SD.NtSecDescPrimary,
    S.[Version],
    Owner.[AuthType]
from
    [DataSource] DS inner join Catalog C on C.ItemID = DS.Link
    inner join Subscriptions S on S.[SubscriptionID] = DS.[SubscriptionID]
    inner join [Catalog] CAT on S.[Report_OID] = CAT.[ItemID]
    inner join [Users] Owner on S.OwnerID = Owner.UserID
    inner join [Users] Modified on S.ModifiedByID = Modified.UserID
    left join [SecData] SD on SD.[PolicyID] = CAT.[PolicyID] AND SD.AuthType = Owner.AuthType
    left outer join [ActiveSubscriptions] A with (NOLOCK) on S.[SubscriptionID] = A.[SubscriptionID]
where 
    C.Path = @DataSourceName
GO
GRANT EXECUTE ON [dbo].[ListSubscriptionsUsingDataSource] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ListTasks]
@Path nvarchar (425) = NULL,
@Prefix nvarchar (425) = NULL
AS

select 
        S.[ScheduleID],
        S.[Name],
        S.[StartDate],
        S.[Flags],
        S.[NextRunTime],
        S.[LastRunTime],
        S.[EndDate],
        S.[RecurrenceType],
        S.[MinutesInterval],
        S.[DaysInterval],
        S.[WeeksInterval],
        S.[DaysOfWeek],
        S.[DaysOfMonth],
        S.[Month],
        S.[MonthlyWeek],
        S.[State], 
        S.[LastRunStatus],
        S.[ScheduledRunTimeout],
        S.[EventType],
        S.[EventData],
        S.[Type],
        S.[Path],
        SUSER_SNAME(Owner.[Sid]),
        Owner.[UserName],
        Owner.[AuthType],
        (select count(*) from ReportSchedule where ReportSchedule.ScheduleID = S.ScheduleID)
from
    [Schedule] S  inner join [Users] Owner on S.[CreatedById] = Owner.UserID
where
    S.[Type] = 0 /*Type 0 is shared schedules*/ and
    ((@Path is null) OR (S.Path = @Path) or (S.Path like @Prefix escape '*'))
GO
GRANT EXECUTE ON [dbo].[ListTasks] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ListTasksForMaintenance]
AS

declare @date datetime
set @date = GETUTCDATE()

update
    [Schedule]
set
    [ConsistancyCheck] = @date
from 
(
  SELECT TOP 20 [ScheduleID] FROM [Schedule] WITH(UPDLOCK) WHERE [ConsistancyCheck] is NULL
) AS t1
WHERE [Schedule].[ScheduleID] = t1.[ScheduleID]

select top 20
        S.[ScheduleID],
        S.[Name],
        S.[StartDate],
        S.[Flags],
        S.[NextRunTime],
        S.[LastRunTime],
        S.[EndDate],
        S.[RecurrenceType],
        S.[MinutesInterval],
        S.[DaysInterval],
        S.[WeeksInterval],
        S.[DaysOfWeek],
        S.[DaysOfMonth],
        S.[Month],
        S.[MonthlyWeek],
        S.[State], 
        S.[LastRunStatus],
        S.[ScheduledRunTimeout],
        S.[EventType],
        S.[EventData],
        S.[Type],
        S.[Path]
from
    [Schedule] S
where
    [ConsistancyCheck] = @date
GO
GRANT EXECUTE ON [dbo].[ListTasksForMaintenance] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ListUsedDeliveryProviders] 
AS
select distinct [DeliveryExtension] from Subscriptions where [DeliveryExtension] <> ''
GO
GRANT EXECUTE ON [dbo].[ListUsedDeliveryProviders] TO [RSExecRole]
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
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Loads a report's RDL for republishing
CREATE PROCEDURE [dbo].[LoadForRepublishing]
@Path		nvarchar(425)
AS
SELECT 
	COALESCE(LinkTarget.Content, MainItem.Content) AS [Content], 
	CompiledDefinition.SnapshotDataID, 
	CompiledDefinition.ProcessingFlags
FROM Catalog MainItem
LEFT OUTER JOIN Catalog LinkTarget WITH (INDEX = PK_CATALOG) ON (MainItem.LinkSourceID = LinkTarget.ItemID)
JOIN SnapshotData CompiledDefinition ON (CompiledDefinition.SnapshotDataID = COALESCE(LinkTarget.Intermediate, MainItem.Intermediate))
WHERE MainItem.Path = @Path
GO
GRANT EXECUTE ON [dbo].[LoadForRepublishing] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[LockPersistedStream]
@SessionID varchar(32),
@Index int
AS

SELECT [Index] FROM [ReportServerTempDB].dbo.PersistedStream WITH (XLOCK) WHERE SessionID = @SessionID AND [Index] = @Index
GO
GRANT EXECUTE ON [dbo].[LockPersistedStream] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[LockSnapshotForUpgrade]
@SnapshotDataID as uniqueidentifier,
@IsPermanentSnapshot as bit
AS
if @IsPermanentSnapshot = 1
BEGIN
   SELECT ChunkName from ChunkData with (XLOCK)
   WHERE SnapshotDataID = @SnapshotDataID
END ELSE BEGIN
   SELECT ChunkName from [ReportServerTempDB].dbo.ChunkData with (XLOCK)
   WHERE SnapshotDataID = @SnapshotDataID
END
GO
GRANT EXECUTE ON [dbo].[LockSnapshotForUpgrade] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MarkSnapshotAsDependentOnUser]
@SnapshotDataID as uniqueidentifier,
@IsPermanentSnapshot as bit
AS
SET NOCOUNT OFF
if @IsPermanentSnapshot = 1
BEGIN
   UPDATE SnapshotData
   SET DependsOnUser = 1
   WHERE SnapshotDataID = @SnapshotDataID
END ELSE BEGIN
   UPDATE [ReportServerTempDB].dbo.SnapshotData
   SET DependsOnUser = 1
   WHERE SnapshotDataID = @SnapshotDataID
END
GO
GRANT EXECUTE ON [dbo].[MarkSnapshotAsDependentOnUser] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MigrateExecutionLog] @updatedRow int output
as
begin
	set @updatedRow = 0 ;
    if exists (select id from dbo.sysobjects where id = object_id(N'[dbo].[ExecutionLog_Old]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
    begin
        SET DEADLOCK_PRIORITY LOW ;
        SET NOCOUNT OFF ;
        
        insert into [dbo].[ExecutionLogStorage]
            ([InstanceName],
             [ReportID],
             [UserName],
             [ExecutionId],
             [RequestType],
             [Format],
             [Parameters],
             [ReportAction],
             [TimeStart],
             [TimeEnd],
             [TimeDataRetrieval],
             [TimeProcessing],
             [TimeRendering],
             [Source],
             [Status],
             [ByteCount],
             [RowCount],
             [AdditionalInfo])
        select top (1024) with ties
            [InstanceName],
            [ReportID],
            [UserName],
            null,
            [RequestType],
            [Format],
            [Parameters],
            1,      --Render
            [TimeStart],
            [TimeEnd],
            [TimeDataRetrieval],
            [TimeProcessing],
            [TimeRendering],
            [Source],
            [Status],
            [ByteCount],
            [RowCount],        
            null
         from [dbo].[ExecutionLog_Old] WITH (XLOCK)
         order by TimeStart ;
         
         delete from [dbo].[ExecutionLog_Old]
         where [TimeStart] in (select top (1024) with ties [TimeStart] from [dbo].[ExecutionLog_Old] order by [TimeStart]) ;
         
         set @updatedRow = @@ROWCOUNT ;
         
	     IF @updatedRow = 0
	     begin
            drop table [dbo].[ExecutionLog_Old]
         end
     end
end
GO
GRANT EXECUTE ON [dbo].[MigrateExecutionLog] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MoveObject]
@OldPath nvarchar (425),
@OldPrefix nvarchar (850),
@NewName nvarchar (425),
@NewPath nvarchar (425),
@NewParentID uniqueidentifier,
@RenameOnly as bit,
@MaxPathLength as int
AS

DECLARE @LongPath nvarchar(425)
SET @LongPath =
  (SELECT TOP 1 Path
   FROM Catalog
   WHERE
      LEN(Path)-LEN(@OldPath)+LEN(@NewPath) > @MaxPathLength AND
      Path LIKE @OldPrefix ESCAPE '*')
   
IF @LongPath IS NOT NULL BEGIN
   SELECT @LongPath
   RETURN
END

IF @RenameOnly = 0 -- if this a full-blown move, not just a rename
BEGIN
    -- adjust policies on the top item that gets moved
    DECLARE @OldInheritedPolicyID as uniqueidentifier
    SELECT @OldInheritedPolicyID = (SELECT PolicyID FROM Catalog with (XLOCK) WHERE Path = @OldPath AND PolicyRoot = 0)
    IF (@OldInheritedPolicyID IS NOT NULL)
       BEGIN -- this was not a policy root, change it to inherit from target folder
         DECLARE @NewPolicyID as uniqueidentifier
         SELECT @NewPolicyID = (SELECT PolicyID FROM Catalog with (XLOCK) WHERE ItemID = @NewParentID)
         -- update item and children that shared the old policy
         UPDATE Catalog SET PolicyID = @NewPolicyID WHERE Path = @OldPath 
         UPDATE Catalog SET PolicyID = @NewPolicyID 
            WHERE Path LIKE @OldPrefix ESCAPE '*' 
            AND Catalog.PolicyID = @OldInheritedPolicyID
     END
END

-- Update item that gets moved (Path, Name, and ParentId)
update Catalog
set Name = @NewName, Path = @NewPath, ParentID = @NewParentID
where Path = @OldPath
-- Update all its children (Path only, Names and ParentIds stay the same)
update Catalog
set Path = STUFF(Path, 1, LEN(@OldPath), @NewPath )
where Path like @OldPrefix escape '*'
GO
GRANT EXECUTE ON [dbo].[MoveObject] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ObjectExists]
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

SELECT Type, ItemID, SnapshotLimit, NtSecDescPrimary, ExecutionFlag, Intermediate, [LinkSourceID], SubType, ComponentID
FROM ExtendedCatalog(@OwnerID, @Path, @EditSessionID)
LEFT OUTER JOIN SecData
ON ExtendedCatalog.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType
END
GO
GRANT EXECUTE ON [dbo].[ObjectExists] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[OpenSegmentedChunk]
	@SnapshotId		uniqueidentifier,
	@IsPermanent	bit,
	@ChunkName		nvarchar(260), 
	@ChunkType		int, 
	@ChunkId        uniqueidentifier out, 
	@ChunkFlags     tinyint out
as begin    
	if (@IsPermanent = 1) begin		
		select	@ChunkId = ChunkId,
				@ChunkFlags = ChunkFlags
		from dbo.SegmentedChunk chunk
		where chunk.SnapshotDataId = @SnapshotId and chunk.ChunkName = @ChunkName and chunk.ChunkType = @ChunkType
		
		select	csm.SegmentId, 				
				csm.LogicalByteCount as LogicalSegmentLength, 
				csm.ActualByteCount as ActualSegmentLength		
		from ChunkSegmentMapping csm		
		where csm.ChunkId = @ChunkId
		order by csm.StartByte asc
	end
	else begin
		select	@ChunkId = ChunkId,
				@ChunkFlags = ChunkFlags
		from [ReportServerTempDB].dbo.SegmentedChunk chunk
		where chunk.SnapshotDataId = @SnapshotId and chunk.ChunkName = @ChunkName and chunk.ChunkType = @ChunkType

		if @ChunkFlags & 0x4 > 0 begin
			-- Shallow copy: read chunk segments from catalog 
			select	csm.SegmentId, 				
					csm.LogicalByteCount as LogicalSegmentLength, 
					csm.ActualByteCount as ActualSegmentLength		
			from ChunkSegmentMapping csm		
			where csm.ChunkId = @ChunkId
			order by csm.StartByte asc
		end
		else begin
			-- Regular copy: read chunk segments from temp db
			select	csm.SegmentId, 				
					csm.LogicalByteCount as LogicalSegmentLength, 
					csm.ActualByteCount as ActualSegmentLength		
			from [ReportServerTempDB].dbo.ChunkSegmentMapping csm		
			where csm.ChunkId = @ChunkId
			order by csm.StartByte asc
		end
	end
end
GO
GRANT EXECUTE ON [dbo].[OpenSegmentedChunk] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PromoteSnapshotInfo]
@SnapshotDataID as uniqueidentifier,
@IsPermanentSnapshot as bit,
@PageCount as int,
@HasDocMap as bit, 
@PaginationMode as smallint, 
@ProcessingFlags as int
AS

-- HasDocMap: Processing engine may not 
-- compute this flag in all cases, which 
-- can lead to it being false when passed into
-- this proc, however the server needs this 
-- flag to be true if it was ever set to be 
-- true in order to communicate that there is a 
-- document map to the viewer control.

IF @IsPermanentSnapshot = 1
BEGIN
   UPDATE SnapshotData SET 
	PageCount = @PageCount, 
	HasDocMap = COALESCE(@HasDocMap | HasDocMap, @HasDocMap),
	PaginationMode = @PaginationMode,
	ProcessingFlags = @ProcessingFlags
   WHERE SnapshotDataID = @SnapshotDataID
END ELSE BEGIN
   UPDATE [ReportServerTempDB].dbo.SnapshotData SET 
	PageCount = @PageCount, 
	HasDocMap = COALESCE(@HasDocMap | HasDocMap, @HasDocMap), 
	PaginationMode = @PaginationMode,
	ProcessingFlags = @ProcessingFlags
   WHERE SnapshotDataID = @SnapshotDataID
END
GO
GRANT EXECUTE ON [dbo].[PromoteSnapshotInfo] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ReadChunkPortion]
@ChunkPointer binary(16),
@IsPermanentSnapshot bit,
@DataIndex int,
@Length int
AS

IF @IsPermanentSnapshot != 0 BEGIN
    READTEXT ChunkData.Content @ChunkPointer @DataIndex @Length
END ELSE BEGIN
    READTEXT [ReportServerTempDB].dbo.ChunkData.Content @ChunkPointer @DataIndex @Length
END
GO
GRANT EXECUTE ON [dbo].[ReadChunkPortion] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ReadChunkSegment]
	@ChunkId		uniqueidentifier,
	@SegmentId		uniqueidentifier,
	@IsPermanent	bit, 
	@DataIndex		int,
	@Length			int
as begin
	if(@IsPermanent = 1) begin	
		select substring(seg.Content, @DataIndex + 1, @Length) as [Content]
		from Segment seg
		join ChunkSegmentMapping csm on (csm.SegmentId = seg.SegmentId)
		where csm.ChunkId = @ChunkId and csm.SegmentId = @SegmentId
	end
	else begin
		select substring(seg.Content, @DataIndex + 1, @Length) as [Content]
		from [ReportServerTempDB].dbo.Segment seg
		join [ReportServerTempDB].dbo.ChunkSegmentMapping csm on (csm.SegmentId = seg.SegmentId)
		where csm.ChunkId = @ChunkId and csm.SegmentId = @SegmentId
	end
end
GO
GRANT EXECUTE ON [dbo].[ReadChunkSegment] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ReadRoleProperties]
@RoleName as nvarchar(260)
AS 
SELECT Description, TaskMask, RoleFlags FROM Roles WHERE RoleName = @RoleName
GO
GRANT EXECUTE ON [dbo].[ReadRoleProperties] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Republishing generates new ID and stores those in the object model, 
-- in order to resolve the data sets we need to rebind the old 
-- data set definition to the current ID
CREATE PROCEDURE [dbo].[RebindDataSet]
@ItemId		uniqueidentifier, 
@Name		nvarchar(260), 
@NewID	uniqueidentifier
AS
UPDATE DataSets
SET ID = @NewID
WHERE ItemID = @ItemId AND [Name] = @Name
GO
GRANT EXECUTE ON [dbo].[RebindDataSet] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Republishing generates new DSID and stores those in the object model, 
-- in order to resolve the data sources we need to rebind the old 
-- data source definition to the current DSID
CREATE PROCEDURE [dbo].[RebindDataSource]
@ItemId		uniqueidentifier, 
@Name		nvarchar(260), 
@NewDSID	uniqueidentifier
AS
UPDATE DataSource
SET DSID = @NewDSID
WHERE ItemID = @ItemId AND [Name] = @Name
GO
GRANT EXECUTE ON [dbo].[RebindDataSource] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RemoveReportFromSession]
@SessionID as varchar(32),
@ReportPath as nvarchar(440), 
@OwnerSid as varbinary(85) = NULL,
@OwnerName as nvarchar(260),
@AuthType as int
AS

DECLARE @OwnerID uniqueidentifier
EXEC GetUserID @OwnerSid, @OwnerName, @AuthType, @OwnerID OUTPUT

EXEC DereferenceSessionSnapshot @SessionID, @OwnerID
   
DELETE
   SE
FROM
   [ReportServerTempDB].dbo.SessionData AS SE
WHERE
   SE.SessionID = @SessionID AND
   SE.ReportPath = @ReportPath AND
   SE.OwnerID = @OwnerID
   
DELETE FROM [ReportServerTempDB].dbo.SessionLock WHERE SessionID=@SessionID
   
-- Delete any persisted streams associated with this session
UPDATE PS
SET
    PS.RefCount = 0,
    PS.ExpirationDate = GETDATE()
FROM
    [ReportServerTempDB].dbo.PersistedStream AS PS
WHERE
    PS.SessionID = @SessionID
GO
GRANT EXECUTE ON [dbo].[RemoveReportFromSession] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RemoveRunningJob]
@JobID as nvarchar(32)
AS
SET NOCOUNT OFF
DELETE FROM RunningJobs WHERE JobID = @JobID
GO
GRANT EXECUTE ON [dbo].[RemoveRunningJob] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RemoveSegment]
	@DeleteCountPermanent int, 
	@DeleteCountTemp int
as
begin
	SET DEADLOCK_PRIORITY LOW
	
	-- Locking:
	-- Similar idea as in RemovedSegmentedMapping.  Readpast
	-- any Segments which are currently locked and run the 
	-- inner scan with nolock.	
	declare @numDeleted int;
	declare @toDeleteMapping table (
		SegmentId uniqueidentifier );
	
	insert into @toDeleteMapping (SegmentId)	
	select top (@DeleteCountPermanent) SegmentId 
	from Segment with (readpast)	
	where not exists (
		select 1 from ChunkSegmentMapping CSM with (nolock)
		where CSM.SegmentId = Segment.SegmentId
		) ;
		
	delete from Segment with (readpast)
	where Segment.SegmentId in (
		select td.SegmentId from @toDeleteMapping td
		where not exists (
			select 1 from ChunkSegmentMapping CSM
			where CSM.SegmentId = td.SegmentId ));
			
	select @numDeleted = @@rowcount ;
	
	declare @toDeleteTempSegment table (
		SegmentId uniqueidentifier );
	
	insert into @toDeleteTempSegment (SegmentId)		
	select top (@DeleteCountTemp) SegmentId
	from [ReportServerTempDB].dbo.Segment with (readpast)	
	where not exists (
		select 1 from [ReportServerTempDB].dbo.ChunkSegmentMapping CSM with (nolock)
		where CSM.SegmentId = [ReportServerTempDB].dbo.Segment.SegmentId
		) ;
		
	delete from [ReportServerTempDB].dbo.Segment with (readpast)
	where [ReportServerTempDB].dbo.Segment.SegmentId in (
		select td.SegmentId from @toDeleteTempSegment td 
		where not exists (
			select 1 from [ReportServerTempDB].dbo.ChunkSegmentMapping CSM
			where CSM.SegmentId = td.SegmentId
			)) ;
	select @numDeleted = @numDeleted + @@rowcount ;
	
	select @numDeleted;
end
GO
GRANT EXECUTE ON [dbo].[RemoveSegment] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RemoveSegmentedMapping]
    @DeleteCountPermanentChunk int,
	@DeleteCountPermanentMapping int, 
	@DeleteCountTempChunk int,
	@DeleteCountTempMapping int,
	@MachineName nvarchar(260)
as
begin
	SET DEADLOCK_PRIORITY LOW
	
	declare @deleted table (
		ChunkID uniqueidentifier, 
		IsPermanent bit );
	
	-- details on lock hints:
	-- we use readpast on ChunkSegmentMapping to skip past
	-- rows which are currently locked.  they are being actively 
	-- used so clearly we do not want to delete them. we use 
	-- nolock on SegmentedChunk table as well, this is because
	-- regardless of whether or not that row is locked, we want to
	-- know if it is referenced by a SegmentedChunk and if 
	-- so we do not want to delete the mapping row.  ChunkIds are 
	-- only modified when creating a shallow chunk copy(see ShallowCopyChunk),
	-- but in this case the ChunkSegmentMapping row is locked (via the insert)
	-- so we are safe.
	
	declare @toDeletePermChunks table (
	    SnapshotDataId uniqueidentifier ) ;
	
	insert into @toDeletePermChunks (SnapshotDataId)		
	select top (@DeleteCountPermanentChunk) SnapshotDataId 
	from SegmentedChunk with (readpast)	
	where not exists (
		select 1 from SnapshotData SD with (nolock)
		where SegmentedChunk.SnapshotDataId = SD.SnapshotDataID
		) ;
		
	delete from SegmentedChunk with (readpast)
	where SegmentedChunk.SnapshotDataId in (
		select td.SnapshotDataId from @toDeletePermChunks td
		where not exists (
			select 1 from SnapshotData SD
			where td.SnapshotDataId = SD.SnapshotDataID
			)) ;
		
	-- clean up segmentedchunks from permanent database
	
	declare @toDeleteChunks table (
		ChunkId uniqueidentifier );	
	
	-- clean up mappings from permanent database
	insert into @toDeleteChunks (ChunkId)
	select top (@DeleteCountPermanentMapping) ChunkId
	from ChunkSegmentMapping with (readpast)	
	where not exists (
		select 1 from SegmentedChunk SC with (nolock)
		where SC.ChunkId = ChunkSegmentMapping.ChunkId
		) ;
		
	delete from ChunkSegmentMapping with (readpast)
	output deleted.ChunkId, convert(bit, 1) into @deleted
	where ChunkSegmentMapping.ChunkId in (
		select td.ChunkId from @toDeleteChunks td
		where not exists (
			select 1 from SegmentedChunk SC 
			where SC.ChunkId = td.ChunkId )
		and not exists (
			select 1 from [ReportServerTempDB].dbo.SegmentedChunk TSC
			where TSC.ChunkId = td.ChunkId ) )
	
	declare @toDeleteTempChunks table (		
		SnapshotDataId uniqueidentifier);
			
	-- clean up SegmentedChunks from the Temp database
	-- for locking we play the same idea as in the previous query.
	-- snapshotIds never change, so again this operation is safe.
	insert into @toDeleteTempChunks (SnapshotDataId)		
	select top (@DeleteCountTempChunk) SnapshotDataId 
	from [ReportServerTempDB].dbo.SegmentedChunk with (readpast)
	where [ReportServerTempDB].dbo.SegmentedChunk.Machine = @MachineName
	and not exists (
		select 1 from [ReportServerTempDB].dbo.SnapshotData SD with (nolock)
		where [ReportServerTempDB].dbo.SegmentedChunk.SnapshotDataId = SD.SnapshotDataID
		) ;
		
	delete from [ReportServerTempDB].dbo.SegmentedChunk with (readpast)
	where [ReportServerTempDB].dbo.SegmentedChunk.SnapshotDataId in (
		select td.SnapshotDataId from @toDeleteTempChunks td
		where not exists (
			select 1 from [ReportServerTempDB].dbo.SnapshotData SD
			where td.SnapshotDataId = SD.SnapshotDataID
			)) ;
	
	declare @toDeleteTempMappings table (
		ChunkId uniqueidentifier );		
		
	-- clean up mappings from temp database
	insert into @toDeleteTempMappings (ChunkId)	
	select top (@DeleteCountTempMapping) ChunkId
	from [ReportServerTempDB].dbo.ChunkSegmentMapping with (readpast)	
	where not exists (
		select 1 from [ReportServerTempDB].dbo.SegmentedChunk SC with (nolock)
		where SC.ChunkId = [ReportServerTempDB].dbo.ChunkSegmentMapping.ChunkId
		) ;
		
	delete from [ReportServerTempDB].dbo.ChunkSegmentMapping with (readpast)
	output deleted.ChunkId, convert(bit, 0) into @deleted
	where [ReportServerTempDB].dbo.ChunkSegmentMapping.ChunkId in (
		select td.ChunkId from @toDeleteTempMappings td
		where not exists (
			select 1 from [ReportServerTempDB].dbo.SegmentedChunk SC
			where td.ChunkId = SC.ChunkId )) ;
		
	-- need to return these so we can cleanup file system chunks
	select distinct ChunkID, IsPermanent
	from @deleted ;
end
GO
GRANT EXECUTE ON [dbo].[RemoveSegmentedMapping] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetAllProperties]
@Path nvarchar (425),
@EditSessionID varchar(32) = NULL,
@Property ntext,
@Description ntext = NULL,
@Hidden bit = NULL,
@ModifiedBySid varbinary (85) = NULL,
@ModifiedByName nvarchar(260),
@AuthType int,
@ModifiedDate DateTime
AS

IF(@EditSessionID is null)
BEGIN
DECLARE @ModifiedByID uniqueidentifier
EXEC GetUserID @ModifiedBySid, @ModifiedByName, @AuthType, @ModifiedByID OUTPUT

UPDATE Catalog
SET Property = @Property, Description = @Description, Hidden = @Hidden, ModifiedByID = @ModifiedByID, ModifiedDate = @ModifiedDate
WHERE Path = @Path
END
ELSE
BEGIN
    UPDATE [ReportServerTempDB].dbo.TempCatalog
    SET Property = @Property, Description = @Description
    WHERE ContextPath = @Path and EditSessionID = @EditSessionID
END
GO
GRANT EXECUTE ON [dbo].[SetAllProperties] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetCacheLastUsed]
    @SnapshotDataID uniqueidentifier, 
    @Timestamp datetime
AS
BEGIN
    -- Extend the cache lifetime based on the current timestamp
    -- set the last used time, which is utilized to compute which entries
    -- to evict when enforcing cache limits
    -- in the case where the cache entry is using schedule based expiration (RelativeExpiration is null)
    -- then don't update AbsoluteExpiration
    UPDATE [ReportServerTempDB].dbo.ExecutionCache
    SET		AbsoluteExpiration = ISNULL(DATEADD(n, RelativeExpiration, @Timestamp), AbsoluteExpiration),
            LastUsedTime = @Timestamp 
    WHERE SnapshotDataID = @SnapshotDataID ;
END
GO
GRANT EXECUTE ON [dbo].[SetCacheLastUsed] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetCacheOptions]
@Path as nvarchar(425),
@CacheReport as bit,
@ExpirationFlags as int,
@CacheExpiration as int = NULL
AS
DECLARE @CachePolicyID as uniqueidentifier
SELECT @CachePolicyID = (SELECT CachePolicyID 
FROM CachePolicy with (XLOCK) INNER JOIN Catalog ON Catalog.ItemID = CachePolicy.ReportID
WHERE  Catalog.Path = @Path)
IF @CachePolicyID IS NULL -- no policy exists
BEGIN
    IF @CacheReport = 1 -- create a new one
    BEGIN
        INSERT INTO CachePolicy
        (CachePolicyID, ReportID, ExpirationFlags, CacheExpiration)
        (SELECT NEWID(), ItemID, @ExpirationFlags, @CacheExpiration
        FROM Catalog WHERE Catalog.Path = @Path)
    END
    -- ELSE if it has no policy and we want to remove its policy do nothing
END
ELSE -- existing policy
BEGIN
    IF @CacheReport = 1
    BEGIN
        UPDATE CachePolicy SET ExpirationFlags = @ExpirationFlags, CacheExpiration = @CacheExpiration
        WHERE CachePolicyID = @CachePolicyID
        EXEC FlushReportFromCache @Path
    END
    ELSE
    BEGIN
        DELETE FROM CachePolicy 
        WHERE CachePolicyID = @CachePolicyID
        EXEC FlushReportFromCache @Path
    END
END
GO
GRANT EXECUTE ON [dbo].[SetCacheOptions] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetConfigurationInfo]
@Name nvarchar (260),
@Value ntext
AS
DELETE
FROM [ConfigurationInfo]
WHERE [Name] = @Name

IF @Value is not null BEGIN
   INSERT
   INTO ConfigurationInfo
   VALUES ( newid(), @Name, @Value )
END
GO
GRANT EXECUTE ON [dbo].[SetConfigurationInfo] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetDrillthroughReports]
@ReportID uniqueidentifier,
@ModelID uniqueidentifier,
@ModelItemID nvarchar(425),
@Type tinyint
AS
 SET NOCOUNT OFF
 INSERT INTO ModelDrill (ModelDrillID, ModelID, ReportID, ModelItemID, [Type])
 VALUES (newid(), @ModelID, @ReportID, @ModelItemID, @Type)
GO
GRANT EXECUTE ON [dbo].[SetDrillthroughReports] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetExecutionOptions]
@Path as nvarchar(425),
@ExecutionFlag as int,
@ExecutionChanged as bit = 0
AS
IF @ExecutionChanged = 0
BEGIN
    UPDATE Catalog SET ExecutionFlag = @ExecutionFlag WHERE Catalog.Path = @Path
END
ELSE
BEGIN
    IF (@ExecutionFlag & 3) = 2
    BEGIN   -- set it to snapshot, flush cache
        EXEC FlushReportFromCache @Path
        DELETE CachePolicy FROM CachePolicy INNER JOIN Catalog ON CachePolicy.ReportID = Catalog.ItemID
        WHERE Catalog.Path = @Path
    END

    -- now clean existing snapshot and execution time if any
    UPDATE SnapshotData
    SET PermanentRefcount = PermanentRefcount - 1
    FROM
       SnapshotData
       INNER JOIN Catalog ON SnapshotData.SnapshotDataID = Catalog.SnapshotDataID
    WHERE Catalog.Path = @Path
    
    UPDATE Catalog
    SET ExecutionFlag = @ExecutionFlag, SnapshotDataID = NULL, ExecutionTime = NULL
    WHERE Catalog.Path = @Path
END
GO
GRANT EXECUTE ON [dbo].[SetExecutionOptions] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetHistoryLimit]
@Path nvarchar (425),
@SnapshotLimit int = NULL
AS
UPDATE Catalog
SET SnapshotLimit=@SnapshotLimit
WHERE Path = @Path
GO
GRANT EXECUTE ON [dbo].[SetHistoryLimit] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetKeysForInstallation]
@InstallationID uniqueidentifier,
@SymmetricKey image = NULL,
@PublicKey image
AS

update [dbo].[Keys]
set [SymmetricKey] = @SymmetricKey, [PublicKey] = @PublicKey
where [InstallationID] = @InstallationID and [Client] = 1
GO
GRANT EXECUTE ON [dbo].[SetKeysForInstallation] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetLastModified]
@Path nvarchar (425),
@ModifiedBySid varbinary (85) = NULL,
@ModifiedByName nvarchar(260),
@AuthType int,
@ModifiedDate DateTime
AS
DECLARE @ModifiedByID uniqueidentifier
EXEC GetUserID @ModifiedBySid, @ModifiedByName, @AuthType, @ModifiedByID OUTPUT
UPDATE Catalog
SET ModifiedByID = @ModifiedByID, ModifiedDate = @ModifiedDate
WHERE Path = @Path
GO
GRANT EXECUTE ON [dbo].[SetLastModified] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetMachineName]
@MachineName nvarchar(256),
@InstallationID uniqueidentifier
AS

UPDATE [dbo].[Keys]
SET MachineName = @MachineName
WHERE [InstallationID] = @InstallationID and [Client] = 1
GO
GRANT EXECUTE ON [dbo].[SetMachineName] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- update the system policy
CREATE PROCEDURE [dbo].[SetModelItemPolicy]
@CatalogItemID as uniqueidentifier,
@ModelItemID as nvarchar(425),
@PrimarySecDesc as image,
@SecondarySecDesc as ntext = NULL,
@XmlPolicy as ntext,
@AuthType as int,
@PolicyID uniqueidentifier OUTPUT
AS 
SELECT @PolicyID = (SELECT PolicyID FROM ModelItemPolicy WHERE CatalogItemID = @CatalogItemID AND ModelItemID = @ModelItemID )
IF (@PolicyID IS NULL)
   BEGIN
     SET @PolicyID = newid()
     INSERT INTO Policies (PolicyID, PolicyFlag)
     VALUES (@PolicyID, 2)
     INSERT INTO SecData (SecDataID, PolicyID, AuthType, XmlDescription, NTSecDescPrimary, NtSecDescSecondary)
     VALUES (newid(), @PolicyID, @AuthType, @XmlPolicy, @PrimarySecDesc, @SecondarySecDesc)
     INSERT INTO ModelItemPolicy (ID, CatalogItemID, ModelItemID, PolicyID)
     VALUES (newid(), @CatalogItemID, @ModelItemID, @PolicyID)
   END
ELSE
   BEGIN
      DECLARE @SecDataID as uniqueidentifier
      SELECT @SecDataID = (SELECT SecDataID FROM SecData WHERE PolicyID = @PolicyID and AuthType = @AuthType)
      IF (@SecDataID IS NULL)
      BEGIN -- insert new sec desc's
        INSERT INTO SecData (SecDataID, PolicyID, AuthType, XmlDescription, NTSecDescPrimary, NtSecDescSecondary)
        VALUES (newid(), @PolicyID, @AuthType, @XmlPolicy, @PrimarySecDesc, @SecondarySecDesc)
      END
      ELSE
      BEGIN -- update existing sec desc's
        UPDATE SecData SET 
        XmlDescription = @XmlPolicy,
        NtSecDescPrimary = @PrimarySecDesc,
        NtSecDescSecondary = @SecondarySecDesc
        WHERE SecData.PolicyID = @PolicyID
        AND AuthType = @AuthType

      END      
   END
DELETE FROM PolicyUserRole WHERE PolicyID = @PolicyID
GO
GRANT EXECUTE ON [dbo].[SetModelItemPolicy] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetNotificationAttempt] 
@Attempt int,
@SecondsToAdd int,
@NotificationID uniqueidentifier
AS

update 
    [Notifications] 
set 
    [ProcessStart] = NULL, 
    [Attempt] = @Attempt, 
    [ProcessAfter] = DateAdd(second, @SecondsToAdd, GetUtcDate())
where
    [NotificationID] = @NotificationID
GO
GRANT EXECUTE ON [dbo].[SetNotificationAttempt] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetObjectContent]
@Path nvarchar (425),
@EditSessionID varchar(32) = NULL,
@Type int,
@Content image = NULL,
@Intermediate uniqueidentifier = NULL,
@Parameter ntext = NULL,
@LinkSourceID uniqueidentifier = NULL,
@MimeType nvarchar (260) = NULL,
@DataCacheHash varbinary(64) = NULL,
@SubType nvarchar(128) = NULL,
@ComponentID uniqueidentifier= NULL
AS

DECLARE @OldIntermediate as uniqueidentifier
DECLARE @OldPermanent as bit
IF(@EditSessionID is null)
BEGIN	
SET @OldIntermediate = (SELECT Intermediate FROM Catalog WITH (XLOCK) WHERE Path = @Path)

UPDATE SnapshotData
SET PermanentRefcount = PermanentRefcount - 1,
    -- to fix VSTS 384486 keep shared dataset compiled definition for 14 days
    ExpirationDate = case when @Type = 8 then DATEADD(d, 14, GETDATE()) ELSE ExpirationDate END,
    TransientRefcount = TransientRefcount + case when @Type = 8 then 1 ELSE 0 END
WHERE SnapshotData.SnapshotDataID = @OldIntermediate

UPDATE Catalog
SET Type=@Type, Content = @Content, Intermediate = @Intermediate, [Parameter] = @Parameter, LinkSourceID = @LinkSourceID, MimeType = @MimeType, SubType = @SubType, ComponentID = @ComponentID
WHERE Path = @Path

UPDATE SnapshotData
SET PermanentRefcount = PermanentRefcount + 1, TransientRefcount = TransientRefcount - 1
WHERE SnapshotData.SnapshotDataID = @Intermediate

EXEC FlushReportFromCache @Path

END
ELSE
BEGIN
    DECLARE @OldDataCacheHash binary(64) ;
    DECLARE @ItemID uniqueidentifier ;
    
    SELECT	@OldIntermediate = Intermediate, 
            @OldPermanent = IntermediateIsPermanent,
            @OldDataCacheHash = DataCacheHash, 
            @ItemID = TempCatalogID
    FROM [ReportServerTempDB].dbo.TempCatalog WITH (XLOCK)
    WHERE ContextPath = @Path and EditSessionID = @EditSessionID

    UPDATE [ReportServerTempDB].dbo.TempCatalog
    SET Content = @Content, 
        Intermediate = @Intermediate, 
        IntermediateIsPermanent = 0, 
        Parameter = @Parameter,
        DataCacheHash = @DataCacheHash
    WHERE ContextPath = @Path and EditSessionID = @EditSessionID
    
    UPDATE [ReportServerTempDB].dbo.SnapshotData
    SET  PermanentRefcount = PermanentRefcount - 1
    WHERE SnapshotData.SnapshotDataID = @OldIntermediate

    UPDATE [ReportServerTempDB].dbo.SnapshotData
    SET PermanentRefcount = PermanentRefcount + 1, TransientRefcount = TransientRefcount - 1
    WHERE SnapshotData.SnapshotDataID = @Intermediate 
    
    EXEC ExtendEditSessionLifetime @EditSessionID ;
    
    IF ((@OldDataCacheHash <> @DataCacheHash) OR 
		(@OldDataCacheHash IS NULL) OR 
		(@DataCacheHash IS NULL))
    BEGIN
        EXEC FlushCacheById @ItemID
    END
END
GO
GRANT EXECUTE ON [dbo].[SetObjectContent] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetParameters]
@Path nvarchar (425),
@Parameter ntext
AS
UPDATE Catalog
SET [Parameter] = @Parameter
WHERE Path = @Path
EXEC FlushReportFromCache @Path
GO
GRANT EXECUTE ON [dbo].[SetParameters] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetPersistedStreamError]
@SessionID varchar(32),
@Index int,
@AllRows bit,
@Error nvarchar(512)
AS

if @AllRows = 0
BEGIN
    UPDATE [ReportServerTempDB].dbo.PersistedStream SET Error = @Error WHERE SessionID = @SessionID and [Index] = @Index
END
ELSE
BEGIN
    UPDATE [ReportServerTempDB].dbo.PersistedStream SET Error = @Error WHERE SessionID = @SessionID
END
GO
GRANT EXECUTE ON [dbo].[SetPersistedStreamError] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- this assumes the item exists in the catalog
CREATE PROCEDURE [dbo].[SetPolicy]
@ItemName as nvarchar(425),
@ItemNameLike as nvarchar(850),
@PrimarySecDesc as image,
@SecondarySecDesc as ntext = NULL,
@XmlPolicy as ntext,
@AuthType int,
@PolicyID uniqueidentifier OUTPUT
AS 
SELECT @PolicyID = (SELECT PolicyID FROM Catalog WHERE Path = @ItemName AND PolicyRoot = 1)
IF (@PolicyID IS NULL)
   BEGIN -- this is not a policy root
     SET @PolicyID = newid()
     INSERT INTO Policies (PolicyID, PolicyFlag)
     VALUES (@PolicyID, 0)
     INSERT INTO SecData (SecDataID, PolicyID, AuthType, XmlDescription, NTSecDescPrimary, NtSecDescSecondary)
     VALUES (newid(), @PolicyID, @AuthType, @XmlPolicy, @PrimarySecDesc, @SecondarySecDesc)
     DECLARE @OldPolicyID as uniqueidentifier
     SELECT @OldPolicyID = (SELECT PolicyID FROM Catalog WHERE Path = @ItemName)
     -- update item and children that shared the old policy
     UPDATE Catalog SET PolicyID = @PolicyID, PolicyRoot = 1 WHERE Path = @ItemName 
     UPDATE Catalog SET PolicyID = @PolicyID 
    WHERE Path LIKE @ItemNameLike ESCAPE '*' 
    AND Catalog.PolicyID = @OldPolicyID
   END
ELSE
   BEGIN
      UPDATE Policies SET 
      PolicyFlag = 0
      WHERE Policies.PolicyID = @PolicyID
      DECLARE @SecDataID as uniqueidentifier
      SELECT @SecDataID = (SELECT SecDataID FROM SecData WHERE PolicyID = @PolicyID and AuthType = @AuthType)
      IF (@SecDataID IS NULL)
      BEGIN -- insert new sec desc's
        INSERT INTO SecData (SecDataID, PolicyID, AuthType, XmlDescription ,NTSecDescPrimary, NtSecDescSecondary)
        VALUES (newid(), @PolicyID, @AuthType, @XmlPolicy, @PrimarySecDesc, @SecondarySecDesc)
      END
      ELSE
      BEGIN -- update existing sec desc's
        UPDATE SecData SET 
        XmlDescription = @XmlPolicy,
        NtSecDescPrimary = @PrimarySecDesc,
        NtSecDescSecondary = @SecondarySecDesc
        WHERE SecData.PolicyID = @PolicyID
        AND AuthType = @AuthType
      END
   END
DELETE FROM PolicyUserRole WHERE PolicyID = @PolicyID
GO
GRANT EXECUTE ON [dbo].[SetPolicy] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetReencryptedDatasourceInfo]
@DSID uniqueidentifier,
@ConnectionString image = NULL,
@OriginalConnectionString image = NULL,
@UserName image = NULL,
@Password image = NULL,
@CredentialRetrieval int,
@Version int
AS

UPDATE [dbo].[DataSource]
SET
    [ConnectionString] = @ConnectionString,
    [OriginalConnectionString] = @OriginalConnectionString,
    [UserName] = @UserName,
    [Password] = @Password,
    [CredentialRetrieval] = @CredentialRetrieval,
    [Version] = @Version
WHERE [DSID] = @DSID
GO
GRANT EXECUTE ON [dbo].[SetReencryptedDatasourceInfo] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetReencryptedSubscriptionInfo]
@SubscriptionID as uniqueidentifier,
@ExtensionSettings as ntext = NULL,
@Version as int
AS

UPDATE [dbo].[Subscriptions]
SET [ExtensionSettings] = @ExtensionSettings,
    [Version] = @Version
WHERE [SubscriptionID] = @SubscriptionID
GO
GRANT EXECUTE ON [dbo].[SetReencryptedSubscriptionInfo] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetRoleProperties]
@RoleName as nvarchar(260),
@Description as nvarchar(512) = NULL,
@TaskMask as nvarchar(32),
@RoleFlags as tinyint
AS 
SET NOCOUNT OFF
DECLARE @ExistingRoleFlags as tinyint
SET @ExistingRoleFlags = (SELECT RoleFlags FROM Roles WHERE RoleName = @RoleName)
IF @ExistingRoleFlags IS NULL
BEGIN
    RETURN
END
IF @ExistingRoleFlags <> @RoleFlags
BEGIN
    RAISERROR ('Bad role flags', 16, 1)
END
UPDATE Roles SET 
Description = @Description, 
TaskMask = @TaskMask,
RoleFlags = @RoleFlags
WHERE RoleName = @RoleName
GO
GRANT EXECUTE ON [dbo].[SetRoleProperties] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetSessionCredentials]
@SessionID as varchar(32),
@OwnerSid as varbinary(85) = NULL,
@OwnerName as nvarchar(260),
@AuthType as int,
@DataSourceInfo as image = NULL,
@Expiration as datetime,
@EffectiveParams as ntext = NULL
AS

DECLARE @OwnerID uniqueidentifier
EXEC GetUserID @OwnerSid, @OwnerName, @AuthType, @OwnerID OUTPUT

EXEC DereferenceSessionSnapshot @SessionID, @OwnerID

UPDATE SE
SET
   SE.DataSourceInfo = @DataSourceInfo,
   SE.SnapshotDataID = null,
   SE.IsPermanentSnapshot = null,
   SE.SnapshotExpirationDate = null,
   SE.ShowHideInfo = null,
   SE.HasInteractivity = null,
   SE.AutoRefreshSeconds = null,
   SE.Expiration = @Expiration,
   SE.EffectiveParams = @EffectiveParams,
   SE.AwaitingFirstExecution = 1
FROM
   [ReportServerTempDB].dbo.SessionData AS SE
WHERE
   SE.SessionID = @SessionID AND
   SE.OwnerID = @OwnerID
GO
GRANT EXECUTE ON [dbo].[SetSessionCredentials] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Writes or updates session record
CREATE PROCEDURE [dbo].[SetSessionData]
@SessionID as varchar(32),
@ReportPath as nvarchar(440),
@HistoryDate as datetime = NULL,
@Timeout as int,
@AutoRefreshSeconds as int = NULL,
@EffectiveParams ntext = NULL,
@OwnerSid as varbinary (85) = NULL,
@OwnerName as nvarchar (260),
@AuthType as int,
@ShowHideInfo as image = NULL,
@DataSourceInfo as image = NULL,
@SnapshotDataID as uniqueidentifier = NULL,
@IsPermanentSnapshot as bit = NULL,
@SnapshotTimeoutSeconds as int = NULL,
@HasInteractivity as bit,
@SnapshotExpirationDate as datetime = NULL,
@AwaitingFirstExecution as bit  = NULL, 
@EditSessionID as varchar(32) = NULL,
@DataSetInfo as varbinary(max) = null
AS

DECLARE @OwnerID uniqueidentifier
EXEC GetUserID @OwnerSid, @OwnerName, @AuthType, @OwnerID OUTPUT

DECLARE @now datetime
SET @now = GETDATE()

-- is there a session for the same report ?
DECLARE @OldSnapshotDataID uniqueidentifier
DECLARE @OldIsPermanentSnapshot bit
DECLARE @OldSessionID varchar(32)

SELECT
   @OldSessionID = SessionID,
   @OldSnapshotDataID = SnapshotDataID,
   @OldIsPermanentSnapshot = IsPermanentSnapshot
FROM [ReportServerTempDB].dbo.SessionData WITH (XLOCK) 
WHERE SessionID = @SessionID

IF @OldSessionID IS NOT NULL
BEGIN -- Yes, update it
   IF @OldSnapshotDataID != @SnapshotDataID or @SnapshotDataID is NULL BEGIN
      EXEC DereferenceSessionSnapshot @SessionID, @OwnerID
   END

   UPDATE
      [ReportServerTempDB].dbo.SessionData
   SET
      SnapshotDataID = @SnapshotDataID,
      IsPermanentSnapshot = @IsPermanentSnapshot,
      Timeout = @Timeout,
      AutoRefreshSeconds = @AutoRefreshSeconds,
      SnapshotExpirationDate = @SnapshotExpirationDate,
      -- we want database session to expire later than in-memory session
      Expiration = DATEADD(s, @Timeout+10, @now),
      ShowHideInfo = @ShowHideInfo,
      DataSourceInfo = @DataSourceInfo,
      AwaitingFirstExecution = @AwaitingFirstExecution,
      DataSetInfo = @DataSetInfo      
      -- EffectiveParams = @EffectiveParams, -- no need to update user params as they are always same
      -- ReportPath = @ReportPath
      -- OwnerID = @OwnerID
   WHERE
      SessionID = @SessionID
 
   
   -- update expiration date on a snapshot that we reference
   IF @IsPermanentSnapshot != 0 BEGIN
      UPDATE
         SnapshotData
      SET
         ExpirationDate = DATEADD(n, @SnapshotTimeoutSeconds, @now)
      WHERE
         SnapshotDataID = @SnapshotDataID
   END ELSE BEGIN
      UPDATE
         [ReportServerTempDB].dbo.SnapshotData
      SET
         ExpirationDate = DATEADD(n, @SnapshotTimeoutSeconds, @now)
      WHERE
         SnapshotDataID = @SnapshotDataID
   END

END
ELSE
BEGIN -- no, insert it
   UPDATE PS
    SET PS.RefCount = 1
    FROM
        [ReportServerTempDB].dbo.PersistedStream as PS
    WHERE
        PS.SessionID = @SessionID	
        
    INSERT INTO [ReportServerTempDB].dbo.SessionData
      (SessionID, SnapshotDataID, IsPermanentSnapshot, ReportPath,
       EffectiveParams, Timeout, AutoRefreshSeconds, Expiration,
       ShowHideInfo, DataSourceInfo, OwnerID, 
       CreationTime, HasInteractivity, SnapshotExpirationDate, HistoryDate, AwaitingFirstExecution, EditSessionID, DataSetInfo)
   VALUES
      (@SessionID, @SnapshotDataID, @IsPermanentSnapshot, @ReportPath,
       @EffectiveParams, @Timeout, @AutoRefreshSeconds, DATEADD(s, @Timeout, @now),
       @ShowHideInfo, @DataSourceInfo, @OwnerID, @now,
       @HasInteractivity, @SnapshotExpirationDate, @HistoryDate, @AwaitingFirstExecution, @EditSessionID, @DataSetInfo)             
END
GO
GRANT EXECUTE ON [dbo].[SetSessionData] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetSessionParameters]
@SessionID as varchar(32),
@OwnerSid as varbinary(85) = NULL,
@OwnerName as nvarchar(260),
@AuthType as int,
@EffectiveParams as ntext = NULL
AS

DECLARE @OwnerID uniqueidentifier
EXEC GetUserID @OwnerSid, @OwnerName, @AuthType, @OwnerID OUTPUT

UPDATE SE
SET
   SE.EffectiveParams = @EffectiveParams,
   SE.AwaitingFirstExecution = 1
FROM
   [ReportServerTempDB].dbo.SessionData AS SE
WHERE
   SE.SessionID = @SessionID AND
   SE.OwnerID = @OwnerID
GO
GRANT EXECUTE ON [dbo].[SetSessionParameters] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetSnapshotChunksVersion]
@SnapshotDataID as uniqueidentifier,
@IsPermanentSnapshot as bit,
@Version as smallint
AS
declare @affectedRows int
set @affectedRows = 0
if @IsPermanentSnapshot = 1
BEGIN
   if @Version > 0
   BEGIN
      UPDATE ChunkData
      SET Version = @Version
      WHERE SnapshotDataID = @SnapshotDataID
      
      SELECT @affectedRows = @affectedRows + @@rowcount
      
      UPDATE SegmentedChunk
      SET Version = @Version
      WHERE SnapshotDataId = @SnapshotDataID      
      
      SELECT @affectedRows = @affectedRows + @@rowcount            
   END ELSE BEGIN
      UPDATE ChunkData
      SET Version = Version
      WHERE SnapshotDataID = @SnapshotDataID
      
      SELECT @affectedRows = @affectedRows + @@rowcount
      
      UPDATE SegmentedChunk
      SET Version = Version
      WHERE SnapshotDataId = @SnapshotDataID
      
      SELECT @affectedRows = @affectedRows + @@rowcount
   END   
END ELSE BEGIN
   if @Version > 0
   BEGIN
      UPDATE [ReportServerTempDB].dbo.ChunkData
      SET Version = @Version
      WHERE SnapshotDataID = @SnapshotDataID
      
      SELECT @affectedRows = @affectedRows + @@rowcount
      
      UPDATE [ReportServerTempDB].dbo.SegmentedChunk
      SET Version = @Version
      WHERE SnapshotDataId = @SnapshotDataID    
      
      SELECT @affectedRows = @affectedRows + @@rowcount
   END ELSE BEGIN
      UPDATE [ReportServerTempDB].dbo.ChunkData
      SET Version = Version
      WHERE SnapshotDataID = @SnapshotDataID
            
      SELECT @affectedRows = @affectedRows + @@rowcount
      
      UPDATE [ReportServerTempDB].dbo.SegmentedChunk
      SET Version = Version
      WHERE SnapshotDataId = @SnapshotDataID   
      
      SELECT @affectedRows = @affectedRows + @@rowcount
   END      
END
SELECT @affectedRows
GO
GRANT EXECUTE ON [dbo].[SetSnapshotChunksVersion] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetSnapshotProcessingFlags]
@SnapshotDataID as uniqueidentifier, 
@IsPermanentSnapshot as bit, 
@ProcessingFlags int
AS

if @IsPermanentSnapshot = 1 
BEGIN
	UPDATE SnapshotData
	SET ProcessingFlags = @ProcessingFlags
	WHERE SnapshotDataID = @SnapshotDataID
END ELSE BEGIN
	UPDATE [ReportServerTempDB].dbo.SnapshotData
	SET ProcessingFlags = @ProcessingFlags
	WHERE SnapshotDataID = @SnapshotDataID
END
GO
GRANT EXECUTE ON [dbo].[SetSnapshotProcessingFlags] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- update the system policy
CREATE PROCEDURE [dbo].[SetSystemPolicy]
@PrimarySecDesc as image,
@SecondarySecDesc as ntext = NULL,
@XmlPolicy as ntext,
@AuthType as int,
@PolicyID uniqueidentifier OUTPUT
AS 
SELECT @PolicyID = (SELECT PolicyID FROM Policies WHERE PolicyFlag = 1)
IF (@PolicyID IS NULL)
   BEGIN
     SET @PolicyID = newid()
     INSERT INTO Policies (PolicyID, PolicyFlag)
     VALUES (@PolicyID, 1)
     INSERT INTO SecData (SecDataID, PolicyID, AuthType, XmlDescription, NTSecDescPrimary, NtSecDescSecondary)
     VALUES (newid(), @PolicyID, @AuthType, @XmlPolicy, @PrimarySecDesc, @SecondarySecDesc)
   END
ELSE
   BEGIN
      DECLARE @SecDataID as uniqueidentifier
      SELECT @SecDataID = (SELECT SecDataID FROM SecData WHERE PolicyID = @PolicyID and AuthType = @AuthType)
      IF (@SecDataID IS NULL)
      BEGIN -- insert new sec desc's
        INSERT INTO SecData (SecDataID, PolicyID, AuthType, XmlDescription, NTSecDescPrimary, NtSecDescSecondary)
        VALUES (newid(), @PolicyID, @AuthType, @XmlPolicy, @PrimarySecDesc, @SecondarySecDesc)
      END
      ELSE
      BEGIN -- update existing sec desc's
        UPDATE SecData SET 
        XmlDescription = @XmlPolicy,
        NtSecDescPrimary = @PrimarySecDesc,
        NtSecDescSecondary = @SecondarySecDesc
        WHERE SecData.PolicyID = @PolicyID
        AND AuthType = @AuthType

      END      
   END
DELETE FROM PolicyUserRole WHERE PolicyID = @PolicyID
GO
GRANT EXECUTE ON [dbo].[SetSystemPolicy] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetUpgradeItemStatus]
@ItemName nvarchar(260),
@Status nvarchar(512)
AS
UPDATE 
    [UpgradeInfo]
SET
    [Status] = @Status
WHERE
    [Item] = @ItemName
GO
GRANT EXECUTE ON [dbo].[SetUpgradeItemStatus] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ShallowCopyChunk]
	@SnapshotId		uniqueidentifier, 
	@ChunkId		uniqueidentifier, 	
	@IsPermanent	bit, 
	@Machine		nvarchar(512),
	@NewChunkId		uniqueidentifier out
as
begin
	-- @SnapshotId & @ChunkId are the old identifiers	
	-- build the chunksegmentmapping first to prevent race 
	-- condition with cleaning it up
	select @NewChunkId = newid() ;
	if (@IsPermanent = 1) begin		
		insert ChunkSegmentMapping (ChunkId, SegmentId, StartByte, LogicalByteCount, ActualByteCount)
		select @NewChunkId, SegmentId, StartByte, LogicalByteCount, ActualByteCount
		from ChunkSegmentMapping where ChunkId = @ChunkId ;		
		
		update SegmentedChunk
		set ChunkId = @NewChunkId
		where ChunkId = @ChunkId and SnapshotDataId = @SnapshotId		
	end
	else begin
		insert [ReportServerTempDB].dbo.ChunkSegmentMapping (ChunkId, SegmentId, StartByte, LogicalByteCount, ActualByteCount)
		select @NewChunkId, SegmentId, StartByte, LogicalByteCount, ActualByteCount
		from [ReportServerTempDB].dbo.ChunkSegmentMapping where ChunkId = @ChunkId ;		
		
		-- update the machine name also, this is only really useful 
		-- for file system chunks, in which case the snapshot should
		-- have been versioned on the initial update
		update [ReportServerTempDB].dbo.SegmentedChunk
		set 
			ChunkId = @NewChunkId, 
			Machine = @Machine
		where ChunkId = @ChunkId and SnapshotDataId = @SnapshotId			
	end
end
GO
GRANT EXECUTE ON [dbo].[ShallowCopyChunk] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[StoreServerParameters]
@ServerParametersID nvarchar(32),
@Path nvarchar(425),
@CurrentDate datetime,
@Timeout int,
@Expiration datetime,
@ParametersValues image,
@ParentParametersID nvarchar(32) = NULL
AS

DECLARE @ExistingServerParametersID as nvarchar(32)
SET @ExistingServerParametersID = (SELECT ServerParametersID from [dbo].[ServerParametersInstance] WHERE ServerParametersID = @ServerParametersID)
IF @ExistingServerParametersID IS NULL -- new row
BEGIN
  INSERT INTO [dbo].[ServerParametersInstance]
    (ServerParametersID, ParentID, Path, CreateDate, ModifiedDate, Timeout, Expiration, ParametersValues)
  VALUES
    (@ServerParametersID, @ParentParametersID, @Path, @CurrentDate, @CurrentDate, @Timeout, @Expiration, @ParametersValues)
END
ELSE
BEGIN
  UPDATE [dbo].[ServerParametersInstance]
  SET Timeout = @Timeout,
  Expiration = @Expiration,
  ParametersValues = @ParametersValues,
  ModifiedDate = @CurrentDate,
  Path = @Path,
  ParentID = @ParentParametersID
  WHERE ServerParametersID = @ServerParametersID
END
GO
GRANT EXECUTE ON [dbo].[StoreServerParameters] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[TempChunkExists]
	@ChunkId uniqueidentifier
AS
BEGIN
	SELECT COUNT(1) FROM [ReportServerTempDB].dbo.SegmentedChunk
	WHERE ChunkId = @ChunkId
END
GO
GRANT EXECUTE ON [dbo].[TempChunkExists] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateActiveSubscription]
@ActiveID uniqueidentifier,
@TotalNotifications int = NULL,
@TotalSuccesses int = NULL,
@TotalFailures int = NULL
AS

if @TotalNotifications is not NULL
begin
    update ActiveSubscriptions set TotalNotifications = @TotalNotifications where ActiveID = @ActiveID
end

if @TotalSuccesses is not NULL
begin
    update ActiveSubscriptions set TotalSuccesses = TotalSuccesses + @TotalSuccesses where ActiveID = @ActiveID
end

if @TotalFailures is not NULL
begin
    update ActiveSubscriptions set TotalFailures = TotalFailures + @TotalFailures where ActiveID = @ActiveID
end

select 
    TotalNotifications, 
    TotalSuccesses, 
    TotalFailures 
from 
    ActiveSubscriptions
where
    ActiveID = @ActiveID
GO
GRANT EXECUTE ON [dbo].[UpdateActiveSubscription] TO [RSExecRole]
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
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdatePolicyPrincipal]
@PolicyID uniqueidentifier,
@PrincipalSid varbinary(85) = NULL,
@PrincipalName nvarchar(260),
@PrincipalAuthType int,
@RoleName nvarchar(260),
@PrincipalID uniqueidentifier OUTPUT,
@RoleID uniqueidentifier OUTPUT
AS 
EXEC GetPrincipalID @PrincipalSid , @PrincipalName, @PrincipalAuthType, @PrincipalID  OUTPUT
SELECT @RoleID = (SELECT RoleID FROM Roles WHERE RoleName = @RoleName)
INSERT INTO PolicyUserRole 
(ID, RoleID, UserID, PolicyID)
VALUES (newid(), @RoleID, @PrincipalID, @PolicyID)
GO
GRANT EXECUTE ON [dbo].[UpdatePolicyPrincipal] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdatePolicyRole]
@PolicyID uniqueidentifier,
@PrincipalID uniqueidentifier,
@RoleName nvarchar(260),
@RoleID uniqueidentifier OUTPUT
AS 
SELECT @RoleID = (SELECT RoleID FROM Roles WHERE RoleName = @RoleName)
INSERT INTO PolicyUserRole 
(ID, RoleID, UserID, PolicyID)
VALUES (newid(), @RoleID, @PrincipalID, @PolicyID)
GO
GRANT EXECUTE ON [dbo].[UpdatePolicyRole] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateRunningJob]
@JobID as nvarchar(32),
@JobStatus as smallint
AS
SET NOCOUNT OFF
UPDATE RunningJobs SET JobStatus = @JobStatus WHERE JobID = @JobID
GO
GRANT EXECUTE ON [dbo].[UpdateRunningJob] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateScheduleNextRunTime]
@ScheduleID as uniqueidentifier,
@NextRunTime as datetime
as
update Schedule set [NextRunTime] = @NextRunTime where [ScheduleID] = @ScheduleID
GO
GRANT EXECUTE ON [dbo].[UpdateScheduleNextRunTime] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateSnapshot]
@Path as nvarchar(425),
@SnapshotDataID as uniqueidentifier,
@executionDate as datetime
AS
DECLARE @OldSnapshotDataID uniqueidentifier
DECLARE @ExecutionFlag int

SELECT @OldSnapshotDataID = SnapshotDataID,
	   @ExecutionFlag = ExecutionFlag 
	   FROM Catalog WITH (XLOCK) WHERE Catalog.Path = @Path
	   
	-- If the report is deleted after execution snapshot is fired
	IF (@@rowcount = 0)
	BEGIN		
        RAISERROR('Report does not exist', 16, 1)
        RETURN
    END

-- update reference count in snapshot table
UPDATE SnapshotData
SET PermanentRefcount = PermanentRefcount-1
WHERE SnapshotData.SnapshotDataID = @OldSnapshotDataID

 -- If the report is not set to execution snapshot after the 
 -- update execution snapshot fired, ignore this case.
IF (@ExecutionFlag & 3) <> 2
    BEGIN
        RAISERROR('Invalid snapshot flag', 16, 1)
        RETURN
    END

-- update catalog to point to the new execution snapshot
UPDATE Catalog
SET SnapshotDataID = @SnapshotDataID, ExecutionTime = @executionDate
WHERE Catalog.Path = @Path

UPDATE SnapshotData
SET PermanentRefcount = PermanentRefcount+1, TransientRefcount = TransientRefcount-1
WHERE SnapshotData.SnapshotDataID = @SnapshotDataID
GO
GRANT EXECUTE ON [dbo].[UpdateSnapshot] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateSnapshotPaginationInfo]
@SnapshotDataID as uniqueidentifier, 
@IsPermanentSnapshot as bit, 
@PageCount as int,
@PaginationMode as smallint
AS
IF @IsPermanentSnapshot = 1
BEGIN
   UPDATE SnapshotData SET 
	PageCount = @PageCount, 	
	PaginationMode = @PaginationMode
   WHERE SnapshotDataID = @SnapshotDataID
END ELSE BEGIN
   UPDATE [ReportServerTempDB].dbo.SnapshotData SET 
	PageCount = @PageCount, 	
	PaginationMode = @PaginationMode
   WHERE SnapshotDataID = @SnapshotDataID
END
GO
GRANT EXECUTE ON [dbo].[UpdateSnapshotPaginationInfo] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateSnapshotReferences]
	@OldSnapshotId UNIQUEIDENTIFIER, 
	@NewSnapshotId UNIQUEIDENTIFIER,
	@IsPermanentSnapshot BIT,
	@TransientRefCountModifier INT,
	@UpdatedReferences INT OUTPUT	
AS 
BEGIN	
	SET @UpdatedReferences = 0
	
	IF(@IsPermanentSnapshot = 1)
	BEGIN
		-- Update Snapshot Executions		
		UPDATE [dbo].[Catalog]
		SET [SnapshotDataID] = @NewSnapshotId
		WHERE [SnapshotDataID] = @OldSnapshotId

		SELECT @UpdatedReferences = @UpdatedReferences + @@ROWCOUNT

		-- Update History
		UPDATE [dbo].[History]
		SET [SnapshotDataID] = @NewSnapshotId
		WHERE [SnapshotDataID] = @OldSnapshotId

		SELECT @UpdatedReferences = @UpdatedReferences + @@ROWCOUNT

		UPDATE [dbo].[SnapshotData]
		SET [PermanentRefcount] = [PermanentRefcount] - @UpdatedReferences,
			[TransientRefcount] = [TransientRefcount] + @TransientRefCountModifier
		WHERE [SnapshotDataID] = @OldSnapshotId

		UPDATE [dbo].[SnapshotData]
		SET [PermanentRefcount] = [PermanentRefcount] + @UpdatedReferences
		WHERE [SnapshotDataID] = @NewSnapshotId
	END
	ELSE
	BEGIN
		-- Update Execution Cache
		UPDATE [ReportServerTempDB].dbo.[ExecutionCache]
		SET [SnapshotDataID] = @NewSnapshotId
		WHERE [SnapshotDataID] = @OldSnapshotId
		
		SELECT @UpdatedReferences = @UpdatedReferences + @@ROWCOUNT
		
		UPDATE [ReportServerTempDB].dbo.[SnapshotData]
		SET [PermanentRefcount] = [PermanentRefcount] - @UpdatedReferences,
			[TransientRefcount] = [TransientRefcount] + @TransientRefCountModifier
		WHERE [SnapshotDataID] = @OldSnapshotId

		UPDATE [ReportServerTempDB].dbo.[SnapshotData]
		SET [PermanentRefcount] = [PermanentRefcount] + @UpdatedReferences
		WHERE [SnapshotDataID] = @NewSnapshotId
	END
END
GO
GRANT EXECUTE ON [dbo].[UpdateSnapshotReferences] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateSubscription]
@id uniqueidentifier,
@Locale nvarchar(260),
@OwnerSid varbinary(85) = NULL,
@OwnerName nvarchar(260),
@OwnerAuthType int,
@DeliveryExtension nvarchar(260) = NULL,
@InactiveFlags int,
@ExtensionSettings ntext = NULL,
@ModifiedBySid varbinary(85) = NULL, 
@ModifiedByName nvarchar(260),
@ModifiedByAuthType int,
@ModifiedDate datetime,
@Description nvarchar(512) = NULL,
@LastStatus nvarchar(260) = NULL,
@EventType nvarchar(260),
@MatchData ntext = NULL,
@Parameters ntext = NULL,
@DataSettings ntext = NULL,
@Version int
AS
-- Update a subscription's information.
DECLARE @ModifiedByID uniqueidentifier
DECLARE @OwnerID uniqueidentifier

EXEC GetUserID @ModifiedBySid, @ModifiedByName, @ModifiedByAuthType, @ModifiedByID OUTPUT
EXEC GetUserID @OwnerSid, @OwnerName, @OwnerAuthType, @OwnerID OUTPUT

-- Make sure there is a valid provider
update Subscriptions set
        [DeliveryExtension] = @DeliveryExtension,
        [Locale] = @Locale,
        [OwnerID] = @OwnerID,
        [InactiveFlags] = @InactiveFlags,
        [ExtensionSettings] = @ExtensionSettings,
        [ModifiedByID] = @ModifiedByID,
        [ModifiedDate] = @ModifiedDate,
        [Description] = @Description,
        [LastStatus] = @LastStatus,
        [EventType] = @EventType,
        [MatchData] = @MatchData,
        [Parameters] = @Parameters,
        [DataSettings] = @DataSettings,
    [Version] = @Version
where
    [SubscriptionID] = @id
GO
GRANT EXECUTE ON [dbo].[UpdateSubscription] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateSubscriptionLastRunInfo]
@SubscriptionID uniqueidentifier,
@Flags int,
@LastRunTime datetime,
@LastStatus nvarchar(260)
AS

update Subscriptions set
        [InactiveFlags] = @Flags,
        [LastRunTime] = @LastRunTime,
        [LastStatus] = @LastStatus
where
    [SubscriptionID] = @SubscriptionID
GO
GRANT EXECUTE ON [dbo].[UpdateSubscriptionLastRunInfo] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateSubscriptionStatus]
@SubscriptionID uniqueidentifier,
@Status nvarchar(260)
AS

update Subscriptions set
        [LastStatus] = @Status
where
    [SubscriptionID] = @SubscriptionID
GO
GRANT EXECUTE ON [dbo].[UpdateSubscriptionStatus] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateTask]
@ScheduleID uniqueidentifier,
@Name nvarchar (260),
@StartDate datetime,
@Flags int,
@NextRunTime datetime = NULL,
@LastRunTime datetime = NULL,
@EndDate datetime = NULL,
@RecurrenceType int = NULL,
@MinutesInterval int = NULL,
@DaysInterval int = NULL,
@WeeksInterval int = NULL,
@DaysOfWeek int = NULL,
@DaysOfMonth int = NULL,
@Month int = NULL,
@MonthlyWeek int = NULL,
@State int = NULL,
@LastRunStatus nvarchar (260) = NULL,
@ScheduledRunTimeout int = NULL

AS

-- Update a tasks values. ScheduleID and Report information can not be updated
Update Schedule set
        [StartDate] = @StartDate, 
        [Name] = @Name,
        [Flags] = @Flags,
        [NextRunTime] = @NextRunTime,
        [LastRunTime] = @LastRunTime,
        [EndDate] = @EndDate, 
        [RecurrenceType] = @RecurrenceType, 
        [MinutesInterval] = @MinutesInterval,
        [DaysInterval] = @DaysInterval,
        [WeeksInterval] = @WeeksInterval,
        [DaysOfWeek] = @DaysOfWeek, 
        [DaysOfMonth] = @DaysOfMonth, 
        [Month] = @Month, 
        [MonthlyWeek] = @MonthlyWeek, 
        [State] = @State, 
        [LastRunStatus] = @LastRunStatus,
        [ScheduledRunTimeout] = @ScheduledRunTimeout
where
    [ScheduleID] = @ScheduleID
GO
GRANT EXECUTE ON [dbo].[UpdateTask] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpgradeSharePointPaths]
    @OldPrefix nvarchar(440),
    @NewPrefix nvarchar(440),
    @PrefixLen int 

AS
BEGIN
UPDATE [Catalog]
  SET [Path] = @NewPrefix + SUBSTRING([Path], @PrefixLen, 5000)
  WHERE [Path] like @OldPrefix escape '*';
END
GO
GRANT EXECUTE ON [dbo].[UpgradeSharePointPaths] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpgradeSharePointSchedulePaths]
    @OldPath nvarchar(440),
    @NewPath nvarchar(440)

AS
BEGIN
-- Update Path if the pair (Name, NewPath) is unique.
UPDATE [Schedule]
  SET [Path] = @NewPath
  WHERE [Path] = @OldPath
  AND NOT EXISTS (SELECT [Name] FROM [Schedule] AS S2
                    WHERE S2.[Path] = @NewPath
                    AND S2.[Name] = [Schedule].[Name])

-- If any paths were not updated in the first pass, generate a unique name.
-- Update Name, Path to (Name + "(<ScheduleID>)", NewPath)
UPDATE [Schedule]
  SET [Path] = @NewPath,
       [Name] = [Name] + ' (' + CAST([ScheduleID] AS NCHAR(36)) + ')'
  WHERE [Path] = @OldPath
  AND NOT EXISTS (SELECT [Name] FROM [Schedule] AS S2
                    WHERE S2.[Path] = @NewPath
                    AND S2.[Name] = [Schedule].[Name] + ' (' + CAST([Schedule].[ScheduleID] AS NCHAR(36)) + ')')
END
GO
GRANT EXECUTE ON [dbo].[UpgradeSharePointSchedulePaths] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WriteChunkPortion]
@ChunkPointer binary(16),
@IsPermanentSnapshot bit,
@DataIndex int = NULL,
@DeleteLength int = NULL,
@Content image
AS

IF @IsPermanentSnapshot != 0 BEGIN
    UPDATETEXT ChunkData.Content @ChunkPointer @DataIndex @DeleteLength @Content
END ELSE BEGIN
    UPDATETEXT [ReportServerTempDB].dbo.ChunkData.Content @ChunkPointer @DataIndex @DeleteLength @Content
END
GO
GRANT EXECUTE ON [dbo].[WriteChunkPortion] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WriteChunkSegment]
	@ChunkId			uniqueidentifier,
	@IsPermanent		bit,
	@SegmentId			uniqueidentifier, 
	@DataIndex			int,
	@Length				int,
	@LogicalByteCount	int, 
	@Content			varbinary(max)
as begin
	declare @output table (actualLength int not null) ;
	if(@IsPermanent = 1) begin	
		update Segment
		set Content.write( substring(@Content, 1, @Length), @DataIndex, @Length )		
		output datalength(inserted.Content) into @output(actualLength)		
		where SegmentId = @SegmentId
		
		update ChunkSegmentMapping
		set LogicalByteCount = @LogicalByteCount, 
		    ActualByteCount = (select top 1 actualLength from @output)
		where ChunkSegmentMapping.ChunkId = @ChunkId and ChunkSegmentMapping.SegmentId = @SegmentId
	end
	else begin
		update [ReportServerTempDB].dbo.Segment
		set Content.write( substring(@Content, 1, @Length), @DataIndex, @Length )		
		output datalength(inserted.Content) into @output(actualLength)		
		where SegmentId = @SegmentId
		
		update [ReportServerTempDB].dbo.ChunkSegmentMapping
		set LogicalByteCount = @LogicalByteCount, 
		    ActualByteCount = (select top 1 actualLength from @output)
		where ChunkId = @ChunkId and SegmentId = @SegmentId
	end
	
	if(@@rowcount <> 1)
		raiserror('unexpected # of segments update', 16, 1)
end
GO
GRANT EXECUTE ON [dbo].[WriteChunkSegment] TO [RSExecRole]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WriteFirstPortionPersistedStream]
@SessionID varchar(32),
@Index int,
@Name nvarchar(260) = NULL,
@MimeType nvarchar(260) = NULL,
@Extension nvarchar(260) = NULL,
@Encoding nvarchar(260) = NULL,
@Content image
AS

UPDATE [ReportServerTempDB].dbo.PersistedStream set Content = @Content, [Name] = @Name, MimeType = @MimeType, Extension = @Extension WHERE SessionID = @SessionID AND [Index] = @Index

SELECT TEXTPTR(Content) FROM [ReportServerTempDB].dbo.PersistedStream WHERE SessionID = @SessionID AND [Index] = @Index
GO
GRANT EXECUTE ON [dbo].[WriteFirstPortionPersistedStream] TO [RSExecRole]
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
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WriteNextPortionPersistedStream]
@DataPointer binary(16),
@DataIndex int,
@DeleteLength int,
@Content image
AS

UPDATETEXT [ReportServerTempDB].dbo.PersistedStream.Content @DataPointer @DataIndex @DeleteLength @Content
GO
GRANT EXECUTE ON [dbo].[WriteNextPortionPersistedStream] TO [RSExecRole]
GO
CREATE ROUTE [AutoCreatedLocal]
AUTHORIZATION [dbo]
WITH
	ADDRESS = 'LOCAL'
GO
