.class public Lcom/miui/gallery/scanner/ScanTaskManager;
.super Ljava/lang/Object;
.source "ScanTaskManager.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/FutureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/scanner/ScanTaskManager$OnAllTasksExecutedListener;
    }
.end annotation


# instance fields
.field private mLimit:I

.field private mListener:Lcom/miui/gallery/scanner/ScanTaskManager$OnAllTasksExecutedListener;

.field private mLock:Ljava/lang/Object;

.field private mPool:Lcom/miui/gallery/threadpool/ThreadPool;

.field private mRunningQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/threadpool/Future;",
            ">;"
        }
    .end annotation
.end field

.field private mWaitQueue:Ljava/util/PriorityQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/PriorityQueue<",
            "Lcom/miui/gallery/scanner/ScanTask;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/PriorityQueue;

    invoke-direct {v0}, Ljava/util/PriorityQueue;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mRunningQueue:Ljava/util/LinkedList;

    new-instance v0, Lcom/miui/gallery/threadpool/ThreadPool;

    const/4 v1, 0x1

    invoke-direct {v0, v1, v1}, Lcom/miui/gallery/threadpool/ThreadPool;-><init>(II)V

    iput-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    iput v1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mLimit:I

    return-void
.end method

.method public constructor <init>(ILcom/miui/gallery/scanner/ScanTaskManager$OnAllTasksExecutedListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/PriorityQueue;

    invoke-direct {v0}, Ljava/util/PriorityQueue;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mRunningQueue:Ljava/util/LinkedList;

    iput-object p2, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mListener:Lcom/miui/gallery/scanner/ScanTaskManager$OnAllTasksExecutedListener;

    new-instance p2, Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-direct {p2, p1, p1}, Lcom/miui/gallery/threadpool/ThreadPool;-><init>(II)V

    iput-object p2, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    iput p1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mLimit:I

    return-void
.end method

.method private contains(Lcom/miui/gallery/scanner/ScanTask;)Z
    .locals 3

    invoke-virtual {p1}, Lcom/miui/gallery/scanner/ScanTask;->isForceScan()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mRunningQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v1}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {v1}, Lcom/miui/gallery/threadpool/Future;->getJob()Lcom/miui/gallery/threadpool/ThreadPool$Job;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/scanner/ScanTask;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v0, p1}, Ljava/util/PriorityQueue;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method private submitIfAllowed()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-virtual {v0}, Lcom/miui/gallery/threadpool/ThreadPool;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/scanner/ScanTaskManager;->cancelAll()V

    return-void

    :cond_0
    :goto_0
    iget v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mLimit:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/scanner/ScanTask;

    iget v1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mLimit:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mLimit:I

    const-string v1, "ScanTaskManager"

    const-string v2, "priority %d, time %d"

    invoke-virtual {v0}, Lcom/miui/gallery/scanner/ScanTask;->getPriority()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0}, Lcom/miui/gallery/scanner/ScanTask;->getNewTime()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-virtual {v1, v0, p0}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mRunningQueue:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public cancelAll()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v1}, Ljava/util/PriorityQueue;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mRunningQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v2}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    goto :goto_0

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

