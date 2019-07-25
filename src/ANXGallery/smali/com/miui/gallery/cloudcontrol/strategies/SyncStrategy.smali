.class public Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;
.super Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;
.source "SyncStrategy.java"


# instance fields
.field private isAutoDownload:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "auto_download"
    .end annotation
.end field

.field private isAutoDownloadBackPeriodic:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "auto-download-in-back-periodic"
    .end annotation
.end field

.field private isAutoDownloadForePeriodic:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "auto-download-in-fore-periodic"
    .end annotation
.end field

.field private isAutoDownloadRequireDeviceIdle:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "auto-download-require-device-idle"
    .end annotation
.end field

.field private isAutoDownloadShare:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "auto_download_share"
    .end annotation
.end field

.field private isFrontForManualDownload:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "front_for_manual_download"
    .end annotation
.end field

.field private isGuideCloudInternational:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "guide-cloud-for-international-build"
    .end annotation
.end field

.field private isMonitorBackground:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "monitor_background"
    .end annotation
.end field

.field private isMonitorEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "monitor_enable"
    .end annotation
.end field

.field private isMonitorSyncTime:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "monitor_sync_time"
    .end annotation
.end field

.field private isMonitorTraffic:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "monitor_traffic"
    .end annotation
.end field

.field private isSupportBackupOnlyWifi:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "support_backup_only_wifi"
    .end annotation
.end field

.field private mAutoDownloadNumInForeground:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "auto-download-num-in-foreground"
    .end annotation
.end field

.field private mAutoDownloadOwnerSyncedImage:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "auto-download-owner-synced-image"
    .end annotation
.end field

.field private mAutoDownloadShareSyncedImage:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "auto-download-share-synced-image"
    .end annotation
.end field

.field private mAutoDownloadSpaceLimit:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "auto-download-space-limit"
    .end annotation
.end field

.field private mAutoDownloadType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "download_type"
    .end annotation
.end field

.field private mDelayUploadTime:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "delay-upload-time"
    .end annotation
.end field

.field private mIntervalForActivePull:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "interval_for_active_pull"
    .end annotation
.end field

.field private mMaxDownloadTimes:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "max-download-times-when-timeout"
    .end annotation
.end field

.field private mMaxTempOperationServerTagCapacity:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "max-capacity-temp-operation-server-tag"
    .end annotation
.end field

.field private mMonitorBackBufferTime:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "monitor_background_buffer_time"
    .end annotation
.end field

.field private mMonitorBackUpperTime:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "monitor_background_upper_time"
    .end annotation
.end field

.field private mMonitorCheckInterval:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "monitor_check_interval"
    .end annotation
.end field

.field private mMonitorSyncUpperTime:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "monitor_sync_upper_time"
    .end annotation
.end field

.field private mMonitorTrafficStep:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "monitor_traffic_step"
    .end annotation
.end field

.field private mOnlyChargingAcquireWakelock:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "only-charging-acquire-wakelock"
    .end annotation
.end field

.field private mOnlyScreenOffAcquireWakelock:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "only-screen-off-acquire-wakelock"
    .end annotation
.end field

.field private mTotalOwnerSaveThumbnailCountLimit:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "total-owner-save-thumbnail-count-limit"
    .end annotation
.end field

.field private mTotalSharerSaveThumbnailCountLimit:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "total-sharer-save-thumbnail-count-limit"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 5

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;-><init>()V

    const/16 v0, 0x2710

    iput v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mTotalOwnerSaveThumbnailCountLimit:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mTotalSharerSaveThumbnailCountLimit:I

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mDelayUploadTime:J

    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mOnlyScreenOffAcquireWakelock:Z

    iput-boolean v3, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mOnlyChargingAcquireWakelock:Z

    const/16 v4, 0x1e

    iput v4, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMaxTempOperationServerTagCapacity:I

    const v4, 0x3e4ccccd    # 0.2f

    iput v4, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mAutoDownloadSpaceLimit:F

    const/16 v4, 0x1f4

    iput v4, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mAutoDownloadNumInForeground:I

    iput-boolean v3, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mAutoDownloadOwnerSyncedImage:Z

    iput-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mAutoDownloadShareSyncedImage:Z

    iput-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownloadBackPeriodic:Z

    iput-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownloadForePeriodic:Z

    iput-boolean v3, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownloadRequireDeviceIdle:Z

    iput-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isGuideCloudInternational:Z

    iput v3, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMaxDownloadTimes:I

    iput-boolean v3, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownload:Z

    iput v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mAutoDownloadType:I

    iput-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownloadShare:Z

    iput-boolean v3, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isSupportBackupOnlyWifi:Z

    iput-boolean v3, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isMonitorEnable:Z

    iput-wide v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMonitorCheckInterval:J

    iput-boolean v3, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isMonitorBackground:Z

    const-wide/16 v1, 0x3a98

    iput-wide v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMonitorBackBufferTime:J

    const-wide/32 v1, 0x1d4c0

    iput-wide v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMonitorBackUpperTime:J

    iput-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isMonitorTraffic:Z

    const-wide/32 v1, 0x6400000

    iput-wide v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMonitorTrafficStep:J

    iput-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isMonitorSyncTime:Z

    const-wide/32 v0, 0x1b7740

    iput-wide v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMonitorSyncUpperTime:J

    iput-boolean v3, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isFrontForManualDownload:Z

    const-wide/32 v0, 0xa4cb80

    iput-wide v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mIntervalForActivePull:J

    return-void
