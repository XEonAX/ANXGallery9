.class public Lcom/miui/gallery/util/photoview/TileDecodeManager;
.super Ljava/lang/Object;
.source "TileDecodeManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/photoview/TileDecodeManager$TileDecodeJob;
    }
.end annotation


# instance fields
.field private volatile mCurrentDecodingTiles:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/miui/gallery/util/photoview/Tile;",
            ">;"
        }
    .end annotation
.end field

.field private mDecodeFuture:Lcom/miui/gallery/threadpool/Future;

.field private mDecodeHandlerRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/os/Handler;",
            ">;"
        }
    .end annotation
.end field

.field private mDecodeProviderRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/miui/gallery/util/photoview/TileBitProvider;",
            ">;"
        }
    .end annotation
.end field

.field private mDecodeQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/miui/gallery/util/photoview/Tile;",
            ">;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/os/Handler;Lcom/miui/gallery/util/photoview/TileBitProvider;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeQueue:Ljava/util/concurrent/BlockingQueue;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mCurrentDecodingTiles:Landroid/util/SparseArray;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeHandlerRef:Ljava/lang/ref/WeakReference;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeProviderRef:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/util/photoview/TileDecodeManager;)Ljava/util/concurrent/BlockingQueue;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeQueue:Ljava/util/concurrent/BlockingQueue;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/util/photoview/TileDecodeManager;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/util/photoview/TileDecodeManager;)Landroid/util/SparseArray;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mCurrentDecodingTiles:Landroid/util/SparseArray;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/util/photoview/TileDecodeManager;)Lcom/miui/gallery/util/photoview/TileBitProvider;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/TileDecodeManager;->getProvider()Lcom/miui/gallery/util/photoview/TileBitProvider;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/util/photoview/TileDecodeManager;)Landroid/os/Handler;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/TileDecodeManager;->getHandler()Landroid/os/Handler;

    move-result-object p0

    return-object p0
.end method

.method private getHandler()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeHandlerRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeHandlerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Handler;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private getProvider()Lcom/miui/gallery/util/photoview/TileBitProvider;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeProviderRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeProviderRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/photoview/TileBitProvider;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private startDecodeEngine()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeFuture:Lcom/miui/gallery/threadpool/Future;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getDecodePool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/util/photoview/TileDecodeManager$TileDecodeJob;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/util/photoview/TileDecodeManager$TileDecodeJob;-><init>(Lcom/miui/gallery/util/photoview/TileDecodeManager;Lcom/miui/gallery/util/photoview/TileDecodeManager$1;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeFuture:Lcom/miui/gallery/threadpool/Future;

    const-string v0, "TileDecodeManager"

    const-string v1, "start decode engine"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    const-string v0, "TileDecodeManager"

    const-string v1, "cancel decode engine"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeFuture:Lcom/miui/gallery/threadpool/Future;

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mCurrentDecodingTiles:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->clear()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public clear()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    const-string v0, "TileDecodeManager"

    const-string v1, "clear queue"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public getDecodingTile(I)Lcom/miui/gallery/util/photoview/Tile;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mCurrentDecodingTiles:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/util/photoview/Tile;

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public put(Lcom/miui/gallery/util/photoview/Tile;)Z
    .locals 1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/util/photoview/TileDecodeManager;->startDecodeEngine()V

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mDecodeQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public removeDecodingTile(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager;->mCurrentDecodingTiles:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->remove(I)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
