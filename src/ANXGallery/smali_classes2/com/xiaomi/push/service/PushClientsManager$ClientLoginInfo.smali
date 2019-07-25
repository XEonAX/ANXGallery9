.class public Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;
.super Ljava/lang/Object;
.source "PushClientsManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/PushClientsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ClientLoginInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$ClientStatusListener;,
        Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$NotifyClientJob;,
        Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$PeerWatcher;
    }
.end annotation


# instance fields
.field public authMethod:Ljava/lang/String;

.field public chid:Ljava/lang/String;

.field public clientExtra:Ljava/lang/String;

.field public cloudExtra:Ljava/lang/String;

.field public context:Landroid/content/Context;

.field private currentRetrys:I

.field private hasPeerSupport:Z

.field public kick:Z

.field public mClientEventDispatcher:Lcom/xiaomi/push/service/ClientEventDispatcher;

.field private mPushService:Lcom/xiaomi/push/service/XMPushService;

.field notifiedStatus:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

.field final notifyClientJob:Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$NotifyClientJob;

.field peer:Landroid/os/Messenger;

.field peerWatcher:Landroid/os/IBinder$DeathRecipient;

.field public pkgName:Ljava/lang/String;

.field public security:Ljava/lang/String;

.field public session:Ljava/lang/String;

.field status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

.field private statusChangeListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$ClientStatusListener;",
            ">;"
        }
    .end annotation
.end field

.field private timeOutJob:Lcom/xiaomi/push/service/XMPushService$BindTimeoutJob;

.field public token:Ljava/lang/String;

