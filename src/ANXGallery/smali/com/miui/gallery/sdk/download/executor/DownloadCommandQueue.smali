.class public Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;
.super Ljava/lang/Object;
.source "DownloadCommandQueue.java"


# instance fields
.field private final mAllowBatchMax:I

.field private final mExecutings:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/sdk/download/executor/DownloadCommand;",
            ">;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/util/concurrent/locks/ReadWriteLock;

.field private final mPendings:Lcom/miui/gallery/sdk/download/executor/queue/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/sdk/download/executor/queue/Queue<",
            "Lcom/miui/gallery/sdk/download/executor/DownloadCommand;",
            ">;"
        }
    .end annotation
.end field

.field private final mTag:Ljava/lang/String;


# direct methods
.method public constructor <init>(IILjava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mLock:Ljava/util/concurrent/locks/ReadWriteLock;

    new-instance v0, Lcom/miui/gallery/sdk/download/executor/queue/Queue;

    invoke-direct {v0, p2}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mPendings:Lcom/miui/gallery/sdk/download/executor/queue/Queue;

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mExecutings:Ljava/util/Map;

    iput p1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mAllowBatchMax:I

    iput-object p3, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mTag:Ljava/lang/String;

    return-void
.end method

.method private lock(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->lock()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->lock()V

    :goto_0
    return-void
.end method

.method private unlock(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    :goto_0
    return-void
.end method


# virtual methods
.method public cancel(Ljava/lang/String;)I
    .locals 4

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->lock(Z)V

    const/4 v1, -0x1

    :try_start_0
    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mPendings:Lcom/miui/gallery/sdk/download/executor/queue/Queue;

    invoke-virtual {v2, p1}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->remove(Ljava/lang/String;)Lcom/miui/gallery/sdk/download/executor/queue/Command;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mExecutings:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    :cond_1
    :goto_0
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getItem()Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    move-result-object p1

    invoke-virtual {p1, v3, v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->compareAnsSetStatus(II)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getItem()Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->callbackCancel(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    return v1

    :catchall_0
    move-exception p1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    throw p1
.end method

.method public cancelAll()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/sdk/download/executor/DownloadCommand;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->lock(Z)V

    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mExecutings:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mExecutings:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mPendings:Lcom/miui/gallery/sdk/download/executor/queue/Queue;

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->values()Ljava/util/Collection;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mPendings:Lcom/miui/gallery/sdk/download/executor/queue/Queue;

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->clear()V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    invoke-virtual {v3}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getItem()Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->compareAnsSetStatus(II)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v3}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getItem()Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    move-result-object v3

    invoke-static {v3}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->callbackCancel(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :cond_3
    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    throw v1
.end method

.method public contains(Ljava/lang/String;)I
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->lock(Z)V

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mPendings:Lcom/miui/gallery/sdk/download/executor/queue/Queue;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->get(Ljava/lang/String;)Lcom/miui/gallery/sdk/download/executor/queue/Command;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    return v0

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mExecutings:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    :goto_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    return p1

    :cond_1
    const/4 p1, -0x1

    goto :goto_0

    :catchall_0
    move-exception p1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    throw p1
.end method

.method public getBatchSize()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mAllowBatchMax:I

    return v0
.end method

.method public getPendingSize()I
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->lock(Z)V

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mPendings:Lcom/miui/gallery/sdk/download/executor/queue/Queue;

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->size()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    return v1

    :catchall_0
    move-exception v1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    throw v1
.end method

.method public interrupt()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/sdk/download/executor/DownloadCommand;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->lock(Z)V

    :try_start_0
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mExecutings:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x2

    const/4 v5, 0x0

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    invoke-virtual {v3}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getItem()Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    move-result-object v6

    invoke-virtual {v6, v5, v4}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->compareAnsSetStatus(II)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mExecutings:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mPendings:Lcom/miui/gallery/sdk/download/executor/queue/Queue;

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    invoke-virtual {v3}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getItem()Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    move-result-object v6

    invoke-virtual {v6, v5, v4}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->compareAnsSetStatus(II)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mPendings:Lcom/miui/gallery/sdk/download/executor/queue/Queue;

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->clear()V

    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    new-instance v5, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    invoke-direct {v5, v4}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;-><init>(Lcom/miui/gallery/sdk/download/executor/DownloadCommand;)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_4
    iget-object v3, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mPendings:Lcom/miui/gallery/sdk/download/executor/queue/Queue;

    invoke-virtual {v3, v2}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->putAtLast(Ljava/util/List;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    throw v1
.end method

.method public pollToExecute()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/sdk/download/executor/DownloadCommand;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->lock(Z)V

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mPendings:Lcom/miui/gallery/sdk/download/executor/queue/Queue;

    iget v2, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mAllowBatchMax:I

    invoke-virtual {v1, v2}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->poll(I)Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    iget-object v4, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mExecutings:Ljava/util/Map;

    invoke-virtual {v3}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mTag:Ljava/lang/String;

    const-string v3, "pollToExecute: remove count=%d, remain count=%d"

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mPendings:Lcom/miui/gallery/sdk/download/executor/queue/Queue;

    invoke-virtual {v5}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    throw v1
.end method

.method public put(Lcom/miui/gallery/sdk/download/executor/DownloadCommand;Z)I
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->put(Ljava/util/List;Z)I

    move-result p1

    return p1
.end method

.method public put(Ljava/util/List;Z)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/sdk/download/executor/DownloadCommand;",
            ">;Z)I"
        }
    .end annotation

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->lock(Z)V

    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    iget-object v3, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mExecutings:Ljava/util/Map;

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mPendings:Lcom/miui/gallery/sdk/download/executor/queue/Queue;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->putAtFirst(Ljava/util/List;)I

    move-result p1

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mPendings:Lcom/miui/gallery/sdk/download/executor/queue/Queue;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->putAtLast(Ljava/util/List;)I

    move-result p1

    :goto_1
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mTag:Ljava/lang/String;

    const-string v2, "put: add count=%d, atFirst=%s"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-static {v1, v2, v3, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    return p1

    :catchall_0
    move-exception p1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    throw p1
.end method

.method public remove(Ljava/lang/String;)Lcom/miui/gallery/sdk/download/executor/DownloadCommand;
    .locals 2

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->lock(Z)V

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mExecutings:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mPendings:Lcom/miui/gallery/sdk/download/executor/queue/Queue;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/sdk/download/executor/queue/Queue;->remove(Ljava/lang/String;)Lcom/miui/gallery/sdk/download/executor/queue/Command;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    return-object v1

    :catchall_0
    move-exception p1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    throw p1
.end method

.method public removeFromExecuting(Ljava/lang/String;)Lcom/miui/gallery/sdk/download/executor/DownloadCommand;
    .locals 2

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->lock(Z)V

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->mExecutings:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->unlock(Z)V

    throw p1
.end method
