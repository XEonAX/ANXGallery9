.class Lcom/xiaomi/push/service/XMPushService$ResetConnectionJob;
.super Lcom/xiaomi/push/service/XMPushService$Job;
.source "XMPushService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/XMPushService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ResetConnectionJob"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/push/service/XMPushService;


# direct methods
.method constructor <init>(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/XMPushService$ResetConnectionJob;->this$0:Lcom/xiaomi/push/service/XMPushService;

    const/4 p1, 0x3

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService$Job;-><init>(I)V

    return-void
.end method


# virtual methods
.method public getDesc()Ljava/lang/String;
    .locals 1

    const-string v0, "reset the connection."

    return-object v0
.end method

.method public process()V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$ResetConnectionJob;->this$0:Lcom/xiaomi/push/service/XMPushService;

    const/16 v1, 0xb

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/XMPushService;->disconnect(ILjava/lang/Exception;)V

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$ResetConnectionJob;->this$0:Lcom/xiaomi/push/service/XMPushService;

    invoke-virtual {v0}, Lcom/xiaomi/push/service/XMPushService;->shouldReconnect()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$ResetConnectionJob;->this$0:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {v0}, Lcom/xiaomi/push/service/XMPushService;->access$900(Lcom/xiaomi/push/service/XMPushService;)V

    :cond_0
    return-void
.end method
