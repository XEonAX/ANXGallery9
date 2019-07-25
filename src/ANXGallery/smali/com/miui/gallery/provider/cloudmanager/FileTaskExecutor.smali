.class Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;
.super Ljava/lang/Object;
.source "FileTaskExecutor.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/FutureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskResult;,
        Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskJob;,
        Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileHandleListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/FutureListener<",
        "Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskResult;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mListener:Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileHandleListener;

.field private final mLock:Ljava/lang/Object;

.field private final mPool:Lcom/miui/gallery/threadpool/ThreadPool;

.field private mRunningTask:Lcom/miui/gallery/threadpool/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/Future<",
            "Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskResult;",
            ">;"
        }
    .end annotation
.end field

.field private mWaitingQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "[J>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileHandleListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mLock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mRunningTask:Lcom/miui/gallery/threadpool/Future;

    iput-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mListener:Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileHandleListener;

    new-instance p1, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {p1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mWaitingQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    new-instance p1, Lcom/miui/gallery/threadpool/ThreadPool;

    const/4 p2, 0x1

    invoke-direct {p1, p2, p2}, Lcom/miui/gallery/threadpool/ThreadPool;-><init>(II)V

    iput-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    return-void
.end method

.method private cancelAll()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mRunningTask:Lcom/miui/gallery/threadpool/Future;

    if-eqz v1, :cond_0

    const-string v1, "CloudManager.FileTaskExecutor"

    const-string v2, "Running file task isn\'t finished yet!"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mWaitingQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mRunningTask:Lcom/miui/gallery/threadpool/Future;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mRunningTask:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v1}, Lcom/miui/gallery/threadpool/Future;->cancel()V

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

.method private reportIfCompleted()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->isCompleted()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "CloudManager.FileTaskExecutor"

    const-string v1, "on complete all tasks"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mListener:Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileHandleListener;

    invoke-interface {v0}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileHandleListener;->onAllTaskExecuted()V

    :cond_0
    return-void
.end method

.method private submitIfAllowed()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-virtual {v0}, Lcom/miui/gallery/threadpool/ThreadPool;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->cancelAll()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mListener:Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileHandleListener;

    invoke-interface {v0}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileHandleListener;->onCancel()V

    const-string v0, "CloudManager.FileTaskExecutor"

    const-string v1, "Strange situation, submitting tasks when executor is shutting down!"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mRunningTask:Lcom/miui/gallery/threadpool/Future;

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mWaitingQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    move-result v1

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mWaitingQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [J

    const-string v2, "CloudManager.FileTaskExecutor"

    const-string v3, "Submitting FileTaskJob of %d ids to executor [%s]"

    array-length v4, v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v2, v3, v4, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskJob;

    iget-object v3, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3, v1}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskJob;-><init>(Landroid/content/Context;[J)V

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-virtual {v1, v2, p0}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mRunningTask:Lcom/miui/gallery/threadpool/Future;

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->reportIfCompleted()V

    :goto_0
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
.method public isCompleted()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mWaitingQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mRunningTask:Lcom/miui/gallery/threadpool/Future;

    if-nez v1, :cond_0

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
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/Future<",
            "Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskResult;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mRunningTask:Lcom/miui/gallery/threadpool/Future;

    if-eq v1, p1, :cond_0

    const-string v1, "CloudManager.FileTaskExecutor"

    const-string v2, "Don\'t know what happened, but we expect %s instead of %s"

    iget-object v3, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mRunningTask:Lcom/miui/gallery/threadpool/Future;

    invoke-static {v1, v2, v3, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mRunningTask:Lcom/miui/gallery/threadpool/Future;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskResult;

    if-eqz p1, :cond_1

    iget-object v0, p1, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskResult;->ids:[J

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskResult;->results:[J

    if-eqz v0, :cond_1

    const-string v0, "CloudManager.FileTaskExecutor"

    const-string v1, "onFutureDone for %s ids"

    iget-object v2, p1, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskResult;->ids:[J

    array-length v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mListener:Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileHandleListener;

    iget-object v1, p1, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskResult;->ids:[J

    iget-object p1, p1, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileTaskResult;->results:[J

    invoke-interface {v0, v1, p1}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileHandleListener;->onRecordsHandled([J[J)V

    goto :goto_0

    :cond_1
    const-string v0, "CloudManager.FileTaskExecutor"

    const-string v1, "Invalid file task result %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->submitIfAllowed()V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public shutdown()V
    .locals 2

    const-string v0, "CloudManager.FileTaskExecutor"

    const-string v1, "Shutting down executor [%s]"

    invoke-static {v0, v1, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->cancelAll()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mPool:Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-virtual {v0}, Lcom/miui/gallery/threadpool/ThreadPool;->shutdown()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mContext:Landroid/content/Context;

    return-void
.end method

.method public submit([J)V
    .locals 2

    if-eqz p1, :cond_0

    array-length v0, p1

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->mWaitingQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->submitIfAllowed()V

    goto :goto_0

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->reportIfCompleted()V

    :goto_0
    return-void
.end method
