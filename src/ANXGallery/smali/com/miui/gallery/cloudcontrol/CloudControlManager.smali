.class public Lcom/miui/gallery/cloudcontrol/CloudControlManager;
.super Ljava/lang/Object;
.source "CloudControlManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloudcontrol/CloudControlManager$SingletonHolder;
    }
.end annotation


# instance fields
.field private mCache:Lcom/miui/gallery/cloudcontrol/ProfileCache;

.field private mInitDoneSignal:Ljava/util/concurrent/CountDownLatch;

.field private mInitTask:Landroid/os/AsyncTask;
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

.field private volatile mIsInitDone:Z

.field private volatile mIsInitStart:Z

.field private mStrategyClassMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "+",
            "Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/cloudcontrol/CloudControlManager$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager$1;-><init>(Lcom/miui/gallery/cloudcontrol/CloudControlManager;)V

    iput-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mInitTask:Landroid/os/AsyncTask;

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mInitDoneSignal:Ljava/util/concurrent/CountDownLatch;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    new-instance v0, Lcom/miui/gallery/cloudcontrol/ProfileCache;

    invoke-direct {v0}, Lcom/miui/gallery/cloudcontrol/ProfileCache;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mCache:Lcom/miui/gallery/cloudcontrol/ProfileCache;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloudcontrol/CloudControlManager$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/cloudcontrol/CloudControlManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->registerStrategyClass()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/cloudcontrol/CloudControlManager;)Lcom/miui/gallery/cloudcontrol/ProfileCache;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mCache:Lcom/miui/gallery/cloudcontrol/ProfileCache;

    return-object p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/cloudcontrol/CloudControlManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mInitialized:Z

    return p1
.end method

.method static synthetic access$302(Lcom/miui/gallery/cloudcontrol/CloudControlManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mIsInitDone:Z

    return p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/cloudcontrol/CloudControlManager;)Ljava/util/concurrent/CountDownLatch;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mInitDoneSignal:Ljava/util/concurrent/CountDownLatch;

    return-object p0
.end method

.method public static getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloudcontrol/CloudControlManager$SingletonHolder;->INSTANCE:Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    return-object v0
.end method

.method private initialized()Z
    .locals 7

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mIsInitDone:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mInitialized:Z

    return v0

    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_1

    const-string v0, "CloudControlManager"

    const-string v1, "not initialized, but caller is main thread, doesn\'t block, stack trace:\n%s"

    const-string v2, "\n\t"

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    return v0

    :cond_1
    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mIsInitStart:Z

    if-nez v0, :cond_2

    const-string v0, "CloudControlManager"

    const-string v1, "start init"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->init(Landroid/content/Context;)V

    :cond_2
    const-string v0, "CloudControlManager"

    const-string v1, "not initialized, waiting lock from:\n%s"

    const-string v2, "\n\t"

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mInitDoneSignal:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->await()V

    const-string v2, "CloudControlManager"

    const-string v3, "wait init done costs %d ms"

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    const/4 v6, 0x0

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CloudControlManager"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    const-string v0, "CloudControlManager"

    const-string v1, "initialized: %b"

    iget-boolean v2, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mInitialized:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mInitialized:Z

    return v0
.end method

.method private registerStrategyClass()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "album-list"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "cloud-guide"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/CloudGuideStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "sync"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "server-unmodify-albums"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "components-list"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "hidden-albums"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/HiddenAlbumsStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "ignore-albums"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/IgnoreAlbumsStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "location"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/LocationStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "search"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "album-sort-date"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "backup-policies"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/BackupPolicisStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "server-reserved-album-names"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "media_scanner"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "upload-supported-file-types"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "photo-print"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/PhotoPrintStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "creation"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "assistant-rules"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    const-string v1, "feature-switch"

    const-class v2, Lcom/miui/gallery/cloudcontrol/strategies/FeatureSwitchStrategy;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public clearCloudCache()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mIsInitStart:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->initialized()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mCache:Lcom/miui/gallery/cloudcontrol/ProfileCache;

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->clearCloudCache()V

    :cond_0
    return-void
.end method

.method public declared-synchronized init(Landroid/content/Context;)V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mIsInitDone:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mIsInitStart:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "CloudControlManager"

    const-string v1, "init"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mIsInitStart:Z

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mInitTask:Landroid/os/AsyncTask;

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

.method public insertToCache(Lcom/miui/gallery/cloudcontrol/FeatureProfile;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->initialized()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mCache:Lcom/miui/gallery/cloudcontrol/ProfileCache;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->insertToCloudCache(Lcom/miui/gallery/cloudcontrol/FeatureProfile;)V

    :cond_0
    return-void
.end method

.method public queryFeatureStatus(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->initialized()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mCache:Lcom/miui/gallery/cloudcontrol/ProfileCache;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->queryStatus(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    move-result-object p1

    return-object p1

    :cond_0
    sget-object p1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->UNAVAILABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    return-object p1
.end method

.method public queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;",
            ">(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/Merger;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object p1

    return-object p1
.end method

.method public queryFeatureStrategy(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/Merger;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/cloudcontrol/Merger<",
            "TT;>;)TT;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->initialized()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mCache:Lcom/miui/gallery/cloudcontrol/ProfileCache;

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mStrategyClassMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    invoke-virtual {v0, p1, v1, p2}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->queryStrategy(Ljava/lang/String;Ljava/lang/Class;Lcom/miui/gallery/cloudcontrol/Merger;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    const-string p2, "CloudControlManager"

    const-string v0, "Generic type doesn\'t match."

    invoke-static {p2, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    :cond_0
    const-string p2, "CloudControlManager"

    const-string v0, "No strategy class was registered with %s."

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public registerStatusObserver(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;)Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mCache:Lcom/miui/gallery/cloudcontrol/ProfileCache;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->registerStatusObserver(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;)Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    move-result-object p1

    return-object p1
.end method

.method public registerStrategyObserver(Ljava/lang/String;Ljava/lang/Class;Lcom/miui/gallery/cloudcontrol/Merger;Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/miui/gallery/cloudcontrol/Merger<",
            "TT;>;",
            "Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver<",
            "TT;>;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mCache:Lcom/miui/gallery/cloudcontrol/ProfileCache;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->registerStrategyObserver(Ljava/lang/String;Ljava/lang/Class;Lcom/miui/gallery/cloudcontrol/Merger;Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object p1

    return-object p1
.end method

.method public unregisterStatusObserver(Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mCache:Lcom/miui/gallery/cloudcontrol/ProfileCache;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->unregisterStatusObserver(Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;)V

    return-void
.end method

.method public unregisterStrategyObserver(Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->mCache:Lcom/miui/gallery/cloudcontrol/ProfileCache;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->unregisterStrategyObserver(Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;)V

    return-void
.end method
