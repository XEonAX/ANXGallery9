.class public Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;
.super Ljava/lang/Object;
.source "SimpleTaskExecutor.java"

# interfaces
.implements Lcom/miui/gallery/search/core/context/TaskExecutor;
.implements Lcom/miui/gallery/threadpool/FutureListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/search/core/context/TaskExecutor<",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job;",
        ">;",
        "Lcom/miui/gallery/threadpool/FutureListener;"
    }
.end annotation


# instance fields
.field private mLimit:I

.field private final mLock:Ljava/lang/Object;

.field private final mPool:Lcom/miui/gallery/threadpool/ThreadPool;

.field private mRunningQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/threadpool/Future;",
            ">;"
        }
    .end annotation
.end field

.field private final mWaitQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Lcom/miui/gallery/threadpool/ThreadPool$Job;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mRunningQueue:Ljava/util/LinkedList;

    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mWaitQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    new-instance v0, Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-direct {v0, p1, p1}, Lcom/miui/gallery/threadpool/ThreadPool;-><init>(II)V

    iput-object v0, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    iput p1, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mLimit:I

    return-void
.end method

.method private contains(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mRunningQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v1}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {v1}, Lcom/miui/gallery/threadpool/Future;->getJob()Lcom/miui/gallery/threadpool/ThreadPool$Job;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v2

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mWaitQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    return v2

    :cond_3
    const/4 p1, 0x0

    return p1
.end method

.method private submitIfAllowed()V
    .locals 4

    :goto_0
    iget v0, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mLimit:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mWaitQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mWaitQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/threadpool/ThreadPool$Job;

    iget v1, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mLimit:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mLimit:I

    iget-object v1, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-virtual {v1, v0, p0}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v1

    const-string v2, "SimpleTaskExecutor"

    const-string v3, "submit task %s, running %s"

    invoke-static {v2, v3, v0, v1}, Lcom/miui/gallery/search/utils/SearchLog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mRunningQueue:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "SimpleTaskExecutor"

    invoke-static {v1, v0}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public cancel(Lcom/miui/gallery/threadpool/ThreadPool$Job;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mRunningQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v2}, Lcom/miui/gallery/threadpool/Future;->getJob()Lcom/miui/gallery/threadpool/ThreadPool$Job;

    move-result-object v3

    invoke-virtual {p0, v3, p1}, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->isSameTask(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/ThreadPool$Job;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v1, "SimpleTaskExecutor"

    const-string v3, "Cancel running task [%s]"

    invoke-static {v1, v3, p1}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v2}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    invoke-virtual {p0, v2}, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->onFutureDone(Lcom/miui/gallery/threadpool/Future;)V

    monitor-exit v0

    return-void

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mWaitQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "SimpleTaskExecutor"

    const-string v2, "Remove task from waiting queue [%s]"

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method protected isSameTask(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/ThreadPool$Job;)Z
    .locals 0

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public onFutureDone(Lcom/miui/gallery/threadpool/Future;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mRunningQueue:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mLimit:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mLimit:I

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->submitIfAllowed()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)V
    .locals 3

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->contains(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "SimpleTaskExecutor"

    const-string v2, "contain task %d"

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/search/utils/SearchLog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    monitor-exit v0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->mWaitQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/miui/gallery/search/core/context/SimpleTaskExecutor;->submitIfAllowed()V

    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_1
    :goto_0
    return-void
.end method
