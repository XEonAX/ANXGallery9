.class public Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;
.super Ljava/lang/Object;
.source "AlgorithmExecuteManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager$AlgorithmManagerHolder;
    }
.end annotation


# instance fields
.field private final mBlockingQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private final mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private final mThreadFactory:Ljava/util/concurrent/ThreadFactory;


# direct methods
.method private constructor <init>()V
    .locals 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;->mBlockingQueue:Ljava/util/concurrent/BlockingQueue;

    new-instance v0, Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager$1;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;)V

    iput-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;->mThreadFactory:Ljava/util/concurrent/ThreadFactory;

    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v7, p0, Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;->mBlockingQueue:Ljava/util/concurrent/BlockingQueue;

    iget-object v8, p0, Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;->mThreadFactory:Ljava/util/concurrent/ThreadFactory;

    const/4 v2, 0x1

    const/4 v3, 0x3

    const-wide/16 v4, 0x1e

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;-><init>()V

    return-void
.end method

.method static getInstance()Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager$AlgorithmManagerHolder;->access$100()Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public enqueue(Lcom/miui/gallery/assistant/manager/AlgorithmRequest;)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    const-string p1, "AlgorithmExecuteManager"

    const-string v0, "Execute Queue size: %d"

    iget-object v1, p0, Lcom/miui/gallery/assistant/manager/AlgorithmExecuteManager;->mBlockingQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v1}, Ljava/util/concurrent/BlockingQueue;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
