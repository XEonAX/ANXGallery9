.class final Lcom/xiaomi/push/service/MIPushEventProcessor$5;
.super Lcom/xiaomi/push/service/XMPushService$Job;
.source "MIPushEventProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/MIPushEventProcessor;->sendAppAbsentAck(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$container:Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

.field final synthetic val$pushService:Lcom/xiaomi/push/service/XMPushService;

.field final synthetic val$realTargetPackage:Ljava/lang/String;


# direct methods
.method constructor <init>(ILcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;Ljava/lang/String;)V
    .locals 0

    iput-object p2, p0, Lcom/xiaomi/push/service/MIPushEventProcessor$5;->val$pushService:Lcom/xiaomi/push/service/XMPushService;

    iput-object p3, p0, Lcom/xiaomi/push/service/MIPushEventProcessor$5;->val$container:Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    iput-object p4, p0, Lcom/xiaomi/push/service/MIPushEventProcessor$5;->val$realTargetPackage:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService$Job;-><init>(I)V

    return-void
.end method


# virtual methods
.method public getDesc()Ljava/lang/String;
    .locals 1

    const-string v0, "send app absent ack message for message."

    return-object v0
.end method

.method public process()V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/service/MIPushEventProcessor$5;->val$pushService:Lcom/xiaomi/push/service/XMPushService;

    iget-object v1, p0, Lcom/xiaomi/push/service/MIPushEventProcessor$5;->val$container:Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-static {v0, v1}, Lcom/xiaomi/push/service/MIPushEventProcessor;->constructAckMessage(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getMetaInfo()Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    move-result-object v1

    const-string v2, "absent_target_package"

    iget-object v3, p0, Lcom/xiaomi/push/service/MIPushEventProcessor$5;->val$realTargetPackage:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->putToExtra(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/xiaomi/push/service/MIPushEventProcessor$5;->val$pushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {v1, v0}, Lcom/xiaomi/push/service/MIPushHelper;->sendPacket(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)V
    :try_end_0
    .catch Lcom/xiaomi/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    iget-object v1, p0, Lcom/xiaomi/push/service/MIPushEventProcessor$5;->val$pushService:Lcom/xiaomi/push/service/XMPushService;

    const/16 v2, 0xa

    invoke-virtual {v1, v2, v0}, Lcom/xiaomi/push/service/XMPushService;->disconnect(ILjava/lang/Exception;)V

    :goto_0
    return-void
.end method
