.class Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;
.super Ljava/lang/Object;
.source "SyncStateObserver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$FirstPulledReceiver;,
        Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncSettingObserver;,
        Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$MediaObserver;,
        Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncContentObserver;,
        Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$UploadingObserver;,
        Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncRequestDispatchedReceiver;,
        Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$DeviceStorageStateReceiver;,
        Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$PowerChangedReceiver;,
        Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$NetworkReceiver;,
        Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$CTAReceiver;
    }
.end annotation


# instance fields
.field private mCtaReceiver:Landroid/content/BroadcastReceiver;

.field private mDeviceStorageReceiver:Landroid/content/BroadcastReceiver;

.field private mFirstPulledReceiver:Landroid/content/BroadcastReceiver;

.field private mMediaObserver:Landroid/database/ContentObserver;

.field private mNetworkReceiver:Landroid/content/BroadcastReceiver;

.field private mPowerStatusReceiver:Landroid/content/BroadcastReceiver;

.field private mRegisterCount:I

.field private mSyncCommandDispatchedReceiver:Landroid/content/BroadcastReceiver;

.field private mSyncOnlyWifiObeserver:Landroid/database/ContentObserver;

.field private mSyncSettingObserver:Ljava/lang/Object;

.field private mUploadingObserver:Landroid/database/ContentObserver;


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mRegisterCount:I

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->doRegister(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->doUnregister(Landroid/content/Context;)V

    return-void
.end method

.method private doRegister(Landroid/content/Context;)V
    .locals 6

    invoke-direct {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->ensureObservers()V

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->initState(Landroid/content/Context;)V

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.miui.gallery.action.CTA_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mCtaReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE_IMMEDIATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mNetworkReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v0, v3, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mPowerStatusReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v2

    invoke-virtual {p1, v1, v0, v3, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.DEVICE_STORAGE_LOW"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.action.DEVICE_STORAGE_OK"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mDeviceStorageReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v2

    invoke-virtual {p1, v1, v0, v3, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.miui.gallery.SYNC_COMMAND_DISPATCHED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mSyncCommandDispatchedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->UPLOAD_STATE_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mUploadingObserver:Landroid/database/ContentObserver;

    const/4 v4, 0x1

    invoke-virtual {v0, v1, v4, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mMediaObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v4, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$ShareImage;->SHARE_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mMediaObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v4, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->SYNC_SETTINGS_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mSyncOnlyWifiObeserver:Landroid/database/ContentObserver;

    const/4 v5, 0x0

    invoke-virtual {v0, v1, v5, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncSettingObserver;

    invoke-direct {v0, p0, v3}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncSettingObserver;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$1;)V

    invoke-static {v4, v0}, Landroid/content/ContentResolver;->addStatusChangeListener(ILandroid/content/SyncStatusObserver;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mSyncSettingObserver:Ljava/lang/Object;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.miui.gallery.action.FIRST_SYNC_FINISHED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mFirstPulledReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    return-void
.end method

.method private doUnregister(Landroid/content/Context;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mCtaReceiver:Landroid/content/BroadcastReceiver;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mCtaReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v2}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mCtaReceiver:Landroid/content/BroadcastReceiver;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mNetworkReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mNetworkReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mNetworkReceiver:Landroid/content/BroadcastReceiver;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mPowerStatusReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mPowerStatusReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mPowerStatusReceiver:Landroid/content/BroadcastReceiver;

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mDeviceStorageReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mDeviceStorageReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mDeviceStorageReceiver:Landroid/content/BroadcastReceiver;

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mSyncCommandDispatchedReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_4

    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mSyncCommandDispatchedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v2}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mSyncCommandDispatchedReceiver:Landroid/content/BroadcastReceiver;

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mUploadingObserver:Landroid/database/ContentObserver;

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mUploadingObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    iput-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mUploadingObserver:Landroid/database/ContentObserver;

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mMediaObserver:Landroid/database/ContentObserver;

    if-eqz v0, :cond_6

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mMediaObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    iput-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mMediaObserver:Landroid/database/ContentObserver;

    :cond_6
    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mSyncOnlyWifiObeserver:Landroid/database/ContentObserver;

    if-eqz v0, :cond_7

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mSyncOnlyWifiObeserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    iput-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mSyncOnlyWifiObeserver:Landroid/database/ContentObserver;

    :cond_7
    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mSyncSettingObserver:Ljava/lang/Object;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mSyncSettingObserver:Ljava/lang/Object;

    invoke-static {v0}, Landroid/content/ContentResolver;->removeStatusChangeListener(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mSyncSettingObserver:Ljava/lang/Object;

    :cond_8
    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mFirstPulledReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_9

    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mFirstPulledReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mFirstPulledReceiver:Landroid/content/BroadcastReceiver;

    :cond_9
    return-void
.end method

.method private ensureObservers()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mNetworkReceiver:Landroid/content/BroadcastReceiver;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$CTAReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$CTAReceiver;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$1;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mCtaReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$NetworkReceiver;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$NetworkReceiver;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mNetworkReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$PowerChangedReceiver;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$PowerChangedReceiver;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mPowerStatusReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$DeviceStorageStateReceiver;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$DeviceStorageStateReceiver;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$1;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mDeviceStorageReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncRequestDispatchedReceiver;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncRequestDispatchedReceiver;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$1;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mSyncCommandDispatchedReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$UploadingObserver;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$UploadingObserver;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mUploadingObserver:Landroid/database/ContentObserver;

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$MediaObserver;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$MediaObserver;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mMediaObserver:Landroid/database/ContentObserver;

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncContentObserver;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncContentObserver;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mSyncOnlyWifiObeserver:Landroid/database/ContentObserver;

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncSettingObserver;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncSettingObserver;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$1;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mSyncSettingObserver:Ljava/lang/Object;

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$FirstPulledReceiver;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$FirstPulledReceiver;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$1;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mFirstPulledReceiver:Landroid/content/BroadcastReceiver;

    :cond_0
    return-void
.end method

.method private initState(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p1, v0}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->isPowerCanSync(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result p1

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setPowerCanSync(Z)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mMediaObserver:Landroid/database/ContentObserver;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/database/ContentObserver;->onChange(Z)V

    return-void
.end method


# virtual methods
.method register(Landroid/content/Context;)V
    .locals 2

    const-string v0, "SyncStateObserver"

    const-string v1, "register %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mRegisterCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mRegisterCount:I

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$1;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method unregister(Landroid/content/Context;)V
    .locals 2

    const-string v0, "SyncStateObserver"

    const-string v1, "unregister %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mRegisterCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->mRegisterCount:I

    if-gtz v0, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$2;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
