.class Lcom/xiaomi/push/service/XMPushService$13;
.super Ljava/lang/Object;
.source "XMPushService.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/XMPushService;->enableForegroundService()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/push/service/XMPushService;


# direct methods
.method constructor <init>(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/XMPushService$13;->this$0:Lcom/xiaomi/push/service/XMPushService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onServiceConnected "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->i(Ljava/lang/String;)V

    invoke-static {}, Lcom/xiaomi/push/service/XMJobService;->getRunningService()Landroid/app/Service;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p2, p0, Lcom/xiaomi/push/service/XMPushService$13;->this$0:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {}, Lcom/xiaomi/push/service/XMPushService;->access$1000()I

    move-result v0

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService$13;->this$0:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {v1}, Lcom/xiaomi/push/service/XMPushService;->getPushServiceNotification(Landroid/content/Context;)Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Lcom/xiaomi/push/service/XMPushService;->startForeground(ILandroid/app/Notification;)V

    invoke-static {}, Lcom/xiaomi/push/service/XMPushService;->access$1000()I

    move-result p2

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$13;->this$0:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {v0}, Lcom/xiaomi/push/service/XMPushService;->getPushServiceNotification(Landroid/content/Context;)Landroid/app/Notification;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/app/Service;->stopForeground(Z)V

    iget-object p1, p0, Lcom/xiaomi/push/service/XMPushService$13;->this$0:Lcom/xiaomi/push/service/XMPushService;

    invoke-virtual {p1, p0}, Lcom/xiaomi/push/service/XMPushService;->unbindService(Landroid/content/ServiceConnection;)V

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "XMService connected but innerService is null "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    return-void
.end method
