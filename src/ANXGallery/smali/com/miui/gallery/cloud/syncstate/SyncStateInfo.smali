.class public Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;
.super Ljava/lang/Object;
.source "SyncStateInfo.java"


# instance fields
.field private mCloudSpaceRemainingSize:J

.field private mCloudSpaceTotalSize:J

.field private mDirtyCount:Lcom/miui/gallery/cloud/syncstate/DirtyCount;

.field private mDirtySize:J

.field private mImageSyncedCount:I

.field private volatile mInited:Z

.field private volatile mIsBatteryLow:Z

.field private volatile mIsCloudSpaceFull:Z

.field private volatile mIsDirtyChanged:Z

.field private volatile mIsLocalSpaceFull:Z

.field private volatile mIsMediaChanged:Z

.field private volatile mIsSyncedChanged:Z

.field private mLock:Ljava/lang/Object;

.field private final mObservable:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/syncstate/OnSyncStateChangeObserver;",
            ">;"
        }
    .end annotation
.end field

.field private mRefreshTimeRunnable:Ljava/lang/Runnable;

.field private mSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

.field private mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

.field private mUpdateRunnable:Ljava/lang/Runnable;

.field private mUpdateTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask<",
            "Landroid/content/Context;",
            "Ljava/lang/Void;",
            "Lcom/miui/gallery/cloud/syncstate/SyncStatus;",
            ">;"
        }
    .end annotation
.end field

