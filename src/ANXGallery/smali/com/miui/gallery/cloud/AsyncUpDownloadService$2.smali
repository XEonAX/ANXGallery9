.class Lcom/miui/gallery/cloud/AsyncUpDownloadService$2;
.super Ljava/lang/Object;
.source "AsyncUpDownloadService.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/cloud/AsyncUpDownloadService;->tryCancelTasksWhenConnChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cloud/AsyncUpDownloadService;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cloud/AsyncUpDownloadService;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$2;->this$0:Lcom/miui/gallery/cloud/AsyncUpDownloadService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 5

    const/4 p1, 0x0

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0xe

    if-ge v0, v1, :cond_2

    :try_start_0
    invoke-static {v0}, Lcom/miui/gallery/cloud/SyncConditionManager;->check(I)I

    move-result v1

    if-eqz v1, :cond_1

    const-string v2, "AsyncUpDownloadService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "net work is changed, cancel all, priority="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/miui/gallery/util/SyncLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/miui/gallery/cloud/RequestItemBase;->isCancellablePriority(I)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-ne v2, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    :goto_1
    invoke-static {v0, v1, v3}, Lcom/miui/gallery/cloud/UpDownloadManager;->cancel(IZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$2;->this$0:Lcom/miui/gallery/cloud/AsyncUpDownloadService;

    invoke-static {v1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->access$300(Lcom/miui/gallery/cloud/AsyncUpDownloadService;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    throw v0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$2;->this$0:Lcom/miui/gallery/cloud/AsyncUpDownloadService;

    invoke-static {v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->access$300(Lcom/miui/gallery/cloud/AsyncUpDownloadService;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    const/4 p1, 0x0

    return-object p1
.end method
