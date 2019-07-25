.class public final Lcom/miui/gallery/cloud/download/BatchDownloadManager;
.super Ljava/lang/Object;
.source "BatchDownloadManager.java"

# interfaces
.implements Landroid/os/Handler$Callback;
.implements Lcom/miui/gallery/cloud/download/DownloadObserver$OnConditionChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/download/BatchDownloadManager$ItemDownloadListener;,
        Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;,
        Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;,
        Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;,
        Lcom/miui/gallery/cloud/download/BatchDownloadManager$SingletonHolder;
    }
.end annotation


# static fields
.field private static final COUNT_STAGE:[I

.field private static volatile sHasDownloaded:Z


# instance fields
.field private mBatchDownloadListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mCollectionLock:Ljava/lang/Object;

.field private final mDispatchLock:Ljava/lang/Object;

.field private mDispatchTask:Lcom/miui/gallery/threadpool/Future;

.field private mDownloadItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;",
            ">;"
        }
    .end annotation
.end field

.field private mDownloadItemsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;",
            ">;"
        }
    .end annotation
.end field

.field private mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

.field private mError:Lcom/miui/gallery/error/core/ErrorCode;

.field private mFailItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;",
            ">;"
        }
    .end annotation
.end field

.field private mOptionsBuilder:Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

.field private mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mSuccessItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;",
            ">;"
        }
    .end annotation
.end field

