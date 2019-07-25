.class final Lcom/xiaomi/push/service/MIPushHelper;
.super Ljava/lang/Object;
.source "MIPushHelper.java"


# direct methods
.method static constructBlob(Lcom/xiaomi/push/service/MIPushAccount;Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Lcom/xiaomi/slim/Blob;
    .locals 4

    :try_start_0
    new-instance p1, Lcom/xiaomi/slim/Blob;

    invoke-direct {p1}, Lcom/xiaomi/slim/Blob;-><init>()V

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Lcom/xiaomi/slim/Blob;->setChannelId(I)V

    iget-object v0, p0, Lcom/xiaomi/push/service/MIPushAccount;->account:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/xiaomi/slim/Blob;->setFrom(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/xiaomi/push/service/MIPushHelper;->getSourcePkgName(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/xiaomi/slim/Blob;->setPackageName(Ljava/lang/String;)V

    const-string v0, "SECMSG"

    const-string v1, "message"

    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/slim/Blob;->setCmd(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/push/service/MIPushAccount;->account:Ljava/lang/String;

    iget-object v1, p2, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->target:Lcom/xiaomi/xmpush/thrift/Target;

    const/4 v2, 0x0

    const-string v3, "@"

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/xiaomi/xmpush/thrift/Target;->userId:Ljava/lang/String;

    iget-object v1, p2, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->target:Lcom/xiaomi/xmpush/thrift/Target;

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/xiaomi/xmpush/thrift/Target;->resource:Ljava/lang/String;

    invoke-static {p2}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertThriftObjectToBytes(Lorg/apache/thrift/TBase;)[B

    move-result-object v0

    iget-object p0, p0, Lcom/xiaomi/push/service/MIPushAccount;->security:Ljava/lang/String;

    invoke-virtual {p1, v0, p0}, Lcom/xiaomi/slim/Blob;->setPayload([BLjava/lang/String;)V

    invoke-virtual {p1, v3}, Lcom/xiaomi/slim/Blob;->setPayloadType(S)V

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "try send mi push message. packagename:"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p2, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->packageName:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " action:"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p2, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->action:Lcom/xiaomi/xmpush/thrift/ActionType;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method static constructBlob(Lcom/xiaomi/push/service/XMPushService;[B)Lcom/xiaomi/slim/Blob;
    .locals 1

    new-instance v0, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-direct {v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;-><init>()V

    :try_start_0
    invoke-static {v0, p1}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertByteArrayToThriftObject(Lorg/apache/thrift/TBase;[B)V

    invoke-static {p0}, Lcom/xiaomi/push/service/MIPushAccountUtils;->getMIPushAccount(Landroid/content/Context;)Lcom/xiaomi/push/service/MIPushAccount;

    move-result-object p1

    invoke-static {p1, p0, v0}, Lcom/xiaomi/push/service/MIPushHelper;->constructBlob(Lcom/xiaomi/push/service/MIPushAccount;Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Lcom/xiaomi/slim/Blob;

    move-result-object p0
    :try_end_0
    .catch Lorg/apache/thrift/TException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method static contructAppAbsentMessage(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;
    .locals 2

    new-instance v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    invoke-direct {v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;-><init>()V

    invoke-virtual {v0, p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->setAppId(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    const-string v1, "package uninstalled"

    invoke-virtual {v0, v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->setType(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    invoke-static {}, Lcom/xiaomi/smack/packet/Packet;->nextID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->setId(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->setRequireAck(Z)Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    sget-object v1, Lcom/xiaomi/xmpush/thrift/ActionType;->Notification:Lcom/xiaomi/xmpush/thrift/ActionType;

    invoke-static {p0, p1, v0, v1}, Lcom/xiaomi/push/service/MIPushHelper;->generateRequestContainer(Ljava/lang/String;Ljava/lang/String;Lorg/apache/thrift/TBase;Lcom/xiaomi/xmpush/thrift/ActionType;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    move-result-object p0

    return-object p0
.end method

.method static generateRequestContainer(Ljava/lang/String;Ljava/lang/String;Lorg/apache/thrift/TBase;Lcom/xiaomi/xmpush/thrift/ActionType;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/apache/thrift/TBase<",
            "TT;*>;>(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "TT;",
            "Lcom/xiaomi/xmpush/thrift/ActionType;",
            ")",
            "Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;"
        }
    .end annotation

    invoke-static {p2}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertThriftObjectToBytes(Lorg/apache/thrift/TBase;)[B

    move-result-object p2

    new-instance v0, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-direct {v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;-><init>()V

    new-instance v1, Lcom/xiaomi/xmpush/thrift/Target;

    invoke-direct {v1}, Lcom/xiaomi/xmpush/thrift/Target;-><init>()V

    const-wide/16 v2, 0x5

    iput-wide v2, v1, Lcom/xiaomi/xmpush/thrift/Target;->channelId:J

    const-string v2, "fakeid"

    iput-object v2, v1, Lcom/xiaomi/xmpush/thrift/Target;->userId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->setTarget(Lcom/xiaomi/xmpush/thrift/Target;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->setPushAction(Ljava/nio/ByteBuffer;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-virtual {v0, p3}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->setAction(Lcom/xiaomi/xmpush/thrift/ActionType;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    const/4 p2, 0x1

    invoke-virtual {v0, p2}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->setIsRequest(Z)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-virtual {v0, p0}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->setPackageName(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->setEncryptAction(Z)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-virtual {v0, p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->setAppid(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    return-object v0
.end method

.method static getReceiverPermission(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".permission.MIPUSH_RECEIVE"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getSourcePkgName(Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->metaInfo:Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->metaInfo:Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    iget-object v0, v0, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->internal:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->metaInfo:Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    iget-object v0, v0, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->internal:Ljava/util/Map;

    const-string v1, "ext_traffic_source_pkg"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    return-object v0

    :cond_0
    iget-object p0, p0, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->packageName:Ljava/lang/String;

    return-object p0
.end method

.method static prepareClientLoginInfo(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->watch(Landroid/os/Messenger;)V

    new-instance v0, Lcom/xiaomi/push/service/MIPushHelper$2;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/MIPushHelper$2;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    invoke-virtual {p1, v0}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->addClientStatusListener(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$ClientStatusListener;)V

    return-void
.end method

.method static prepareMIPushAccount(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 8

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/push/service/MIPushAccountUtils;->getMIPushAccount(Landroid/content/Context;)Lcom/xiaomi/push/service/MIPushAccount;

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/push/service/MIPushAccountUtils;->getMIPushAccount(Landroid/content/Context;)Lcom/xiaomi/push/service/MIPushAccount;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/xiaomi/push/service/MIPushAccount;->toClientLoginInfo(Lcom/xiaomi/push/service/XMPushService;)Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/xiaomi/push/service/MIPushHelper;->prepareClientLoginInfo(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/xiaomi/push/service/PushClientsManager;->addActiveClient(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    invoke-static {p0}, Lcom/xiaomi/push/service/Sync;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/Sync;

    move-result-object v0

    new-instance v7, Lcom/xiaomi/push/service/MIPushHelper$1;

    const-string v2, "GAID"

    const-wide/32 v3, 0x2a300

    move-object v1, v7

    move-object v5, p0

    invoke-direct/range {v1 .. v6}, Lcom/xiaomi/push/service/MIPushHelper$1;-><init>(Ljava/lang/String;JLcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/MIPushAccount;)V

    invoke-virtual {v0, v7}, Lcom/xiaomi/push/service/Sync;->schedSync(Lcom/xiaomi/push/service/Sync$SyncJob;)V

    :cond_0
    return-void
.end method

.method static sendPacket(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, -0x1

    invoke-static {v0, v1, p1, v2}, Lcom/xiaomi/push/clientreport/PerfMessageHelper;->collectUpStream(Ljava/lang/String;Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;I)V

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getCurrentConnection()Lcom/xiaomi/smack/Connection;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/xiaomi/smack/Connection;->isBinaryConnection()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p0}, Lcom/xiaomi/push/service/MIPushAccountUtils;->getMIPushAccount(Landroid/content/Context;)Lcom/xiaomi/push/service/MIPushAccount;

    move-result-object v1

    invoke-static {v1, p0, p1}, Lcom/xiaomi/push/service/MIPushHelper;->constructBlob(Lcom/xiaomi/push/service/MIPushAccount;Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)Lcom/xiaomi/slim/Blob;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {v0, p0}, Lcom/xiaomi/smack/Connection;->send(Lcom/xiaomi/slim/Blob;)V

    :cond_0
    return-void

    :cond_1
    new-instance p0, Lcom/xiaomi/smack/XMPPException;

    const-string p1, "Don\'t support XMPP connection."

    invoke-direct {p0, p1}, Lcom/xiaomi/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    new-instance p0, Lcom/xiaomi/smack/XMPPException;

    const-string p1, "try send msg while connection is null."

    invoke-direct {p0, p1}, Lcom/xiaomi/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static sendPacket(Lcom/xiaomi/push/service/XMPushService;Ljava/lang/String;[B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p1, v0, p2}, Lcom/xiaomi/push/clientreport/PerfMessageHelper;->collectUpStream(Ljava/lang/String;Landroid/content/Context;[B)V

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getCurrentConnection()Lcom/xiaomi/smack/Connection;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/xiaomi/smack/Connection;->isBinaryConnection()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p0, p2}, Lcom/xiaomi/push/service/MIPushHelper;->constructBlob(Lcom/xiaomi/push/service/XMPushService;[B)Lcom/xiaomi/slim/Blob;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Lcom/xiaomi/smack/Connection;->send(Lcom/xiaomi/slim/Blob;)V

    return-void

    :cond_0
    const v0, 0x42c1d83

    const-string v1, "not a valid message"

    invoke-static {p0, p1, p2, v0, v1}, Lcom/xiaomi/push/service/MIPushClientManager;->notifyError(Landroid/content/Context;Ljava/lang/String;[BILjava/lang/String;)V

    return-void

    :cond_1
    new-instance p0, Lcom/xiaomi/smack/XMPPException;

    const-string p1, "Don\'t support XMPP connection."

    invoke-direct {p0, p1}, Lcom/xiaomi/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    new-instance p0, Lcom/xiaomi/smack/XMPPException;

    const-string p1, "try send msg while connection is null."

    invoke-direct {p0, p1}, Lcom/xiaomi/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
