.class public Lcom/miui/gallery/cleaner/ScannerManager;
.super Ljava/lang/Object;
.source "ScannerManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;,
        Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;
    }
.end annotation


# static fields
.field public static final TIME_COST_STAGE:[I

.field private static instance:Lcom/miui/gallery/cleaner/ScannerManager;


# instance fields
.field private mObserverHolder:Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;

.field private mOnScanResultUpdateListener:Lcom/miui/gallery/cleaner/BaseScanner$OnScanResultUpdateListener;

.field private mReset:Z

.field private mScanFuture:Lcom/miui/gallery/threadpool/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mScanFutureHandler:Lcom/miui/gallery/threadpool/FutureHandler;

.field private mScanJob:Lcom/miui/gallery/threadpool/ThreadPool$Job;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mScanResults:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cleaner/ScanResult;",
            ">;"
        }
    .end annotation
.end field

.field private mScanStartTime:J

.field private mScanners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cleaner/BaseScanner;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mSize:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miui/gallery/cleaner/ScannerManager;->TIME_COST_STAGE:[I

    return-void

    :array_0
    .array-data 4
        0x5
        0xa
        0xf
        0x19
        0x28
        0x3c
        0xb4
        0x12c
    .end array-data
.end method

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanners:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanResults:Ljava/util/ArrayList;

    new-instance v0, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;-><init>(Lcom/miui/gallery/cleaner/ScannerManager$1;)V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mObserverHolder:Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mReset:Z

    new-instance v0, Lcom/miui/gallery/cleaner/ScannerManager$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cleaner/ScannerManager$5;-><init>(Lcom/miui/gallery/cleaner/ScannerManager;)V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanFutureHandler:Lcom/miui/gallery/threadpool/FutureHandler;

    new-instance v0, Lcom/miui/gallery/cleaner/ScannerManager$6;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cleaner/ScannerManager$6;-><init>(Lcom/miui/gallery/cleaner/ScannerManager;)V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanJob:Lcom/miui/gallery/threadpool/ThreadPool$Job;

    new-instance v0, Lcom/miui/gallery/cleaner/ScannerManager$7;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cleaner/ScannerManager$7;-><init>(Lcom/miui/gallery/cleaner/ScannerManager;)V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mOnScanResultUpdateListener:Lcom/miui/gallery/cleaner/BaseScanner$OnScanResultUpdateListener;

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanners:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/cleaner/slim/SlimScanner;

    invoke-direct {v1}, Lcom/miui/gallery/cleaner/slim/SlimScanner;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanners:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/cleaner/ScreenshotScanner;

    invoke-direct {v1}, Lcom/miui/gallery/cleaner/ScreenshotScanner;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-boolean v0, Lcom/miui/os/Rom;->IS_STABLE:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanners:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/cleaner/VideoScanner;

    invoke-direct {v1}, Lcom/miui/gallery/cleaner/VideoScanner;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanners:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-direct {v1}, Lcom/miui/gallery/cleaner/SimilarScanner;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/cleaner/ScannerManager;)Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mObserverHolder:Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/cleaner/ScannerManager;ILcom/miui/gallery/cleaner/ScanResult;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/cleaner/ScannerManager;->updateScanResult(ILcom/miui/gallery/cleaner/ScanResult;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/cleaner/ScannerManager;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mSize:J

    return-wide v0
.end method

.method static synthetic access$202(Lcom/miui/gallery/cleaner/ScannerManager;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mSize:J

    return-wide p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/cleaner/ScannerManager;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanStartTime:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/miui/gallery/cleaner/ScannerManager;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanners:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/cleaner/ScannerManager;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanResults:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/cleaner/ScannerManager;)Lcom/miui/gallery/cleaner/BaseScanner$OnScanResultUpdateListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mOnScanResultUpdateListener:Lcom/miui/gallery/cleaner/BaseScanner$OnScanResultUpdateListener;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/cleaner/ScannerManager;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cleaner/ScannerManager;->onScanProgress(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V

    return-void
.end method

.method static synthetic access$802(Lcom/miui/gallery/cleaner/ScannerManager;Lcom/miui/gallery/threadpool/Future;)Lcom/miui/gallery/threadpool/Future;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanFuture:Lcom/miui/gallery/threadpool/Future;

    return-object p1
.end method

.method static synthetic access$900(Lcom/miui/gallery/cleaner/ScannerManager;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cleaner/ScannerManager;->removeScanResult(I)V

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/miui/gallery/cleaner/ScannerManager;
    .locals 2

    const-class v0, Lcom/miui/gallery/cleaner/ScannerManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/cleaner/ScannerManager;->instance:Lcom/miui/gallery/cleaner/ScannerManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-direct {v1}, Lcom/miui/gallery/cleaner/ScannerManager;-><init>()V

    sput-object v1, Lcom/miui/gallery/cleaner/ScannerManager;->instance:Lcom/miui/gallery/cleaner/ScannerManager;

    :cond_0
    sget-object v1, Lcom/miui/gallery/cleaner/ScannerManager;->instance:Lcom/miui/gallery/cleaner/ScannerManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private onScanProgress(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cleaner/ScannerManager$4;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/cleaner/ScannerManager$4;-><init>(Lcom/miui/gallery/cleaner/ScannerManager;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private removeScanResult(I)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanResults:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanResults:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cleaner/ScanResult;

    invoke-virtual {v2}, Lcom/miui/gallery/cleaner/ScanResult;->getType()I

    move-result v3

    if-ne v3, p1, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    iget-wide v3, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mSize:J

    invoke-virtual {v2}, Lcom/miui/gallery/cleaner/ScanResult;->getSize()J

    move-result-wide v1

    const/4 p1, 0x0

    sub-long/2addr v3, v1

    iput-wide v3, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mSize:J

    iget-wide v1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mSize:J

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-gez p1, :cond_1

    iput-wide v3, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mSize:J

    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/ScannerManager;->updateScanResult()V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private updateScanResult()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/cleaner/ScannerManager$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cleaner/ScannerManager$3;-><init>(Lcom/miui/gallery/cleaner/ScannerManager;)V

    invoke-static {v0}, Lcom/miui/gallery/threadpool/ThreadManager;->runOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private updateScanResult(ILcom/miui/gallery/cleaner/ScanResult;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanResults:Ljava/util/ArrayList;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanResults:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_0
    if-ge v1, v2, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanResults:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/cleaner/ScanResult;

    invoke-virtual {v3}, Lcom/miui/gallery/cleaner/ScanResult;->getType()I

    move-result v4

    if-ne v4, p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanResults:Ljava/util/ArrayList;

    invoke-virtual {p1, v1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget-wide v1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mSize:J

    invoke-virtual {p2}, Lcom/miui/gallery/cleaner/ScanResult;->getSize()J

    move-result-wide p1

    invoke-virtual {v3}, Lcom/miui/gallery/cleaner/ScanResult;->getSize()J

    move-result-wide v3

    const/4 v5, 0x0

    sub-long/2addr p1, v3

    add-long/2addr v1, p1

    iput-wide v1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mSize:J

    iget-wide p1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mSize:J

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-gez v3, :cond_1

    iput-wide v1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mSize:J

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/ScannerManager;->updateScanResult()V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method


# virtual methods
.method public getScanResults()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cleaner/ScanResult;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanResults:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getScanSize()J
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanResults:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mSize:J

    monitor-exit v0

    return-wide v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getScanner(I)Lcom/miui/gallery/cleaner/BaseScanner;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cleaner/BaseScanner;

    iget v2, v1, Lcom/miui/gallery/cleaner/BaseScanner;->mType:I

    if-ne v2, p1, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getStartTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanStartTime:J

    return-wide v0
.end method

.method public declared-synchronized isReset()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mReset:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isScanFinish()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/ScannerManager;->isReset()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/ScannerManager;->isScanning()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isScanResultEmpty()Z
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanResults:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanResults:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget-wide v1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mSize:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public declared-synchronized isScanning()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanFuture:Lcom/miui/gallery/threadpool/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public registerObserver(Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mObserverHolder:Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;

    iget-object v0, v0, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public declared-synchronized resetScan()V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanFuture:Lcom/miui/gallery/threadpool/Future;

    new-instance v0, Lcom/miui/gallery/cleaner/ScannerManager$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cleaner/ScannerManager$2;-><init>(Lcom/miui/gallery/cleaner/ScannerManager;)V

    invoke-static {v0}, Lcom/miui/gallery/threadpool/ThreadManager;->runOnMainThread(Ljava/lang/Runnable;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cleaner/BaseScanner;

    invoke-virtual {v1}, Lcom/miui/gallery/cleaner/BaseScanner;->reset()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanResults:Ljava/util/ArrayList;

    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const-wide/16 v1, 0x0

    :try_start_1
    iput-wide v1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mSize:J

    iput-wide v1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanStartTime:J

    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanResults:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mReset:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized startScan()V
    .locals 3

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/ScannerManager;->resetScan()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanStartTime:J

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanJob:Lcom/miui/gallery/threadpool/ThreadPool$Job;

    iget-object v2, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanFutureHandler:Lcom/miui/gallery/threadpool/FutureHandler;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mScanFuture:Lcom/miui/gallery/threadpool/Future;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mReset:Z

    new-instance v0, Lcom/miui/gallery/cleaner/ScannerManager$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cleaner/ScannerManager$1;-><init>(Lcom/miui/gallery/cleaner/ScannerManager;)V

    invoke-static {v0}, Lcom/miui/gallery/threadpool/ThreadManager;->runOnMainThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public unregisterObserver(Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager;->mObserverHolder:Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;

    iget-object v0, v0, Lcom/miui/gallery/cleaner/ScannerManager$ScanObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    return-void
.end method
