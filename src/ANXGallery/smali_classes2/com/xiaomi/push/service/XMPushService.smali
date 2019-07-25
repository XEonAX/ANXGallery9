.class public Lcom/xiaomi/push/service/XMPushService;
.super Landroid/app/Service;
.source "XMPushService.java"

# interfaces
.implements Lcom/xiaomi/smack/ConnectionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/XMPushService$PingCallBack;,
        Lcom/xiaomi/push/service/XMPushService$ConnectionChangeReceiver;,
        Lcom/xiaomi/push/service/XMPushService$PingJob;,
        Lcom/xiaomi/push/service/XMPushService$ResetConnectionJob;,
        Lcom/xiaomi/push/service/XMPushService$DisconnectJob;,
        Lcom/xiaomi/push/service/XMPushService$ConnectJob;,
        Lcom/xiaomi/push/service/XMPushService$UnbindJob;,
        Lcom/xiaomi/push/service/XMPushService$ReBindJob;,
        Lcom/xiaomi/push/service/XMPushService$BindTimeoutJob;,
        Lcom/xiaomi/push/service/XMPushService$BindJob;,
        Lcom/xiaomi/push/service/XMPushService$BlobReceiveJob;,
        Lcom/xiaomi/push/service/XMPushService$IntentJob;,
        Lcom/xiaomi/push/service/XMPushService$PacketReceiveJob;,
        Lcom/xiaomi/push/service/XMPushService$Job;,
        Lcom/xiaomi/push/service/XMPushService$KillJob;,
        Lcom/xiaomi/push/service/XMPushService$InitJob;
    }
.end annotation


# static fields
.field private static final PID:I

.field public static START_STICKY:I


# instance fields
.field private connConfig:Lcom/xiaomi/smack/ConnectionConfiguration;

.field private lastAlive:J

.field private mClientEventDispatcher:Lcom/xiaomi/push/service/ClientEventDispatcher;

.field private mConnectionChangeReceiver:Lcom/xiaomi/push/service/XMPushService$ConnectionChangeReceiver;

.field private mCurrentConnection:Lcom/xiaomi/smack/Connection;

.field private mExtremePowerModeObserver:Landroid/database/ContentObserver;

.field protected mJobClazz:Ljava/lang/Class;

.field private mJobController:Lcom/xiaomi/push/service/JobScheduler;

.field private mPacketListener:Lcom/xiaomi/smack/PacketListener;

.field private mPacketSync:Lcom/xiaomi/push/service/PacketSync;

.field private mReconnManager:Lcom/xiaomi/push/service/ReconnectionManager;

.field private mRegion:Ljava/lang/String;

.field private mSlimConnection:Lcom/xiaomi/slim/SlimConnection;

.field messenger:Landroid/os/Messenger;

.field private networkListeners:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lcom/xiaomi/push/service/NetworkListener;",
            ">;"
        }
    .end annotation
.end field

