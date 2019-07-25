.class Lcom/xiaomi/mipush/sdk/PushServiceClient$3;
.super Ljava/lang/Object;
.source "PushServiceClient.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mipush/sdk/PushServiceClient;->bindServiceSafely(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;


# direct methods
.method constructor <init>(Lcom/xiaomi/mipush/sdk/PushServiceClient;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$3;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$3;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    monitor-enter p1

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$3;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    new-instance v1, Landroid/os/Messenger;

    invoke-direct {v1, p2}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    invoke-static {v0, v1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$302(Lcom/xiaomi/mipush/sdk/PushServiceClient;Landroid/os/Messenger;)Landroid/os/Messenger;

    iget-object p2, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$3;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    const/4 v0, 0x0

    invoke-static {p2, v0}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$402(Lcom/xiaomi/mipush/sdk/PushServiceClient;Z)Z

    iget-object p2, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$3;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {p2}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$500(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Message;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$3;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$300(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/os/Messenger;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$3;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {p2}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$500(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->clear()V

    monitor-exit p1

    return-void

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p2
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$3;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$302(Lcom/xiaomi/mipush/sdk/PushServiceClient;Landroid/os/Messenger;)Landroid/os/Messenger;

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$3;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$402(Lcom/xiaomi/mipush/sdk/PushServiceClient;Z)Z

    return-void
.end method
