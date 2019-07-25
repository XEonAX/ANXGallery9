.class Lcom/miui/gallery/cleaner/ScannerManager$6;
.super Ljava/lang/Object;
.source "ScannerManager.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cleaner/ScannerManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cleaner/ScannerManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cleaner/ScannerManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScannerManager$6;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cleaner/ScannerManager$6;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 11

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager$6;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/ScannerManager;->access$400(Lcom/miui/gallery/cleaner/ScannerManager;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cleaner/BaseScanner;

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_1

    return-object v2

    :cond_1
    invoke-virtual {v1}, Lcom/miui/gallery/cleaner/BaseScanner;->scan()Lcom/miui/gallery/cleaner/ScanResult;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/miui/gallery/cleaner/ScanResult;->getSize()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v8, v4, v6

    if-gtz v8, :cond_2

    goto :goto_0

    :cond_2
    iget-object v4, p0, Lcom/miui/gallery/cleaner/ScannerManager$6;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    monitor-enter v4

    :try_start_0
    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v5

    if-eqz v5, :cond_3

    monitor-exit v4

    return-object v2

    :cond_3
    iget-object v2, p0, Lcom/miui/gallery/cleaner/ScannerManager$6;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-static {v2}, Lcom/miui/gallery/cleaner/ScannerManager;->access$500(Lcom/miui/gallery/cleaner/ScannerManager;)Ljava/util/ArrayList;

    move-result-object v2

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v5, p0, Lcom/miui/gallery/cleaner/ScannerManager$6;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    iget-object v6, p0, Lcom/miui/gallery/cleaner/ScannerManager$6;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-static {v6}, Lcom/miui/gallery/cleaner/ScannerManager;->access$200(Lcom/miui/gallery/cleaner/ScannerManager;)J

    move-result-wide v6

    invoke-virtual {v3}, Lcom/miui/gallery/cleaner/ScanResult;->getSize()J

    move-result-wide v8

    const/4 v10, 0x0

    add-long/2addr v6, v8

    invoke-static {v5, v6, v7}, Lcom/miui/gallery/cleaner/ScannerManager;->access$202(Lcom/miui/gallery/cleaner/ScannerManager;J)J

    iget-object v5, p0, Lcom/miui/gallery/cleaner/ScannerManager$6;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-static {v5}, Lcom/miui/gallery/cleaner/ScannerManager;->access$500(Lcom/miui/gallery/cleaner/ScannerManager;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iget-object v2, p0, Lcom/miui/gallery/cleaner/ScannerManager$6;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-static {v2}, Lcom/miui/gallery/cleaner/ScannerManager;->access$600(Lcom/miui/gallery/cleaner/ScannerManager;)Lcom/miui/gallery/cleaner/BaseScanner$OnScanResultUpdateListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/cleaner/BaseScanner;->addListener(Lcom/miui/gallery/cleaner/BaseScanner$OnScanResultUpdateListener;)V

    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScannerManager$6;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-static {v1, p1}, Lcom/miui/gallery/cleaner/ScannerManager;->access$700(Lcom/miui/gallery/cleaner/ScannerManager;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :catchall_0
    move-exception p1

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw p1

    :catchall_1
    move-exception p1

    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw p1

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScannerManager$6;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    monitor-enter v0

    :try_start_5
    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result p1

    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/cleaner/ScannerManager$6;->this$0:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-static {p1, v2}, Lcom/miui/gallery/cleaner/ScannerManager;->access$802(Lcom/miui/gallery/cleaner/ScannerManager;Lcom/miui/gallery/threadpool/Future;)Lcom/miui/gallery/threadpool/Future;

    :cond_5
    monitor-exit v0

    return-object v2

    :catchall_2
    move-exception p1

    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw p1
.end method