.end method

.method public static createDefault()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;
    .locals 1

    new-instance v0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    invoke-direct {v0}, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;-><init>()V

    return-object v0
.end method


# virtual methods
.method public getAutoDownloadSpaceLimit()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mAutoDownloadSpaceLimit:F

    return v0
.end method

.method public getAutoDownloadType()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mAutoDownloadType:I

    return v0
.end method

.method public getDelayUploadTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mDelayUploadTime:J

    return-wide v0
.end method

.method public getIntervalForActivePull()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mIntervalForActivePull:J

    return-wide v0
.end method

.method public getMaxDownloadTimes()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMaxDownloadTimes:I

    return v0
.end method

.method public getMaxTempOperationServerTagCapacity()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMaxTempOperationServerTagCapacity:I

    return v0
.end method

.method public getMonitorBackBufferTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMonitorBackBufferTime:J

    return-wide v0
.end method

.method public getMonitorBackUpperTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMonitorBackUpperTime:J

    return-wide v0
.end method

.method public getMonitorCheckInterval()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMonitorCheckInterval:J

    return-wide v0
.end method

.method public getMonitorSyncUpperTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMonitorSyncUpperTime:J

    return-wide v0
.end method

.method public getMonitorTrafficStep()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMonitorTrafficStep:J

    return-wide v0
.end method

.method public isAutoDownload()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownload:Z

    return v0
.end method

.method public isAutoDownloadRequireDeviceIdle()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownloadRequireDeviceIdle:Z

    return v0
.end method

.method public isAutoDownloadShare()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownloadShare:Z

    return v0
.end method

.method public isFrontForManualDownload()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isFrontForManualDownload:Z

    return v0
.end method

.method public isGuideCloudInternational()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isGuideCloudInternational:Z

    return v0
.end method

.method public isMonitorBackground()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isMonitorBackground:Z

    return v0
.end method

.method public isMonitorEnable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isMonitorEnable:Z

    return v0
.end method

.method public isMonitorSyncTime()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isMonitorSyncTime:Z

    return v0
.end method

.method public isMonitorTraffic()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isMonitorTraffic:Z

    return v0
.end method

.method public isOnlyChargingAcquireWakelock()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mOnlyChargingAcquireWakelock:Z

    return v0
.end method

.method public isOnlyScreenOffAcquireWakelock()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mOnlyScreenOffAcquireWakelock:Z

    return v0
.end method

.method public isSupportBackupOnlyWifi()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isSupportBackupOnlyWifi:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SyncStrategy{mTotalOwnerSaveThumbnailCountLimit="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mTotalOwnerSaveThumbnailCountLimit:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mTotalSharerSaveThumbnailCountLimit="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mTotalSharerSaveThumbnailCountLimit:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mDelayUploadTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mDelayUploadTime:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mOnlyScreenOffAcquireWakelock="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mOnlyScreenOffAcquireWakelock:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mOnlyChargingAcquireWakelock="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mOnlyChargingAcquireWakelock:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mMaxTempOperationServerTagCapacity="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMaxTempOperationServerTagCapacity:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mAutoDownloadSpaceLimit="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mAutoDownloadSpaceLimit:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", mAutoDownloadNumInForeground="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mAutoDownloadNumInForeground:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mAutoDownloadOwnerSyncedImage="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mAutoDownloadOwnerSyncedImage:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mAutoDownloadShareSyncedImage="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mAutoDownloadShareSyncedImage:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isAutoDownloadBackPeriodic="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownloadBackPeriodic:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isAutoDownloadForePeriodic="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownloadForePeriodic:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isAutoDownloadRequireDeviceIdle="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownloadRequireDeviceIdle:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isGuideCloudInternational="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isGuideCloudInternational:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isAutoDownload="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownload:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mAutoDownloadType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mAutoDownloadType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", isAutoDownloadShare="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownloadShare:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isSupportBackupOnlyWifi="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isSupportBackupOnlyWifi:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isMonitorEnable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isMonitorEnable:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mMonitorCheckInterval="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMonitorCheckInterval:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", isMonitorBackground="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isMonitorBackground:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mMonitorBackBufferTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMonitorBackBufferTime:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mMonitorBackUpperTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMonitorBackUpperTime:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", isMonitorTraffic="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isMonitorTraffic:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mMonitorTrafficStep="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMonitorTrafficStep:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", isMonitorSyncTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isMonitorSyncTime:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mMonitorSyncUpperTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mMonitorSyncUpperTime:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", isFrontForManualDownload="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isFrontForManualDownload:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mIntervalForActivePull="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->mIntervalForActivePull:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
