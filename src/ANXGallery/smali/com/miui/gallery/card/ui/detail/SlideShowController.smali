.class public Lcom/miui/gallery/card/ui/detail/SlideShowController;
.super Ljava/lang/Object;
.source "SlideShowController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/card/ui/detail/SlideShowController$LoadItem;,
        Lcom/miui/gallery/card/ui/detail/SlideShowController$ShowItem;,
        Lcom/miui/gallery/card/ui/detail/SlideShowController$LoadJob;,
        Lcom/miui/gallery/card/ui/detail/SlideShowController$GetJob;
    }
.end annotation


# instance fields
.field private final mCacheQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/miui/gallery/card/ui/detail/SlideShowController$ShowItem;",
            ">;"
        }
    .end annotation
.end field

.field private final mDuration:I

.field private mGetFuture:Lcom/miui/gallery/threadpool/Future;

.field private final mHandler:Landroid/os/Handler;

.field private mLoadFuture:Lcom/miui/gallery/threadpool/Future;

.field private mLoadIndex:I

.field private final mLock:Ljava/lang/Object;

.field private final mMediaInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/model/BaseMedia;",
            ">;"
        }
    .end annotation
.end field

.field private mShowIndex:I

.field private final mSlideShowView:Lcom/miui/gallery/widget/SlideShowView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/SlideShowView;I)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mCacheQueue:Ljava/util/concurrent/BlockingQueue;

    new-instance v0, Landroid/os/Handler;

    new-instance v1, Lcom/miui/gallery/card/ui/detail/SlideShowController$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController$1;-><init>(Lcom/miui/gallery/card/ui/detail/SlideShowController;)V

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mSlideShowView:Lcom/miui/gallery/widget/SlideShowView;

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mSlideShowView:Lcom/miui/gallery/widget/SlideShowView;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/SlideShowView;->setScaleOnlyMode(Z)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mMediaInfos:Ljava/util/List;

    iput p2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mDuration:I

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/card/ui/detail/SlideShowController;)Lcom/miui/gallery/widget/SlideShowView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mSlideShowView:Lcom/miui/gallery/widget/SlideShowView;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/card/ui/detail/SlideShowController;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mDuration:I

    return p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/card/ui/detail/SlideShowController;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->decreaseLoadIndex()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/card/ui/detail/SlideShowController;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/card/ui/detail/SlideShowController;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->loadNextBitmap()V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/card/ui/detail/SlideShowController;)Ljava/util/concurrent/BlockingQueue;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mCacheQueue:Ljava/util/concurrent/BlockingQueue;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/card/ui/detail/SlideShowController;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/card/ui/detail/SlideShowController;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    return p0
.end method

.method static synthetic access$802(Lcom/miui/gallery/card/ui/detail/SlideShowController;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mShowIndex:I

    return p1
.end method

.method static synthetic access$900(Lcom/miui/gallery/card/ui/detail/SlideShowController;)Lcom/miui/gallery/card/ui/detail/SlideShowController$LoadItem;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->getLoadItem()Lcom/miui/gallery/card/ui/detail/SlideShowController$LoadItem;

    move-result-object p0

    return-object p0
.end method

.method private cancelGet()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mGetFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mGetFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mGetFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    return-void
.end method

.method private cancelLoad()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    return-void
.end method

.method private decreaseLoadIndex()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mMediaInfos:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    iget v2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    iget v2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    if-gtz v2, :cond_0

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getLoadItem()Lcom/miui/gallery/card/ui/detail/SlideShowController$LoadItem;
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    if-gez v1, :cond_0

    const/4 v1, 0x0

    iput v1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    :cond_0
    :goto_0
    iget v1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    if-ltz v1, :cond_3

    iget v1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mMediaInfos:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mMediaInfos:Ljava/util/List;

    iget v2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/card/model/BaseMedia;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lcom/miui/gallery/card/model/BaseMedia;->getUri()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-static {v1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ofUri(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    move-result-object v2

    sget-object v3, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->UNKNOWN:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    if-ne v2, v3, :cond_1

    sget-object v2, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v2, v1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_1
    new-instance v2, Lcom/miui/gallery/card/ui/detail/SlideShowController$LoadItem;

    iget v3, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    invoke-direct {v2, p0, v1, v3}, Lcom/miui/gallery/card/ui/detail/SlideShowController$LoadItem;-><init>(Lcom/miui/gallery/card/ui/detail/SlideShowController;Ljava/lang/String;I)V

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->increaseLoadIndex()V

    monitor-exit v0

    return-object v2

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->increaseLoadIndex()V

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private increaseLoadIndex()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mMediaInfos:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    iget v2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    iget v2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    if-ne v2, v1, :cond_0

    iget v2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    rem-int/2addr v2, v1

    iput v2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private loadNextBitmap()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/card/ui/detail/SlideShowController$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController$2;-><init>(Lcom/miui/gallery/card/ui/detail/SlideShowController;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->nextBitmap(Lcom/miui/gallery/threadpool/FutureListener;)V

    return-void
.end method

.method private startLoad()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->cancelLoad()V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/card/ui/detail/SlideShowController$LoadJob;

    invoke-direct {v1, p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController$LoadJob;-><init>(Lcom/miui/gallery/card/ui/detail/SlideShowController;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadFuture:Lcom/miui/gallery/threadpool/Future;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mMediaInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public nextBitmap(Lcom/miui/gallery/threadpool/FutureListener;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/FutureListener<",
            "Lcom/miui/gallery/card/ui/detail/SlideShowController$ShowItem;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->cancelGet()V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/card/ui/detail/SlideShowController$GetJob;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/card/ui/detail/SlideShowController$GetJob;-><init>(Lcom/miui/gallery/card/ui/detail/SlideShowController;Lcom/miui/gallery/card/ui/detail/SlideShowController$1;)V

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mGetFuture:Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method public pause()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->cancelLoad()V

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->cancelGet()V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mSlideShowView:Lcom/miui/gallery/widget/SlideShowView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/SlideShowView;->release()V

    return-void
.end method

.method public resume()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->startLoad()V

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->loadNextBitmap()V

    return-void
.end method

.method public updateMedias(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/miui/gallery/card/model/BaseMedia;",
            ">;)V"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mMediaInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mMediaInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-eq v0, v3, :cond_4

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->pause()V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v3, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mMediaInfos:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    iget-object v3, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mMediaInfos:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iput v2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mSlideShowView:Lcom/miui/gallery/widget/SlideShowView;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-le p1, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/SlideShowView;->setSlideAnimEnable(Z)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mCacheQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {p1}, Ljava/util/concurrent/BlockingQueue;->clear()V

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->resume()V

    goto :goto_2

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_2
    iget-object v3, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mMediaInfos:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iput v2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mLoadIndex:I

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->cancelLoad()V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowController;->mSlideShowView:Lcom/miui/gallery/widget/SlideShowView;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-le p1, v1, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/SlideShowView;->setSlideAnimEnable(Z)V

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->startLoad()V

    :cond_4
    :goto_2
    return-void

    :catchall_1
    move-exception p1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1
.end method
