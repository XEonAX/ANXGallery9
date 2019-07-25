.class final Lcom/xiaomi/push/service/MIPushEventProcessor$1;
.super Lcom/xiaomi/push/service/XMPushService$Job;
.source "MIPushEventProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/MIPushEventProcessor;->sendAppNotInstallNotification(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$container:Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

.field final synthetic val$pushService:Lcom/xiaomi/push/service/XMPushService;


# direct methods
.method constructor <init>(ILcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)V
    .locals 0

    iput-object p2, p0, Lcom/xiaomi/push/service/MIPushEventProcessor$1;->val$pushService:Lcom/xiaomi/push/service/XMPushService;

    iput-object p3, p0, Lcom/xiaomi/push/service/MIPushEventProcessor$1;->val$container:Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService$Job;-><init>(I)V

    return-void
.end method


# virtual methods
.method public getDesc()Ljava/lang/String;
    .locals 1

    const-string v0, "send app absent message."

    return-object v0
.end method

.method public process()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/service/MIPushEventProcessor$1;->val$pushService:Lcom/xiaomi/push/service/XMPushService;

    iget-object v1, p0, Lcom/xiaomi/push/service/MIPushEventProcessor$1;->val$container:Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-virtual {v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/xiaomi/push/service/MIPushEventProcessor$1;->val$container:Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getAppid()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/xiaomi/push/service/MIPushHelper;->contructAppAbsentMessage(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/xiaomi/push/service/MIPushHelper;->sendPacket(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)V
    :try_end_0
    .catch Lcom/xiaomi/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    iget-object v1, p0, Lcom/xiaomi/push/service/MIPushEventProcessor$1;->val$pushService:Lcom/xiaomi/push/service/XMPushService;

    const/16 v2, 0xa

    invoke-virtual {v1, v2, v0}, Lcom/xiaomi/push/service/XMPushService;->disconnect(ILjava/lang/Exception;)V

    :goto_0
    return-void
.end method
