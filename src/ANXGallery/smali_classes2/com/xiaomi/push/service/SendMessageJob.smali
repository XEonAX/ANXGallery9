.class Lcom/xiaomi/push/service/SendMessageJob;
.super Lcom/xiaomi/push/service/XMPushService$Job;
.source "SendMessageJob.java"


# instance fields
.field private mBlob:Lcom/xiaomi/slim/Blob;

.field private pushService:Lcom/xiaomi/push/service/XMPushService;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/slim/Blob;)V
    .locals 1

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/xiaomi/push/service/XMPushService$Job;-><init>(I)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/push/service/SendMessageJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    iput-object p1, p0, Lcom/xiaomi/push/service/SendMessageJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    iput-object p2, p0, Lcom/xiaomi/push/service/SendMessageJob;->mBlob:Lcom/xiaomi/slim/Blob;

    return-void
.end method


# virtual methods
.method public getDesc()Ljava/lang/String;
    .locals 1

    const-string v0, "send a message."

    return-object v0
.end method

.method public process()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/service/SendMessageJob;->mBlob:Lcom/xiaomi/slim/Blob;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/SendMessageJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    iget-object v1, p0, Lcom/xiaomi/push/service/SendMessageJob;->mBlob:Lcom/xiaomi/slim/Blob;

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/XMPushService;->sendPacket(Lcom/xiaomi/slim/Blob;)V
    :try_end_0
    .catch Lcom/xiaomi/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    iget-object v1, p0, Lcom/xiaomi/push/service/SendMessageJob;->pushService:Lcom/xiaomi/push/service/XMPushService;

    const/16 v2, 0xa

    invoke-virtual {v1, v2, v0}, Lcom/xiaomi/push/service/XMPushService;->disconnect(ILjava/lang/Exception;)V

    :cond_0
    :goto_0
    return-void
.end method
