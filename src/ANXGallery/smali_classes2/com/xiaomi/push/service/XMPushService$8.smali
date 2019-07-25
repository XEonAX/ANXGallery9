.class Lcom/xiaomi/push/service/XMPushService$8;
.super Lcom/xiaomi/push/service/XMPushService$Job;
.source "XMPushService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/XMPushService;->handleIntent(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/push/service/XMPushService;

.field final synthetic val$envType:I

.field final synthetic val$packageName:Ljava/lang/String;

.field final synthetic val$payload:[B


# direct methods
.method constructor <init>(Lcom/xiaomi/push/service/XMPushService;II[BLjava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/XMPushService$8;->this$0:Lcom/xiaomi/push/service/XMPushService;

    iput p3, p0, Lcom/xiaomi/push/service/XMPushService$8;->val$envType:I

    iput-object p4, p0, Lcom/xiaomi/push/service/XMPushService$8;->val$payload:[B

    iput-object p5, p0, Lcom/xiaomi/push/service/XMPushService$8;->val$packageName:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/xiaomi/push/service/XMPushService$Job;-><init>(I)V

    return-void
.end method


# virtual methods
.method public getDesc()Ljava/lang/String;
    .locals 1

    const-string v0, "clear account cache."

    return-object v0
.end method

.method public process()V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$8;->this$0:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {v0}, Lcom/xiaomi/push/service/MIPushAccountUtils;->clearAccount(Landroid/content/Context;)V

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v0

    const-string v1, "5"

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/PushClientsManager;->deactivateAllClientByChid(Ljava/lang/String;)V

    iget v0, p0, Lcom/xiaomi/push/service/XMPushService$8;->val$envType:I

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->setEnvType(I)V

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$8;->this$0:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {v0}, Lcom/xiaomi/push/service/XMPushService;->access$300(Lcom/xiaomi/push/service/XMPushService;)Lcom/xiaomi/smack/ConnectionConfiguration;

    move-result-object v0

    invoke-static {}, Lcom/xiaomi/smack/ConnectionConfiguration;->getXmppServerHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/smack/ConnectionConfiguration;->setHost(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService$8;->this$0:Lcom/xiaomi/push/service/XMPushService;

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService$8;->val$payload:[B

    iget-object v2, p0, Lcom/xiaomi/push/service/XMPushService$8;->val$packageName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/XMPushService;->registerForMiPushApp([BLjava/lang/String;)V

    return-void
.end method
