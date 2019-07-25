.class public Lcom/miui/gallery/preference/GalleryPreferences$Sync;
.super Ljava/lang/Object;
.source "GalleryPreferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/preference/GalleryPreferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Sync"
.end annotation


# static fields
.field private static final DEFAULT_AUTO_BATCH_DOWNLOAD:Z

.field private static final DEFAULT_DOWNLOAD_TYPE:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getSyncStrategy()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownload()Z

    move-result v0

    sput-boolean v0, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->DEFAULT_AUTO_BATCH_DOWNLOAD:Z

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getSyncStrategy()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->getAutoDownloadType()I

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "thumbnail"

    goto :goto_0

    :cond_0
    const-string v0, "origin"

    :goto_0
    sput-object v0, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->DEFAULT_DOWNLOAD_TYPE:Ljava/lang/String;

    return-void
.end method

.method public static clearActivePullTimes()V
    .locals 1

    const-string v0, "active_pull_times"

    invoke-static {v0}, Lcom/miui/gallery/preference/PreferenceHelper;->removeKey(Ljava/lang/String;)V

    return-void
.end method

.method public static clearFirstSyncFailCount()V
    .locals 1

    const-string v0, "first_sync_fail_count"

    invoke-static {v0}, Lcom/miui/gallery/preference/PreferenceHelper;->removeKey(Ljava/lang/String;)V

    return-void
.end method

.method public static getActivePullTimes()I
    .locals 2

    const-string v0, "active_pull_times"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getAutoDownloadTime()J
    .locals 3

    const-string v0, "auto_download_time"

    const-wide/16 v1, -0x1

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getBackupOnlyInWifi()Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/FeatureUtil;->isSupportBackupOnlyWifi()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    const-string v0, "backup_only_in_wifi"

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 2

    const-string v0, "download_type"

    sget-object v1, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->DEFAULT_DOWNLOAD_TYPE:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "thumbnail"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object v0

    :cond_0
    const-string v1, "origin"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getEverRefillLocalGroupId()Z
    .locals 2

    const-string v0, "ever_refill_local_group_id"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getEverSyncedSystemAlbum()Z
    .locals 2

    const-string v0, "ever_synced_system_album"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getFirstSyncFailCount()I
    .locals 2

    const-string v0, "first_sync_fail_count"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getFirstSyncStartTime()J
    .locals 3

    const-string v0, "first_sync_start_time"

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getIsPlugged()Z
    .locals 2

    const-string v0, "is_plugged"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/MemoryPreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getLastSyncTimestamp()J
    .locals 3

    const-string v0, "last_sync_timestamp"

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/MemoryPreferenceHelper;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getPowerCanSync()Z
    .locals 2

    const-string v0, "power_can_sync"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/MemoryPreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getSyncCompletelyFinish()Z
    .locals 2

    const-string v0, "sync_completely_finish"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static increaseActivePullTimes()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getActivePullTimes()I

    move-result v0

    const-string v1, "active_pull_times"

    add-int/lit8 v0, v0, 0x1

    invoke-static {v1, v0}, Lcom/miui/gallery/preference/PreferenceHelper;->putInt(Ljava/lang/String;I)V

    return-void
.end method

.method public static increaseFirstSyncFailCount()V
    .locals 2

    const-string v0, "first_sync_fail_count"

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getFirstSyncFailCount()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->putInt(Ljava/lang/String;I)V

    return-void
.end method

.method public static isAutoDownload()Z
    .locals 2

    const-string v0, "auto_download"

    sget-boolean v1, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->DEFAULT_AUTO_BATCH_DOWNLOAD:Z

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isDeviceStorageLow()Z
    .locals 2

    const-string v0, "device_storage_low"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/MemoryPreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isEverAutoDownloaded()Z
    .locals 2

    const-string v0, "ever_auto_download"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static remove()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/preference/PreferenceHelper;->getPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "backup_only_in_wifi"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "sync_completely_finish"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "slim_after_backuped_v2"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "ever_synced_system_album"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "ever_auto_download"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "auto_download_time"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "download_type"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "auto_download"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "active_pull_times"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "first_sync_start_time"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "first_sync_fail_count"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public static setAutoDownload(Z)V
    .locals 1

    const-string v0, "auto_download"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setAutoDownloadTime(J)V
    .locals 1

    const-string v0, "auto_download_time"

    invoke-static {v0, p0, p1}, Lcom/miui/gallery/preference/PreferenceHelper;->putLong(Ljava/lang/String;J)V

    return-void
.end method

.method public static setBackupOnlyInWifi(Z)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/util/FeatureUtil;->isSupportBackupOnlyWifi()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "backup_only_in_wifi"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setDeviceStorageLow(Z)V
    .locals 1

    const-string v0, "device_storage_low"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/MemoryPreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setDownloadType(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne p0, v1, :cond_0

    const-string v1, "download_type"

    const-string v2, "thumbnail"

    invoke-static {v1, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne p0, v1, :cond_1

    const-string v1, "download_type"

    const-string v2, "origin"

    invoke-static {v1, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    if-eq v0, p0, :cond_2

    const-string p0, "auto_download_time"

    invoke-static {p0}, Lcom/miui/gallery/preference/PreferenceHelper;->removeKey(Ljava/lang/String;)V

    const-string p0, "ever_auto_download"

    invoke-static {p0}, Lcom/miui/gallery/preference/PreferenceHelper;->removeKey(Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public static setEverAutoDownloaded()V
    .locals 2

    const-string v0, "ever_auto_download"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setEverRefillLocalGroupId()V
    .locals 2

    const-string v0, "ever_refill_local_group_id"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setEverSyncedSystemAlbum()V
    .locals 2

    const-string v0, "ever_synced_system_album"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setFirstSyncStartTime(J)V
    .locals 5

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getFirstSyncStartTime()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    cmp-long v0, p0, v2

    if-lez v0, :cond_0

    const-string v0, "first_sync_start_time"

    invoke-static {v0, p0, p1}, Lcom/miui/gallery/preference/PreferenceHelper;->putLong(Ljava/lang/String;J)V

    :cond_0
    return-void
.end method

.method public static setIsPlugged(Z)V
    .locals 1

    const-string v0, "is_plugged"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/MemoryPreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setLastSyncTimestamp(J)V
    .locals 1

    const-string v0, "last_sync_timestamp"

    invoke-static {v0, p0, p1}, Lcom/miui/gallery/preference/MemoryPreferenceHelper;->putLong(Ljava/lang/String;J)V

    return-void
.end method

.method public static setPowerCanSync(Z)V
    .locals 1

    const-string v0, "power_can_sync"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/MemoryPreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setSyncCompletelyFinish(Z)V
    .locals 1

    const-string v0, "sync_completely_finish"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method
