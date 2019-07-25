.class Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$1;
.super Ljava/lang/Object;
.source "PushClientsManager.java"

# interfaces
.implements Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$ClientStatusListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;-><init>(Lcom/xiaomi/push/service/XMPushService;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;


# direct methods
.method constructor <init>(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$1;->this$0:Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChange(Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;I)V
    .locals 2

    sget-object p1, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->binding:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    if-ne p2, p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$1;->this$0:Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    invoke-static {p1}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->access$100(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)Lcom/xiaomi/push/service/XMPushService;

    move-result-object p1

    iget-object p2, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$1;->this$0:Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    invoke-static {p2}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->access$000(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)Lcom/xiaomi/push/service/XMPushService$BindTimeoutJob;

    move-result-object p2

    const-wide/32 v0, 0xea60

    invoke-virtual {p1, p2, v0, v1}, Lcom/xiaomi/push/service/XMPushService;->executeJobDelayed(Lcom/xiaomi/push/service/XMPushService$Job;J)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$1;->this$0:Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    invoke-static {p1}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->access$100(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)Lcom/xiaomi/push/service/XMPushService;

    move-result-object p1

    iget-object p2, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$1;->this$0:Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    invoke-static {p2}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->access$000(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)Lcom/xiaomi/push/service/XMPushService$BindTimeoutJob;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/xiaomi/push/service/XMPushService;->removeJobs(Lcom/xiaomi/push/service/XMPushService$Job;)V

    :goto_0
    return-void
.end method
