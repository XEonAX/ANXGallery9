.class Lcom/xiaomi/metoknlp/devicediscover/k;
.super Landroid/content/BroadcastReceiver;
.source "WifiCampStatistics.java"


# instance fields
.field final synthetic S:Lcom/xiaomi/metoknlp/devicediscover/f;


# direct methods
.method constructor <init>(Lcom/xiaomi/metoknlp/devicediscover/f;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/metoknlp/devicediscover/k;->S:Lcom/xiaomi/metoknlp/devicediscover/f;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/metoknlp/devicediscover/k;->S:Lcom/xiaomi/metoknlp/devicediscover/f;

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/f;->a(Lcom/xiaomi/metoknlp/devicediscover/f;)Lcom/xiaomi/metoknlp/devicediscover/n;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/xiaomi/metoknlp/devicediscover/n;->hasMessages(I)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/metoknlp/devicediscover/k;->S:Lcom/xiaomi/metoknlp/devicediscover/f;

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/f;->a(Lcom/xiaomi/metoknlp/devicediscover/f;)Lcom/xiaomi/metoknlp/devicediscover/n;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/xiaomi/metoknlp/devicediscover/n;->removeMessages(I)V

    :cond_0
    iget-object p1, p0, Lcom/xiaomi/metoknlp/devicediscover/k;->S:Lcom/xiaomi/metoknlp/devicediscover/f;

    invoke-static {p1}, Lcom/xiaomi/metoknlp/devicediscover/f;->a(Lcom/xiaomi/metoknlp/devicediscover/f;)Lcom/xiaomi/metoknlp/devicediscover/n;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/xiaomi/metoknlp/devicediscover/n;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    iget-object p2, p0, Lcom/xiaomi/metoknlp/devicediscover/k;->S:Lcom/xiaomi/metoknlp/devicediscover/f;

    invoke-static {p2}, Lcom/xiaomi/metoknlp/devicediscover/f;->a(Lcom/xiaomi/metoknlp/devicediscover/f;)Lcom/xiaomi/metoknlp/devicediscover/n;

    move-result-object p2

    const-wide/16 v0, 0x2710

    invoke-virtual {p2, p1, v0, v1}, Lcom/xiaomi/metoknlp/devicediscover/n;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_1
    return-void
.end method
