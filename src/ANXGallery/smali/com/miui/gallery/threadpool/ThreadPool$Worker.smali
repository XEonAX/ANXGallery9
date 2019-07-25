.class Lcom/miui/gallery/threadpool/ThreadPool$Worker;
.super Ljava/lang/Object;
.source "ThreadPool.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/Future;
.implements Lcom/miui/gallery/threadpool/ThreadPool$JobContext;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/threadpool/ThreadPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Worker"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/Future<",
        "TT;>;",
        "Lcom/miui/gallery/threadpool/ThreadPool$JobContext;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field private mCancelListener:Lcom/miui/gallery/threadpool/ThreadPool$CancelListener;

.field private mCancelType:I

.field private volatile mIsCancelled:Z

.field private mIsDone:Z

.field private mJob:Lcom/miui/gallery/threadpool/ThreadPool$Job;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
            "TT;>;"
        }
    .end annotation
.end field

.field private mListener:Lcom/miui/gallery/threadpool/FutureListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/FutureListener<",
            "TT;>;"
        }
    .end annotation
.end field

.field private mMode:I

.field private mResult:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mWaitOnResource:Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

.field final synthetic this$0:Lcom/miui/gallery/threadpool/ThreadPool;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/threadpool/ThreadPool;Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
            "TT;>;",
            "Lcom/miui/gallery/threadpool/FutureListener<",
            "TT;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->this$0:Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mCancelType:I

    iput-object p2, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mJob:Lcom/miui/gallery/threadpool/ThreadPool$Job;

    iput-object p3, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mListener:Lcom/miui/gallery/threadpool/FutureListener;

    return-void
.end method

.method private acquireResource(Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;)Z
    .locals 3

    :goto_0
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mIsCancelled:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iput-object v1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mWaitOnResource:Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

    const/4 p1, 0x0

    monitor-exit p0

    return p1

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mWaitOnResource:Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    monitor-enter p1

    :try_start_1
    iget v0, p1, Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;->value:I

    if-lez v0, :cond_1

    iget v0, p1, Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;->value:I

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    iput v0, p1, Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;->value:I

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-enter p0

    :try_start_2
    iput-object v1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mWaitOnResource:Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

    monitor-exit p0

    return v2

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :cond_1
    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Object;->wait()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catch_0
    :try_start_4
    monitor-exit p1

    goto :goto_0

    :catchall_1
    move-exception v0

    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v0

    :catchall_2
    move-exception p1

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw p1
.end method

.method private modeToCounter(I)Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->this$0:Lcom/miui/gallery/threadpool/ThreadPool;

    iget-object p1, p1, Lcom/miui/gallery/threadpool/ThreadPool;->mCpuCounter:Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

    return-object p1

    :cond_0
    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->this$0:Lcom/miui/gallery/threadpool/ThreadPool;

    iget-object p1, p1, Lcom/miui/gallery/threadpool/ThreadPool;->mNetworkCounter:Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private releaseResource(Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;)V
    .locals 1

    monitor-enter p1

    :try_start_0
    iget v0, p1, Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;->value:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p1, Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;->value:I

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public declared-synchronized cancel()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mIsCancelled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mIsCancelled:Z

    iget-object v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mWaitOnResource:Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mWaitOnResource:Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iget-object v1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mWaitOnResource:Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v1

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mCancelListener:Lcom/miui/gallery/threadpool/ThreadPool$CancelListener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mCancelListener:Lcom/miui/gallery/threadpool/ThreadPool$CancelListener;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/ThreadPool$CancelListener;->onCancel()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_2
    monitor-exit p0

    return-void

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized cancel(I)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mCancelType:I

    invoke-virtual {p0}, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->cancel()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized get()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    monitor-enter p0

    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mIsDone:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    const-string v1, "Worker"

    const-string v2, "ingore exception"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mResult:Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getCancelType()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mCancelType:I

    return v0
.end method

.method public getJob()Lcom/miui/gallery/threadpool/ThreadPool$Job;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mJob:Lcom/miui/gallery/threadpool/ThreadPool$Job;

    return-object v0
.end method

.method public isCancelled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mIsCancelled:Z

    return v0
.end method

.method public declared-synchronized isDone()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mIsDone:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public run()V
    .locals 4

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->setMode(I)Z

    move-result v1

    if-eqz v1, :cond_0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mJob:Lcom/miui/gallery/threadpool/ThreadPool$Job;

    invoke-interface {v1, p0}, Lcom/miui/gallery/threadpool/ThreadPool$Job;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "Worker"

    const-string v3, "Exception in running a job"

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-enter p0

    const/4 v2, 0x0

    :try_start_1
    invoke-virtual {p0, v2}, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->setMode(I)Z

    iput-object v1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mResult:Ljava/lang/Object;

    iput-boolean v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mIsDone:Z

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mListener:Lcom/miui/gallery/threadpool/FutureListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mListener:Lcom/miui/gallery/threadpool/FutureListener;

    invoke-interface {v0, p0}, Lcom/miui/gallery/threadpool/FutureListener;->onFutureDone(Lcom/miui/gallery/threadpool/Future;)V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method public declared-synchronized setCancelListener(Lcom/miui/gallery/threadpool/ThreadPool$CancelListener;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mCancelListener:Lcom/miui/gallery/threadpool/ThreadPool$CancelListener;

    iget-boolean p1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mIsCancelled:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mCancelListener:Lcom/miui/gallery/threadpool/ThreadPool$CancelListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mCancelListener:Lcom/miui/gallery/threadpool/ThreadPool$CancelListener;

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$CancelListener;->onCancel()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setMode(I)Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mMode:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->modeToCounter(I)Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->releaseResource(Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;)V

    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mMode:I

    invoke-direct {p0, p1}, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->modeToCounter(I)Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-direct {p0, v1}, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->acquireResource(Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;)Z

    move-result v1

    if-nez v1, :cond_1

    return v0

    :cond_1
    iput p1, p0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;->mMode:I

    :cond_2
    const/4 p1, 0x1

    return p1
.end method
