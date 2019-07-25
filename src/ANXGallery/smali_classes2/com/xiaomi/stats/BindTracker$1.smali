.class Lcom/xiaomi/stats/BindTracker$1;
.super Lcom/xiaomi/push/service/XMPushService$Job;
.source "BindTracker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/stats/BindTracker;->onChange(Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/stats/BindTracker;


# direct methods
.method constructor <init>(Lcom/xiaomi/stats/BindTracker;I)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/stats/BindTracker$1;->this$0:Lcom/xiaomi/stats/BindTracker;

    invoke-direct {p0, p2}, Lcom/xiaomi/push/service/XMPushService$Job;-><init>(I)V

    return-void
.end method


# virtual methods
.method public getDesc()Ljava/lang/String;
    .locals 1

    const-string v0, "Handling bind stats"

    return-object v0
.end method

.method public process()V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/stats/BindTracker$1;->this$0:Lcom/xiaomi/stats/BindTracker;

    invoke-static {v0}, Lcom/xiaomi/stats/BindTracker;->access$000(Lcom/xiaomi/stats/BindTracker;)V

    return-void
.end method
