.class public Lcom/miui/gallery/adapter/SlideShowAdapter;
.super Ljava/lang/Object;
.source "SlideShowAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;,
        Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;,
        Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;,
        Lcom/miui/gallery/adapter/SlideShowAdapter$GetJob;
    }
.end annotation


# instance fields
.field private mCacheItem:Lcom/miui/gallery/model/ImageLoadParams;

.field private mCacheQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;",
            ">;"
        }
    .end annotation
.end field

.field private mDataSet:Lcom/miui/gallery/model/BaseDataSet;

.field private mGetFuture:Lcom/miui/gallery/threadpool/Future;

.field private mLoadFuture:Lcom/miui/gallery/threadpool/Future;

.field private mLoadIndex:I

.field private mLock:Ljava/lang/Object;

.field private mShowIndex:I


# direct methods
.method public constructor <init>(Lcom/miui/gallery/model/ImageLoadParams;I)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mCacheQueue:Ljava/util/concurrent/BlockingQueue;

    iput-object p1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mCacheItem:Lcom/miui/gallery/model/ImageLoadParams;

    iput p2, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/adapter/SlideShowAdapter;)Ljava/util/concurrent/BlockingQueue;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mCacheQueue:Ljava/util/concurrent/BlockingQueue;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/adapter/SlideShowAdapter;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/adapter/SlideShowAdapter;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    return p0
.end method

.method static synthetic access$306(Lcom/miui/gallery/adapter/SlideShowAdapter;)I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    return v0
.end method

.method static synthetic access$400(Lcom/miui/gallery/adapter/SlideShowAdapter;)Lcom/miui/gallery/model/BaseDataSet;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    return-object p0
.end method

.method static synthetic access$502(Lcom/miui/gallery/adapter/SlideShowAdapter;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mShowIndex:I

    return p1
.end method

.method static synthetic access$600(Lcom/miui/gallery/adapter/SlideShowAdapter;)Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/SlideShowAdapter;->getLoadItem()Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;

    move-result-object p0

    return-object p0
.end method

.method private cancelGet()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mGetFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mGetFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mGetFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    return-void
.end method

.method private cancelLoad()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    return-void
.end method

.method private getLoadItem()Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    :goto_0
    iget v1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    if-ltz v1, :cond_3

    iget v1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    iget-object v3, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {v3}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result v3

    if-ge v1, v3, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    iget v3, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/model/BaseDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getPathDisplayBetter()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-static {v3}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ofUri(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    move-result-object v2

    sget-object v4, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->UNKNOWN:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    if-ne v2, v4, :cond_0

    sget-object v2, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v2, v3}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_0
    iget v2, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    new-instance v2, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;

    iget v4, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getSecretKey()[B

    move-result-object v1

    invoke-direct {v2, p0, v3, v4, v1}, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;-><init>(Lcom/miui/gallery/adapter/SlideShowAdapter;Ljava/lang/String;I[B)V

    monitor-exit v0

    return-object v2

    :cond_1
    iget v1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mCacheItem:Lcom/miui/gallery/model/ImageLoadParams;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mCacheItem:Lcom/miui/gallery/model/ImageLoadParams;

    iget v3, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/model/ImageLoadParams;->match(Lcom/miui/gallery/model/BaseDataItem;I)Z

    move-result v1

    if-eqz v1, :cond_3

    iget v1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    new-instance v1, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;

    iget-object v2, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mCacheItem:Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {v2}, Lcom/miui/gallery/model/ImageLoadParams;->getPath()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    add-int/lit8 v3, v3, -0x1

    iget-object v4, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mCacheItem:Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {v4}, Lcom/miui/gallery/model/ImageLoadParams;->getSecretKey()[B

    move-result-object v4

    invoke-direct {v1, p0, v2, v3, v4}, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadItem;-><init>(Lcom/miui/gallery/adapter/SlideShowAdapter;Ljava/lang/String;I[B)V

    monitor-exit v0

    return-object v1

    :cond_3
    monitor-exit v0

    return-object v2

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private startLoad()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/adapter/SlideShowAdapter;->cancelLoad()V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;

    invoke-direct {v1, p0}, Lcom/miui/gallery/adapter/SlideShowAdapter$LoadJob;-><init>(Lcom/miui/gallery/adapter/SlideShowAdapter;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadFuture:Lcom/miui/gallery/threadpool/Future;

    return-void
.end method


# virtual methods
.method public changeDataSet(Lcom/miui/gallery/model/BaseDataSet;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    iput p2, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mLoadIndex:I

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/SlideShowAdapter;->cancelLoad()V

    iget-object p1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mCacheQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {p1}, Ljava/util/concurrent/BlockingQueue;->clear()V

    invoke-direct {p0}, Lcom/miui/gallery/adapter/SlideShowAdapter;->startLoad()V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public getBaseDataItem(I)Lcom/miui/gallery/model/BaseDataItem;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/model/BaseDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v1

    :cond_0
    return-object v1
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getShowIndex()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mShowIndex:I

    return v0
.end method

.method public nextBitmap(Lcom/miui/gallery/threadpool/FutureListener;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/FutureListener<",
            "Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/adapter/SlideShowAdapter;->cancelGet()V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/adapter/SlideShowAdapter$GetJob;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/adapter/SlideShowAdapter$GetJob;-><init>(Lcom/miui/gallery/adapter/SlideShowAdapter;Lcom/miui/gallery/adapter/SlideShowAdapter$1;)V

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/adapter/SlideShowAdapter;->mGetFuture:Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method public pause()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/SlideShowAdapter;->cancelLoad()V

    invoke-direct {p0}, Lcom/miui/gallery/adapter/SlideShowAdapter;->cancelGet()V

    return-void
.end method

.method public resume()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/SlideShowAdapter;->startLoad()V

    return-void
.end method
