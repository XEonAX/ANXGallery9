.class Lcom/miui/gallery/util/photoview/TileDecodeManager$TileDecodeJob;
.super Ljava/lang/Object;
.source "TileDecodeManager.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/photoview/TileDecodeManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TileDecodeJob"
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
.field final synthetic this$0:Lcom/miui/gallery/util/photoview/TileDecodeManager;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/util/photoview/TileDecodeManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager$TileDecodeJob;->this$0:Lcom/miui/gallery/util/photoview/TileDecodeManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/util/photoview/TileDecodeManager;Lcom/miui/gallery/util/photoview/TileDecodeManager$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/photoview/TileDecodeManager$TileDecodeJob;-><init>(Lcom/miui/gallery/util/photoview/TileDecodeManager;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/photoview/TileDecodeManager$TileDecodeJob;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 10

    :cond_0
    :goto_0
    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager$TileDecodeJob;->this$0:Lcom/miui/gallery/util/photoview/TileDecodeManager;

    invoke-static {v0}, Lcom/miui/gallery/util/photoview/TileDecodeManager;->access$100(Lcom/miui/gallery/util/photoview/TileDecodeManager;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    const-wide/16 v2, 0x7d0

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v2, v3, v4}, Ljava/util/concurrent/BlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/photoview/Tile;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/Tile;->isActive()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager$TileDecodeJob;->this$0:Lcom/miui/gallery/util/photoview/TileDecodeManager;

    invoke-static {v0}, Lcom/miui/gallery/util/photoview/TileDecodeManager;->access$100(Lcom/miui/gallery/util/photoview/TileDecodeManager;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    return-object v1

    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/Tile;->getTileRect()Landroid/graphics/Rect;

    move-result-object v3

    invoke-static {v3}, Lcom/miui/gallery/util/photoview/TileView;->makeTileKey(Landroid/graphics/Rect;)I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager$TileDecodeJob;->this$0:Lcom/miui/gallery/util/photoview/TileDecodeManager;

    invoke-static {v4}, Lcom/miui/gallery/util/photoview/TileDecodeManager;->access$200(Lcom/miui/gallery/util/photoview/TileDecodeManager;)Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v5, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager$TileDecodeJob;->this$0:Lcom/miui/gallery/util/photoview/TileDecodeManager;

    invoke-static {v5}, Lcom/miui/gallery/util/photoview/TileDecodeManager;->access$300(Lcom/miui/gallery/util/photoview/TileDecodeManager;)Landroid/util/SparseArray;

    move-result-object v5

    invoke-virtual {v5, v3, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iget-object v3, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager$TileDecodeJob;->this$0:Lcom/miui/gallery/util/photoview/TileDecodeManager;

    invoke-static {v3}, Lcom/miui/gallery/util/photoview/TileDecodeManager;->access$400(Lcom/miui/gallery/util/photoview/TileDecodeManager;)Lcom/miui/gallery/util/photoview/TileBitProvider;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/miui/gallery/util/photoview/Tile;->decode(Lcom/miui/gallery/util/photoview/TileBitProvider;)Z

    move-result v3

    const-string v4, "TileDecodeManager"

    const-string v5, "decode tile %s costs %d ms."

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/Tile;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    const/4 v9, 0x0

    sub-long/2addr v7, v1

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v4, v5, v6, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/TileDecodeManager$TileDecodeJob;->this$0:Lcom/miui/gallery/util/photoview/TileDecodeManager;

    invoke-static {v1}, Lcom/miui/gallery/util/photoview/TileDecodeManager;->access$500(Lcom/miui/gallery/util/photoview/TileDecodeManager;)Landroid/os/Handler;

    move-result-object v1

    if-eqz v1, :cond_0

    if-eqz v3, :cond_3

    const/4 v2, 0x1

    goto :goto_1

    :cond_3
    const/4 v2, 0x2

    :goto_1
    invoke-virtual {v1, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_0

    :cond_4
    const-string v0, "TileDecodeManager"

    const-string v2, "tile decode job is cancelled %s"

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {v0, v2, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1
.end method