.field private mUIHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->COUNT_STAGE:[I

    const/4 v0, 0x0

    sput-boolean v0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->sHasDownloaded:Z

    return-void

    nop

    :array_0
    .array-data 4
        0x14
        0x32
        0x64
        0xc8
        0x1f4
        0x3e8
        0xbb8
        0x1388
        0x2710
    .end array-data
.end method

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mCollectionLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDispatchLock:Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->NO_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mError:Lcom/miui/gallery/error/core/ErrorCode;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mBatchDownloadListeners:Ljava/util/List;

    new-instance v0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$ItemDownloadListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$ItemDownloadListener;-><init>(Lcom/miui/gallery/cloud/download/BatchDownloadManager;Lcom/miui/gallery/cloud/download/BatchDownloadManager$1;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItemsMap:Ljava/util/Map;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItems:Ljava/util/List;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mSuccessItems:Ljava/util/List;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mFailItems:Ljava/util/List;

    new-instance v0, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mOptionsBuilder:Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mUIHandler:Landroid/os/Handler;

    invoke-static {}, Lcom/miui/gallery/cloud/download/DownloadObserver;->getInstance()Lcom/miui/gallery/cloud/download/DownloadObserver;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/miui/gallery/cloud/download/DownloadObserver;->register(Landroid/content/Context;Lcom/miui/gallery/cloud/download/DownloadObserver$OnConditionChangeListener;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/download/BatchDownloadManager$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;-><init>()V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/cloud/download/BatchDownloadManager;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->statStartDownload(I)V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/cloud/download/BatchDownloadManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->statEndDownload()V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/cloud/download/BatchDownloadManager;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->onItemDownloadSuccess(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/cloud/download/BatchDownloadManager;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->onItemDownloadFail(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/miui/gallery/cloud/download/BatchDownloadManager;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->onItemDownloadCancel(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/cloud/download/BatchDownloadManager;)Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getAutoDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/cloud/download/BatchDownloadManager;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/cloud/download/BatchDownloadManager;)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mOptionsBuilder:Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/cloud/download/BatchDownloadManager;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->checkCondition()Z

    move-result p0

    return p0
.end method

.method static synthetic access$702(Z)Z
    .locals 0

    sput-boolean p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->sHasDownloaded:Z

    return p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/cloud/download/BatchDownloadManager;Ljava/util/List;Lcom/miui/gallery/sdk/download/DownloadOptions;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->download(Ljava/util/List;Lcom/miui/gallery/sdk/download/DownloadOptions;)V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/cloud/download/BatchDownloadManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->callbackBatchProgress()V

    return-void
.end method

.method private callbackBatchCancelled()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->callbackBatchCancelled(Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;)V

    return-void
.end method

.method private callbackBatchCancelled(Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mUIHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method private callbackBatchEnd()V
    .locals 5

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->callbackBatchEnd(Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;)V

    const-string v0, "BatchDownloadManager"

    const-string v1, "download %s end success[%s], total[%s], error %s"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getAutoDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mSuccessItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mError:Lcom/miui/gallery/error/core/ErrorCode;

    const/4 v4, 0x3

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private callbackBatchEnd(Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mUIHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method private callbackBatchProgress()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->callbackBatchProgress(Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;)V

    return-void
.end method

.method private callbackBatchProgress(Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mUIHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method public static canAutoDownload()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccount()Landroid/accounts/Account;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->isAutoDownload()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sIsFirstSynced()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private cancelTask()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDispatchTask:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDispatchTask:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDispatchTask:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    return-void
.end method

.method private checkCondition()Z
    .locals 3

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "BatchDownloadManager"

    const-string v2, "condition cta not allowed"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->NO_CTA_PERMISSION:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p0, v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->setError(Lcom/miui/gallery/error/core/ErrorCode;)V

    return v1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "BatchDownloadManager"

    const-string v2, "condition no network"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->NO_NETWORK:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p0, v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->setError(Lcom/miui/gallery/error/core/ErrorCode;)V

    return v1

    :cond_1
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "BatchDownloadManager"

    const-string v2, "condition no wifi"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->NO_WIFI_CONNECTED:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p0, v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->setError(Lcom/miui/gallery/error/core/ErrorCode;)V

    return v1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mOptionsBuilder:Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->build()Lcom/miui/gallery/sdk/download/DownloadOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/DownloadOptions;->isRequireCharging()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getIsPlugged()Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "BatchDownloadManager"

    const-string v2, "condition not charging"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->NO_CHARGING:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p0, v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->setError(Lcom/miui/gallery/error/core/ErrorCode;)V

    return v1

    :cond_3
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getPowerCanSync()Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "BatchDownloadManager"

    const-string v2, "condition low power"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->POWER_LOW:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p0, v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->setError(Lcom/miui/gallery/error/core/ErrorCode;)V

    return v1

    :cond_4
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->isDeviceStorageLow()Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "BatchDownloadManager"

    const-string v2, "condition low storage"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->STORAGE_LOW:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p0, v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->setError(Lcom/miui/gallery/error/core/ErrorCode;)V

    return v1

    :cond_5
    const/4 v0, 0x1

    return v0
.end method

.method private clearState()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mCollectionLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItemsMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mSuccessItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mFailItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    sget-object v1, Lcom/miui/gallery/error/core/ErrorCode;->NO_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p0, v1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->setError(Lcom/miui/gallery/error/core/ErrorCode;)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private doStopDownload()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDispatchLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->cancelTask()V

    invoke-static {}, Lcom/miui/gallery/sdk/download/ImageDownloader;->getInstance()Lcom/miui/gallery/sdk/download/ImageDownloader;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/sdk/download/ImageDownloader;->cancelAll(Lcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-static {}, Lcom/miui/gallery/sdk/download/ImageDownloader;->getInstance()Lcom/miui/gallery/sdk/download/ImageDownloader;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/sdk/download/ImageDownloader;->cancelAll(Lcom/miui/gallery/sdk/download/DownloadType;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private download(Ljava/util/List;Lcom/miui/gallery/sdk/download/DownloadOptions;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;",
            "Lcom/miui/gallery/sdk/download/DownloadOptions;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getAutoDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v6

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mCollectionLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/Uri;

    new-instance v3, Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;

    invoke-direct {v3, v2, v6}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;-><init>(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    iget-object v4, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItems:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v4, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItemsMap:Ljava/util/Map;

    invoke-static {v2, v6}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    iget-object v7, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDispatchLock:Ljava/lang/Object;

    monitor-enter v7

    :try_start_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroid/net/Uri;

    invoke-static {}, Lcom/miui/gallery/sdk/download/ImageDownloader;->getInstance()Lcom/miui/gallery/sdk/download/ImageDownloader;

    move-result-object v0

    iget-object v4, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    const/4 v5, 0x0

    move-object v2, v6

    move-object v3, p2

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/sdk/download/ImageDownloader;->load(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/DownloadOptions;Lcom/miui/gallery/sdk/download/listener/DownloadListener;Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;)V

    goto :goto_1

    :cond_1
    monitor-exit v7

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_1
    move-exception p1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1
.end method

.method private getAutoDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    :cond_0
    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne v0, v1, :cond_1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    :cond_1
    return-object v0
.end method

.method public static getInstance()Lcom/miui/gallery/cloud/download/BatchDownloadManager;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$SingletonHolder;->access$100()Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    move-result-object v0

    return-object v0
.end method

.method private interruptBatchDownload(Landroid/content/Context;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v0, 0x1

    const/4 v1, 0x3

    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "BatchDownloadManager"

    const-string v0, "interrupt batch download for %s"

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getAutoDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->doStopDownload()V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->callbackBatchEnd()V

    :cond_0
    return-void
.end method

.method private isBatchDownloading(Lcom/miui/gallery/sdk/download/DownloadType;)Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mCollectionLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItems:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;

    iget-object v1, v1, Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const/4 v3, 0x1

    if-ne v1, p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p1

    if-ne p1, v3, :cond_1

    const/4 v2, 0x1

    :cond_1
    monitor-exit v0

    return v2

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private isDownloadEnd(Lcom/miui/gallery/sdk/download/DownloadType;)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mCollectionLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItems:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;

    iget-object v1, v1, Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-ne v1, p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mFailItems:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mSuccessItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr p1, v1

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt p1, v1, :cond_1

    const/4 v2, 0x1

    :cond_1
    monitor-exit v0

    return v2

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private isValidItem(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Z
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getAutoDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    if-ne v0, p2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItemsMap:Ljava/util/Map;

    invoke-static {p1, p2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private onItemDownloadCancel(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mCollectionLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->isValidItem(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v1

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mFailItems:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;

    invoke-direct {v2, p1, p2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;-><init>(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0, p2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->isDownloadEnd(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 p2, 0x1

    const/4 v1, 0x4

    invoke-virtual {p1, p2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->callbackBatchEnd()V

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private onItemDownloadFail(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mCollectionLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->isValidItem(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v1

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    invoke-direct {p0, p3}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->updateFailReason(Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    iget-object p3, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mFailItems:Ljava/util/List;

    new-instance v1, Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;

    invoke-direct {v1, p1, p2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;-><init>(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-interface {p3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getAutoDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->isDownloadEnd(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 p2, 0x1

    const/4 p3, 0x4

    invoke-virtual {p1, p2, p3}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->callbackBatchEnd()V

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private onItemDownloadSuccess(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mCollectionLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->isValidItem(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v1

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mSuccessItems:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;

    invoke-direct {v2, p1, p2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$BatchItem;-><init>(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getAutoDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->isDownloadEnd(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->callbackBatchEnd()V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->callbackBatchProgress()V

    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private resumeBatchDownload(Landroid/content/Context;)V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->canAutoDownload()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "BatchDownloadManager"

    const-string v1, "resume batch download for %s"

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getAutoDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->startBatchDownload(Landroid/content/Context;Z)V

    :cond_0
    return-void
.end method

.method private setError(Lcom/miui/gallery/error/core/ErrorCode;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mCollectionLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mError:Lcom/miui/gallery/error/core/ErrorCode;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private statEndDownload()V
    .locals 5

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sIsFirstSynced()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->isEverAutoDownloaded()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "BatchDownloadManager"

    const-string v1, "stat end download"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setEverAutoDownloaded()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getAutoDownloadTime()J

    move-result-wide v3

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x3e8

    div-long/2addr v1, v3

    const-wide/16 v3, 0x3c

    div-long/2addr v1, v3

    div-long/2addr v1, v3

    long-to-int v1, v1

    const-string v2, "timely"

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "sync_auto_download_%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Sync"

    invoke-static {v2, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    return-void
.end method

.method private statStartDownload(I)V
    .locals 5

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sIsFirstSynced()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getAutoDownloadTime()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const-string v0, "BatchDownloadManager"

    const-string v1, "stat start download"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setAutoDownloadTime(J)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "stage"

    int-to-float p1, p1

    sget-object v2, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->COUNT_STAGE:[I

    invoke-static {p1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->formatValueStage(F[I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "Sync"

    const-string v1, "sync_auto_download_weight"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    return-void
.end method

.method private updateFailReason(Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->getCode()Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->setError(Lcom/miui/gallery/error/core/ErrorCode;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public download(Landroid/net/Uri;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mOptionsBuilder:Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setRequireWLAN(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setRequireDeviceStorage(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setRequirePower(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setQueueFirst(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->build()Lcom/miui/gallery/sdk/download/DownloadOptions;

    move-result-object v0

    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->download(Ljava/util/List;Lcom/miui/gallery/sdk/download/DownloadOptions;)V

    const-string v0, "BatchDownloadManager"

    const-string v1, "download %s at first"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 6

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mSuccessItems:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItems:Ljava/util/List;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-interface {p1, v0, v2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;->onDownloadCancelled(Ljava/util/List;Ljava/util/List;)V

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mBatchDownloadListeners:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    iget-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mBatchDownloadListeners:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;

    iget-object v3, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mSuccessItems:Ljava/util/List;

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItems:Ljava/util/List;

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;->onDownloadCancelled(Ljava/util/List;Ljava/util/List;)V

    goto :goto_0

    :cond_1
    monitor-exit v0

    :goto_1
    return v1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_2

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mSuccessItems:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItems:Ljava/util/List;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-interface {p1, v0, v2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;->onDownloadProgress(Ljava/util/List;Ljava/util/List;)V

    goto :goto_3

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mBatchDownloadListeners:Ljava/util/List;

    monitor-enter v0

    :try_start_1
    iget-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mBatchDownloadListeners:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;

    iget-object v3, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mSuccessItems:Ljava/util/List;

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItems:Ljava/util/List;

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;->onDownloadProgress(Ljava/util/List;Ljava/util/List;)V

    goto :goto_2

    :cond_3
    monitor-exit v0

    :goto_3
    return v1

    :catchall_1
    move-exception p1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p1

    :pswitch_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_4

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mSuccessItems:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItems:Ljava/util/List;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mError:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-interface {p1, v0, v2, v3}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;->onDownloadComplete(Ljava/util/List;Ljava/util/List;Lcom/miui/gallery/error/core/ErrorCode;)V

    goto :goto_5

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mBatchDownloadListeners:Ljava/util/List;

    monitor-enter p1

    :try_start_2
    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mBatchDownloadListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;

    iget-object v3, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mSuccessItems:Ljava/util/List;

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDownloadItems:Ljava/util/List;

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mError:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-interface {v2, v3, v4, v5}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;->onDownloadComplete(Ljava/util/List;Ljava/util/List;Lcom/miui/gallery/error/core/ErrorCode;)V

    goto :goto_4

    :cond_5
    monitor-exit p1

    :goto_5
    return v1

    :catchall_2
    move-exception v0

    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    throw v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onConditionChanged(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->checkCondition()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->resumeBatchDownload(Landroid/content/Context;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->interruptBatchDownload(Landroid/content/Context;)V

    :goto_0
    return-void
.end method

.method public registerBatchDownloadListener(Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mBatchDownloadListeners:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mBatchDownloadListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->callbackBatchEnd(Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;)V

    goto :goto_0

    :pswitch_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->callbackBatchCancelled(Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;)V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->callbackBatchProgress(Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;)V

    :goto_0
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public startBatchDownload(Landroid/content/Context;Z)V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getAutoDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->isBatchDownloading(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p1, "BatchDownloadManager"

    const-string p2, "batch downloading already started: %s"

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_0
    sget-boolean v1, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->sHasDownloaded:Z

    if-eqz v1, :cond_1

    if-nez p2, :cond_1

    const-string p1, "BatchDownloadManager"

    const-string p2, "no need download because memory marker"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->clearState()V

    iget-object p2, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDispatchLock:Ljava/lang/Object;

    monitor-enter p2

    :try_start_0
    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->doStopDownload()V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v2, p0, p1, v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;-><init>(Lcom/miui/gallery/cloud/download/BatchDownloadManager;Landroid/content/Context;Lcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-virtual {v1, v2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mDispatchTask:Lcom/miui/gallery/threadpool/Future;

    monitor-exit p2

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public stopBatchDownload(Landroid/content/Context;)V
    .locals 2

    const-string p1, "BatchDownloadManager"

    const-string v0, "stop batch download for %s"

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getAutoDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->doStopDownload()V

    iget-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->callbackBatchCancelled()V

    return-void
.end method

.method public unregisterBatchDownloadListener(Lcom/miui/gallery/cloud/download/BatchDownloadManager$OnBatchDownloadListener;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mBatchDownloadListeners:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->mBatchDownloadListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
