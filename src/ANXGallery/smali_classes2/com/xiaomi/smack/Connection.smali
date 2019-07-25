.class public abstract Lcom/xiaomi/smack/Connection;
.super Ljava/lang/Object;
.source "Connection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/smack/Connection$ListenerWrapper;
    }
.end annotation


# static fields
.field public static DEBUG_ENABLED:Z

.field private static final connectionCounter:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field protected challenge:Ljava/lang/String;

.field protected config:Lcom/xiaomi/smack/ConnectionConfiguration;

.field protected connTimes:I

.field private connectStatus:I

.field protected connectTime:J

.field protected final connectionCounterValue:I

.field private final connectionListeners:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lcom/xiaomi/smack/ConnectionListener;",
            ">;"
        }
    .end annotation
.end field

.field protected connectionPoint:Ljava/lang/String;

.field protected debugger:Lcom/xiaomi/smack/debugger/SmackDebugger;

.field protected volatile lastPingReceived:J

.field protected volatile lastPingSent:J

.field private mCachedStatus:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation
.end field

.field protected mPushService:Lcom/xiaomi/push/service/XMPushService;

.field private readAlive:J

.field protected final recvListeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/xiaomi/smack/PacketListener;",
            "Lcom/xiaomi/smack/Connection$ListenerWrapper;",
            ">;"
        }
    .end annotation
.end field

.field protected final sendListeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/xiaomi/smack/PacketListener;",
            "Lcom/xiaomi/smack/Connection$ListenerWrapper;",
            ">;"
        }
    .end annotation
.end field

.field protected writeAlive:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/xiaomi/smack/Connection;->connectionCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    sput-boolean v1, Lcom/xiaomi/smack/Connection;->DEBUG_ENABLED:Z

    :try_start_0
    const-string v0, "smack.debugEnabled"

    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/xiaomi/smack/Connection;->DEBUG_ENABLED:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    invoke-static {}, Lcom/xiaomi/smack/SmackConfiguration;->getVersion()Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/smack/ConnectionConfiguration;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/smack/Connection;->connTimes:I

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/xiaomi/smack/Connection;->connectTime:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/xiaomi/smack/Connection;->lastPingSent:J

    iput-wide v0, p0, Lcom/xiaomi/smack/Connection;->lastPingReceived:J

    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/xiaomi/smack/Connection;->mCachedStatus:Ljava/util/LinkedList;

    new-instance v2, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v2, p0, Lcom/xiaomi/smack/Connection;->connectionListeners:Ljava/util/Collection;

    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v2, p0, Lcom/xiaomi/smack/Connection;->recvListeners:Ljava/util/Map;

    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v2, p0, Lcom/xiaomi/smack/Connection;->sendListeners:Ljava/util/Map;

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/xiaomi/smack/Connection;->debugger:Lcom/xiaomi/smack/debugger/SmackDebugger;

    const-string v2, ""

    iput-object v2, p0, Lcom/xiaomi/smack/Connection;->challenge:Ljava/lang/String;

    const-string v2, ""

    iput-object v2, p0, Lcom/xiaomi/smack/Connection;->connectionPoint:Ljava/lang/String;

    const/4 v2, 0x2

    iput v2, p0, Lcom/xiaomi/smack/Connection;->connectStatus:I

    sget-object v2, Lcom/xiaomi/smack/Connection;->connectionCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v2

    iput v2, p0, Lcom/xiaomi/smack/Connection;->connectionCounterValue:I

    iput-wide v0, p0, Lcom/xiaomi/smack/Connection;->readAlive:J

    iput-wide v0, p0, Lcom/xiaomi/smack/Connection;->writeAlive:J

    iput-object p2, p0, Lcom/xiaomi/smack/Connection;->config:Lcom/xiaomi/smack/ConnectionConfiguration;

    iput-object p1, p0, Lcom/xiaomi/smack/Connection;->mPushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-virtual {p0}, Lcom/xiaomi/smack/Connection;->initDebugger()V

    return-void
.end method

