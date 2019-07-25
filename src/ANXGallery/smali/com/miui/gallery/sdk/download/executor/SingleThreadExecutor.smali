.class public Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;
.super Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;
.source "SingleThreadExecutor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor$Job;
    }
.end annotation


# instance fields
.field private mPendingDispatch:Z

.field private mWorkLock:Ljava/lang/Object;

.field private mWorker:Ljava/lang/Thread;


# direct methods
.method public constructor <init>(II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;-><init>(II)V

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mWorkLock:Ljava/lang/Object;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mPendingDispatch:Z

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->onTaskEnd()V

    return-void
.end method

.method private ensureWork()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mWorkLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mWorker:Ljava/lang/Thread;

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor$Job;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor$Job;-><init>(Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor$1;)V

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->getTag()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mWorker:Ljava/lang/Thread;

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mWorker:Ljava/lang/Thread;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setPriority(I)V

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mWorker:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mWorker:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mWorker:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->isAlive()Z

    move-result v1

    if-nez v1, :cond_2

    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mPendingDispatch:Z

    :cond_2
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

.method private onTaskEnd()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mWorkLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mWorker:Ljava/lang/Thread;

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mWorker:Ljava/lang/Thread;

    :cond_0
    iget-boolean v1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mPendingDispatch:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mQueue:Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->getPendingSize()I

    move-result v1

    if-lez v1, :cond_1

    const-string v1, "SingleThreadExecutor"

    const-string v2, "onTaskEnd need dispatch"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mPendingDispatch:Z

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->dispatch()V

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
.method public cancel(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mQueue:Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->cancel(Ljava/lang/String;)I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->interrupt()V

    :cond_0
    const/4 v1, -0x1

    if-eq p1, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected dispatch()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->ensureWork()V

    return-void
.end method

.method protected getTag()Ljava/lang/String;
    .locals 1

    const-string v0, "SingleThreadExecutor"

    return-object v0
.end method

.method public interrupt()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mWorkLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mWorker:Ljava/lang/Thread;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mWorker:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;->mQueue:Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->interrupt()Ljava/util/List;

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
