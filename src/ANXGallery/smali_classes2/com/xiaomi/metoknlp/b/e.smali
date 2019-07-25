.class Lcom/xiaomi/metoknlp/b/e;
.super Landroid/content/BroadcastReceiver;
.source "ConnectivityMonitor.java"


# instance fields
.field final synthetic af:Lcom/xiaomi/metoknlp/b/c;


# direct methods
.method private constructor <init>(Lcom/xiaomi/metoknlp/b/c;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/metoknlp/b/e;->af:Lcom/xiaomi/metoknlp/b/c;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/xiaomi/metoknlp/b/c;Lcom/xiaomi/metoknlp/b/b;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/metoknlp/b/e;-><init>(Lcom/xiaomi/metoknlp/b/c;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    if-nez p2, :cond_0

    return-void

    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    const-string v0, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "networkInfo"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/net/NetworkInfo;

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result p2

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/xiaomi/metoknlp/b/e;->af:Lcom/xiaomi/metoknlp/b/c;

    invoke-static {p2}, Lcom/xiaomi/metoknlp/b/c;->b(Lcom/xiaomi/metoknlp/b/c;)Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0xc8

    invoke-virtual {p2, v0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object p2

    sget-object v0, Landroid/net/NetworkInfo$State;->DISCONNECTED:Landroid/net/NetworkInfo$State;

    if-ne p2, v0, :cond_3

    iget-object p2, p0, Lcom/xiaomi/metoknlp/b/e;->af:Lcom/xiaomi/metoknlp/b/c;

    invoke-static {p2}, Lcom/xiaomi/metoknlp/b/c;->b(Lcom/xiaomi/metoknlp/b/c;)Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0xc9

    invoke-virtual {p2, v0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    :cond_3
    :goto_0
    return-void
.end method
