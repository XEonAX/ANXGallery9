.class public Lcom/miui/gallery/assistant/library/LibraryManager;
.super Ljava/lang/Object;
.source "LibraryManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;,
        Lcom/miui/gallery/assistant/library/LibraryManager$NetworkReceiver;,
        Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;,
        Lcom/miui/gallery/assistant/library/LibraryManager$LibraryManagerHolder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "LibraryManager"


# instance fields
.field private final mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

.field private final mCurrentLibraries:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Lcom/miui/gallery/assistant/library/Library;",
            ">;"
        }
    .end annotation
.end field

.field private final mInitTask:Landroid/os/AsyncTask;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask<",
            "Landroid/content/Context;",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mInitialized:Z

.field private volatile mInitializing:Z

.field private final mLibraryDownloadManager:Lcom/miui/gallery/net/library/LibraryDownloadManager;

.field private mNetworkReceiver:Lcom/miui/gallery/assistant/library/LibraryManager$NetworkReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/assistant/library/LibraryManager$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/assistant/library/LibraryManager$1;-><init>(Lcom/miui/gallery/assistant/library/LibraryManager;)V

    iput-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mInitTask:Landroid/os/AsyncTask;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mCurrentLibraries:Ljava/util/Map;

    new-instance v0, Lcom/miui/gallery/net/library/LibraryDownloadManager;

    invoke-direct {v0}, Lcom/miui/gallery/net/library/LibraryDownloadManager;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mLibraryDownloadManager:Lcom/miui/gallery/net/library/LibraryDownloadManager;

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/assistant/library/LibraryManager$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/assistant/library/LibraryManager;-><init>()V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/assistant/library/LibraryManager;)Lcom/miui/gallery/net/library/LibraryDownloadManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mLibraryDownloadManager:Lcom/miui/gallery/net/library/LibraryDownloadManager;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/assistant/library/LibraryManager;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/assistant/library/LibraryManager;->unRegisterNetObserver(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/assistant/library/LibraryManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/assistant/library/LibraryManager;->initAllLibrarys()V

    return-void
.end method

.method static synthetic access$302(Lcom/miui/gallery/assistant/library/LibraryManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mInitializing:Z

    return p1
.end method

.method static synthetic access$402(Lcom/miui/gallery/assistant/library/LibraryManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mInitialized:Z

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/assistant/library/LibraryManager;)Ljava/util/concurrent/CountDownLatch;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/assistant/library/LibraryManager;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/assistant/library/LibraryManager;->tryDownloadAllLibrarys()Z

    move-result p0

    return p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/assistant/library/LibraryManager;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/assistant/library/LibraryManager;->registerNetObserver(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$800()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/assistant/library/LibraryManager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$900(Lcom/miui/gallery/assistant/library/LibraryManager;Lcom/miui/gallery/assistant/library/Library;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/assistant/library/LibraryManager;->recordDownloadResult(Lcom/miui/gallery/assistant/library/Library;Ljava/lang/String;)V

    return-void
.end method

.method private downloadLibraryInternal(Lcom/miui/gallery/assistant/library/Library;ZLcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 2

    new-instance v0, Lcom/miui/gallery/assistant/library/LibraryManager$4;

    invoke-direct {v0, p0, p3, p1}, Lcom/miui/gallery/assistant/library/LibraryManager$4;-><init>(Lcom/miui/gallery/assistant/library/LibraryManager;Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;Lcom/miui/gallery/assistant/library/Library;)V

    if-eqz p1, :cond_0

    sget-object p3, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_DOWNLOADING:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    invoke-virtual {p1, p3}, Lcom/miui/gallery/assistant/library/Library;->setLibraryStatus(Lcom/miui/gallery/assistant/library/Library$LibraryStatus;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getNetworkPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p3

    new-instance v1, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;

    invoke-direct {v1, p0, p1, p2, v0}, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryDownloadJob;-><init>(Lcom/miui/gallery/assistant/library/LibraryManager;Lcom/miui/gallery/assistant/library/Library;ZLcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;)V

    invoke-virtual {p3, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private getCurrentLibraryById(J)Lcom/miui/gallery/assistant/library/Library;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mCurrentLibraries:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/assistant/library/Library;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/assistant/library/Library;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/dao/GalleryEntityManager;->find(Ljava/lang/Class;[Ljava/lang/String;)Lcom/miui/gallery/dao/base/Entity;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/assistant/library/Library;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mCurrentLibraries:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public static getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager$LibraryManagerHolder;->access$000()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v0

    return-object v0
.end method

.method private initAllLibrarys()V
    .locals 8

    sget-object v0, Lcom/miui/gallery/assistant/library/LibraryConstants;->sAllLibraries:[Ljava/lang/Long;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v4, v0, v3

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-direct {p0, v4, v5}, Lcom/miui/gallery/assistant/library/LibraryManager;->getCurrentLibraryById(J)Lcom/miui/gallery/assistant/library/Library;

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-virtual {v6}, Lcom/miui/gallery/assistant/library/Library;->isOverDue()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-virtual {v6}, Lcom/miui/gallery/assistant/library/Library;->isLoaded()Z

    move-result v6

    if-nez v6, :cond_1

    :cond_0
    new-instance v6, Lcom/miui/gallery/net/library/LibraryRequest;

    invoke-direct {v6, v4, v5}, Lcom/miui/gallery/net/library/LibraryRequest;-><init>(J)V

    :try_start_0
    invoke-virtual {v6}, Lcom/miui/gallery/net/library/LibraryRequest;->executeSync()[Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_1

    array-length v7, v6

    if-lez v7, :cond_1

    aget-object v7, v6, v2

    instance-of v7, v7, Lcom/miui/gallery/assistant/library/Library;

    if-eqz v7, :cond_1

    aget-object v6, v6, v2

    check-cast v6, Lcom/miui/gallery/assistant/library/Library;

    invoke-direct {p0, v6}, Lcom/miui/gallery/assistant/library/LibraryManager;->refreshServerLibraryInfo(Lcom/miui/gallery/assistant/library/Library;)V
    :try_end_0
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v6

    sget-object v7, Lcom/miui/gallery/assistant/library/LibraryManager;->TAG:Ljava/lang/String;

    invoke-static {v7, v6}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_1
    invoke-direct {p0, v4, v5}, Lcom/miui/gallery/assistant/library/LibraryManager;->refreshLibraryStatusInternal(J)Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private loadLibraryInternal(Lcom/miui/gallery/assistant/library/Library;)Z
    .locals 1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/library/Library;->isLoaded()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/library/Library;->load()Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private recordDownloadResult(Lcom/miui/gallery/assistant/library/Library;Ljava/lang/String;)V
    .locals 4

    if-eqz p1, :cond_0

    const-string v0, "assistant"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "library_download_result_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/library/Library;->getLibraryId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private refreshLibraryStatusInternal(J)Lcom/miui/gallery/assistant/library/Library$LibraryStatus;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mCurrentLibraries:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/assistant/library/Library;

    if-nez p1, :cond_0

    sget-object p1, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_NO_LIBRARY_INFO:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    return-object p1

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/assistant/library/Library;->isExist()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/library/Library;->isLoaded()Z

    move-result p2

    if-eqz p2, :cond_1

    sget-object p2, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_LOADED:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    goto :goto_0

    :cond_1
    sget-object p2, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_AVAILABLE:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    :goto_0
    invoke-virtual {p1, p2}, Lcom/miui/gallery/assistant/library/Library;->setLibraryStatus(Lcom/miui/gallery/assistant/library/Library$LibraryStatus;)V

    goto :goto_1

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mLibraryDownloadManager:Lcom/miui/gallery/net/library/LibraryDownloadManager;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/library/Library;->getLibraryId()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->isLibraryDownloading(J)Z

    move-result p2

    if-eqz p2, :cond_3

    sget-object p2, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_DOWNLOADING:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/assistant/library/Library;->setLibraryStatus(Lcom/miui/gallery/assistant/library/Library$LibraryStatus;)V

    goto :goto_1

    :cond_3
    sget-object p2, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_NOT_DOWNLOADED:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/assistant/library/Library;->setLibraryStatus(Lcom/miui/gallery/assistant/library/Library$LibraryStatus;)V

    :goto_1
    invoke-virtual {p1}, Lcom/miui/gallery/assistant/library/Library;->getLibraryStatus()Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    move-result-object p1

    return-object p1
.end method

.method private refreshServerLibraryInfo(Lcom/miui/gallery/assistant/library/Library;)V
    .locals 4

    if-eqz p1, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/assistant/library/Library;->setRefreshTime(J)V

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/library/Library;->getLibraryId()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mCurrentLibraries:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/library/Library;

    iget-object v3, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mCurrentLibraries:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v3, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez v2, :cond_0

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/dao/GalleryEntityManager;->insert(Lcom/miui/gallery/dao/base/Entity;)Z

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/assistant/library/LibraryManager;->updateLibraryToDatabase(Lcom/miui/gallery/assistant/library/Library;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private registerNetObserver(Landroid/content/Context;)V
    .locals 4

    new-instance v0, Lcom/miui/gallery/assistant/library/LibraryManager$NetworkReceiver;

    invoke-direct {v0, p0}, Lcom/miui/gallery/assistant/library/LibraryManager$NetworkReceiver;-><init>(Lcom/miui/gallery/assistant/library/LibraryManager;)V

    iput-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mNetworkReceiver:Lcom/miui/gallery/assistant/library/LibraryManager$NetworkReceiver;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE_IMMEDIATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mNetworkReceiver:Lcom/miui/gallery/assistant/library/LibraryManager$NetworkReceiver;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v0, v3, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    return-void
.end method

.method private tryDownloadAllLibrarys()Z
    .locals 12

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mInitialized:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-static {v1}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->checkCondition(Z)Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    sget-object v0, Lcom/miui/gallery/assistant/library/LibraryConstants;->sAllLibraries:[Ljava/lang/Long;

    array-length v2, v0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    :goto_0
    if-ge v4, v2, :cond_4

    aget-object v6, v0, v4

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-virtual {p0, v6, v7}, Lcom/miui/gallery/assistant/library/LibraryManager;->getLibrary(J)Lcom/miui/gallery/assistant/library/Library;

    move-result-object v8

    if-nez v8, :cond_2

    sget-object v8, Lcom/miui/gallery/assistant/library/LibraryManager;->TAG:Ljava/lang/String;

    const-string v9, "Library %d is available or no download info,no need to download now"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {v8, v9, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_2
    invoke-virtual {v8}, Lcom/miui/gallery/assistant/library/Library;->getLibraryStatus()Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    move-result-object v9

    sget-object v10, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_NOT_DOWNLOADED:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    if-ne v9, v10, :cond_3

    sget-object v5, Lcom/miui/gallery/assistant/library/LibraryManager;->TAG:Ljava/lang/String;

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "Library %d download when app start up Begin."

    new-array v11, v3, [Ljava/lang/Object;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v11, v1

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v5, Lcom/miui/gallery/assistant/library/LibraryManager$2;

    invoke-direct {v5, p0}, Lcom/miui/gallery/assistant/library/LibraryManager$2;-><init>(Lcom/miui/gallery/assistant/library/LibraryManager;)V

    invoke-virtual {p0, v8, v1, v5}, Lcom/miui/gallery/assistant/library/LibraryManager;->downloadLibrary(Lcom/miui/gallery/assistant/library/Library;ZLcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;)Lcom/miui/gallery/threadpool/Future;

    const/4 v5, 0x0

    :cond_3
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_4
    return v5
.end method

.method private unRegisterNetObserver(Landroid/content/Context;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mNetworkReceiver:Lcom/miui/gallery/assistant/library/LibraryManager$NetworkReceiver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mNetworkReceiver:Lcom/miui/gallery/assistant/library/LibraryManager$NetworkReceiver;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mNetworkReceiver:Lcom/miui/gallery/assistant/library/LibraryManager$NetworkReceiver;

    :cond_0
    return-void
.end method

.method private updateLibraryToDatabase(Lcom/miui/gallery/assistant/library/Library;)V
    .locals 6

    if-eqz p1, :cond_0

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/assistant/library/Library;->onConvertToContents(Landroid/content/ContentValues;)V

    const-string v1, "%s=%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "libraryId"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/library/Library;->getLibraryId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v1

    const-class v2, Lcom/miui/gallery/assistant/library/Library;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, p1, v3}, Lcom/miui/gallery/dao/GalleryEntityManager;->update(Ljava/lang/Class;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)Z

    :cond_0
    return-void
.end method


# virtual methods
.method public downloadLibrary(Lcom/miui/gallery/assistant/library/Library;ZLcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 2

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/library/Library;->isLibraryItemInfosConsistent()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/library/Library;->getLibraryId()J

    move-result-wide p1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/assistant/library/LibraryManager$3;

    invoke-direct {v1, p0, p3, p1, p2}, Lcom/miui/gallery/assistant/library/LibraryManager$3;-><init>(Lcom/miui/gallery/assistant/library/LibraryManager;Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;J)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/assistant/library/LibraryManager;->downloadLibraryInternal(Lcom/miui/gallery/assistant/library/Library;ZLcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    return-object p1
.end method

.method public getLibrary(J)Lcom/miui/gallery/assistant/library/Library;
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mInitialized:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mCurrentLibraries:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/assistant/library/Library;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getLibraryItemPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "libs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getLibrarySync(J)Lcom/miui/gallery/assistant/library/Library;
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mInitialized:Z

    if-nez v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    const-wide/16 v1, 0x1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/miui/gallery/assistant/library/LibraryManager;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mCurrentLibraries:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/assistant/library/Library;

    if-nez v0, :cond_1

    new-instance v1, Lcom/miui/gallery/net/library/LibraryRequest;

    invoke-direct {v1, p1, p2}, Lcom/miui/gallery/net/library/LibraryRequest;-><init>(J)V

    :try_start_1
    invoke-virtual {v1}, Lcom/miui/gallery/net/library/LibraryRequest;->executeSync()[Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    array-length v2, v1

    if-lez v2, :cond_1

    const/4 v2, 0x0

    aget-object v3, v1, v2

    instance-of v3, v3, Lcom/miui/gallery/assistant/library/Library;

    if-eqz v3, :cond_1

    aget-object v1, v1, v2

    check-cast v1, Lcom/miui/gallery/assistant/library/Library;
    :try_end_1
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_1 .. :try_end_1} :catch_2

    :try_start_2
    invoke-direct {p0, v1}, Lcom/miui/gallery/assistant/library/LibraryManager;->refreshServerLibraryInfo(Lcom/miui/gallery/assistant/library/Library;)V

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/assistant/library/LibraryManager;->refreshLibraryStatusInternal(J)Lcom/miui/gallery/assistant/library/Library$LibraryStatus;
    :try_end_2
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_2 .. :try_end_2} :catch_1

    move-object v0, v1

    goto :goto_2

    :catch_1
    move-exception p1

    move-object v0, v1

    goto :goto_1

    :catch_2
    move-exception p1

    :goto_1
    sget-object p2, Lcom/miui/gallery/assistant/library/LibraryManager;->TAG:Ljava/lang/String;

    invoke-static {p2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_2
    return-object v0
.end method

.method public declared-synchronized init(Landroid/content/Context;)V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mInitialized:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mInitializing:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/miui/gallery/assistant/library/LibraryManager;->TAG:Ljava/lang/String;

    const-string v1, "init"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mInitializing:Z

    iget-object v1, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mInitTask:Landroid/os/AsyncTask;

    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v0, v0, [Landroid/content/Context;

    const/4 v3, 0x0

    aput-object p1, v0, v3

    invoke-virtual {v1, v2, v0}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized isInitialized()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager;->mInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isLibrarysExist([Ljava/lang/Long;)Z
    .locals 6

    if-eqz p1, :cond_2

    array-length v0, p1

    if-lez v0, :cond_2

    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    aget-object v3, p1, v2

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {p0, v3, v4}, Lcom/miui/gallery/assistant/library/LibraryManager;->getLibrary(J)Lcom/miui/gallery/assistant/library/Library;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/miui/gallery/assistant/library/Library;->getLibraryStatus()Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    move-result-object v4

    sget-object v5, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_AVAILABLE:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    if-eq v4, v5, :cond_0

    invoke-virtual {v3}, Lcom/miui/gallery/assistant/library/Library;->getLibraryStatus()Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_LOADED:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    if-eq v3, v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return v1

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method public loadLibrary(J)Z
    .locals 1

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Long;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v0, p2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/assistant/library/LibraryManager;->loadLibrary([Ljava/lang/Long;)Z

    move-result p1

    return p1
.end method

.method public declared-synchronized loadLibrary([Ljava/lang/Long;)Z
    .locals 8

    monitor-enter p0

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    :try_start_0
    array-length v1, p1

    if-lez v1, :cond_5

    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_4

    aget-object v3, p1, v2

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {p0, v3, v4}, Lcom/miui/gallery/assistant/library/LibraryManager;->getLibrary(J)Lcom/miui/gallery/assistant/library/Library;

    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v5, :cond_0

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    invoke-virtual {v5}, Lcom/miui/gallery/assistant/library/Library;->getLibraryStatus()Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    move-result-object v6

    sget-object v7, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_LOADED:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    if-ne v6, v7, :cond_1

    sget-object v5, Lcom/miui/gallery/assistant/library/LibraryManager;->TAG:Ljava/lang/String;

    const-string v6, "Library %d has been loaded, no need load again!"

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v5, v6, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    invoke-virtual {v5}, Lcom/miui/gallery/assistant/library/Library;->getLibraryStatus()Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_AVAILABLE:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    if-ne v3, v4, :cond_3

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v3

    invoke-direct {v3, v5}, Lcom/miui/gallery/assistant/library/LibraryManager;->loadLibraryInternal(Lcom/miui/gallery/assistant/library/Library;)Z

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v3, :cond_2

    monitor-exit p0

    return v0

    :cond_2
    :try_start_2
    sget-object v3, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_LOADED:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    invoke-virtual {v5, v3}, Lcom/miui/gallery/assistant/library/Library;->setLibraryStatus(Lcom/miui/gallery/assistant/library/Library$LibraryStatus;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    monitor-exit p0

    return v0

    :cond_4
    monitor-exit p0

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :cond_5
    monitor-exit p0

    return v0
.end method
