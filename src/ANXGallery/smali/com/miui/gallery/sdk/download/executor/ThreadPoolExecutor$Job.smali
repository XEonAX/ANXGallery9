.class Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor$Job;
.super Ljava/lang/Object;
.source "ThreadPoolExecutor.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Job"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor$Job;->this$0:Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor$Job;-><init>(Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;)V

    return-void
.end method

.method private needContinue(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Z
    .locals 5

    const-string v0, "ThreadPoolExecutor"

    const-string v1, "pendingSize %d, interrupted %s, canceled %s"

    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor$Job;->this$0:Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;

    iget-object v2, v2, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mQueue:Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->getPendingSize()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v0, v1, v2, v3, v4}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor$Job;->this$0:Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;

    iget-object v0, v0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mQueue:Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->getPendingSize()I

    move-result v0

    if-lez v0, :cond_0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 8

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor$Job;->needContinue(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor$Job;->this$0:Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;

    iget-object v0, v0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mQueue:Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->pollToExecute()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    invoke-static {v0}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;->classifyCommand(Ljava/util/List;)Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    invoke-static {v5}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->checkValid(Lcom/miui/gallery/sdk/download/executor/DownloadCommand;)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v5}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getItem()Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccountInfo()Lcom/miui/gallery/cloud/AccountCache$AccountInfo;

    move-result-object v4

    if-eqz v4, :cond_5

    const-string v5, "ThreadPoolExecutor"

    const-string v6, "%s execute size %d"

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v5, v6, p0, v7}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :try_start_0
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    iget-object v5, v4, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;->mAccount:Landroid/accounts/Account;

    iget-object v4, v4, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;->mToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    invoke-interface {v2, v5, v4, v1}, Lcom/miui/gallery/sdk/download/downloader/IDownloader;->download(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    iget-object v4, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor$Job;->this$0:Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;

    iget-object v4, v4, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mQueue:Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;

    invoke-virtual {v3}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->removeFromExecuting(Ljava/lang/String;)Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    goto :goto_2

    :catchall_0
    move-exception p1

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    iget-object v2, p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor$Job;->this$0:Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;

    iget-object v2, v2, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;->mQueue:Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/miui/gallery/sdk/download/executor/DownloadCommandQueue;->removeFromExecuting(Ljava/lang/String;)Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    goto :goto_3

    :cond_4
    throw p1

    :cond_5
    const-string v2, "ThreadPoolExecutor"

    const-string v3, "execute: account is null"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_6
    const-string p1, "ThreadPoolExecutor"

    const-string v0, "runnable end %s"

    invoke-static {p1, v0, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x0

    return-object p1
.end method
