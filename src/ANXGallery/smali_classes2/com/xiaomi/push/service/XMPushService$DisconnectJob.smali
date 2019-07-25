.class public Lcom/xiaomi/push/service/XMPushService$DisconnectJob;
.super Lcom/xiaomi/push/service/XMPushService$Job;
.source "XMPushService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/XMPushService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DisconnectJob"
.end annotation


# instance fields
.field public e:Ljava/lang/Exception;

.field public reason:I

.field final synthetic this$0:Lcom/xiaomi/push/service/XMPushService;


# direct methods
.method constructor <init>(Lcom/xiaomi/push/service/XMPushService;ILjava/lang/Exception;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/XMPushService$DisconnectJob;->this$0:Lcom/xiaomi/push/service/XMPushService;

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService$Job;-><init>(I)V

    iput p2, p0, Lcom/xiaomi/push/service/XMPushService$DisconnectJob;->reason:I

    iput-object p3, p0, Lcom/xiaomi/push/service/XMPushService$DisconnectJob;->e:Ljava/lang/Exception;

    return-void
.end method


# virtual methods
.method public getDesc()Ljava/lang/String;
    .locals 1

    const-string v0, "disconnect the connection."

    return-object v0
.end method

.method public process()V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$DisconnectJob;->this$0:Lcom/xiaomi/push/service/XMPushService;

    iget v1, p0, Lcom/xiaomi/push/service/XMPushService$DisconnectJob;->reason:I

    iget-object v2, p0, Lcom/xiaomi/push/service/XMPushService$DisconnectJob;->e:Ljava/lang/Exception;

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/XMPushService;->disconnect(ILjava/lang/Exception;)V

    return-void
.end method
