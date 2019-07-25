.class public Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;
.super Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;
.source "ThreadPoolExecutor.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/FutureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor$Job;
    }
.end annotation


# instance fields
.field private final mCoreSize:I

.field private mExecutorLock:Ljava/lang/Object;

.field private mFutures:[Lcom/miui/gallery/threadpool/Future;

.field private mPool:Lcom/miui/gallery/threadpool/ThreadPool;


# direct methods
.method public constructor <init>(II)V
    .locals 1

    const/4 v0, 0x2

    invoke-direct {p0, v0, p1, p2}, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;-><init>(III)V

    return-void
.end method

.method public constructor <init>(III)V
    .locals 0

    invoke-direct {p0, p2, p3}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;-><init>(II)V

    new-instance p2, Ljava/lang/Object;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mExecutorLock:Ljava/lang/Object;

    iput p1, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mCoreSize:I

    iget p1, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mCoreSize:I

    new-array p1, p1, [Lcom/miui/gallery/threadpool/Future;

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mFutures:[Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private dispatchJobs()Z
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mExecutorLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    const/4 v2, 0x0

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-virtual {v1}, Lcom/miui/gallery/threadpool/ThreadPool;->isShutdown()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mQueue:Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->getPendingSize()I

    move-result v1

    if-lez v1, :cond_4

    const/4 v3, 0x0

    :goto_0
    iget v4, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mCoreSize:I

    if-ge v2, v4, :cond_3

    if-lez v1, :cond_3

    iget-object v4, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mFutures:[Lcom/miui/gallery/threadpool/Future;

    aget-object v4, v4, v2

    if-eqz v4, :cond_1

    invoke-interface {v4}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v5

    if-nez v5, :cond_1

    invoke-interface {v4}, Lcom/miui/gallery/threadpool/Future;->isDone()Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_1
    new-instance v3, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor$Job;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor$Job;-><init>(Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor$1;)V

    const-string v4, "ThreadPoolExecutor"

    const-string v5, "submit runnable %s"

    invoke-static {v4, v5, v3}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v4, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-virtual {v4, v3, p0}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mFutures:[Lcom/miui/gallery/threadpool/Future;

    aput-object v3, v4, v2

    iget-object v3, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mQueue:Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;

    invoke-virtual {v3}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->getBatchSize()I

    move-result v3

    sub-int/2addr v1, v3

    const/4 v3, 0x1

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    move v2, v3

    :cond_4
    monitor-exit v0

    return v2

    :cond_5
    :goto_1
    monitor-exit v0

    return v2

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private initExecutorIfNeed()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mExecutorLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-virtual {v1}, Lcom/miui/gallery/threadpool/ThreadPool;->isShutdown()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    new-instance v1, Lcom/miui/gallery/threadpool/ThreadPool;

    iget v2, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mCoreSize:I

    iget v3, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mCoreSize:I

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/threadpool/ThreadPool;-><init>(II)V

    iput-object v1, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

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


# virtual methods
.method protected dispatch()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mExecutorLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0}, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->initExecutorIfNeed()V

    invoke-direct {p0}, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->dispatchJobs()Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected getTag()Ljava/lang/String;
    .locals 1

    const-string v0, "ThreadPoolExecutor"

    return-object v0
.end method

.method public interrupt()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mExecutorLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    :try_start_0
    iget v3, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mCoreSize:I

    if-ge v2, v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mFutures:[Lcom/miui/gallery/threadpool/Future;

    aget-object v3, v3, v2

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mFutures:[Lcom/miui/gallery/threadpool/Future;

    aget-object v3, v3, v2

    invoke-interface {v3, v1}, Lcom/miui/gallery/threadpool/Future;->cancel(I)V

    iget-object v3, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mFutures:[Lcom/miui/gallery/threadpool/Future;

    const/4 v4, 0x0

    aput-object v4, v3, v2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-virtual {v1}, Lcom/miui/gallery/threadpool/ThreadPool;->shutdownNow()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v1

    goto :goto_2

    :catch_0
    move-exception v1

    :try_start_1
    const-string v2, "ThreadPoolExecutor"

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mQueue:Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->interrupt()Ljava/util/List;

    return-void

    :goto_2
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public onFutureDone(Lcom/miui/gallery/threadpool/Future;)V
    .locals 2

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->dispatchJobs()Z

    move-result p1

    const-string v0, "ThreadPoolExecutor"

    const-string v1, "onFutureDone dispatch %s"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