.method public cancelByPriority(I)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v1}, Ljava/util/PriorityQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/scanner/ScanTask;

    invoke-virtual {v2}, Lcom/miui/gallery/scanner/ScanTask;->getPriority()I

    move-result v3

    if-ne p1, v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    const-string v3, "ScanTaskManager"

    const-string v4, "cancel task [%s] by priority [%d]"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v3, v4, v2, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mRunningQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v2}, Lcom/miui/gallery/threadpool/Future;->getJob()Lcom/miui/gallery/threadpool/ThreadPool$Job;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/scanner/ScanTask;

    invoke-virtual {v3}, Lcom/miui/gallery/scanner/ScanTask;->getPriority()I

    move-result v4

    if-ne p1, v4, :cond_2

    invoke-interface {v2}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    const-string v2, "ScanTaskManager"

    const-string v4, "cancel task [%s] by priority [%d]"

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v2, v4, v3, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1

    :cond_3
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public cancelForegroundTask()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v1}, Ljava/util/PriorityQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/scanner/ScanTask;

    invoke-virtual {v2}, Lcom/miui/gallery/scanner/ScanTask;->isForeground()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lcom/miui/gallery/scanner/ScanTask;->canRunningInBackground()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    const-string v3, "ScanTaskManager"

    const-string v4, "cancel foreground task %s"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v4, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mRunningQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v2}, Lcom/miui/gallery/threadpool/Future;->getJob()Lcom/miui/gallery/threadpool/ThreadPool$Job;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/scanner/ScanTask;

    invoke-virtual {v3}, Lcom/miui/gallery/scanner/ScanTask;->isForeground()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v3}, Lcom/miui/gallery/scanner/ScanTask;->canRunningInBackground()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-interface {v2}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    const-string v2, "ScanTaskManager"

    const-string v4, "cancel foreground task %s"

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v4, v3}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_3
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isEmpty()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mRunningQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v1}, Ljava/util/PriorityQueue;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onFutureDone(Lcom/miui/gallery/threadpool/Future;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    :try_start_0
    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->getCancelType()I

    move-result v2

    if-ne v2, v1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->getJob()Lcom/miui/gallery/threadpool/ThreadPool$Job;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/scanner/ScanTask;

    if-eqz v2, :cond_0

    const-string v3, "ScanTaskManager"

    const-string v4, "CANCEL_INTERRUPT %d"

    invoke-virtual {v2}, Lcom/miui/gallery/scanner/ScanTask;->getPriority()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v3, v2}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mRunningQueue:Ljava/util/LinkedList;

    invoke-virtual {v2, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mListener:Lcom/miui/gallery/scanner/ScanTaskManager$OnAllTasksExecutedListener;

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/scanner/ScanTaskManager;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mListener:Lcom/miui/gallery/scanner/ScanTaskManager$OnAllTasksExecutedListener;

    invoke-interface {p1}, Lcom/miui/gallery/scanner/ScanTaskManager$OnAllTasksExecutedListener;->onAllTasksExecuted()V

    :cond_1
    iget p1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mLimit:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mLimit:I

    invoke-direct {p0}, Lcom/miui/gallery/scanner/ScanTaskManager;->submitIfAllowed()V

    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public shutdown()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/scanner/ScanTaskManager;->cancelAll()V

    iget-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-virtual {v0}, Lcom/miui/gallery/threadpool/ThreadPool;->shutdown()V

    return-void
.end method

.method public submit(Lcom/miui/gallery/scanner/ScanTask;)V
    .locals 7

    if-eqz p1, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/scanner/ScanTaskManager;->contains(Lcom/miui/gallery/scanner/ScanTask;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "ScanTaskManager"

    const-string v2, "contains task %s"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    monitor-exit v0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v1, p1}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/miui/gallery/scanner/ScanTaskManager;->mRunningQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v2}, Lcom/miui/gallery/threadpool/Future;->getJob()Lcom/miui/gallery/threadpool/ThreadPool$Job;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/scanner/ScanTask;

    if-eqz v3, :cond_1

    invoke-virtual {v3, p1}, Lcom/miui/gallery/scanner/ScanTask;->compareTo(Lcom/miui/gallery/scanner/ScanTask;)I

    move-result v4

    if-lez v4, :cond_1

    const-string v4, "ScanTaskManager"

    const-string v5, "priority %d is interrupted by %d"

    invoke-virtual {v3}, Lcom/miui/gallery/scanner/ScanTask;->getPriority()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1}, Lcom/miui/gallery/scanner/ScanTask;->getPriority()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v4, v5, v3, v6}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Lcom/miui/gallery/threadpool/Future;->cancel(I)V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/scanner/ScanTaskManager;->submitIfAllowed()V

    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_3
    :goto_1
    return-void
.end method
