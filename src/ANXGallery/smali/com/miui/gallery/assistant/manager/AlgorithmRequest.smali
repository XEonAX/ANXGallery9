.class public abstract Lcom/miui/gallery/assistant/manager/AlgorithmRequest;
.super Ljava/lang/Object;
.source "AlgorithmRequest.java"

# interfaces
.implements Ljava/lang/Comparable;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;,
        Lcom/miui/gallery/assistant/manager/AlgorithmRequest$State;,
        Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Ljava/lang/Object;",
        "P::",
        "Lcom/miui/gallery/assistant/manager/request/param/RequestParams<",
        "TI;>;R:",
        "Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/miui/gallery/assistant/manager/AlgorithmRequest;",
        ">;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field static final seq:Ljava/util/concurrent/atomic/AtomicLong;


# instance fields
.field protected final TAG:Ljava/lang/String;

.field private mAlgorithmResult:Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field

.field private volatile mAsyncThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener<",
            "TR;>;"
        }
    .end annotation
.end field

.field private volatile mIsCanceled:Z

.field private volatile mMainThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener<",
            "TR;>;"
        }
    .end annotation
.end field

.field private final mPriority:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;

.field protected mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TP;"
        }
    .end annotation
.end field

.field private volatile mState:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$State;

.field private mSyncExecuteLock:Ljava/util/concurrent/CountDownLatch;

.field seqNum:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    sput-object v0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->seq:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/RequestParams;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;",
            "TP;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mSyncExecuteLock:Ljava/util/concurrent/CountDownLatch;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mIsCanceled:Z

    iput-object p2, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    iput-object p1, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mPriority:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;

    sget-object p1, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$State;->STATE_INIT:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$State;

    iput-object p1, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mState:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$State;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/assistant/manager/AlgorithmRequest;)Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mMainThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;

    return-object p0
.end method

.method private notifySaveComplete(Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mAsyncThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mAsyncThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;->onSaveComplete(Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mMainThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$4;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$4;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest;Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    return-void
.end method

.method private onStart()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mAsyncThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mAsyncThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;

    invoke-interface {v0}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;->onStart()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mMainThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$1;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    return-void
.end method

.method private recordAlgorithmProcessTime(J)V
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr v0, p1

    iget-object p1, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->TAG:Ljava/lang/String;

    const-string p2, "%s AlgorithmRequest process using time %d ms"

    iget-object v2, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->TAG:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {p1, p2, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "model_"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-wide/16 v2, 0x32

    div-long v4, v0, v2

    mul-long v4, v4, v2

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, p2, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "assistant"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "assistant_algorithm_process_time_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->TAG:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p2, v2, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const-string p1, "assistant"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "assistant_algorithm_process_time_distribution_"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->TAG:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method

.method private releaseSyncExecuteLock()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mSyncExecuteLock:Ljava/util/concurrent/CountDownLatch;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mSyncExecuteLock:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    :cond_0
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/miui/gallery/assistant/manager/AlgorithmRequest;)I
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mPriority:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;->ordinal()I

    move-result v0

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->getPriority()Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;->ordinal()I

    move-result v1

    sub-int/2addr v0, v1

    if-nez v0, :cond_1

    iget-wide v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->seqNum:J

    iget-wide v2, p1, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->seqNum:J

    cmp-long p1, v0, v2

    if-gez p1, :cond_0

    const/4 p1, -0x1

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    const/4 v0, 0x1

    :cond_1
    :goto_0
    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->compareTo(Lcom/miui/gallery/assistant/manager/AlgorithmRequest;)I

    move-result p1

    return p1
.end method

.method protected deliverResponse(Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mAlgorithmResult:Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;

    invoke-direct {p0}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->releaseSyncExecuteLock()V

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mAsyncThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mAsyncThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;->onComputeComplete(Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mMainThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$2;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest;Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    return-void
.end method

.method public execute()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->refreshSequence()V

    invoke-static {}, Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;->getInstance()Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;->enqueue(Lcom/miui/gallery/assistant/manager/AlgorithmRequest;)V

    sget-object v0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$State;->STATE_QUEUING:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$State;

    iput-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mState:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$State;

    return-void
.end method

.method public executeSync()Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
        }
    .end annotation

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_1

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getRequestThreadLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mPriority:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;

    sget-object v1, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;->PRIORITY_IMMEDIATELY:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->run()V

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mAlgorithmResult:Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;

    return-object v0

    :cond_0
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mSyncExecuteLock:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->execute()V

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mSyncExecuteLock:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mAlgorithmResult:Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;

    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "executeSync could not call on main thread or request thread."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPriority()Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mPriority:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;

    return-object v0
.end method

.method protected abstract onSaveResult(Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation
.end method

.method protected abstract process(Ljava/lang/Object;)Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TI;)TR;"
        }
    .end annotation
.end method

.method protected refreshSequence()V
    .locals 2

    sget-object v0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->seq:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->seqNum:J

    return-void
.end method

.method public run()V
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mIsCanceled:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mAsyncThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mAsyncThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;

    invoke-interface {v0}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;->onCancel()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mMainThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$3;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$State;->STATE_START:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$State;

    iput-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mState:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$State;

    invoke-direct {p0}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->onStart()V

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    invoke-interface {v2}, Lcom/miui/gallery/assistant/manager/request/param/RequestParams;->getAlgorithmRequestInputs()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->process(Ljava/lang/Object;)Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;

    move-result-object v2

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->recordAlgorithmProcessTime(J)V

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;->getResultCode()I

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_2

    return-void

    :cond_2
    invoke-virtual {p0, v2}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->deliverResponse(Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;)V

    sget-object v0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$State;->STATE_FINISHED:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$State;

    iput-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mState:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$State;

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->TAG:Ljava/lang/String;

    const-string v1, "%s AlgorithmRequest save result!"

    iget-object v3, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->TAG:Ljava/lang/String;

    invoke-static {v0, v1, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v2}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->onSaveResult(Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;)V

    invoke-direct {p0, v2}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->notifySaveComplete(Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public setMainThreadListener(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener<",
            "TR;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;->mMainThreadListener:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;

    return-void
.end method
