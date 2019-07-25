.class public Lcom/xiaomi/push/service/AwakeAppPingJob;
.super Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;
.source "AwakeAppPingJob.java"


# instance fields
.field private mIsCache:Z

.field private mXMPushServiceWR:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/xiaomi/push/service/XMPushService;",
            ">;"
        }
    .end annotation
.end field

.field private mXmPushActionNotification:Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;


# direct methods
.method public constructor <init>(Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;Ljava/lang/ref/WeakReference;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/xiaomi/push/service/XMPushService;",
            ">;Z)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/push/service/AwakeAppPingJob;->mIsCache:Z

    iput-object p1, p0, Lcom/xiaomi/push/service/AwakeAppPingJob;->mXmPushActionNotification:Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    iput-object p2, p0, Lcom/xiaomi/push/service/AwakeAppPingJob;->mXMPushServiceWR:Ljava/lang/ref/WeakReference;

    iput-boolean p3, p0, Lcom/xiaomi/push/service/AwakeAppPingJob;->mIsCache:Z

    return-void
.end method


# virtual methods
.method public getJobId()I
    .locals 1

    const/16 v0, 0x16

    return v0
.end method

.method public run()V
    .locals 5

    iget-object v0, p0, Lcom/xiaomi/push/service/AwakeAppPingJob;->mXMPushServiceWR:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/xiaomi/push/service/AwakeAppPingJob;->mXmPushActionNotification:Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/service/AwakeAppPingJob;->mXMPushServiceWR:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/push/service/XMPushService;

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v1, p0, Lcom/xiaomi/push/service/AwakeAppPingJob;->mXmPushActionNotification:Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    invoke-static {}, Lcom/xiaomi/push/service/PacketHelper;->generatePacketID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->setId(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    iget-object v1, p0, Lcom/xiaomi/push/service/AwakeAppPingJob;->mXmPushActionNotification:Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->setRequireAck(Z)Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MoleInfo aw_ping : send aw_Ping msg "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/push/service/AwakeAppPingJob;->mXmPushActionNotification:Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/push/service/AwakeAppPingJob;->mXmPushActionNotification:Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    invoke-virtual {v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/xiaomi/push/service/AwakeAppPingJob;->mXmPushActionNotification:Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getAppId()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/xiaomi/push/service/AwakeAppPingJob;->mXmPushActionNotification:Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    sget-object v4, Lcom/xiaomi/xmpush/thrift/ActionType;->Notification:Lcom/xiaomi/xmpush/thrift/ActionType;

    invoke-static {v1, v2, v3, v4}, Lcom/xiaomi/push/service/MIPushHelper;->generateRequestContainer(Ljava/lang/String;Ljava/lang/String;Lorg/apache/thrift/TBase;Lcom/xiaomi/xmpush/thrift/ActionType;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertThriftObjectToBytes(Lorg/apache/thrift/TBase;)[B

    move-result-object v2

    iget-boolean v3, p0, Lcom/xiaomi/push/service/AwakeAppPingJob;->mIsCache:Z

    invoke-virtual {v0, v1, v2, v3}, Lcom/xiaomi/push/service/XMPushService;->sendMessage(Ljava/lang/String;[BZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MoleInfo aw_ping : send help app ping error"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_2
    :goto_1
    return-void
.end method
