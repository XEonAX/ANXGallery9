.class Lcom/xiaomi/metoknlp/b/d;
.super Landroid/os/Handler;
.source "ConnectivityMonitor.java"


# instance fields
.field final synthetic af:Lcom/xiaomi/metoknlp/b/c;


# direct methods
.method public constructor <init>(Lcom/xiaomi/metoknlp/b/c;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/metoknlp/b/d;->af:Lcom/xiaomi/metoknlp/b/c;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    iget-object v0, p0, Lcom/xiaomi/metoknlp/b/d;->af:Lcom/xiaomi/metoknlp/b/c;

    invoke-static {v0}, Lcom/xiaomi/metoknlp/b/c;->a(Lcom/xiaomi/metoknlp/b/c;)Ljava/util/List;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/metoknlp/b/d;->af:Lcom/xiaomi/metoknlp/b/c;

    invoke-static {v1}, Lcom/xiaomi/metoknlp/b/c;->a(Lcom/xiaomi/metoknlp/b/c;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/metoknlp/b/a;

    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/net/NetworkInfo;

    invoke-interface {v2, v3}, Lcom/xiaomi/metoknlp/b/a;->b(Landroid/net/NetworkInfo;)V

    goto :goto_0

    :cond_0
    monitor-exit v0

    goto :goto_2

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :pswitch_1
    iget-object v0, p0, Lcom/xiaomi/metoknlp/b/d;->af:Lcom/xiaomi/metoknlp/b/c;

    invoke-static {v0}, Lcom/xiaomi/metoknlp/b/c;->a(Lcom/xiaomi/metoknlp/b/c;)Ljava/util/List;

    move-result-object v0

    monitor-enter v0

    :try_start_1
    iget-object v1, p0, Lcom/xiaomi/metoknlp/b/d;->af:Lcom/xiaomi/metoknlp/b/c;

    invoke-static {v1}, Lcom/xiaomi/metoknlp/b/c;->a(Lcom/xiaomi/metoknlp/b/c;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/metoknlp/b/a;

    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/net/NetworkInfo;

    invoke-interface {v2, v3}, Lcom/xiaomi/metoknlp/b/a;->a(Landroid/net/NetworkInfo;)V

    goto :goto_1

    :cond_1
    monitor-exit v0

    goto :goto_2

    :catchall_1
    move-exception p1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p1

    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xc8
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
