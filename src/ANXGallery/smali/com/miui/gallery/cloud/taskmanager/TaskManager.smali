.class public Lcom/miui/gallery/cloud/taskmanager/TaskManager;
.super Ljava/lang/Object;
.source "TaskManager.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/FutureListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/FutureListener<",
        "Lcom/miui/gallery/cloud/taskmanager/Task;",
        ">;"
    }
.end annotation


# instance fields
.field private mLimit:I

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
            "Lcom/miui/gallery/cloud/taskmanager/Task;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/PriorityQueue;

    invoke-direct {v0}, Ljava/util/PriorityQueue;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mRunningQueue:Ljava/util/LinkedList;

    iput p1, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mLimit:I

    new-instance p1, Lcom/miui/gallery/threadpool/ThreadPool;

    iget v0, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mLimit:I

    iget v1, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mLimit:I

    invoke-direct {p1, v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;-><init>(II)V

    iput-object p1, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    return-void
.end method

.method private contains(Lcom/miui/gallery/cloud/taskmanager/Task;)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mRunningQueue:Ljava/util/LinkedList;

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

    check-cast v1, Lcom/miui/gallery/cloud/taskmanager/Task;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v0, p1}, Ljava/util/PriorityQueue;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method private needReschedule(Lcom/miui/gallery/threadpool/Future;)Z
    .locals 1

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->getCancelType()I

    move-result p1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private submitIfAllowed()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-virtual {v0}, Lcom/miui/gallery/threadpool/ThreadPool;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->cancelAll()V

    return-void

    :cond_0
    :goto_0
    iget v0, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mLimit:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloud/taskmanager/Task;

    iget v1, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mLimit:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mLimit:I

    iget-object v1, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mRunningQueue:Ljava/util/LinkedList;

    iget-object v2, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-virtual {v2, v0, p0}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    const-string v1, "TaskManager"

    const-string v2, "task %s submit"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public cancelAll()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v1}, Ljava/util/PriorityQueue;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mRunningQueue:Ljava/util/LinkedList;

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

.method public onFutureDone(Lcom/miui/gallery/threadpool/Future;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/Future<",
            "Lcom/miui/gallery/cloud/taskmanager/Task;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->needReschedule(Lcom/miui/gallery/threadpool/Future;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->getJob()Lcom/miui/gallery/threadpool/ThreadPool$Job;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloud/taskmanager/Task;

    if-eqz v1, :cond_0

    const-string v2, "TaskManager"

    const-string v3, "interrupted task %s rescheduled"

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v2, v1}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mRunningQueue:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    iget p1, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mLimit:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mLimit:I

    invoke-direct {p0}, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->submitIfAllowed()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public shutdown()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->cancelAll()V

    iget-object v0, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-virtual {v0}, Lcom/miui/gallery/threadpool/ThreadPool;->shutdown()V

    return-void
.end method

.method public submit(Lcom/miui/gallery/cloud/taskmanager/Task;)V
    .locals 6

    if-eqz p1, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->contains(Lcom/miui/gallery/cloud/taskmanager/Task;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "TaskManager"

    const-string v2, "contain task %s"

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    monitor-exit v0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mWaitQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v1, p1}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->mRunningQueue:Ljava/util/LinkedList;

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

    check-cast v3, Lcom/miui/gallery/cloud/taskmanager/Task;

    invoke-virtual {p1, v3}, Lcom/miui/gallery/cloud/taskmanager/Task;->compareTo(Lcom/miui/gallery/cloud/taskmanager/Task;)I

    move-result v4

    if-lez v4, :cond_1

    const-string v4, "TaskManager"

    const-string v5, "task %s is interrupted for running %s"

    invoke-static {v4, v5, v3, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Lcom/miui/gallery/threadpool/Future;->cancel(I)V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->submitIfAllowed()V

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