.field private mVideoSyncedCount:I


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mImageSyncedCount:I

    iput v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mVideoSyncedCount:I

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mLock:Ljava/lang/Object;

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo$2;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mUpdateRunnable:Ljava/lang/Runnable;

    sget-object v0, Lcom/miui/gallery/cloud/base/SyncType;->UNKNOW:Lcom/miui/gallery/cloud/base/SyncType;

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    sget-object v0, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->UNAVAILABLE:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mObservable:Ljava/util/List;

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/DirtyCount;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/syncstate/DirtyCount;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mDirtyCount:Lcom/miui/gallery/cloud/syncstate/DirtyCount;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mObservable:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->updateSyncStatus(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;Landroid/content/Context;)Lcom/miui/gallery/cloud/syncstate/SyncStatus;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->updateSyncStatusInternal(Landroid/content/Context;)Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->triggerSync(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Lcom/miui/gallery/cloud/syncstate/SyncStatus;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Lcom/miui/gallery/cloud/syncstate/SyncStatus;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsDirtyChanged:Z

    return p0
.end method

.method static synthetic access$502(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsDirtyChanged:Z

    return p1
.end method

.method static synthetic access$600(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsSyncedChanged:Z

    return p0
.end method

.method static synthetic access$602(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsSyncedChanged:Z

    return p1
.end method

.method static synthetic access$700(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Lcom/miui/gallery/cloud/base/SyncType;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->notifyObservers()V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->doRefreshTime()V

    return-void
.end method

.method private checkIsPendingMetaData(Landroid/accounts/Account;)Z
    .locals 1

    if-eqz p1, :cond_0

    const-string v0, "com.miui.gallery.cloud.provider"

    invoke-static {p1, v0}, Landroid/content/ContentResolver;->isSyncPending(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private checkIsPendingUpload(Landroid/accounts/Account;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->checkIsPendingMetaData(Landroid/accounts/Account;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->getInstance()Lcom/miui/gallery/util/deviceprovider/UploadStatusController;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->isPending()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private checkIsSyncing(Landroid/accounts/Account;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->checkIsSyncingMetaData(Landroid/accounts/Account;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->getInstance()Lcom/miui/gallery/util/deviceprovider/UploadStatusController;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->isUploading()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private checkIsSyncingMetaData(Landroid/accounts/Account;)Z
    .locals 1

    const-string v0, "com.miui.gallery.cloud.provider"

    invoke-static {p1, v0}, Landroid/content/ContentResolver;->isSyncActive(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method private doRefreshTime()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->invalidate()V

    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 5

    iget-boolean v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mInited:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mObservable:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    iget-object v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mObservable:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_1
    iput-boolean v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mInited:Z

    :goto_0
    invoke-static {}, Lcom/miui/gallery/cloud/SpaceFullHandler;->isOwnerSpaceFull()Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsCloudSpaceFull:Z

    new-instance v0, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.DEVICE_STORAGE_LOW"

    invoke-direct {v0, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    const/4 v3, 0x0

    if-eqz v0, :cond_2

    const-string v4, "android.intent.action.DEVICE_STORAGE_LOW"

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    iput-boolean v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsLocalSpaceFull:Z

    new-instance v0, Landroid/content/IntentFilter;

    const-string v4, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-static {p1, v0}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->isPowerCanSync(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_2

    :cond_3
    const/4 v1, 0x0

    goto :goto_2

    :cond_4
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getPowerCanSync()Z

    move-result v1

    :goto_2
    iput-boolean v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsBatteryLow:Z

    return-void
.end method

.method public static isBackSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Z
    .locals 1

    if-eqz p0, :cond_1

    sget-object v0, Lcom/miui/gallery/cloud/base/SyncType;->UNKNOW:Lcom/miui/gallery/cloud/base/SyncType;

    if-eq p0, v0, :cond_0

    sget-object v0, Lcom/miui/gallery/cloud/base/SyncType;->BACKGROUND:Lcom/miui/gallery/cloud/base/SyncType;

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private isMeetPullCondition()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    const/4 v1, 0x1

    invoke-static {v1, v0}, Lcom/miui/gallery/cloud/SyncConditionManager;->checkIgnoreCancel(ILcom/miui/gallery/cloud/base/SyncType;)I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private isMeetPushCondition()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    const/4 v1, 0x4

    invoke-static {v1, v0}, Lcom/miui/gallery/cloud/SyncConditionManager;->checkIgnoreCancel(ILcom/miui/gallery/cloud/base/SyncType;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private notifyObservers()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo$1;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private startRefreshTime()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mRefreshTimeRunnable:Ljava/lang/Runnable;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo$4;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mRefreshTimeRunnable:Ljava/lang/Runnable;

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->stopRefreshTime()V

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mObservable:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mObservable:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mRefreshTimeRunnable:Ljava/lang/Runnable;

    const-wide/32 v3, 0xea60

    invoke-virtual {v1, v2, v3, v4}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private stopRefreshTime()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mRefreshTimeRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mRefreshTimeRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method private triggerSync(Landroid/content/Context;)V
    .locals 3

    const-string v0, "SyncStateInfo"

    const-string v1, "triggerSync"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    const-wide v1, 0x7fffffffffffffffL

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setDelayUpload(Z)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    return-void
.end method

.method private updateDirtyCount(Landroid/content/Context;)V
    .locals 2

    invoke-static {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getDirtyCount(Landroid/content/Context;)Lcom/miui/gallery/cloud/syncstate/DirtyCount;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mDirtyCount:Lcom/miui/gallery/cloud/syncstate/DirtyCount;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mDirtyCount:Lcom/miui/gallery/cloud/syncstate/DirtyCount;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsDirtyChanged:Z

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->updateDirtySize(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method private updateDirtySize(Landroid/content/Context;)V
    .locals 4

    invoke-static {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getDirtySize(Landroid/content/Context;)[J

    move-result-object p1

    const/4 v0, 0x0

    aget-wide v0, p1, v0

    const/4 v2, 0x1

    aget-wide v2, p1, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mDirtySize:J

    return-void
.end method

.method private updateSyncStatus(Landroid/content/Context;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mUpdateTask:Landroid/os/AsyncTask;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mUpdateTask:Landroid/os/AsyncTask;

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    :cond_0
    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo$3;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mUpdateTask:Landroid/os/AsyncTask;

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mUpdateTask:Landroid/os/AsyncTask;

    new-array v1, v1, [Landroid/content/Context;

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method private updateSyncStatusInternal(Landroid/content/Context;)Lcom/miui/gallery/cloud/syncstate/SyncStatus;
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsMediaChanged:Z

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsMediaChanged:Z

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->init(Landroid/content/Context;)V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v1

    if-nez v1, :cond_0

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->CTA_NOT_ALLOW:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccount()Landroid/accounts/Account;

    move-result-object v1

    if-nez v1, :cond_1

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->NO_ACCOUNT:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_1
    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v2

    if-nez v2, :cond_2

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->MASTER_SYNC_OFF:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_2
    const-string v2, "com.miui.gallery.cloud.provider"

    invoke-static {v1, v2}, Landroid/content/ContentResolver;->getSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNC_OFF:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_3
    invoke-static {p1}, Lcom/miui/gallery/util/SyncUtil;->isSyncPause(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string p1, "SyncStateInfo"

    const-string v0, "start refresh time"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->startRefreshTime()V

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNC_PAUSE:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_4
    const-string v2, "SyncStateInfo"

    const-string v3, "stop refresh time"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->stopRefreshTime()V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sIsFirstSynced()Z

    move-result v2

    if-nez v2, :cond_a

    invoke-direct {p0, v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->checkIsSyncingMetaData(Landroid/accounts/Account;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->updateSyncedCount(Landroid/content/Context;)V

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNCING_METADATA:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_5
    iget-boolean v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsLocalSpaceFull:Z

    if-eqz v0, :cond_6

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYSTEM_SPACE_LOW:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_6
    invoke-direct {p0, v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->checkIsPendingMetaData(Landroid/accounts/Account;)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-direct {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->isMeetPullCondition()Z

    move-result v0

    if-eqz v0, :cond_8

    iget v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mImageSyncedCount:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_7

    iget v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mVideoSyncedCount:I

    if-ne v0, v1, :cond_7

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->updateSyncedCount(Landroid/content/Context;)V

    :cond_7
    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNC_META_PENDING:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_8
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result p1

    if-nez p1, :cond_9

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->DISCONNECTED:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_9
    iget-boolean p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsBatteryLow:Z

    if-eqz p1, :cond_19

    iget-object p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncType;->isForce()Z

    move-result p1

    if-nez p1, :cond_19

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->BATTERY_LOW:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_a
    if-eqz v0, :cond_b

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->updateDirtyCount(Landroid/content/Context;)V

    :cond_b
    iget-object v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mDirtyCount:Lcom/miui/gallery/cloud/syncstate/DirtyCount;

    invoke-virtual {v2}, Lcom/miui/gallery/cloud/syncstate/DirtyCount;->getSyncableCount()I

    move-result v2

    if-nez v2, :cond_f

    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mDirtyCount:Lcom/miui/gallery/cloud/syncstate/DirtyCount;

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/syncstate/DirtyCount;->getOversizedCount()I

    move-result v1

    if-lez v1, :cond_c

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNCED_WITH_OVERSIZED_FILE:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_c
    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    sget-object v2, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNCED:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-ne v1, v2, :cond_d

    if-eqz v0, :cond_e

    :cond_d
    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->updateSyncedCount(Landroid/content/Context;)V

    :cond_e
    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNCED:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_f
    invoke-direct {p0, v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->checkIsSyncing(Landroid/accounts/Account;)Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-direct {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->isMeetPushCondition()Z

    move-result v0

    if-eqz v0, :cond_10

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNCING:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_10
    iget-boolean v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsLocalSpaceFull:Z

    if-eqz v0, :cond_11

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYSTEM_SPACE_LOW:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_11
    invoke-direct {p0, v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->checkIsPendingUpload(Landroid/accounts/Account;)Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-direct {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->isMeetPushCondition()Z

    move-result v0

    if-eqz v0, :cond_12

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNC_PENDING:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_12
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-nez v0, :cond_13

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->DISCONNECTED:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_13
    invoke-static {}, Lcom/miui/gallery/cloud/SpaceFullHandler;->isOwnerSpaceFull()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-static {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getCloudSpaceInfo(Landroid/content/Context;)Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;->getTotal()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mCloudSpaceTotalSize:J

    iget-wide v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mCloudSpaceTotalSize:J

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;->getUsed()J

    move-result-wide v2

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mCloudSpaceRemainingSize:J

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->CLOUD_SPACE_FULL:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_14
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    sget-object v1, Lcom/miui/gallery/cloud/base/SyncType;->GPRS_FORCE:Lcom/miui/gallery/cloud/base/SyncType;

    if-ne v0, v1, :cond_15

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNC_ERROR:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_15
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getBackupOnlyInWifi()Z

    move-result v0

    if-nez v0, :cond_16

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->NO_WIFI:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-ne v0, v1, :cond_17

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->triggerSync(Landroid/content/Context;)V

    goto :goto_0

    :cond_16
    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->NO_WIFI:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_17
    :goto_0
    iget-boolean p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsBatteryLow:Z

    if-eqz p1, :cond_19

    iget-object p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncType;->isForce()Z

    move-result p1

    if-eqz p1, :cond_18

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNC_ERROR:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_18
    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->BATTERY_LOW:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1

    :cond_19
    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->UNKNOWN_ERROR:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object p1
.end method

.method private updateSyncedCount(Landroid/content/Context;)V
    .locals 3

    invoke-static {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getSyncedCount(Landroid/content/Context;)[I

    move-result-object p1

    const/4 v0, 0x0

    aget v0, p1, v0

    const/4 v1, 0x1

    aget p1, p1, v1

    iget v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mImageSyncedCount:I

    if-ne v0, v2, :cond_0

    iget v2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mVideoSyncedCount:I

    if-eq p1, v2, :cond_1

    :cond_0
    iput-boolean v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsSyncedChanged:Z

    iput v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mImageSyncedCount:I

    iput p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mVideoSyncedCount:I

    :cond_1
    return-void
.end method


# virtual methods
.method public getCloudSpaceRemainingSize()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mCloudSpaceRemainingSize:J

    return-wide v0
.end method

.method public getCloudSpaceTotalSize()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mCloudSpaceTotalSize:J

    return-wide v0
.end method

.method public getDirtyCount()[I
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mDirtyCount:Lcom/miui/gallery/cloud/syncstate/DirtyCount;

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/syncstate/DirtyCount;->getTotalImageCount()I

    move-result v1

    const/4 v2, 0x0

    aput v1, v0, v2

    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mDirtyCount:Lcom/miui/gallery/cloud/syncstate/DirtyCount;

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/syncstate/DirtyCount;->getTotalVideoCount()I

    move-result v1

    const/4 v2, 0x1

    aput v1, v0, v2

    return-object v0
.end method

.method public getDirtySize()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mDirtySize:J

    return-wide v0
.end method

.method public getResumeInterval(Landroid/content/Context;)J
    .locals 4

    invoke-static {p1}, Lcom/miui/gallery/util/SyncUtil;->getResumeTime(Landroid/content/Context;)J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public getSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-object v0
.end method

.method public getSyncType()Lcom/miui/gallery/cloud/base/SyncType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    return-object v0
.end method

.method public getSyncedCount()[I
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [I

    iget v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mImageSyncedCount:I

    const/4 v2, 0x0

    aput v1, v0, v2

    iget v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mVideoSyncedCount:I

    const/4 v2, 0x1

    aput v1, v0, v2

    return-object v0
.end method

.method invalidate()V
    .locals 4

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mUpdateRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->hasCallbacksCompat(Ljava/lang/Runnable;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "SyncStateInfo"

    const-string v1, "has pending runnable, ignore"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mUpdateRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method onSyncCommandDispatched()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->invalidate()V

    return-void
.end method

.method registerObserver(Lcom/miui/gallery/cloud/syncstate/OnSyncStateChangeObserver;)V
    .locals 4

    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mObservable:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mObservable:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mObservable:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->UNAVAILABLE:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-eq v0, v1, :cond_0

    invoke-interface {p1, p0}, Lcom/miui/gallery/cloud/syncstate/OnSyncStateChangeObserver;->onSyncStateChanged(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V

    :cond_0
    return-void

    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Observer "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is already registered."

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The observer is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method setIsBatteryLow(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsBatteryLow:Z

    if-eq v0, p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->invalidate()V

    :cond_0
    iput-boolean p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsBatteryLow:Z

    return-void
.end method

.method setIsLocalSpaceFull(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsLocalSpaceFull:Z

    if-eq v0, p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->invalidate()V

    :cond_0
    iput-boolean p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsLocalSpaceFull:Z

    return-void
.end method

.method setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    if-eq v1, p1, :cond_0

    const-string v1, "SyncStateInfo"

    const-string v2, "setSyncType old: %s, new: %s"

    iget-object v3, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-static {v1, v2, v3, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->invalidate()V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method triggerMediaChanged()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mIsMediaChanged:Z

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->invalidate()V

    return-void
.end method

.method unregisterObserver(Lcom/miui/gallery/cloud/syncstate/OnSyncStateChangeObserver;)V
    .locals 4

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mObservable:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mObservable:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->mObservable:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    monitor-exit v0

    return-void

    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Observer "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " was not registered."

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The observer is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
