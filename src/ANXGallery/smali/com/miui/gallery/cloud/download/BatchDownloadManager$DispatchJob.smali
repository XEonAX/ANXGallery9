.class Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;
.super Ljava/lang/Object;
.source "BatchDownloadManager.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/download/BatchDownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DispatchJob"
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mType:Lcom/miui/gallery/sdk/download/DownloadType;

.field final synthetic this$0:Lcom/miui/gallery/cloud/download/BatchDownloadManager;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/cloud/download/BatchDownloadManager;Landroid/content/Context;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->this$0:Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-void
.end method

.method private isValidRequest()Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->isAutoDownload()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->this$0:Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    invoke-static {v1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->access$300(Lcom/miui/gallery/cloud/download/BatchDownloadManager;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->this$0:Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    invoke-static {v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->access$400(Lcom/miui/gallery/cloud/download/BatchDownloadManager;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private queryDownload(Landroid/content/Context;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v2, -0x1

    const/4 v3, 0x0

    invoke-static {v0, v1, v3, v2}, Lcom/miui/gallery/cloud/download/BatchDownloadUtil;->queryDownload(Landroid/content/Context;Lcom/miui/gallery/sdk/download/DownloadType;ZI)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getSyncStrategy()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownloadShare()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v3, 0x1

    invoke-static {v0, v1, v3, v2}, Lcom/miui/gallery/cloud/download/BatchDownloadUtil;->queryDownload(Landroid/content/Context;Lcom/miui/gallery/sdk/download/DownloadType;ZI)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_1
    return-object p1
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isAppProcessInForeground(Landroid/content/Context;)Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->this$0:Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    invoke-static {v1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->access$500(Lcom/miui/gallery/cloud/download/BatchDownloadManager;)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v1

    xor-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setRequireCharging(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->this$0:Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    invoke-static {v1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->access$600(Lcom/miui/gallery/cloud/download/BatchDownloadManager;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const-string p1, "BatchDownloadManager"

    const-string v0, "condition not ok, cannot download"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->mContext:Landroid/content/Context;

    invoke-direct {p0, v1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->queryDownload(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_6

    const/4 v3, 0x0

    invoke-static {v3}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->access$702(Z)Z

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v5

    if-nez v5, :cond_5

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->isValidRequest()Z

    move-result v5

    if-nez v5, :cond_1

    goto/16 :goto_1

    :cond_1
    const-string v5, "BatchDownloadManager"

    const-string v6, "start download %s items for %s in foreground %s"

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iget-object v8, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->this$0:Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    invoke-static {v8}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->access$300(Lcom/miui/gallery/cloud/download/BatchDownloadManager;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v8

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-static {v5, v6, v7, v8, v9}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v5, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->this$0:Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    invoke-static {v5}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->access$500(Lcom/miui/gallery/cloud/download/BatchDownloadManager;)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setRequireWLAN(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setRequireDeviceStorage(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setRequirePower(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v5

    xor-int/2addr v0, v4

    invoke-virtual {v5, v0}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setRequireCharging(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->build()Lcom/miui/gallery/sdk/download/DownloadOptions;

    move-result-object v0

    iget-object v5, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->this$0:Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    invoke-static {v5, v1, v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->access$800(Lcom/miui/gallery/cloud/download/BatchDownloadManager;Ljava/util/List;Lcom/miui/gallery/sdk/download/DownloadOptions;)V

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result p1

    if-nez p1, :cond_4

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->isValidRequest()Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->this$0:Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    invoke-static {p1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->access$400(Lcom/miui/gallery/cloud/download/BatchDownloadManager;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object p1

    invoke-virtual {p1, v3, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->this$0:Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    invoke-static {p1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->access$900(Lcom/miui/gallery/cloud/download/BatchDownloadManager;)V

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->mContext:Landroid/content/Context;

    const/16 v0, 0x2710

    invoke-static {p1, v0}, Lcom/miui/gallery/cloud/jobs/SyncJobService;->scheduleJob(Landroid/content/Context;I)I

    iget-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->this$0:Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {p1, v0}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->access$1000(Lcom/miui/gallery/cloud/download/BatchDownloadManager;I)V

    goto :goto_2

    :cond_4
    :goto_0
    const-string p1, "BatchDownloadManager"

    const-string v0, "not auto batch download after dispatching"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/sdk/download/ImageDownloader;->getInstance()Lcom/miui/gallery/sdk/download/ImageDownloader;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/sdk/download/ImageDownloader;->cancelAll(Lcom/miui/gallery/sdk/download/DownloadType;)V

    return-object v2

    :cond_5
    :goto_1
    const-string p1, "BatchDownloadManager"

    const-string v0, "not auto batch download before dispatching"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    :cond_6
    invoke-static {v4}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->access$702(Z)Z

    iget-object p1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->this$0:Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    invoke-static {p1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->access$1100(Lcom/miui/gallery/cloud/download/BatchDownloadManager;)V

    const-string p1, "BatchDownloadManager"

    const-string v0, "no items need download for %s"

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$DispatchJob;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_2
    return-object v2
.end method
