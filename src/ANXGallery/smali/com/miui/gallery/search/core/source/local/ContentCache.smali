.class public Lcom/miui/gallery/search/core/source/local/ContentCache;
.super Ljava/lang/Object;
.source "ContentCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/core/source/local/ContentCache$MyContentObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final mCacheHoldTime:I

.field private mCacheRecycleRunnable:Ljava/lang/Runnable;

.field private mCacheRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "TT;>;"
        }
    .end annotation
.end field

.field private mContentObserver:Landroid/database/ContentObserver;

.field private final mContentProvider:Lcom/miui/gallery/search/core/source/local/ContentCacheProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/search/core/source/local/ContentCacheProvider<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/search/core/source/local/ContentCacheProvider;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/source/local/ContentCacheProvider<",
            "TT;>;)V"
        }
    .end annotation

    const v0, 0x493e0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/search/core/source/local/ContentCache;-><init>(Lcom/miui/gallery/search/core/source/local/ContentCacheProvider;I)V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/search/core/source/local/ContentCacheProvider;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/source/local/ContentCacheProvider<",
            "TT;>;I)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mLock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mCacheRef:Ljava/lang/ref/WeakReference;

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mContentObserver:Landroid/database/ContentObserver;

    new-instance v0, Lcom/miui/gallery/search/core/source/local/ContentCache$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/core/source/local/ContentCache$1;-><init>(Lcom/miui/gallery/search/core/source/local/ContentCache;)V

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mCacheRecycleRunnable:Ljava/lang/Runnable;

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mContentProvider:Lcom/miui/gallery/search/core/source/local/ContentCacheProvider;

    iput p2, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mCacheHoldTime:I

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Cannot accept null content cache provider"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/core/source/local/ContentCache;)Landroid/database/ContentObserver;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mContentObserver:Landroid/database/ContentObserver;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/core/source/local/ContentCache;)Lcom/miui/gallery/search/core/source/local/ContentCacheProvider;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mContentProvider:Lcom/miui/gallery/search/core/source/local/ContentCacheProvider;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/search/core/source/local/ContentCache;)Ljava/lang/ref/WeakReference;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mCacheRef:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/search/core/source/local/ContentCache;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mCacheRef:Ljava/lang/ref/WeakReference;

    return-object p1
.end method

.method private hangOn()V
    .locals 4

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mCacheRecycleRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mCacheRecycleRunnable:Ljava/lang/Runnable;

    iget v2, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mCacheHoldTime:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method


# virtual methods
.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/source/local/ContentCache;->releaseCache()V

    return-void
.end method

.method public getCache()Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mCacheRef:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mCacheRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    :goto_0
    if-nez v0, :cond_2

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mContentProvider:Lcom/miui/gallery/search/core/source/local/ContentCacheProvider;

    invoke-interface {v1}, Lcom/miui/gallery/search/core/source/local/ContentCacheProvider;->loadContent()Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_3

    :try_start_1
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mCacheRef:Ljava/lang/ref/WeakReference;

    iget-object v0, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mLock:Ljava/lang/Object;

    monitor-enter v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iget-object v2, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mContentObserver:Landroid/database/ContentObserver;

    if-nez v2, :cond_1

    new-instance v2, Lcom/miui/gallery/search/core/source/local/ContentCache$MyContentObserver;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/search/core/source/local/ContentCache$MyContentObserver;-><init>(Lcom/miui/gallery/search/core/source/local/ContentCache;Landroid/os/Handler;)V

    iput-object v2, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mContentObserver:Landroid/database/ContentObserver;

    iget-object v2, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mContentProvider:Lcom/miui/gallery/search/core/source/local/ContentCacheProvider;

    iget-object v3, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mContentProvider:Lcom/miui/gallery/search/core/source/local/ContentCacheProvider;

    invoke-interface {v3}, Lcom/miui/gallery/search/core/source/local/ContentCacheProvider;->getContentUri()Landroid/net/Uri;

    move-result-object v3

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mContentObserver:Landroid/database/ContentObserver;

    invoke-interface {v2, v3, v4, v5}, Lcom/miui/gallery/search/core/source/local/ContentCacheProvider;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    :cond_1
    monitor-exit v0

    goto :goto_3

    :catchall_0
    move-exception v2

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v2
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catch_0
    move-exception v0

    goto :goto_1

    :catchall_1
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v1

    move-object v6, v1

    move-object v1, v0

    move-object v0, v6

    :goto_1
    :try_start_4
    const-string v2, "ContentCache"

    invoke-static {v2, v0}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_3

    :goto_2
    invoke-direct {p0}, Lcom/miui/gallery/search/core/source/local/ContentCache;->hangOn()V

    throw v0

    :cond_2
    move-object v1, v0

    :cond_3
    :goto_3
    invoke-direct {p0}, Lcom/miui/gallery/search/core/source/local/ContentCache;->hangOn()V

    return-object v1
.end method

.method public releaseCache()V
    .locals 5

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mContentObserver:Landroid/database/ContentObserver;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mContentProvider:Lcom/miui/gallery/search/core/source/local/ContentCacheProvider;

    iget-object v4, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mContentObserver:Landroid/database/ContentObserver;

    invoke-interface {v2, v4}, Lcom/miui/gallery/search/core/source/local/ContentCacheProvider;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    iput-object v3, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mContentObserver:Landroid/database/ContentObserver;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mCacheRef:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mCacheRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->clear()V

    iput-object v3, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mCacheRef:Ljava/lang/ref/WeakReference;

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/search/core/source/local/ContentCache;->mCacheRecycleRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
