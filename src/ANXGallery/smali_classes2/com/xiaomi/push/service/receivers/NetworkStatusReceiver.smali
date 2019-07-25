.class public Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;
.super Landroid/content/BroadcastReceiver;
.source "NetworkStatusReceiver.java"


# static fields
.field private static isRegister:Z = false

.field private static queue:Ljava/util/concurrent/BlockingQueue; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private static sCorePoolSize:I = 0x1

.field private static sKeepAliveTime:I = 0x2

.field private static sMaximumPoolSize:I = 0x1

.field private static threadPoolExecutor:Ljava/util/concurrent/ThreadPoolExecutor;


# instance fields
.field private isXmlRegister:Z


# direct methods
.method static constructor <clinit>()V
    .locals 8

    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    sput-object v0, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->queue:Ljava/util/concurrent/BlockingQueue;

    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget v2, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->sCorePoolSize:I

    sget v3, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->sMaximumPoolSize:I

    sget v1, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->sKeepAliveTime:I

    int-to-long v4, v1

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v7, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->queue:Ljava/util/concurrent/BlockingQueue;

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    sput-object v0, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->threadPoolExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->isRegister:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->isXmlRegister:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->isXmlRegister:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->isXmlRegister:Z

    const/4 p1, 0x1

    sput-boolean p1, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->isRegister:Z

    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->notifyNetworkChanged(Landroid/content/Context;)V

    return-void
.end method

.method public static isRegister()Z
    .locals 1

    sget-boolean v0, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->isRegister:Z

    return v0
.end method

.method private notifyNetworkChanged(Landroid/content/Context;)V
    .locals 3

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PushServiceClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->shouldUseMIUIPush()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->appRegistered()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->invalidated()Z

    move-result v0

    if-nez v0, :cond_0

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.xiaomi.push.service.XMPushService"

    invoke-direct {v1, p1, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const-string v1, "com.xiaomi.push.network_status_changed"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p1}, Lcom/xiaomi/push/service/ServiceClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/ServiceClient;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/xiaomi/push/service/ServiceClient;->startServiceSafely(Landroid/content/Intent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/network/Network;->hasNetwork(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PushServiceClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->isProvisioned()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PushServiceClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->processRegisterTask()V

    :cond_1
    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/network/Network;->hasNetwork(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "syncing"

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v1

    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->DISABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v1, v2}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->disablePush(Landroid/content/Context;)V

    :cond_2
    const-string v0, "syncing"

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v1

    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->ENABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v1, v2}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->enablePush(Landroid/content/Context;)V

    :cond_3
    const-string v0, "syncing"

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v1

    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_HUAWEI_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v1, v2}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->syncAssemblePushToken(Landroid/content/Context;)V

    :cond_4
    const-string v0, "syncing"

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v1

    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_FCM_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v1, v2}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->syncAssembleFCMPushToken(Landroid/content/Context;)V

    :cond_5
    const-string v0, "syncing"

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v1

    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_COS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v1, v2}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->syncAssembleCOSPushToken(Landroid/content/Context;)V

    :cond_6
    const-string v0, "syncing"

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v1

    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_FTOS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v1, v2}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->syncAssembleFTOSPushToken(Landroid/content/Context;)V

    :cond_7
    invoke-static {}, Lcom/xiaomi/mipush/sdk/HWPushHelper;->needConnect()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/HWPushHelper;->shouldTryConnect(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/HWPushHelper;->setConnectTime(Landroid/content/Context;)V

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/HWPushHelper;->registerHuaWeiAssemblePush(Landroid/content/Context;)V

    :cond_8
    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/COSPushHelper;->doInNetworkChange(Landroid/content/Context;)V

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/FTOSPushHelper;->doInNetworkChange(Landroid/content/Context;)V

    :cond_9
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    iget-boolean p2, p0, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->isXmlRegister:Z

    if-eqz p2, :cond_0

    return-void

    :cond_0
    sget-object p2, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;->threadPoolExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v0, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver$1;

    invoke-direct {v0, p0, p1}, Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver$1;-><init>(Lcom/xiaomi/push/service/receivers/NetworkStatusReceiver;Landroid/content/Context;)V

    invoke-virtual {p2, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
