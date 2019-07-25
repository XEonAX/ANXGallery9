.class Lcom/xiaomi/push/service/XMPushService$KillJob;
.super Lcom/xiaomi/push/service/XMPushService$Job;
.source "XMPushService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/XMPushService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "KillJob"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/push/service/XMPushService;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/XMPushService$KillJob;->this$0:Lcom/xiaomi/push/service/XMPushService;

    const/4 p1, 0x5

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService$Job;-><init>(I)V

    return-void
.end method


# virtual methods
.method public getDesc()Ljava/lang/String;
    .locals 1

    const-string v0, "ask the job queue to quit"

    return-object v0
.end method

.method public process()V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$KillJob;->this$0:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {v0}, Lcom/xiaomi/push/service/XMPushService;->access$600(Lcom/xiaomi/push/service/XMPushService;)Lcom/xiaomi/push/service/JobScheduler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/service/JobScheduler;->quit()V

    return-void
.end method
