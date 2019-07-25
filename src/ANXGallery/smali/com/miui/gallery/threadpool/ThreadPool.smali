.class public Lcom/miui/gallery/threadpool/ThreadPool;
.super Ljava/lang/Object;
.source "ThreadPool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/threadpool/ThreadPool$Worker;,
        Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;,
        Lcom/miui/gallery/threadpool/ThreadPool$CancelListener;,
        Lcom/miui/gallery/threadpool/ThreadPool$JobContextStub;,
        Lcom/miui/gallery/threadpool/ThreadPool$JobContext;,
        Lcom/miui/gallery/threadpool/ThreadPool$Job;
    }
.end annotation


# static fields
.field public static final JOB_CONTEXT_STUB:Lcom/miui/gallery/threadpool/ThreadPool$JobContext;


# instance fields
.field mCpuCounter:Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

.field private final mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

.field mNetworkCounter:Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/threadpool/ThreadPool$JobContextStub;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContextStub;-><init>(Lcom/miui/gallery/threadpool/ThreadPool$1;)V

    sput-object v0, Lcom/miui/gallery/threadpool/ThreadPool;->JOB_CONTEXT_STUB:Lcom/miui/gallery/threadpool/ThreadPool$JobContext;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x4

    const/16 v1, 0x8

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/threadpool/ThreadPool;->mCpuCounter:Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

    new-instance v0, Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/threadpool/ThreadPool;->mNetworkCounter:Lcom/miui/gallery/threadpool/ThreadPool$ResourceCounter;

    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v8, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v8}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    new-instance v9, Lcom/miui/gallery/threadpool/PriorityThreadFactory;

    const-string v1, "thread-pool"

    const/16 v2, 0xa

    invoke-direct {v9, v1, v2}, Lcom/miui/gallery/threadpool/PriorityThreadFactory;-><init>(Ljava/lang/String;I)V

    const-wide/16 v5, 0xa

    move-object v2, v0

    move v3, p1

    move v4, p2

    invoke-direct/range {v2 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object v0, p0, Lcom/miui/gallery/threadpool/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    return-void
.end method


# virtual methods
.method public asExecutorService()Ljava/util/concurrent/ExecutorService;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/threadpool/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    return-object v0
.end method

.method public isShutdown()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/threadpool/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->isShutdown()Z

    move-result v0

    return v0
.end method

.method public shutdown()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/threadpool/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdown()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "ThreadPool"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public shutdownNow()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/threadpool/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdownNow()Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "ThreadPool"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
            "TT;>;)",
            "Lcom/miui/gallery/threadpool/Future<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    return-object p1
.end method

.method public submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
            "TT;>;",
            "Lcom/miui/gallery/threadpool/FutureListener<",
            "TT;>;)",
            "Lcom/miui/gallery/threadpool/Future<",
            "TT;>;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/threadpool/ThreadPool$Worker;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/gallery/threadpool/ThreadPool$Worker;-><init>(Lcom/miui/gallery/threadpool/ThreadPool;Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)V

    iget-object p1, p0, Lcom/miui/gallery/threadpool/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    return-object v0
.end method