.field public userId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->unbind:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    iput-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->currentRetrys:I

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->statusChangeListeners:Ljava/util/List;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->notifiedStatus:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    iput-boolean v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->hasPeerSupport:Z

    new-instance v0, Lcom/xiaomi/push/service/XMPushService$BindTimeoutJob;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/XMPushService$BindTimeoutJob;-><init>(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->timeOutJob:Lcom/xiaomi/push/service/XMPushService$BindTimeoutJob;

    iput-object v1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->peerWatcher:Landroid/os/IBinder$DeathRecipient;

    new-instance v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$NotifyClientJob;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$NotifyClientJob;-><init>(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->notifyClientJob:Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$NotifyClientJob;

    return-void
.end method

.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->unbind:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    iput-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->currentRetrys:I

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->statusChangeListeners:Ljava/util/List;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->notifiedStatus:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    iput-boolean v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->hasPeerSupport:Z

    new-instance v0, Lcom/xiaomi/push/service/XMPushService$BindTimeoutJob;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/XMPushService$BindTimeoutJob;-><init>(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->timeOutJob:Lcom/xiaomi/push/service/XMPushService$BindTimeoutJob;

    iput-object v1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->peerWatcher:Landroid/os/IBinder$DeathRecipient;

    new-instance v0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$NotifyClientJob;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$NotifyClientJob;-><init>(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->notifyClientJob:Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$NotifyClientJob;

    iput-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->mPushService:Lcom/xiaomi/push/service/XMPushService;

    new-instance p1, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$1;

    invoke-direct {p1, p0}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$1;-><init>(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->addClientStatusListener(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$ClientStatusListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)Lcom/xiaomi/push/service/XMPushService$BindTimeoutJob;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->timeOutJob:Lcom/xiaomi/push/service/XMPushService$BindTimeoutJob;

    return-object p0
.end method

.method static synthetic access$100(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)Lcom/xiaomi/push/service/XMPushService;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->mPushService:Lcom/xiaomi/push/service/XMPushService;

    return-object p0
.end method

.method static synthetic access$200(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;IILjava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->shouldNotifyClient(IILjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;IILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->notifyClientStatus(IILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static getResource(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const-string v0, ""

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    const-string v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method private isSpeicalErr(IILjava/lang/String;)Z
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    return v1

    :pswitch_0
    const-string p1, "wait"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    xor-int/2addr p1, v0

    return p1

    :pswitch_1
    iget-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->mPushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-virtual {p1}, Lcom/xiaomi/push/service/XMPushService;->isConnected()Z

    move-result p1

    return p1

    :pswitch_2
    iget-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    sget-object v2, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->binded:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    if-ne p1, v2, :cond_0

    return v1

    :cond_0
    iget-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->mPushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-virtual {p1}, Lcom/xiaomi/push/service/XMPushService;->isConnected()Z

    move-result p1

    if-nez p1, :cond_1

    return v1

    :cond_1
    const/16 p1, 0x15

    if-eq p2, p1, :cond_3

    const/4 p1, 0x7

    if-ne p2, p1, :cond_2

    const-string p1, "wait"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    return v0

    :cond_3
    :goto_0
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private notifyClientStatus(IILjava/lang/String;Ljava/lang/String;)V
    .locals 9

    iget-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    iput-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->notifiedStatus:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->mClientEventDispatcher:Lcom/xiaomi/push/service/ClientEventDispatcher;

    iget-object p3, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->context:Landroid/content/Context;

    invoke-virtual {p1, p3, p0, p2}, Lcom/xiaomi/push/service/ClientEventDispatcher;->notifyChannelClosed(Landroid/content/Context;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;I)V

    goto :goto_2

    :cond_0
    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->mClientEventDispatcher:Lcom/xiaomi/push/service/ClientEventDispatcher;

    iget-object p2, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->context:Landroid/content/Context;

    invoke-virtual {p1, p2, p0, p4, p3}, Lcom/xiaomi/push/service/ClientEventDispatcher;->notifyKickedByServer(Landroid/content/Context;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_5

    iget-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    sget-object v1, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->binded:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    const/4 v2, 0x0

    if-ne p1, v1, :cond_2

    const/4 v6, 0x1

    goto :goto_0

    :cond_2
    const/4 v6, 0x0

    :goto_0
    if-nez v6, :cond_3

    const-string p1, "wait"

    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->currentRetrys:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->currentRetrys:I

    goto :goto_1

    :cond_3
    if-eqz v6, :cond_4

    iput v2, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->currentRetrys:I

    iget-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->peer:Landroid/os/Messenger;

    if-eqz p1, :cond_4

    const/4 p1, 0x0

    const/16 p4, 0x10

    iget-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->mPushService:Lcom/xiaomi/push/service/XMPushService;

    iget-object v0, v0, Lcom/xiaomi/push/service/XMPushService;->messenger:Landroid/os/Messenger;

    invoke-static {p1, p4, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    :try_start_0
    iget-object p4, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->peer:Landroid/os/Messenger;

    invoke-virtual {p4, p1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_4
    :goto_1
    iget-object v3, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->mClientEventDispatcher:Lcom/xiaomi/push/service/ClientEventDispatcher;

    iget-object v4, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->mPushService:Lcom/xiaomi/push/service/XMPushService;

    move-object v5, p0

    move v7, p2

    move-object v8, p3

    invoke-virtual/range {v3 .. v8}, Lcom/xiaomi/push/service/ClientEventDispatcher;->notifyChannelOpenResult(Landroid/content/Context;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;ZILjava/lang/String;)V

    :cond_5
    :goto_2
    return-void
.end method

.method private shouldNotifyClient(IILjava/lang/String;)Z
    .locals 1

    iget-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->notifiedStatus:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    const/4 p2, 0x1

    if-eqz p1, :cond_3

    iget-boolean p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->hasPeerSupport:Z

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->notifiedStatus:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    iget-object p3, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    const/4 v0, 0x0

    if-ne p1, p3, :cond_1

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, " status recovered, don\'t notify client:"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->chid:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->i(Ljava/lang/String;)V

    return v0

    :cond_1
    iget-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->peer:Landroid/os/Messenger;

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->hasPeerSupport:Z

    if-eqz p1, :cond_2

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Peer alive notify status to client:"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->chid:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->i(Ljava/lang/String;)V

    return p2

    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "peer died, ignore notify "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->chid:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->i(Ljava/lang/String;)V

    return v0

    :cond_3
    :goto_0
    return p2
.end method


# virtual methods
.method public addClientStatusListener(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$ClientStatusListener;)V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->statusChangeListeners:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->statusChangeListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getDesc(I)Ljava/lang/String;
    .locals 0

    packed-switch p1, :pswitch_data_0

    const-string p1, "unknown"

    return-object p1

    :pswitch_0
    const-string p1, "KICK"

    return-object p1

    :pswitch_1
    const-string p1, "CLOSE"

    return-object p1

    :pswitch_2
    const-string p1, "OPEN"

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getNextRetryInterval()J
    .locals 4

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    const-wide/high16 v2, 0x4034000000000000L    # 20.0

    mul-double v0, v0, v2

    const-wide/high16 v2, 0x4024000000000000L    # 10.0

    sub-double/2addr v0, v2

    double-to-long v0, v0

    iget v2, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->currentRetrys:I

    add-int/lit8 v2, v2, 0x1

    mul-int/lit8 v2, v2, 0xf

    int-to-long v2, v2

    add-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    mul-long v0, v0, v2

    return-wide v0
.end method

.method public removeClientStatusListener(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$ClientStatusListener;)V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->statusChangeListeners:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->statusChangeListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setStatus(Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;IILjava/lang/String;Ljava/lang/String;)V
    .locals 5

    iget-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->statusChangeListeners:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->statusChangeListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$ClientStatusListener;

    iget-object v3, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    invoke-interface {v2, v3, p1, p3}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$ClientStatusListener;->onChange(Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;I)V

    goto :goto_0

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    const/4 v1, 0x0

    if-eq v0, p1, :cond_1

    const-string v0, "update the client %7$s status. %1$s->%2$s %3$s %4$s %5$s %6$s"

    const/4 v2, 0x7

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    aput-object v3, v2, v1

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    invoke-virtual {p0, p2}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->getDesc(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    invoke-static {p3}, Lcom/xiaomi/push/service/PushConstants;->getErrorDesc(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    aput-object p4, v2, v3

    const/4 v3, 0x5

    aput-object p5, v2, v3

    const/4 v3, 0x6

    iget-object v4, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->chid:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->status:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    :cond_1
    iget-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->mClientEventDispatcher:Lcom/xiaomi/push/service/ClientEventDispatcher;

    if-nez v0, :cond_2

    const-string p1, "status changed while the client dispatcher is missing"

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    return-void

    :cond_2
    sget-object v0, Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;->binding:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    if-ne p1, v0, :cond_3

    return-void

    :cond_3
    const/16 p1, 0x2774

    iget-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->notifiedStatus:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->hasPeerSupport:Z

    if-nez v0, :cond_4

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->peer:Landroid/os/Messenger;

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->hasPeerSupport:Z

    if-eqz v0, :cond_5

    const/16 v1, 0x3e8

    goto :goto_1

    :cond_5
    const/16 v1, 0x2774

    :cond_6
    :goto_1
    iget-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->mPushService:Lcom/xiaomi/push/service/XMPushService;

    iget-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->notifyClientJob:Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$NotifyClientJob;

    invoke-virtual {p1, v0}, Lcom/xiaomi/push/service/XMPushService;->removeJobs(Lcom/xiaomi/push/service/XMPushService$Job;)V

    invoke-direct {p0, p2, p3, p5}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->isSpeicalErr(IILjava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_7

    invoke-direct {p0, p2, p3, p4, p5}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->notifyClientStatus(IILjava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_7
    iget-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->mPushService:Lcom/xiaomi/push/service/XMPushService;

    iget-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->notifyClientJob:Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$NotifyClientJob;

    invoke-virtual {v0, p2, p3, p4, p5}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$NotifyClientJob;->build(IILjava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/XMPushService$Job;

    move-result-object p2

    int-to-long p3, v1

    invoke-virtual {p1, p2, p3, p4}, Lcom/xiaomi/push/service/XMPushService;->executeJobDelayed(Lcom/xiaomi/push/service/XMPushService$Job;J)V

    :goto_2
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method unwatch()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->peer:Landroid/os/Messenger;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->peerWatcher:Landroid/os/IBinder$DeathRecipient;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->peerWatcher:Landroid/os/IBinder$DeathRecipient;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->notifiedStatus:Lcom/xiaomi/push/service/PushClientsManager$ClientStatus;

    return-void
.end method

.method watch(Landroid/os/Messenger;)V
    .locals 3

    invoke-virtual {p0}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->unwatch()V

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    :try_start_0
    iput-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->peer:Landroid/os/Messenger;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->hasPeerSupport:Z

    new-instance v1, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$PeerWatcher;

    invoke-direct {v1, p0, p0, p1}, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo$PeerWatcher;-><init>(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;Landroid/os/Messenger;)V

    iput-object v1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->peerWatcher:Landroid/os/IBinder$DeathRecipient;

    invoke-virtual {p1}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object p1

    iget-object v1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->peerWatcher:Landroid/os/IBinder$DeathRecipient;

    invoke-interface {p1, v1, v0}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "peer linked with old sdk chid = "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->chid:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->i(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "peer linkToDeath err: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->i(Ljava/lang/String;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->peer:Landroid/os/Messenger;

    iput-boolean v0, p0, Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;->hasPeerSupport:Z

    :goto_1
    return-void
.end method