.method private addStatus(I)V
    .locals 5

    iget-object v0, p0, Lcom/xiaomi/smack/Connection;->mCachedStatus:Ljava/util/LinkedList;

    monitor-enter v0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    :try_start_0
    iget-object p1, p0, Lcom/xiaomi/smack/Connection;->mCachedStatus:Ljava/util/LinkedList;

    invoke-virtual {p1}, Ljava/util/LinkedList;->clear()V

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/xiaomi/smack/Connection;->mCachedStatus:Ljava/util/LinkedList;

    new-instance v2, Landroid/util/Pair;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/xiaomi/smack/Connection;->mCachedStatus:Ljava/util/LinkedList;

    invoke-virtual {p1}, Ljava/util/LinkedList;->size()I

    move-result p1

    const/4 v1, 0x6

    if-le p1, v1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/smack/Connection;->mCachedStatus:Ljava/util/LinkedList;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/util/LinkedList;->remove(I)Ljava/lang/Object;

    :cond_1
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private getDesc(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const-string p1, "connected"

    return-object p1

    :cond_0
    if-nez p1, :cond_1

    const-string p1, "connecting"

    return-object p1

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    const-string p1, "disconnected"

    return-object p1

    :cond_2
    const-string p1, "unknown"

    return-object p1
.end method


# virtual methods
.method public addConnectionListener(Lcom/xiaomi/smack/ConnectionListener;)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/smack/Connection;->connectionListeners:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/smack/Connection;->connectionListeners:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_1
    return-void
.end method

.method public addPacketListener(Lcom/xiaomi/smack/PacketListener;Lcom/xiaomi/smack/filter/PacketFilter;)V
    .locals 1

    if-eqz p1, :cond_0

    new-instance v0, Lcom/xiaomi/smack/Connection$ListenerWrapper;

    invoke-direct {v0, p1, p2}, Lcom/xiaomi/smack/Connection$ListenerWrapper;-><init>(Lcom/xiaomi/smack/PacketListener;Lcom/xiaomi/smack/filter/PacketFilter;)V

    iget-object p2, p0, Lcom/xiaomi/smack/Connection;->recvListeners:Ljava/util/Map;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Packet listener is null."

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addPacketSendingListener(Lcom/xiaomi/smack/PacketListener;Lcom/xiaomi/smack/filter/PacketFilter;)V
    .locals 1

    if-eqz p1, :cond_0

    new-instance v0, Lcom/xiaomi/smack/Connection$ListenerWrapper;

    invoke-direct {v0, p1, p2}, Lcom/xiaomi/smack/Connection$ListenerWrapper;-><init>(Lcom/xiaomi/smack/PacketListener;Lcom/xiaomi/smack/filter/PacketFilter;)V

    iget-object p2, p0, Lcom/xiaomi/smack/Connection;->sendListeners:Ljava/util/Map;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Packet listener is null."

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public abstract batchSend([Lcom/xiaomi/slim/Blob;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation
.end method

.method public abstract bind(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation
.end method

.method public clearCachedStatus()V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/smack/Connection;->mCachedStatus:Ljava/util/LinkedList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/smack/Connection;->mCachedStatus:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public abstract disconnect(ILjava/lang/Exception;)V
.end method

.method public getConfiguration()Lcom/xiaomi/smack/ConnectionConfiguration;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/smack/Connection;->config:Lcom/xiaomi/smack/ConnectionConfiguration;

    return-object v0
.end method

.method public getConnTryTimes()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/smack/Connection;->connTimes:I

    return v0
.end method

.method public getConnectionPoint()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/smack/Connection;->config:Lcom/xiaomi/smack/ConnectionConfiguration;

    invoke-virtual {v0}, Lcom/xiaomi/smack/ConnectionConfiguration;->getConnectionPoint()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getConnectionStatus()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/smack/Connection;->connectStatus:I

    return v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/smack/Connection;->config:Lcom/xiaomi/smack/ConnectionConfiguration;

    invoke-virtual {v0}, Lcom/xiaomi/smack/ConnectionConfiguration;->getHost()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLastPingRecv()J
    .locals 2

    iget-wide v0, p0, Lcom/xiaomi/smack/Connection;->lastPingReceived:J

    return-wide v0
.end method

.method protected initDebugger()V
    .locals 6

    iget-object v0, p0, Lcom/xiaomi/smack/Connection;->config:Lcom/xiaomi/smack/ConnectionConfiguration;

    invoke-virtual {v0}, Lcom/xiaomi/smack/ConnectionConfiguration;->isDebuggerEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/xiaomi/smack/Connection;->debugger:Lcom/xiaomi/smack/debugger/SmackDebugger;

    if-nez v0, :cond_2

    const/4 v0, 0x0

    :try_start_0
    const-string v1, "smack.debuggerClass"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-object v1, v0

    :goto_0
    if-eqz v1, :cond_0

    :try_start_1
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v0, v1

    goto :goto_1

    :catch_1
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_1
    if-nez v0, :cond_1

    new-instance v0, Lcom/xiaomi/measite/smack/AndroidDebugger;

    invoke-direct {v0, p0}, Lcom/xiaomi/measite/smack/AndroidDebugger;-><init>(Lcom/xiaomi/smack/Connection;)V

    iput-object v0, p0, Lcom/xiaomi/smack/Connection;->debugger:Lcom/xiaomi/smack/debugger/SmackDebugger;

    goto :goto_2

    :cond_1
    const/4 v1, 0x3

    :try_start_2
    new-array v1, v1, [Ljava/lang/Class;

    const-class v2, Lcom/xiaomi/smack/Connection;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-class v2, Ljava/io/Writer;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-class v5, Ljava/io/Reader;

    aput-object v5, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    new-array v1, v4, [Ljava/lang/Object;

    aput-object p0, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/smack/debugger/SmackDebugger;

    iput-object v0, p0, Lcom/xiaomi/smack/Connection;->debugger:Lcom/xiaomi/smack/debugger/SmackDebugger;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Can\'t initialize the configured debugger!"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_2
    :goto_2
    return-void
.end method

.method public isBinaryConnection()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isConnected()Z
    .locals 2

    iget v0, p0, Lcom/xiaomi/smack/Connection;->connectStatus:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isConnecting()Z
    .locals 1

    iget v0, p0, Lcom/xiaomi/smack/Connection;->connectStatus:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public declared-synchronized isReadAlive()Z
    .locals 5

    monitor-enter p0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/xiaomi/smack/Connection;->readAlive:J

    const/4 v4, 0x0

    sub-long/2addr v0, v2

    invoke-static {}, Lcom/xiaomi/smack/SmackConfiguration;->getCheckAliveInterval()I

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    int-to-long v2, v2

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isReadAlive(J)Z
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/xiaomi/smack/Connection;->readAlive:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmp-long v2, v0, p1

    if-ltz v2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized isWriteAlive()Z
    .locals 6

    monitor-enter p0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/xiaomi/smack/Connection;->writeAlive:J

    const/4 v4, 0x0

    sub-long/2addr v0, v2

    invoke-static {}, Lcom/xiaomi/smack/SmackConfiguration;->getCheckAliveInterval()I

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v3, 0x1

    shl-int/2addr v2, v3

    int-to-long v4, v2

    cmp-long v2, v0, v4

    if-gez v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    monitor-exit p0

    return v3

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public abstract ping(Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation
.end method

.method public removeConnectionListener(Lcom/xiaomi/smack/ConnectionListener;)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/smack/Connection;->connectionListeners:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public abstract send(Lcom/xiaomi/slim/Blob;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation
.end method

.method public abstract sendPacket(Lcom/xiaomi/smack/packet/Packet;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation
.end method

.method public declared-synchronized setChallenge(Ljava/lang/String;)V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/xiaomi/smack/Connection;->connectStatus:I

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setChallenge hash = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/string/MD5;->MD5_32(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x8

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/xiaomi/smack/Connection;->challenge:Ljava/lang/String;

    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v3, v0}, Lcom/xiaomi/smack/Connection;->setConnectionStatus(IILjava/lang/Exception;)V

    goto :goto_0

    :cond_0
    const-string p1, "ignore setChallenge because connection was disconnected"

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setConnectionStatus(IILjava/lang/Exception;)V
    .locals 6

    iget v0, p0, Lcom/xiaomi/smack/Connection;->connectStatus:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq p1, v0, :cond_0

    const-string v0, "update the connection status. %1$s -> %2$s : %3$s "

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/xiaomi/smack/Connection;->connectStatus:I

    invoke-direct {p0, v5}, Lcom/xiaomi/smack/Connection;->getDesc(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, p1}, Lcom/xiaomi/smack/Connection;->getDesc(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {p2}, Lcom/xiaomi/push/service/PushConstants;->getErrorDesc(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/smack/Connection;->mPushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/network/Network;->hasNetwork(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/xiaomi/smack/Connection;->addStatus(I)V

    :cond_1
    const/16 v0, 0xa

    if-ne p1, v2, :cond_3

    iget-object p2, p0, Lcom/xiaomi/smack/Connection;->mPushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-virtual {p2, v0}, Lcom/xiaomi/push/service/XMPushService;->removeJobs(I)V

    iget p2, p0, Lcom/xiaomi/smack/Connection;->connectStatus:I

    if-eqz p2, :cond_2

    const-string p2, "try set connected while not connecting."

    invoke-static {p2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    :cond_2
    iput p1, p0, Lcom/xiaomi/smack/Connection;->connectStatus:I

    iget-object p1, p0, Lcom/xiaomi/smack/Connection;->connectionListeners:Ljava/util/Collection;

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_9

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/xiaomi/smack/ConnectionListener;

    invoke-interface {p2, p0}, Lcom/xiaomi/smack/ConnectionListener;->reconnectionSuccessful(Lcom/xiaomi/smack/Connection;)V

    goto :goto_0

    :cond_3
    if-nez p1, :cond_5

    iget p2, p0, Lcom/xiaomi/smack/Connection;->connectStatus:I

    if-eq p2, v1, :cond_4

    const-string p2, "try set connecting while not disconnected."

    invoke-static {p2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    :cond_4
    iput p1, p0, Lcom/xiaomi/smack/Connection;->connectStatus:I

    iget-object p1, p0, Lcom/xiaomi/smack/Connection;->connectionListeners:Ljava/util/Collection;

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_9

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/xiaomi/smack/ConnectionListener;

    invoke-interface {p2, p0}, Lcom/xiaomi/smack/ConnectionListener;->connectionStarted(Lcom/xiaomi/smack/Connection;)V

    goto :goto_1

    :cond_5
    if-ne p1, v1, :cond_9

    iget-object v1, p0, Lcom/xiaomi/smack/Connection;->mPushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-virtual {v1, v0}, Lcom/xiaomi/push/service/XMPushService;->removeJobs(I)V

    iget v0, p0, Lcom/xiaomi/smack/Connection;->connectStatus:I

    if-nez v0, :cond_7

    iget-object p2, p0, Lcom/xiaomi/smack/Connection;->connectionListeners:Ljava/util/Collection;

    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/smack/ConnectionListener;

    if-nez p3, :cond_6

    new-instance v1, Ljava/util/concurrent/CancellationException;

    const-string v2, "disconnect while connecting"

    invoke-direct {v1, v2}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :cond_6
    move-object v1, p3

    :goto_3
    invoke-interface {v0, p0, v1}, Lcom/xiaomi/smack/ConnectionListener;->reconnectionFailed(Lcom/xiaomi/smack/Connection;Ljava/lang/Exception;)V

    goto :goto_2

    :cond_7
    iget v0, p0, Lcom/xiaomi/smack/Connection;->connectStatus:I

    if-ne v0, v2, :cond_8

    iget-object v0, p0, Lcom/xiaomi/smack/Connection;->connectionListeners:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/smack/ConnectionListener;

    invoke-interface {v1, p0, p2, p3}, Lcom/xiaomi/smack/ConnectionListener;->connectionClosed(Lcom/xiaomi/smack/Connection;ILjava/lang/Exception;)V

    goto :goto_4

    :cond_8
    iput p1, p0, Lcom/xiaomi/smack/Connection;->connectStatus:I

    :cond_9
    return-void
.end method

.method public declared-synchronized setReadAlive()V
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/smack/Connection;->readAlive:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public abstract unbind(Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation
.end method