.field private pingCallBacks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/xiaomi/push/service/XMPushService$PingCallBack;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    sput v0, Lcom/xiaomi/push/service/XMPushService;->PID:I

    const-string v0, "cn.app.chat.xiaomi.net"

    const-string v1, "cn.app.chat.xiaomi.net"

    invoke-static {v0, v1}, Lcom/xiaomi/network/HostManager;->addReservedHost(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "cn.app.chat.xiaomi.net"

    const-string v1, "42.62.94.2:443"

    invoke-static {v0, v1}, Lcom/xiaomi/network/HostManager;->addReservedHost(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "cn.app.chat.xiaomi.net"

    const-string v1, "114.54.23.2"

    invoke-static {v0, v1}, Lcom/xiaomi/network/HostManager;->addReservedHost(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "cn.app.chat.xiaomi.net"

    const-string v1, "111.13.142.2"

    invoke-static {v0, v1}, Lcom/xiaomi/network/HostManager;->addReservedHost(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "cn.app.chat.xiaomi.net"

    const-string v1, "111.206.200.2"

    invoke-static {v0, v1}, Lcom/xiaomi/network/HostManager;->addReservedHost(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    sput v0, Lcom/xiaomi/push/service/XMPushService;->START_STICKY:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/xiaomi/push/service/XMPushService;->lastAlive:J

    const-class v0, Lcom/xiaomi/push/service/XMJobService;

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mJobClazz:Ljava/lang/Class;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mPacketSync:Lcom/xiaomi/push/service/PacketSync;

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mJobController:Lcom/xiaomi/push/service/JobScheduler;

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->messenger:Landroid/os/Messenger;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->networkListeners:Ljava/util/Collection;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->pingCallBacks:Ljava/util/ArrayList;

    new-instance v0, Lcom/xiaomi/push/service/XMPushService$1;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/XMPushService$1;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mPacketListener:Lcom/xiaomi/smack/PacketListener;

    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/push/service/XMPushService;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/push/service/XMPushService;->mRegion:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->updateAlarmTimer()V

    return-void
.end method

.method static synthetic access$1000()I
    .locals 1

    sget v0, Lcom/xiaomi/push/service/XMPushService;->PID:I

    return v0
.end method

.method static synthetic access$200(Lcom/xiaomi/push/service/XMPushService;)Z
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->isExtremePowerSaveMode()Z

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/xiaomi/push/service/XMPushService;)Lcom/xiaomi/smack/ConnectionConfiguration;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/push/service/XMPushService;->connConfig:Lcom/xiaomi/smack/ConnectionConfiguration;

    return-object p0
.end method

.method static synthetic access$400(Lcom/xiaomi/push/service/XMPushService;)Lcom/xiaomi/smack/Connection;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    return-object p0
.end method

.method static synthetic access$402(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/smack/Connection;)Lcom/xiaomi/smack/Connection;
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    return-object p1
.end method

.method static synthetic access$500(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->postOnCreate()V

    return-void
.end method

.method static synthetic access$600(Lcom/xiaomi/push/service/XMPushService;)Lcom/xiaomi/push/service/JobScheduler;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/push/service/XMPushService;->mJobController:Lcom/xiaomi/push/service/JobScheduler;

    return-object p0
.end method

.method static synthetic access$700(Lcom/xiaomi/push/service/XMPushService;)Lcom/xiaomi/push/service/PacketSync;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/push/service/XMPushService;->mPacketSync:Lcom/xiaomi/push/service/PacketSync;

    return-object p0
.end method

.method static synthetic access$800(Lcom/xiaomi/push/service/XMPushService;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->handleIntent(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$900(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->connect()V

    return-void
.end method

.method private broadcastNetworkAvailable(Z)V
    .locals 3

    :try_start_0
    invoke-static {}, Lcom/xiaomi/channel/commonutils/android/SystemUtils;->isBootCompleted()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    new-instance p1, Landroid/content/Intent;

    const-string v0, "miui.intent.action.NETWORK_CONNECTED"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->sendBroadcast(Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/xiaomi/push/service/XMPushService;->networkListeners:Ljava/util/Collection;

    const/4 v0, 0x0

    new-array v1, v0, [Lcom/xiaomi/push/service/NetworkListener;

    invoke-interface {p1, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/xiaomi/push/service/NetworkListener;

    array-length v1, p1

    :goto_0
    if-ge v0, v1, :cond_1

    aget-object v2, p1, v0

    invoke-interface {v2}, Lcom/xiaomi/push/service/NetworkListener;->onNetwrokAvaible()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    new-instance p1, Landroid/content/Intent;

    const-string v0, "miui.intent.action.NETWORK_BLOCKED"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :cond_1
    :goto_1
    return-void
.end method

.method private canOpenForegroundService()Z
    .locals 3

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.xiaomi.xmsf"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-static {p0}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v0

    sget-object v2, Lcom/xiaomi/xmpush/thrift/ConfigKey;->ForegroundServiceSwitch:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v2

    invoke-virtual {v0, v2, v1}, Lcom/xiaomi/push/service/OnlineConfig;->getBooleanValue(IZ)Z

    move-result v0

    return v0
.end method

.method private checkAlive(Z)V
    .locals 3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/push/service/XMPushService;->lastAlive:J

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->isConnected()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/xiaomi/push/service/XMPushService;->scheduleConnect(Z)V

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    invoke-virtual {v0}, Lcom/xiaomi/smack/Connection;->isReadAlive()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    invoke-virtual {v0}, Lcom/xiaomi/smack/Connection;->isWriteAlive()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/network/Network;->isWIFIConnected(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    new-instance p1, Lcom/xiaomi/push/service/XMPushService$DisconnectJob;

    const/16 v0, 0x11

    const/4 v2, 0x0

    invoke-direct {p1, p0, v0, v2}, Lcom/xiaomi/push/service/XMPushService$DisconnectJob;-><init>(Lcom/xiaomi/push/service/XMPushService;ILjava/lang/Exception;)V

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->executeJobNow(Lcom/xiaomi/push/service/XMPushService$Job;)V

    invoke-virtual {p0, v1}, Lcom/xiaomi/push/service/XMPushService;->scheduleConnect(Z)V

    goto :goto_1

    :cond_2
    :goto_0
    new-instance v0, Lcom/xiaomi/push/service/XMPushService$PingJob;

    invoke-direct {v0, p0, p1}, Lcom/xiaomi/push/service/XMPushService$PingJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Z)V

    invoke-direct {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->executeJobNow(Lcom/xiaomi/push/service/XMPushService$Job;)V

    :goto_1
    return-void
.end method

.method private clearPingCallbacks()V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->pingCallBacks:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->pingCallBacks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private closeAllChannelByChid(Ljava/lang/String;I)V
    .locals 8

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/service/PushClientsManager;->getAllClientLoginInfoByChid(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    if-eqz v4, :cond_0

    new-instance v1, Lcom/xiaomi/push/service/XMPushService$UnbindJob;

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, v1

    move-object v3, p0

    move v5, p2

    invoke-direct/range {v2 .. v7}, Lcom/xiaomi/push/service/XMPushService$UnbindJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/xiaomi/push/service/PushClientsManager;->deactivateAllClientByChid(Ljava/lang/String;)V

    return-void
.end method

.method private connect()V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    invoke-virtual {v0}, Lcom/xiaomi/smack/Connection;->isConnecting()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "try to connect while connecting."

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    invoke-virtual {v0}, Lcom/xiaomi/smack/Connection;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "try to connect while is connected."

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->connConfig:Lcom/xiaomi/smack/ConnectionConfiguration;

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/network/Network;->getActiveConnPoint(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/smack/ConnectionConfiguration;->setConnectionPoint(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->connectBySlim()V

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    if-nez v0, :cond_2

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/xiaomi/push/service/PushClientsManager;->notifyConnectionFailed(Landroid/content/Context;)V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->broadcastNetworkAvailable(Z)V

    :cond_2
    return-void
.end method

.method private connectBySlim()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mSlimConnection:Lcom/xiaomi/slim/SlimConnection;

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->mPacketListener:Lcom/xiaomi/smack/PacketListener;

    new-instance v2, Lcom/xiaomi/push/service/XMPushService$11;

    invoke-direct {v2, p0}, Lcom/xiaomi/push/service/XMPushService$11;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/slim/SlimConnection;->addPacketListener(Lcom/xiaomi/smack/PacketListener;Lcom/xiaomi/smack/filter/PacketFilter;)V

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mSlimConnection:Lcom/xiaomi/slim/SlimConnection;

    invoke-virtual {v0}, Lcom/xiaomi/slim/SlimConnection;->connect()V

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mSlimConnection:Lcom/xiaomi/slim/SlimConnection;

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;
    :try_end_0
    .catch Lcom/xiaomi/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "fail to create Slim connection"

    invoke-static {v1, v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->mSlimConnection:Lcom/xiaomi/slim/SlimConnection;

    const/4 v2, 0x3

    invoke-virtual {v1, v2, v0}, Lcom/xiaomi/slim/SlimConnection;->disconnect(ILjava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method private doAWLogic(Landroid/content/Intent;)V
    .locals 7

    :try_start_0
    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/awake/module/AwakeManager;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/push/service/PushLayerProcessIml;

    invoke-direct {v1}, Lcom/xiaomi/push/service/PushLayerProcessIml;-><init>()V

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->setSendDataIml(Lcom/xiaomi/push/service/awake/module/IProcessData;)V

    const-string v0, "mipush_app_package"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v0, "mipush_payload"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    invoke-direct {v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;-><init>()V

    invoke-static {v0, p1}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertByteArrayToThriftObject(Lorg/apache/thrift/TBase;[B)V

    invoke-virtual {v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getAppId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->getExtra()Ljava/util/Map;

    move-result-object p1

    if-eqz p1, :cond_1

    const-string v0, "extra_help_aw_info"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    const-string v0, "extra_aw_app_online_cmd"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_0
    .catch Lorg/apache/thrift/TException; {:try_start_0 .. :try_end_0} :catch_1

    if-nez v0, :cond_1

    :try_start_1
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/apache/thrift/TException; {:try_start_1 .. :try_end_1} :catch_1

    move v4, p1

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    const/4 v4, 0x0

    :goto_0
    :try_start_2
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/awake/module/AwakeManager;

    move-result-object v1

    move-object v2, p0

    invoke-virtual/range {v1 .. v6}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->wakeup(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/apache/thrift/TException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "aw_logic: translate fail. "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/apache/thrift/TException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    :cond_1
    :goto_1
    return-void
.end method

.method private doAWPingCMD(Landroid/content/Intent;I)V
    .locals 4

    const-string v0, "mipush_payload"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v0

    const-string v1, "com.xiaomi.mipush.MESSAGE_CACHE"

    const/4 v2, 0x1

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    new-instance v1, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    invoke-direct {v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;-><init>()V

    :try_start_0
    invoke-static {v1, v0}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertByteArrayToThriftObject(Lorg/apache/thrift/TBase;[B)V

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object v0

    new-instance v2, Lcom/xiaomi/push/service/AwakeAppPingJob;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {v2, v1, v3, p1}, Lcom/xiaomi/push/service/AwakeAppPingJob;-><init>(Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;Ljava/lang/ref/WeakReference;Z)V

    invoke-virtual {v0, v2, p2}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->addRepeatJob(Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;I)Z
    :try_end_0
    .catch Lorg/apache/thrift/TException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p1, "aw_ping : send help app ping  error"

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private enableForegroundService()V
    .locals 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-ge v0, v1, :cond_0

    sget v0, Lcom/xiaomi/push/service/XMPushService;->PID:I

    new-instance v1, Landroid/app/Notification;

    invoke-direct {v1}, Landroid/app/Notification;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/push/service/XMPushService;->startForeground(ILandroid/app/Notification;)V

    return-void

    :cond_0
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->mJobClazz:Ljava/lang/Class;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v1, Lcom/xiaomi/push/service/XMPushService$13;

    invoke-direct {v1, p0}, Lcom/xiaomi/push/service/XMPushService$13;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/xiaomi/push/service/XMPushService;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    return-void
.end method

.method private ensureRegionAvaible()Ljava/lang/String;
    .locals 8

    invoke-static {}, Lcom/xiaomi/channel/commonutils/misc/ThreadUtils;->checkNotUIThread()V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    const-string v3, "com.xiaomi.xmsf"

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_2

    invoke-static {p0}, Lcom/xiaomi/push/service/PushProvision;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/PushProvision;

    move-result-object v3

    move-object v5, v4

    :catch_0
    :goto_0
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v3}, Lcom/xiaomi/push/service/PushProvision;->getProvisioned()I

    move-result v6

    if-nez v6, :cond_3

    :cond_0
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    const-string v5, "ro.miui.region"

    invoke-static {v5}, Lcom/xiaomi/channel/commonutils/android/MIUIUtils;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    const-string v5, "ro.product.locale.region"

    invoke-static {v5}, Lcom/xiaomi/channel/commonutils/android/MIUIUtils;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_1
    :try_start_0
    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    const-wide/16 v6, 0x64

    :try_start_1
    invoke-virtual {v2, v6, v7}, Ljava/lang/Object;->wait(J)V

    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v6

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v6
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    :cond_2
    invoke-static {}, Lcom/xiaomi/channel/commonutils/android/MIUIUtils;->getCountryCode()Ljava/lang/String;

    move-result-object v5

    :cond_3
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/push/service/AppRegionStorage;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/AppRegionStorage;

    move-result-object v2

    invoke-virtual {v2, v5}, Lcom/xiaomi/push/service/AppRegionStorage;->setCountryCode(Ljava/lang/String;)V

    invoke-static {v5}, Lcom/xiaomi/channel/commonutils/android/MIUIUtils;->getRegion(Ljava/lang/String;)Lcom/xiaomi/channel/commonutils/android/Region;

    move-result-object v2

    invoke-virtual {v2}, Lcom/xiaomi/channel/commonutils/android/Region;->name()Ljava/lang/String;

    move-result-object v4

    :cond_4
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sub-long/2addr v2, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "wait region :"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " cost = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    return-object v4
.end method

.method private executeJobNow(Lcom/xiaomi/push/service/XMPushService$Job;)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mJobController:Lcom/xiaomi/push/service/JobScheduler;

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/service/JobScheduler;->executeJobNow(Lcom/xiaomi/push/service/JobScheduler$Job;)V

    return-void
.end method

.method public static getPushServiceNotification(Landroid/content/Context;)Landroid/app/Notification;
    .locals 11
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/xiaomi/push/service/XMPushService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v2, 0x0

    const/16 v3, 0xb

    if-lt v1, v3, :cond_0

    new-instance v1, Landroid/app/Notification$Builder;

    invoke-direct {v1, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->icon:I

    invoke-virtual {v1, v3}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    const-string v3, "Push Service"

    invoke-virtual {v1, v3}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    const-string v3, "Push Service"

    invoke-virtual {v1, v3}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    invoke-static {p0, v2, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    invoke-virtual {v1}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance v1, Landroid/app/Notification;

    invoke-direct {v1}, Landroid/app/Notification;-><init>()V

    invoke-static {p0, v2, v0, v2}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    :try_start_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "setLatestEventInfo"

    const/4 v5, 0x4

    new-array v6, v5, [Ljava/lang/Class;

    const-class v7, Landroid/content/Context;

    aput-object v7, v6, v2

    const-class v7, Ljava/lang/CharSequence;

    const/4 v8, 0x1

    aput-object v7, v6, v8

    const-class v7, Ljava/lang/CharSequence;

    const/4 v9, 0x2

    aput-object v7, v6, v9

    const-class v7, Landroid/app/PendingIntent;

    const/4 v10, 0x3

    aput-object v7, v6, v10

    invoke-virtual {v3, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v5, [Ljava/lang/Object;

    aput-object p0, v4, v2

    const-string p0, "Push Service"

    aput-object p0, v4, v8

    const-string p0, "Push Service"

    aput-object p0, v4, v9

    aput-object v0, v4, v10

    invoke-virtual {v3, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :goto_0
    return-object v1
.end method

.method private handleIntent(Landroid/content/Intent;)V
    .locals 11

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->ACTION_OPEN_CHANNEL:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v1, :cond_32

    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->ACTION_FORCE_RECONNECT:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_7

    :cond_0
    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->ACTION_CLOSE_CHANNEL:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->EXTRA_PACKAGE_NAME:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lcom/xiaomi/push/service/PushConstants;->EXTRA_CHANNEL_ID:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    sget-object v3, Lcom/xiaomi/push/service/PushConstants;->EXTRA_USER_ID:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Service called close channel chid = "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " res = "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v6}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->getResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/PushClientsManager;->queryChannelIdByPackage(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0, v2}, Lcom/xiaomi/push/service/XMPushService;->closeAllChannelByChid(Ljava/lang/String;I)V

    goto :goto_0

    :cond_1
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-direct {p0, v5, v2}, Lcom/xiaomi/push/service/XMPushService;->closeAllChannelByChid(Ljava/lang/String;I)V

    goto/16 :goto_8

    :cond_2
    const/4 v7, 0x2

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v4, p0

    invoke-virtual/range {v4 .. v9}, Lcom/xiaomi/push/service/XMPushService;->closeChannel(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8

    :cond_3
    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->ACTION_SEND_MESSAGE:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->sendMessage(Landroid/content/Intent;)V

    goto/16 :goto_8

    :cond_4
    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->ACTION_BATCH_SEND_MESSAGE:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->sendMessages(Landroid/content/Intent;)V

    goto/16 :goto_8

    :cond_5
    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->ACTION_SEND_IQ:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->EXTRA_PACKAGE_NAME:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/xiaomi/push/service/PushConstants;->EXTRA_SESSION:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "ext_packet"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    new-instance v3, Lcom/xiaomi/smack/packet/IQ;

    invoke-direct {v3, p1}, Lcom/xiaomi/smack/packet/IQ;-><init>(Landroid/os/Bundle;)V

    invoke-direct {p0, v3, v1, v2}, Lcom/xiaomi/push/service/XMPushService;->preparePacket(Lcom/xiaomi/smack/packet/Packet;Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/smack/packet/Packet;

    move-result-object p1

    if-eqz p1, :cond_3a

    invoke-virtual {p1}, Lcom/xiaomi/smack/packet/Packet;->getChannelId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/xiaomi/smack/packet/Packet;->getFrom()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/PushClientsManager;->getClientLoginInfoByChidAndUserId(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    move-result-object v0

    iget-object v0, v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->security:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/xiaomi/slim/Blob;->from(Lcom/xiaomi/smack/packet/Packet;Ljava/lang/String;)Lcom/xiaomi/slim/Blob;

    move-result-object p1

    new-instance v0, Lcom/xiaomi/push/service/SendMessageJob;

    invoke-direct {v0, p0, p1}, Lcom/xiaomi/push/service/SendMessageJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/slim/Blob;)V

    invoke-direct {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->executeJobNow(Lcom/xiaomi/push/service/XMPushService$Job;)V

    goto/16 :goto_8

    :cond_6
    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->ACTION_SEND_PRESENCE:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->EXTRA_PACKAGE_NAME:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/xiaomi/push/service/PushConstants;->EXTRA_SESSION:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "ext_packet"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    new-instance v3, Lcom/xiaomi/smack/packet/Presence;

    invoke-direct {v3, p1}, Lcom/xiaomi/smack/packet/Presence;-><init>(Landroid/os/Bundle;)V

    invoke-direct {p0, v3, v1, v2}, Lcom/xiaomi/push/service/XMPushService;->preparePacket(Lcom/xiaomi/smack/packet/Packet;Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/smack/packet/Packet;

    move-result-object p1

    if-eqz p1, :cond_3a

    invoke-virtual {p1}, Lcom/xiaomi/smack/packet/Packet;->getChannelId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/xiaomi/smack/packet/Packet;->getFrom()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/PushClientsManager;->getClientLoginInfoByChidAndUserId(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    move-result-object v0

    iget-object v0, v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->security:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/xiaomi/slim/Blob;->from(Lcom/xiaomi/smack/packet/Packet;Ljava/lang/String;)Lcom/xiaomi/slim/Blob;

    move-result-object p1

    new-instance v0, Lcom/xiaomi/push/service/SendMessageJob;

    invoke-direct {v0, p0, p1}, Lcom/xiaomi/push/service/SendMessageJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/slim/Blob;)V

    invoke-direct {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->executeJobNow(Lcom/xiaomi/push/service/XMPushService$Job;)V

    goto/16 :goto_8

    :cond_7
    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->ACTION_RESET_CONNECTION:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_CHANNEL_ID:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->EXTRA_USER_ID:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v0, :cond_3a

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "request reset connection from chid = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lcom/xiaomi/push/service/PushClientsManager;->getClientLoginInfoByChidAndUserId(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    move-result-object v0

    if-eqz v0, :cond_3a

    iget-object v1, v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->security:Ljava/lang/String;

    sget-object v2, Lcom/xiaomi/push/service/PushConstants;->EXTRA_SECURITY:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3a

    iget-object p1, v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    sget-object v0, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->binded:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    if-ne p1, v0, :cond_3a

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getCurrentConnection()Lcom/xiaomi/smack/Connection;

    move-result-object p1

    if-eqz p1, :cond_8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3a98

    sub-long/2addr v0, v2

    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/smack/Connection;->isReadAlive(J)Z

    move-result p1

    if-nez p1, :cond_3a

    :cond_8
    new-instance p1, Lcom/xiaomi/push/service/XMPushService$ResetConnectionJob;

    invoke-direct {p1, p0}, Lcom/xiaomi/push/service/XMPushService$ResetConnectionJob;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->executeJobNow(Lcom/xiaomi/push/service/XMPushService$Job;)V

    goto/16 :goto_8

    :cond_9
    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->ACTION_UPDATE_CHANNEL_INFO:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_f

    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->EXTRA_PACKAGE_NAME:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/PushClientsManager;->queryChannelIdByPackage(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_a

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "open channel should be called first before update info, pkg="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    return-void

    :cond_a
    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->EXTRA_CHANNEL_ID:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v5, Lcom/xiaomi/push/service/PushConstants;->EXTRA_USER_ID:Ljava/lang/String;

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_b

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :cond_b
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/PushClientsManager;->getAllClientLoginInfoByChid(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v0

    if-eqz v0, :cond_d

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_d

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    goto :goto_1

    :cond_c
    invoke-virtual {v0, v1, v5}, Lcom/xiaomi/push/service/PushClientsManager;->getClientLoginInfoByChidAndUserId(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    move-result-object v2

    :cond_d
    :goto_1
    if-eqz v2, :cond_3a

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_CLIENT_ATTR:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_CLIENT_ATTR:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->clientExtra:Ljava/lang/String;

    :cond_e
    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_CLOUD_ATTR:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3a

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_CLOUD_ATTR:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v2, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->cloudExtra:Ljava/lang/String;

    goto/16 :goto_8

    :cond_f
    const-string v0, "com.xiaomi.mipush.REGISTER_APP"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/push/service/PushProvision;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/PushProvision;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/service/PushProvision;->checkProvisioned()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/push/service/PushProvision;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/PushProvision;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/service/PushProvision;->getProvisioned()I

    move-result v0

    if-nez v0, :cond_10

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "register without being provisioned. "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "mipush_app_package"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    return-void

    :cond_10
    const-string v0, "mipush_payload"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v9

    const-string v0, "mipush_app_package"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v0, "mipush_env_chanage"

    invoke-virtual {p1, v0, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    const-string v1, "mipush_env_type"

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v8

    invoke-static {p0}, Lcom/xiaomi/push/service/MIPushAppInfo;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/MIPushAppInfo;

    move-result-object p1

    invoke-virtual {p1, v10}, Lcom/xiaomi/push/service/MIPushAppInfo;->removeUnRegisteredPkg(Ljava/lang/String;)V

    if-eqz v0, :cond_11

    const-string p1, "com.xiaomi.xmsf"

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_11

    new-instance p1, Lcom/xiaomi/push/service/XMPushService$8;

    const/16 v7, 0xe

    move-object v5, p1

    move-object v6, p0

    invoke-direct/range {v5 .. v10}, Lcom/xiaomi/push/service/XMPushService$8;-><init>(Lcom/xiaomi/push/service/XMPushService;II[BLjava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->executeJobNow(Lcom/xiaomi/push/service/XMPushService$Job;)V

    goto/16 :goto_8

    :cond_11
    invoke-virtual {p0, v9, v10}, Lcom/xiaomi/push/service/XMPushService;->registerForMiPushApp([BLjava/lang/String;)V

    goto/16 :goto_8

    :cond_12
    const-string v0, "com.xiaomi.mipush.SEND_MESSAGE"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    const-string v0, "com.xiaomi.mipush.UNREGISTER_APP"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    goto/16 :goto_6

    :cond_13
    sget-object v0, Lcom/xiaomi/push/service/PushServiceConstants;->ACTION_UNINSTALL:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    const-string v0, "uninstall_pkg_name"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_17

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_14

    goto/16 :goto_2

    :cond_14
    :try_start_0
    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, p1, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v3, 0x0

    :catch_0
    const-string v0, "com.xiaomi.channel"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v0

    const-string v1, "1"

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/PushClientsManager;->getAllClientLoginInfoByChid(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_15

    if-eqz v3, :cond_15

    const-string p1, "1"

    invoke-direct {p0, p1, v4}, Lcom/xiaomi/push/service/XMPushService;->closeAllChannelByChid(Ljava/lang/String;I)V

    const-string p1, "close the miliao channel as the app is uninstalled."

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    return-void

    :cond_15
    const-string v0, "pref_registered_pkg_names"

    invoke-virtual {p0, v0, v4}, Lcom/xiaomi/push/service/XMPushService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3a

    if-eqz v3, :cond_3a

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-static {p0, p1}, Lcom/xiaomi/push/service/MIPushNotificationHelper;->hasLocalNotifyType(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-static {p0, p1}, Lcom/xiaomi/push/service/MIPushNotificationHelper;->clearLocalNotifyType(Landroid/content/Context;Ljava/lang/String;)V

    :cond_16
    invoke-static {p0, p1}, Lcom/xiaomi/push/service/MIPushNotificationHelper;->clearNotification(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_3a

    if-eqz v1, :cond_3a

    :try_start_1
    invoke-static {p1, v1}, Lcom/xiaomi/push/service/MIPushHelper;->contructAppAbsentMessage(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/xiaomi/push/service/MIPushHelper;->sendPacket(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "uninstall "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " msg sent"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V
    :try_end_1
    .catch Lcom/xiaomi/smack/XMPPException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_8

    :catch_1
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Fail to send Message: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/smack/XMPPException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    const/16 v0, 0xa

    invoke-virtual {p0, v0, p1}, Lcom/xiaomi/push/service/XMPushService;->disconnect(ILjava/lang/Exception;)V

    goto/16 :goto_8

    :cond_17
    :goto_2
    return-void

    :cond_18
    const-string v0, "com.xiaomi.mipush.CLEAR_NOTIFICATION"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_PACKAGE_NAME:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->EXTRA_NOTIFY_ID:Ljava/lang/String;

    const/4 v2, -0x2

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3a

    const/4 v2, -0x1

    if-lt v1, v2, :cond_19

    invoke-static {p0, v0, v1}, Lcom/xiaomi/push/service/MIPushNotificationHelper;->clearNotification(Landroid/content/Context;Ljava/lang/String;I)V

    goto/16 :goto_8

    :cond_19
    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->EXTRA_NOTIFY_TITLE:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/xiaomi/push/service/PushConstants;->EXTRA_NOTIFY_DESCRIPTION:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v0, v1, p1}, Lcom/xiaomi/push/service/MIPushNotificationHelper;->clearNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8

    :cond_1a
    const-string v0, "com.xiaomi.mipush.SET_NOTIFICATION_TYPE"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_PACKAGE_NAME:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->EXTRA_SIG:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/xiaomi/push/service/PushConstants;->EXTRA_NOTIFY_TYPE:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1b

    sget-object v2, Lcom/xiaomi/push/service/PushConstants;->EXTRA_NOTIFY_TYPE:Ljava/lang/String;

    invoke-virtual {p1, v2, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/string/MD5;->MD5_16(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    goto :goto_3

    :cond_1b
    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/string/MD5;->MD5_16(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 p1, 0x0

    :goto_3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1e

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1c

    goto :goto_4

    :cond_1c
    if-eqz v3, :cond_1d

    invoke-static {p0, v0}, Lcom/xiaomi/push/service/MIPushNotificationHelper;->clearLocalNotifyType(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_8

    :cond_1d
    invoke-static {p0, v0, p1}, Lcom/xiaomi/push/service/MIPushNotificationHelper;->setLocalNotifyType(Landroid/content/Context;Ljava/lang/String;I)V

    goto/16 :goto_8

    :cond_1e
    :goto_4
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "invalid notification for "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    goto/16 :goto_8

    :cond_1f
    const-string v0, "com.xiaomi.mipush.DISABLE_PUSH"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    const-string v0, "mipush_app_package"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_20

    invoke-static {p0}, Lcom/xiaomi/push/service/MIPushAppInfo;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/MIPushAppInfo;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/service/MIPushAppInfo;->addDisablePushPkg(Ljava/lang/String;)V

    :cond_20
    const-string p1, "com.xiaomi.xmsf"

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3a

    const/16 p1, 0x13

    invoke-virtual {p0, p1, v2}, Lcom/xiaomi/push/service/XMPushService;->disconnect(ILjava/lang/Exception;)V

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->updateAlarmTimer()V

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->stopSelf()V

    goto/16 :goto_8

    :cond_21
    const-string v0, "com.xiaomi.mipush.DISABLE_PUSH_MESSAGE"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    const-string v0, "com.xiaomi.mipush.ENABLE_PUSH_MESSAGE"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    goto/16 :goto_5

    :cond_22
    const-string v0, "com.xiaomi.mipush.SEND_TINYDATA"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_23

    const-string v0, "mipush_app_package"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "mipush_payload"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object p1

    new-instance v1, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-direct {v1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;-><init>()V

    :try_start_2
    invoke-static {v1, p1}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertByteArrayToThriftObject(Lorg/apache/thrift/TBase;[B)V

    invoke-static {p0}, Lcom/xiaomi/tinyData/TinyDataManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/tinyData/TinyDataManager;

    move-result-object p1

    invoke-virtual {p1, v1, v0}, Lcom/xiaomi/tinyData/TinyDataManager;->upload(Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;Ljava/lang/String;)Z
    :try_end_2
    .catch Lorg/apache/thrift/TException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_8

    :catch_2
    move-exception p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    goto/16 :goto_8

    :cond_23
    const-string v0, "com.xiaomi.push.timer"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    const-string p1, "Service called on timer"

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    invoke-static {v4}, Lcom/xiaomi/push/service/timers/Alarm;->registerPing(Z)V

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->shouldCheckAlive()Z

    move-result p1

    if-eqz p1, :cond_3a

    invoke-direct {p0, v4}, Lcom/xiaomi/push/service/XMPushService;->checkAlive(Z)V

    goto/16 :goto_8

    :cond_24
    const-string v0, "com.xiaomi.push.check_alive"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_25

    const-string p1, "Service called on check alive."

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->shouldCheckAlive()Z

    move-result p1

    if-eqz p1, :cond_3a

    invoke-direct {p0, v4}, Lcom/xiaomi/push/service/XMPushService;->checkAlive(Z)V

    goto/16 :goto_8

    :cond_25
    const-string v0, "com.xiaomi.mipush.thirdparty"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "on thirdpart push :"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "com.xiaomi.mipush.thirdparty_DESC"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    const-string v0, "com.xiaomi.mipush.thirdparty_LEVEL"

    invoke-virtual {p1, v0, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    invoke-static {p0, p1}, Lcom/xiaomi/push/service/timers/Alarm;->changePolicy(Landroid/content/Context;I)V

    goto/16 :goto_8

    :cond_26
    const-string v0, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->networkChanged()V

    goto/16 :goto_8

    :cond_27
    const-string v0, "action_cr_config"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    const-string v0, "action_cr_event_switch"

    invoke-virtual {p1, v0, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    const-string v1, "action_cr_event_frequency"

    const-wide/32 v5, 0x15180

    invoke-virtual {p1, v1, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    const-string v7, "action_cr_perf_switch"

    invoke-virtual {p1, v7, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    const-string v7, "action_cr_perf_frequency"

    invoke-virtual {p1, v7, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v5

    const-string v7, "action_cr_event_en"

    invoke-virtual {p1, v7, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    const-string v7, "action_cr_max_file_size"

    const-wide/32 v8, 0x100000

    invoke-virtual {p1, v7, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v7

    invoke-static {}, Lcom/xiaomi/clientreport/data/Config;->getBuilder()Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/xiaomi/clientreport/data/Config$Builder;->setEventUploadSwitchOpen(Z)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Lcom/xiaomi/clientreport/data/Config$Builder;->setEventUploadFrequency(J)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object p1

    invoke-virtual {p1, v4}, Lcom/xiaomi/clientreport/data/Config$Builder;->setPerfUploadSwitchOpen(Z)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object p1

    invoke-virtual {p1, v5, v6}, Lcom/xiaomi/clientreport/data/Config$Builder;->setPerfUploadFrequency(J)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object p1

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/clientreport/util/ClientReportUtil;->getEventKeyWithDefault(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/xiaomi/clientreport/data/Config$Builder;->setAESKey(Ljava/lang/String;)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object p1

    invoke-virtual {p1, v3}, Lcom/xiaomi/clientreport/data/Config$Builder;->setEventEncrypted(Z)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object p1

    invoke-virtual {p1, v7, v8}, Lcom/xiaomi/clientreport/data/Config$Builder;->setMaxFileLength(J)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object p1

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/xiaomi/clientreport/data/Config$Builder;->build(Landroid/content/Context;)Lcom/xiaomi/clientreport/data/Config;

    move-result-object p1

    const-string v0, "com.xiaomi.xmsf"

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3a

    const-wide/16 v3, 0x0

    cmp-long v0, v1, v3

    if-lez v0, :cond_3a

    cmp-long v0, v5, v3

    if-lez v0, :cond_3a

    cmp-long v0, v7, v3

    if-lez v0, :cond_3a

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->initEventPerfLogic(Landroid/content/Context;Lcom/xiaomi/clientreport/data/Config;)V

    goto/16 :goto_8

    :cond_28
    const-string v0, "action_help_ping"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2b

    const-string v0, "extra_help_ping_switch"

    invoke-virtual {p1, v0, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    const-string v1, "extra_help_ping_frequency"

    invoke-virtual {p1, v1, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const/16 v2, 0x1e

    if-ltz v1, :cond_29

    if-ge v1, v2, :cond_29

    const-string v1, "aw_ping: frquency need > 30s."

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    const/16 v1, 0x1e

    :cond_29
    if-gez v1, :cond_2a

    const/4 v0, 0x0

    :cond_2a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "aw_ping: receive a aw_ping message. switch: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, " frequency: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    if-eqz v0, :cond_3a

    if-lez v1, :cond_3a

    const-string v0, "com.xiaomi.xmsf"

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3a

    invoke-direct {p0, p1, v1}, Lcom/xiaomi/push/service/XMPushService;->doAWPingCMD(Landroid/content/Intent;I)V

    goto/16 :goto_8

    :cond_2b
    const-string v0, "action_aw_app_logic"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->doAWLogic(Landroid/content/Intent;)V

    goto/16 :goto_8

    :cond_2c
    :goto_5
    const-string v0, "mipush_app_package"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "mipush_payload"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v6

    const-string v0, "mipush_app_id"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "mipush_app_token"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v0, "com.xiaomi.mipush.DISABLE_PUSH_MESSAGE"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2d

    invoke-static {p0}, Lcom/xiaomi/push/service/MIPushAppInfo;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/MIPushAppInfo;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/xiaomi/push/service/MIPushAppInfo;->addDisablePushPkgCache(Ljava/lang/String;)V

    :cond_2d
    const-string v0, "com.xiaomi.mipush.ENABLE_PUSH_MESSAGE"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-static {p0}, Lcom/xiaomi/push/service/MIPushAppInfo;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/MIPushAppInfo;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/xiaomi/push/service/MIPushAppInfo;->removeDisablePushPkg(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/xiaomi/push/service/MIPushAppInfo;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/MIPushAppInfo;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/xiaomi/push/service/MIPushAppInfo;->removeDisablePushPkgCache(Ljava/lang/String;)V

    :cond_2e
    if-nez v6, :cond_2f

    const p1, 0x42c1d83

    const-string v0, "null payload"

    invoke-static {p0, v3, v6, p1, v0}, Lcom/xiaomi/push/service/MIPushClientManager;->notifyError(Landroid/content/Context;Ljava/lang/String;[BILjava/lang/String;)V

    goto/16 :goto_8

    :cond_2f
    invoke-static {v3, v6}, Lcom/xiaomi/push/service/MIPushClientManager;->addPendingMessages(Ljava/lang/String;[B)V

    new-instance v0, Lcom/xiaomi/push/service/MIPushAppRegisterJob;

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/xiaomi/push/service/MIPushAppRegisterJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    const-string v0, "com.xiaomi.mipush.ENABLE_PUSH_MESSAGE"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3a

    iget-object p1, p0, Lcom/xiaomi/push/service/XMPushService;->mConnectionChangeReceiver:Lcom/xiaomi/push/service/XMPushService$ConnectionChangeReceiver;

    if-nez p1, :cond_3a

    new-instance p1, Lcom/xiaomi/push/service/XMPushService$ConnectionChangeReceiver;

    invoke-direct {p1, p0}, Lcom/xiaomi/push/service/XMPushService$ConnectionChangeReceiver;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    iput-object p1, p0, Lcom/xiaomi/push/service/XMPushService;->mConnectionChangeReceiver:Lcom/xiaomi/push/service/XMPushService$ConnectionChangeReceiver;

    new-instance p1, Landroid/content/IntentFilter;

    const-string v0, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {p1, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mConnectionChangeReceiver:Lcom/xiaomi/push/service/XMPushService$ConnectionChangeReceiver;

    invoke-virtual {p0, v0, p1}, Lcom/xiaomi/push/service/XMPushService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    goto/16 :goto_8

    :cond_30
    :goto_6
    const-string v0, "mipush_app_package"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "mipush_payload"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v1

    const-string v2, "com.xiaomi.mipush.MESSAGE_CACHE"

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    const-string v3, "com.xiaomi.mipush.UNREGISTER_APP"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_31

    invoke-static {p0}, Lcom/xiaomi/push/service/MIPushAppInfo;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/MIPushAppInfo;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/xiaomi/push/service/MIPushAppInfo;->addUnRegisteredPkg(Ljava/lang/String;)V

    :cond_31
    invoke-virtual {p0, v0, v1, v2}, Lcom/xiaomi/push/service/XMPushService;->sendMessage(Ljava/lang/String;[BZ)V

    goto/16 :goto_8

    :cond_32
    :goto_7
    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_CHANNEL_ID:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->EXTRA_SECURITY:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_33

    const-string p1, "security is empty. ignore."

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    goto/16 :goto_8

    :cond_33
    if-eqz v0, :cond_39

    invoke-direct {p0, v0, p1}, Lcom/xiaomi/push/service/XMPushService;->shouldRebind(Ljava/lang/String;Landroid/content/Intent;)Z

    move-result v1

    invoke-direct {p0, v0, p1}, Lcom/xiaomi/push/service/XMPushService;->updatePushClient(Ljava/lang/String;Landroid/content/Intent;)Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    move-result-object v7

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/network/Network;->hasNetwork(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_34

    iget-object v5, p0, Lcom/xiaomi/push/service/XMPushService;->mClientEventDispatcher:Lcom/xiaomi/push/service/ClientEventDispatcher;

    const/4 v8, 0x0

    const/4 v9, 0x2

    const/4 v10, 0x0

    move-object v6, p0

    invoke-virtual/range {v5 .. v10}, Lcom/xiaomi/push/service/ClientEventDispatcher;->notifyChannelOpenResult(Landroid/content/Context;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;ZILjava/lang/String;)V

    goto :goto_8

    :cond_34
    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->isConnected()Z

    move-result p1

    if-eqz p1, :cond_38

    iget-object p1, v7, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    sget-object v0, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->unbind:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    if-ne p1, v0, :cond_35

    new-instance p1, Lcom/xiaomi/push/service/XMPushService$BindJob;

    invoke-direct {p1, p0, v7}, Lcom/xiaomi/push/service/XMPushService$BindJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->executeJobNow(Lcom/xiaomi/push/service/XMPushService$Job;)V

    goto :goto_8

    :cond_35
    if-eqz v1, :cond_36

    new-instance p1, Lcom/xiaomi/push/service/XMPushService$ReBindJob;

    invoke-direct {p1, p0, v7}, Lcom/xiaomi/push/service/XMPushService$ReBindJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->executeJobNow(Lcom/xiaomi/push/service/XMPushService$Job;)V

    goto :goto_8

    :cond_36
    iget-object p1, v7, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    sget-object v0, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->binding:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    if-ne p1, v0, :cond_37

    const-string p1, "the client is binding. %1$s %2$s."

    new-array v0, v2, [Ljava/lang/Object;

    iget-object v1, v7, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->chid:Ljava/lang/String;

    aput-object v1, v0, v4

    iget-object v1, v7, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->userId:Ljava/lang/String;

    invoke-static {v1}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->getResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    goto :goto_8

    :cond_37
    iget-object p1, v7, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    sget-object v0, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->binded:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    if-ne p1, v0, :cond_3a

    iget-object v5, p0, Lcom/xiaomi/push/service/XMPushService;->mClientEventDispatcher:Lcom/xiaomi/push/service/ClientEventDispatcher;

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v6, p0

    invoke-virtual/range {v5 .. v10}, Lcom/xiaomi/push/service/ClientEventDispatcher;->notifyChannelOpenResult(Landroid/content/Context;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;ZILjava/lang/String;)V

    goto :goto_8

    :cond_38
    invoke-virtual {p0, v3}, Lcom/xiaomi/push/service/XMPushService;->scheduleConnect(Z)V

    goto :goto_8

    :cond_39
    const-string p1, "channel id is empty, do nothing!"

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    :cond_3a
    :goto_8
    return-void
.end method

.method private isExtremePowerSaveMode()Z
    .locals 3

    const-string v0, "com.xiaomi.xmsf"

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "EXTREME_POWER_MODE_ENABLE"

    invoke-static {v0, v2, v1}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method private isPushEnabled()Z
    .locals 2

    const-string v0, "com.xiaomi.xmsf"

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/xiaomi/push/service/MIPushAppInfo;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/MIPushAppInfo;

    move-result-object v0

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/MIPushAppInfo;->isPushDisabled(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private networkChanged()V
    .locals 5

    const/4 v0, 0x0

    :try_start_0
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Lcom/xiaomi/push/service/XMPushService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    move-object v1, v0

    :goto_0
    if-eqz v1, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "["

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getSubtypeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "], state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "network changed,"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v1

    sget-object v2, Landroid/net/NetworkInfo$State;->SUSPENDED:Landroid/net/NetworkInfo$State;

    if-eq v1, v2, :cond_0

    sget-object v2, Landroid/net/NetworkInfo$State;->UNKNOWN:Landroid/net/NetworkInfo$State;

    if-ne v1, v2, :cond_2

    :cond_0
    return-void

    :cond_1
    const-string v1, "network changed, no active network"

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    :cond_2
    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getContext()Lcom/xiaomi/stats/StatsContext;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getContext()Lcom/xiaomi/stats/StatsContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xiaomi/stats/StatsContext;->statsChannelIfNeed()V

    :cond_3
    invoke-static {p0}, Lcom/xiaomi/smack/util/TrafficUtils;->notifyNetworkChanage(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->mSlimConnection:Lcom/xiaomi/slim/SlimConnection;

    invoke-virtual {v1}, Lcom/xiaomi/slim/SlimConnection;->clearCachedStatus()V

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/network/Network;->hasNetwork(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->shouldCheckAlive()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->checkAlive(Z)V

    :cond_4
    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->isConnected()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->isConnecting()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mJobController:Lcom/xiaomi/push/service/JobScheduler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/JobScheduler;->removeJobs(I)V

    new-instance v0, Lcom/xiaomi/push/service/XMPushService$ConnectJob;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/XMPushService$ConnectJob;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    :cond_5
    invoke-static {p0}, Lcom/xiaomi/push/log/LogUploader;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/log/LogUploader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/log/LogUploader;->checkUpload()V

    goto :goto_1

    :cond_6
    new-instance v1, Lcom/xiaomi/push/service/XMPushService$DisconnectJob;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2, v0}, Lcom/xiaomi/push/service/XMPushService$DisconnectJob;-><init>(Lcom/xiaomi/push/service/XMPushService;ILjava/lang/Exception;)V

    invoke-virtual {p0, v1}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    :goto_1
    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->updateAlarmTimer()V

    return-void
.end method

.method private postOnCreate()V
    .locals 3

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/push/service/AppRegionStorage;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/AppRegionStorage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/service/AppRegionStorage;->getRegion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->ensureRegionAvaible()Ljava/lang/String;

    move-result-object v1

    :cond_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    iput-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->mRegion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/AppRegionStorage;->setRegion(Ljava/lang/String;)V

    sget-object v0, Lcom/xiaomi/channel/commonutils/android/Region;->Global:Lcom/xiaomi/channel/commonutils/android/Region;

    invoke-virtual {v0}, Lcom/xiaomi/channel/commonutils/android/Region;->name()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->mRegion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "app.chat.global.xiaomi.net"

    invoke-static {v0}, Lcom/xiaomi/smack/ConnectionConfiguration;->setXmppServerHost(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/xiaomi/channel/commonutils/android/Region;->Europe:Lcom/xiaomi/channel/commonutils/android/Region;

    invoke-virtual {v0}, Lcom/xiaomi/channel/commonutils/android/Region;->name()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->mRegion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "fr.app.chat.global.xiaomi.net"

    invoke-static {v0}, Lcom/xiaomi/smack/ConnectionConfiguration;->setXmppServerHost(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/xiaomi/channel/commonutils/android/Region;->Russia:Lcom/xiaomi/channel/commonutils/android/Region;

    invoke-virtual {v0}, Lcom/xiaomi/channel/commonutils/android/Region;->name()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->mRegion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "ru.app.chat.global.xiaomi.net"

    invoke-static {v0}, Lcom/xiaomi/smack/ConnectionConfiguration;->setXmppServerHost(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    sget-object v0, Lcom/xiaomi/channel/commonutils/android/Region;->India:Lcom/xiaomi/channel/commonutils/android/Region;

    invoke-virtual {v0}, Lcom/xiaomi/channel/commonutils/android/Region;->name()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->mRegion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "idmb.app.chat.global.xiaomi.net"

    invoke-static {v0}, Lcom/xiaomi/smack/ConnectionConfiguration;->setXmppServerHost(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    sget-object v0, Lcom/xiaomi/channel/commonutils/android/Region;->China:Lcom/xiaomi/channel/commonutils/android/Region;

    invoke-virtual {v0}, Lcom/xiaomi/channel/commonutils/android/Region;->name()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mRegion:Ljava/lang/String;

    :cond_5
    :goto_0
    sget-object v0, Lcom/xiaomi/channel/commonutils/android/Region;->China:Lcom/xiaomi/channel/commonutils/android/Region;

    invoke-virtual {v0}, Lcom/xiaomi/channel/commonutils/android/Region;->name()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->mRegion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "cn.app.chat.xiaomi.net"

    invoke-static {v0}, Lcom/xiaomi/smack/ConnectionConfiguration;->setXmppServerHost(Ljava/lang/String;)V

    :cond_6
    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->isPushEnabled()Z

    move-result v0

    if-eqz v0, :cond_7

    new-instance v0, Lcom/xiaomi/push/service/XMPushService$6;

    const/16 v1, 0xb

    invoke-direct {v0, p0, v1}, Lcom/xiaomi/push/service/XMPushService$6;-><init>(Lcom/xiaomi/push/service/XMPushService;I)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    new-instance v1, Lcom/xiaomi/push/service/XMPushService$7;

    invoke-direct {v1, p0, v0}, Lcom/xiaomi/push/service/XMPushService$7;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/XMPushService$Job;)V

    invoke-static {v1}, Lcom/xiaomi/push/service/MIPushAccountUtils;->setAccountChangeListener(Lcom/xiaomi/push/service/MIPushAccountUtils$PushAccountChangeListener;)V

    :cond_7
    :try_start_0
    invoke-static {}, Lcom/xiaomi/channel/commonutils/android/SystemUtils;->isBootCompleted()Z

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mClientEventDispatcher:Lcom/xiaomi/push/service/ClientEventDispatcher;

    invoke-virtual {v0, p0}, Lcom/xiaomi/push/service/ClientEventDispatcher;->notifyServiceStarted(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :cond_8
    :goto_1
    return-void
.end method

.method private preparePacket(Lcom/xiaomi/smack/packet/Packet;Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/smack/packet/Packet;
    .locals 3

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/xiaomi/push/service/PushClientsManager;->queryChannelIdByPackage(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "open channel should be called first before sending a packet, pkg="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_0
    invoke-virtual {p1, p2}, Lcom/xiaomi/smack/packet/Packet;->setPackageName(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/xiaomi/smack/packet/Packet;->getChannelId()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 p2, 0x0

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/xiaomi/smack/packet/Packet;->setChannelId(Ljava/lang/String;)V

    :cond_1
    invoke-virtual {p1}, Lcom/xiaomi/smack/packet/Packet;->getFrom()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lcom/xiaomi/push/service/PushClientsManager;->getClientLoginInfoByChidAndUserId(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    move-result-object v0

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->isConnected()Z

    move-result v1

    if-nez v1, :cond_2

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "drop a packet as the channel is not connected, chid="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    if-eqz v0, :cond_5

    iget-object v1, v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    sget-object v2, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->binded:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    if-eq v1, v2, :cond_3

    goto :goto_0

    :cond_3
    iget-object p2, v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->session:Ljava/lang/String;

    invoke-static {p3, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_4

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "invalid session. "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    return-object p1

    :cond_5
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "drop a packet as the channel is not opened, chid="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private sendMessage(Landroid/content/Intent;)V
    .locals 8

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_PACKAGE_NAME:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->EXTRA_SESSION:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "ext_packet"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v2, :cond_1

    new-instance p1, Lcom/xiaomi/smack/packet/Message;

    invoke-direct {p1, v2}, Lcom/xiaomi/smack/packet/Message;-><init>(Landroid/os/Bundle;)V

    invoke-direct {p0, p1, v0, v1}, Lcom/xiaomi/push/service/XMPushService;->preparePacket(Lcom/xiaomi/smack/packet/Packet;Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/smack/packet/Packet;

    move-result-object p1

    check-cast p1, Lcom/xiaomi/smack/packet/Message;

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/smack/packet/Message;->getChannelId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/xiaomi/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v0, v1}, Lcom/xiaomi/push/service/PushClientsManager;->getClientLoginInfoByChidAndUserId(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    move-result-object v0

    iget-object v0, v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->security:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/xiaomi/slim/Blob;->from(Lcom/xiaomi/smack/packet/Packet;Ljava/lang/String;)Lcom/xiaomi/slim/Blob;

    move-result-object v4

    goto :goto_0

    :cond_1
    const-string v0, "ext_raw_packet"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v0

    if-eqz v0, :cond_2

    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->EXTRA_USER_ID:Ljava/lang/String;

    const-wide/16 v5, 0x0

    invoke-virtual {p1, v1, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    sget-object v5, Lcom/xiaomi/push/service/PushConstants;->EXTRA_USER_RES:Ljava/lang/String;

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "ext_chid"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Lcom/xiaomi/push/service/PushClientsManager;->getClientLoginInfoByChidAndUserId(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    move-result-object v3

    if-eqz v3, :cond_2

    new-instance v7, Lcom/xiaomi/slim/Blob;

    invoke-direct {v7}, Lcom/xiaomi/slim/Blob;-><init>()V

    :try_start_0
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v7, v6}, Lcom/xiaomi/slim/Blob;->setChannelId(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const-string v6, "SECMSG"

    invoke-virtual {v7, v6, v4}, Lcom/xiaomi/slim/Blob;->setCmd(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "xiaomi.com"

    invoke-virtual {v7, v1, v2, v4, v5}, Lcom/xiaomi/slim/Blob;->setFrom(JLjava/lang/String;Ljava/lang/String;)V

    const-string v1, "ext_pkt_id"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v7, p1}, Lcom/xiaomi/slim/Blob;->setPacketID(Ljava/lang/String;)V

    iget-object p1, v3, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->security:Ljava/lang/String;

    invoke-virtual {v7, v0, p1}, Lcom/xiaomi/slim/Blob;->setPayload([BLjava/lang/String;)V

    move-object v4, v7

    :cond_2
    :goto_0
    if-eqz v4, :cond_3

    new-instance p1, Lcom/xiaomi/push/service/SendMessageJob;

    invoke-direct {p1, p0, v4}, Lcom/xiaomi/push/service/SendMessageJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/slim/Blob;)V

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->executeJobNow(Lcom/xiaomi/push/service/XMPushService$Job;)V

    :cond_3
    return-void
.end method

.method private sendMessages(Landroid/content/Intent;)V
    .locals 7

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_PACKAGE_NAME:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/push/service/PushConstants;->EXTRA_SESSION:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "ext_packets"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getParcelableArrayExtra(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v2

    array-length v3, v2

    new-array v3, v3, [Lcom/xiaomi/smack/packet/Message;

    const-string v4, "ext_encrypt"

    const/4 v5, 0x1

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    const/4 p1, 0x0

    const/4 v4, 0x0

    :goto_0
    array-length v5, v2

    if-ge v4, v5, :cond_1

    new-instance v5, Lcom/xiaomi/smack/packet/Message;

    aget-object v6, v2, v4

    check-cast v6, Landroid/os/Bundle;

    invoke-direct {v5, v6}, Lcom/xiaomi/smack/packet/Message;-><init>(Landroid/os/Bundle;)V

    aput-object v5, v3, v4

    aget-object v5, v3, v4

    invoke-direct {p0, v5, v0, v1}, Lcom/xiaomi/push/service/XMPushService;->preparePacket(Lcom/xiaomi/smack/packet/Packet;Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/smack/packet/Packet;

    move-result-object v5

    check-cast v5, Lcom/xiaomi/smack/packet/Message;

    aput-object v5, v3, v4

    aget-object v5, v3, v4

    if-nez v5, :cond_0

    return-void

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v0

    array-length v1, v3

    new-array v1, v1, [Lcom/xiaomi/slim/Blob;

    :goto_1
    array-length v2, v3

    if-ge p1, v2, :cond_2

    aget-object v2, v3, p1

    invoke-virtual {v2}, Lcom/xiaomi/smack/packet/Message;->getChannelId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Lcom/xiaomi/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lcom/xiaomi/push/service/PushClientsManager;->getClientLoginInfoByChidAndUserId(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    move-result-object v4

    iget-object v4, v4, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->security:Ljava/lang/String;

    invoke-static {v2, v4}, Lcom/xiaomi/slim/Blob;->from(Lcom/xiaomi/smack/packet/Packet;Ljava/lang/String;)Lcom/xiaomi/slim/Blob;

    move-result-object v2

    aput-object v2, v1, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_2
    new-instance p1, Lcom/xiaomi/push/service/BatchSendMessageJob;

    invoke-direct {p1, p0, v1}, Lcom/xiaomi/push/service/BatchSendMessageJob;-><init>(Lcom/xiaomi/push/service/XMPushService;[Lcom/xiaomi/slim/Blob;)V

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->executeJobNow(Lcom/xiaomi/push/service/XMPushService$Job;)V

    return-void
.end method

.method private shouldCheckAlive()Z
    .locals 5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/xiaomi/push/service/XMPushService;->lastAlive:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x7530

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/network/Network;->isConnected(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method private shouldRebind(Ljava/lang/String;Landroid/content/Intent;)Z
    .locals 5

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_USER_ID:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/xiaomi/push/service/PushClientsManager;->getClientLoginInfoByChidAndUserId(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    sget-object v3, Lcom/xiaomi/push/service/PushConstants;->EXTRA_SESSION:Ljava/lang/String;

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/xiaomi/push/service/PushConstants;->EXTRA_SECURITY:Ljava/lang/String;

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iget-object v4, v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->session:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->session:Ljava/lang/String;

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "session changed. old session="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->session:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ", new session="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " chid = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    const/4 v2, 0x1

    :cond_0
    iget-object v0, v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->security:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "security changed. chid = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " sechash = "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/xiaomi/channel/commonutils/string/MD5;->MD5_32(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    const/4 v2, 0x1

    :cond_1
    return v2
.end method

.method private unregisterReceiverSafely(Landroid/content/BroadcastReceiver;)V
    .locals 0

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void
.end method

.method private updateAlarmTimer()V
    .locals 1

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->shouldReconnect()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/xiaomi/push/service/timers/Alarm;->isAlive()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/xiaomi/push/service/timers/Alarm;->registerPing(Z)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/xiaomi/push/service/timers/Alarm;->stop()V

    :cond_1
    :goto_0
    return-void
.end method

.method private updatePushClient(Ljava/lang/String;Landroid/content/Intent;)Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;
    .locals 2

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_USER_ID:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/xiaomi/push/service/PushClientsManager;->getClientLoginInfoByChidAndUserId(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    move-result-object p1

    if-nez p1, :cond_0

    new-instance p1, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    invoke-direct {p1, p0}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    :cond_0
    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_CHANNEL_ID:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->chid:Ljava/lang/String;

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_USER_ID:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->userId:Ljava/lang/String;

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_TOKEN:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->token:Ljava/lang/String;

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_PACKAGE_NAME:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->pkgName:Ljava/lang/String;

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_CLIENT_ATTR:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->clientExtra:Ljava/lang/String;

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_CLOUD_ATTR:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->cloudExtra:Ljava/lang/String;

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_KICK:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p1, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->kick:Z

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_SECURITY:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->security:Ljava/lang/String;

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_SESSION:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->session:Ljava/lang/String;

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_AUTH_METHOD:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->authMethod:Ljava/lang/String;

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mClientEventDispatcher:Lcom/xiaomi/push/service/ClientEventDispatcher;

    iput-object v0, p1, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->mClientEventDispatcher:Lcom/xiaomi/push/service/ClientEventDispatcher;

    sget-object v0, Lcom/xiaomi/push/service/PushConstants;->EXTRA_MESSENGER:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/os/Messenger;

    invoke-virtual {p1, p2}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->watch(Landroid/os/Messenger;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    iput-object p2, p1, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->context:Landroid/content/Context;

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/xiaomi/push/service/PushClientsManager;->addActiveClient(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    return-object p1
.end method


# virtual methods
.method public addPingCallBack(Lcom/xiaomi/push/service/XMPushService$PingCallBack;)V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->pingCallBacks:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->pingCallBacks:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public batchSendPacket([Lcom/xiaomi/slim/Blob;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    invoke-virtual {v0, p1}, Lcom/xiaomi/smack/Connection;->batchSend([Lcom/xiaomi/slim/Blob;)V

    return-void

    :cond_0
    new-instance p1, Lcom/xiaomi/smack/XMPPException;

    const-string v0, "try send msg while connection is null."

    invoke-direct {p1, v0}, Lcom/xiaomi/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public closeChannel(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 7

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/xiaomi/push/service/PushClientsManager;->getClientLoginInfoByChidAndUserId(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    move-result-object v3

    if-eqz v3, :cond_0

    new-instance v0, Lcom/xiaomi/push/service/XMPushService$UnbindJob;

    move-object v1, v0

    move-object v2, p0

    move v4, p3

    move-object v5, p5

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/xiaomi/push/service/XMPushService$UnbindJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    :cond_0
    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object p3

    invoke-virtual {p3, p1, p2}, Lcom/xiaomi/push/service/PushClientsManager;->deactivateClient(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public connectionClosed(Lcom/xiaomi/smack/Connection;ILjava/lang/Exception;)V
    .locals 1

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getContext()Lcom/xiaomi/stats/StatsContext;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/xiaomi/stats/StatsContext;->connectionClosed(Lcom/xiaomi/smack/Connection;ILjava/lang/Exception;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->scheduleConnect(Z)V

    return-void
.end method

.method public connectionStarted(Lcom/xiaomi/smack/Connection;)V
    .locals 1

    const-string v0, "begin to connect..."

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getContext()Lcom/xiaomi/stats/StatsContext;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/xiaomi/stats/StatsContext;->connectionStarted(Lcom/xiaomi/smack/Connection;)V

    return-void
.end method

.method public createClientEventDispatcher()Lcom/xiaomi/push/service/ClientEventDispatcher;
    .locals 1

    new-instance v0, Lcom/xiaomi/push/service/ClientEventDispatcher;

    invoke-direct {v0}, Lcom/xiaomi/push/service/ClientEventDispatcher;-><init>()V

    return-object v0
.end method

.method public disconnect(ILjava/lang/Exception;)V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "disconnect "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move-object v1, v2

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    invoke-virtual {v0, p1, p2}, Lcom/xiaomi/smack/Connection;->disconnect(ILjava/lang/Exception;)V

    iput-object v2, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    :cond_1
    const/4 p2, 0x7

    invoke-virtual {p0, p2}, Lcom/xiaomi/push/service/XMPushService;->removeJobs(I)V

    const/4 p2, 0x4

    invoke-virtual {p0, p2}, Lcom/xiaomi/push/service/XMPushService;->removeJobs(I)V

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object p2

    invoke-virtual {p2, p0, p1}, Lcom/xiaomi/push/service/PushClientsManager;->resetAllClients(Landroid/content/Context;I)V

    return-void
.end method

.method public executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V
    .locals 2

    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/xiaomi/push/service/XMPushService;->executeJobDelayed(Lcom/xiaomi/push/service/XMPushService$Job;J)V

    return-void
.end method

.method public executeJobDelayed(Lcom/xiaomi/push/service/XMPushService$Job;J)V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mJobController:Lcom/xiaomi/push/service/JobScheduler;

    invoke-virtual {v0, p1, p2, p3}, Lcom/xiaomi/push/service/JobScheduler;->executeJobDelayed(Lcom/xiaomi/push/service/JobScheduler$Job;J)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public getClientEventDispatcher()Lcom/xiaomi/push/service/ClientEventDispatcher;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mClientEventDispatcher:Lcom/xiaomi/push/service/ClientEventDispatcher;

    return-object v0
.end method

.method public getCurrentConnection()Lcom/xiaomi/smack/Connection;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    return-object v0
.end method

.method public hasJob(I)Z
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mJobController:Lcom/xiaomi/push/service/JobScheduler;

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/service/JobScheduler;->hasJob(I)Z

    move-result p1

    return p1
.end method

.method public isConnected()Z
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    invoke-virtual {v0}, Lcom/xiaomi/smack/Connection;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isConnecting()Z
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    invoke-virtual {v0}, Lcom/xiaomi/smack/Connection;->isConnecting()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isPushDisabled()Z
    .locals 5

    const/4 v0, 0x0

    :try_start_0
    const-string v1, "miui.os.Build"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "IS_CM_CUSTOMIZATION_TEST"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const-string v3, "IS_CU_CUSTOMIZATION_TEST"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    const-string v4, "IS_CT_CUSTOMIZATION_TEST"

    invoke-virtual {v1, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :cond_1
    return v0

    :catch_0
    return v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    iget-object p1, p0, Lcom/xiaomi/push/service/XMPushService;->messenger:Landroid/os/Messenger;

    invoke-virtual {p1}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object p1

    return-object p1
.end method

.method public onCreate()V
    .locals 8

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/android/SystemUtils;->initialize(Landroid/content/Context;)V

    invoke-static {p0}, Lcom/xiaomi/push/service/MIPushAccountUtils;->getMIPushAccount(Landroid/content/Context;)Lcom/xiaomi/push/service/MIPushAccount;

    move-result-object v0

    if-eqz v0, :cond_0

    iget v0, v0, Lcom/xiaomi/push/service/MIPushAccount;->envType:I

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->setEnvType(I)V

    :cond_0
    new-instance v0, Landroid/os/Messenger;

    new-instance v1, Lcom/xiaomi/push/service/XMPushService$2;

    invoke-direct {v1, p0}, Lcom/xiaomi/push/service/XMPushService$2;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->messenger:Landroid/os/Messenger;

    invoke-static {p0}, Lcom/xiaomi/push/service/PushHostManagerFactory;->init(Lcom/xiaomi/push/service/XMPushService;)V

    new-instance v0, Lcom/xiaomi/push/service/XMPushService$3;

    const/4 v4, 0x0

    const/16 v5, 0x1466

    const-string v6, "xiaomi.com"

    const/4 v7, 0x0

    move-object v2, v0

    move-object v3, p0

    invoke-direct/range {v2 .. v7}, Lcom/xiaomi/push/service/XMPushService$3;-><init>(Lcom/xiaomi/push/service/XMPushService;Ljava/util/Map;ILjava/lang/String;Lcom/xiaomi/smack/HttpRequestProxy;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->connConfig:Lcom/xiaomi/smack/ConnectionConfiguration;

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->connConfig:Lcom/xiaomi/smack/ConnectionConfiguration;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/xiaomi/smack/ConnectionConfiguration;->setDebuggerEnabled(Z)V

    new-instance v0, Lcom/xiaomi/slim/SlimConnection;

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->connConfig:Lcom/xiaomi/smack/ConnectionConfiguration;

    invoke-direct {v0, p0, v1}, Lcom/xiaomi/slim/SlimConnection;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/smack/ConnectionConfiguration;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mSlimConnection:Lcom/xiaomi/slim/SlimConnection;

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->createClientEventDispatcher()Lcom/xiaomi/push/service/ClientEventDispatcher;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mClientEventDispatcher:Lcom/xiaomi/push/service/ClientEventDispatcher;

    invoke-static {p0}, Lcom/xiaomi/push/service/timers/Alarm;->initialize(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mSlimConnection:Lcom/xiaomi/slim/SlimConnection;

    invoke-virtual {v0, p0}, Lcom/xiaomi/slim/SlimConnection;->addConnectionListener(Lcom/xiaomi/smack/ConnectionListener;)V

    new-instance v0, Lcom/xiaomi/push/service/PacketSync;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/PacketSync;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mPacketSync:Lcom/xiaomi/push/service/PacketSync;

    new-instance v0, Lcom/xiaomi/push/service/ReconnectionManager;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/ReconnectionManager;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mReconnManager:Lcom/xiaomi/push/service/ReconnectionManager;

    new-instance v0, Lcom/xiaomi/push/service/CommonPacketExtensionProvider;

    invoke-direct {v0}, Lcom/xiaomi/push/service/CommonPacketExtensionProvider;-><init>()V

    invoke-virtual {v0}, Lcom/xiaomi/push/service/CommonPacketExtensionProvider;->register()V

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/xiaomi/stats/StatsHandler;->init(Lcom/xiaomi/push/service/XMPushService;)V

    new-instance v0, Lcom/xiaomi/push/service/JobScheduler;

    const-string v1, "Connection Controller Thread"

    invoke-direct {v0, v1}, Lcom/xiaomi/push/service/JobScheduler;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mJobController:Lcom/xiaomi/push/service/JobScheduler;

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/service/PushClientsManager;->removeAllClientChangeListeners()V

    new-instance v1, Lcom/xiaomi/push/service/XMPushService$4;

    invoke-direct {v1, p0}, Lcom/xiaomi/push/service/XMPushService$4;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/PushClientsManager;->addClientChangeListener(Lcom/xiaomi/push/service/PushClientsManager$ClientChangeListener;)V

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->canOpenForegroundService()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->enableForegroundService()V

    :cond_1
    invoke-static {p0}, Lcom/xiaomi/tinyData/TinyDataManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/tinyData/TinyDataManager;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/push/service/LongConnUploader;

    invoke-direct {v1, p0}, Lcom/xiaomi/push/service/LongConnUploader;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    const-string v2, "UPLOADER_PUSH_CHANNEL"

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/tinyData/TinyDataManager;->addUploader(Lcom/xiaomi/tinyData/TinyDataUploader;Ljava/lang/String;)V

    new-instance v0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;

    invoke-direct {v0, p0}, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->addPingCallBack(Lcom/xiaomi/push/service/XMPushService$PingCallBack;)V

    new-instance v0, Lcom/xiaomi/push/service/XMPushService$InitJob;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/XMPushService$InitJob;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->networkListeners:Ljava/util/Collection;

    invoke-static {p0}, Lcom/xiaomi/push/service/Sync;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/Sync;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->isPushEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Lcom/xiaomi/push/service/XMPushService$ConnectionChangeReceiver;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/XMPushService$ConnectionChangeReceiver;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mConnectionChangeReceiver:Lcom/xiaomi/push/service/XMPushService$ConnectionChangeReceiver;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->mConnectionChangeReceiver:Lcom/xiaomi/push/service/XMPushService$ConnectionChangeReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/xiaomi/push/service/XMPushService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_2
    const-string v0, "com.xiaomi.xmsf"

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "EXTREME_POWER_MODE_ENABLE"

    invoke-static {v0}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_3

    new-instance v1, Lcom/xiaomi/push/service/XMPushService$5;

    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {v1, p0, v2}, Lcom/xiaomi/push/service/XMPushService$5;-><init>(Lcom/xiaomi/push/service/XMPushService;Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->mExtremePowerModeObserver:Landroid/database/ContentObserver;

    :try_start_0
    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/xiaomi/push/service/XMPushService;->mExtremePowerModeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "register observer err:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    :cond_3
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "XMPushService created pid = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/xiaomi/push/service/XMPushService;->PID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    return-void
.end method

.method public onDestroy()V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mConnectionChangeReceiver:Lcom/xiaomi/push/service/XMPushService$ConnectionChangeReceiver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mConnectionChangeReceiver:Lcom/xiaomi/push/service/XMPushService$ConnectionChangeReceiver;

    invoke-direct {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->unregisterReceiverSafely(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mConnectionChangeReceiver:Lcom/xiaomi/push/service/XMPushService$ConnectionChangeReceiver;

    :cond_0
    const-string v0, "com.xiaomi.xmsf"

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mExtremePowerModeObserver:Landroid/database/ContentObserver;

    if-eqz v0, :cond_1

    :try_start_0
    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->mExtremePowerModeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unregister observer err:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->networkListeners:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mJobController:Lcom/xiaomi/push/service/JobScheduler;

    invoke-virtual {v0}, Lcom/xiaomi/push/service/JobScheduler;->removeAllJobs()V

    new-instance v0, Lcom/xiaomi/push/service/XMPushService$10;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lcom/xiaomi/push/service/XMPushService$10;-><init>(Lcom/xiaomi/push/service/XMPushService;I)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    new-instance v0, Lcom/xiaomi/push/service/XMPushService$KillJob;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/XMPushService$KillJob;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/service/PushClientsManager;->removeAllClientChangeListeners()V

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v0

    const/16 v1, 0xf

    invoke-virtual {v0, p0, v1}, Lcom/xiaomi/push/service/PushClientsManager;->resetAllClients(Landroid/content/Context;I)V

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/service/PushClientsManager;->removeActiveClients()V

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mSlimConnection:Lcom/xiaomi/slim/SlimConnection;

    invoke-virtual {v0, p0}, Lcom/xiaomi/slim/SlimConnection;->removeConnectionListener(Lcom/xiaomi/smack/ConnectionListener;)V

    invoke-static {}, Lcom/xiaomi/push/service/ServiceConfig;->getInstance()Lcom/xiaomi/push/service/ServiceConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/service/ServiceConfig;->clear()V

    invoke-static {}, Lcom/xiaomi/push/service/timers/Alarm;->stop()V

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->clearPingCallbacks()V

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    const-string v0, "Service destroyed"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    return-void
.end method

.method onPong()V
    .locals 2

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/xiaomi/push/service/XMPushService;->pingCallBacks:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/push/service/XMPushService$PingCallBack;

    invoke-interface {v1}, Lcom/xiaomi/push/service/XMPushService$PingCallBack;->pingFollowUpAction()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 3

    if-nez p1, :cond_0

    const-string p2, "onStart() with intent NULL"

    invoke-static {p2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p2, "onStart() with intent.Action = %s, chid = %s"

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/xiaomi/push/service/PushConstants;->EXTRA_CHANNEL_ID:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    :goto_0
    if-eqz p1, :cond_5

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_5

    const-string p2, "com.xiaomi.push.timer"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_3

    const-string p2, "com.xiaomi.push.check_alive"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_1

    :cond_1
    const-string p2, "com.xiaomi.push.network_status_changed"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_2

    goto :goto_2

    :cond_2
    new-instance p2, Lcom/xiaomi/push/service/XMPushService$IntentJob;

    invoke-direct {p2, p0, p1}, Lcom/xiaomi/push/service/XMPushService$IntentJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Landroid/content/Intent;)V

    invoke-virtual {p0, p2}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    goto :goto_2

    :cond_3
    :goto_1
    iget-object p2, p0, Lcom/xiaomi/push/service/XMPushService;->mJobController:Lcom/xiaomi/push/service/JobScheduler;

    invoke-virtual {p2}, Lcom/xiaomi/push/service/JobScheduler;->isBlocked()Z

    move-result p2

    if-eqz p2, :cond_4

    const-string p1, "ERROR, the job controller is blocked."

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object p1

    const/16 p2, 0xe

    invoke-virtual {p1, p0, p2}, Lcom/xiaomi/push/service/PushClientsManager;->resetAllClients(Landroid/content/Context;I)V

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->stopSelf()V

    goto :goto_2

    :cond_4
    new-instance p2, Lcom/xiaomi/push/service/XMPushService$IntentJob;

    invoke-direct {p2, p0, p1}, Lcom/xiaomi/push/service/XMPushService$IntentJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Landroid/content/Intent;)V

    invoke-virtual {p0, p2}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    :cond_5
    :goto_2
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    invoke-virtual {p0, p1, p3}, Lcom/xiaomi/push/service/XMPushService;->onStart(Landroid/content/Intent;I)V

    sget p1, Lcom/xiaomi/push/service/XMPushService;->START_STICKY:I

    return p1
.end method

.method public reconnectionFailed(Lcom/xiaomi/smack/Connection;Ljava/lang/Exception;)V
    .locals 1

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getContext()Lcom/xiaomi/stats/StatsContext;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/xiaomi/stats/StatsContext;->reconnectionFailed(Lcom/xiaomi/smack/Connection;Ljava/lang/Exception;)V

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->broadcastNetworkAvailable(Z)V

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->scheduleConnect(Z)V

    return-void
.end method

.method public reconnectionSuccessful(Lcom/xiaomi/smack/Connection;)V
    .locals 2

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getContext()Lcom/xiaomi/stats/StatsContext;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/xiaomi/stats/StatsContext;->reconnectionSuccessful(Lcom/xiaomi/smack/Connection;)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->broadcastNetworkAvailable(Z)V

    iget-object p1, p0, Lcom/xiaomi/push/service/XMPushService;->mReconnManager:Lcom/xiaomi/push/service/ReconnectionManager;

    invoke-virtual {p1}, Lcom/xiaomi/push/service/ReconnectionManager;->onConnectSucceeded()V

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/xiaomi/push/service/PushClientsManager;->getAllClients()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    new-instance v1, Lcom/xiaomi/push/service/XMPushService$BindJob;

    invoke-direct {v1, p0, v0}, Lcom/xiaomi/push/service/XMPushService$BindJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    invoke-virtual {p0, v1}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public registerForMiPushApp([BLjava/lang/String;)V
    .locals 10

    const v0, 0x42c1d83

    if-nez p1, :cond_0

    const-string v1, "null payload"

    invoke-static {p0, p2, p1, v0, v1}, Lcom/xiaomi/push/service/MIPushClientManager;->notifyError(Landroid/content/Context;Ljava/lang/String;[BILjava/lang/String;)V

    const-string p1, "register request without payload"

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_0
    new-instance v1, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    invoke-direct {v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;-><init>()V

    :try_start_0
    invoke-static {v1, p1}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertByteArrayToThriftObject(Lorg/apache/thrift/TBase;[B)V

    iget-object v2, v1, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->action:Lcom/xiaomi/xmpush/thrift/ActionType;

    sget-object v3, Lcom/xiaomi/xmpush/thrift/ActionType;->Registration:Lcom/xiaomi/xmpush/thrift/ActionType;

    if-ne v2, v3, :cond_1

    new-instance v2, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistration;

    invoke-direct {v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistration;-><init>()V
    :try_end_0
    .catch Lorg/apache/thrift/TException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-virtual {v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getPushAction()[B

    move-result-object v3

    invoke-static {v2, v3}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertByteArrayToThriftObject(Lorg/apache/thrift/TBase;[B)V

    invoke-virtual {v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p1}, Lcom/xiaomi/push/service/MIPushClientManager;->registerApp(Ljava/lang/String;[B)V

    new-instance v3, Lcom/xiaomi/push/service/MIPushAppRegisterJob;

    invoke-virtual {v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistration;->getAppId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistration;->getToken()Ljava/lang/String;

    move-result-object v8

    move-object v4, v3

    move-object v5, p0

    move-object v9, p1

    invoke-direct/range {v4 .. v9}, Lcom/xiaomi/push/service/MIPushAppRegisterJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)V

    invoke-virtual {p0, v3}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/clientReport/PushClientReportManager;

    move-result-object v4

    invoke-virtual {v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "E100003"

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionRegistration;->getId()Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x1772

    const-string v9, "send a register message to server"

    invoke-virtual/range {v4 .. v9}, Lcom/xiaomi/push/service/clientReport/PushClientReportManager;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    :try_end_1
    .catch Lorg/apache/thrift/TException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    :try_start_2
    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    const-string v1, " data action error."

    invoke-static {p0, p2, p1, v0, v1}, Lcom/xiaomi/push/service/MIPushClientManager;->notifyError(Landroid/content/Context;Ljava/lang/String;[BILjava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string v1, " registration action required."

    invoke-static {p0, p2, p1, v0, v1}, Lcom/xiaomi/push/service/MIPushClientManager;->notifyError(Landroid/content/Context;Ljava/lang/String;[BILjava/lang/String;)V

    const-string v1, "register request with invalid payload"

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/apache/thrift/TException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    :catch_1
    move-exception v1

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    const-string v1, " data container error."

    invoke-static {p0, p2, p1, v0, v1}, Lcom/xiaomi/push/service/MIPushClientManager;->notifyError(Landroid/content/Context;Ljava/lang/String;[BILjava/lang/String;)V

    :goto_0
    return-void
.end method

.method public removeJobs(I)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mJobController:Lcom/xiaomi/push/service/JobScheduler;

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/service/JobScheduler;->removeJobs(I)V

    return-void
.end method

.method public removeJobs(Lcom/xiaomi/push/service/XMPushService$Job;)V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mJobController:Lcom/xiaomi/push/service/JobScheduler;

    iget v1, p1, Lcom/xiaomi/push/service/XMPushService$Job;->type:I

    invoke-virtual {v0, v1, p1}, Lcom/xiaomi/push/service/JobScheduler;->removeJobs(ILcom/xiaomi/push/service/JobScheduler$Job;)V

    return-void
.end method

.method public scheduleConnect(Z)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mReconnManager:Lcom/xiaomi/push/service/ReconnectionManager;

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/service/ReconnectionManager;->tryReconnect(Z)V

    return-void
.end method

.method public scheduleRebindChannel(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V
    .locals 5

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->getNextRetryInterval()J

    move-result-wide v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "schedule rebind job in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-wide/16 v3, 0x3e8

    div-long v3, v0, v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    new-instance v2, Lcom/xiaomi/push/service/XMPushService$BindJob;

    invoke-direct {v2, p0, p1}, Lcom/xiaomi/push/service/XMPushService$BindJob;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    invoke-virtual {p0, v2, v0, v1}, Lcom/xiaomi/push/service/XMPushService;->executeJobDelayed(Lcom/xiaomi/push/service/XMPushService$Job;J)V

    :cond_0
    return-void
.end method

.method sendMessage(Ljava/lang/String;[BZ)V
    .locals 2

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v0

    const-string v1, "5"

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/PushClientsManager;->getAllClientLoginInfoByChid(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz p3, :cond_2

    invoke-static {p1, p2}, Lcom/xiaomi/push/service/MIPushClientManager;->addPendingMessages(Ljava/lang/String;[B)V

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;

    iget-object v0, v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    sget-object v1, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->binded:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    if-eq v0, v1, :cond_1

    if-eqz p3, :cond_2

    invoke-static {p1, p2}, Lcom/xiaomi/push/service/MIPushClientManager;->addPendingMessages(Ljava/lang/String;[B)V

    goto :goto_0

    :cond_1
    new-instance p3, Lcom/xiaomi/push/service/XMPushService$9;

    const/4 v0, 0x4

    invoke-direct {p3, p0, v0, p1, p2}, Lcom/xiaomi/push/service/XMPushService$9;-><init>(Lcom/xiaomi/push/service/XMPushService;ILjava/lang/String;[B)V

    invoke-virtual {p0, p3}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public sendPacket(Lcom/xiaomi/slim/Blob;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/XMPushService;->mCurrentConnection:Lcom/xiaomi/smack/Connection;

    invoke-virtual {v0, p1}, Lcom/xiaomi/smack/Connection;->send(Lcom/xiaomi/slim/Blob;)V

    return-void

    :cond_0
    new-instance p1, Lcom/xiaomi/smack/XMPPException;

    const-string v0, "try send msg while connection is null."

    invoke-direct {p1, v0}, Lcom/xiaomi/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method sendPongIfNeed()V
    .locals 5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/xiaomi/push/service/XMPushService;->lastAlive:J

    sub-long/2addr v0, v2

    invoke-static {}, Lcom/xiaomi/smack/SmackConfiguration;->getCheckAliveInterval()I

    move-result v2

    int-to-long v2, v2

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/network/Network;->isConnected(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->checkAlive(Z)V

    :cond_1
    return-void
.end method

.method public shouldReconnect()Z
    .locals 1

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/network/Network;->hasNetwork(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/xiaomi/push/service/PushClientsManager;->getInstance()Lcom/xiaomi/push/service/PushClientsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/service/PushClientsManager;->getActiveClientCount()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->isPushDisabled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->isPushEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/xiaomi/push/service/XMPushService;->isExtremePowerSaveMode()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
