.class public abstract Lcom/xiaomi/smack/SocketConnection;
.super Lcom/xiaomi/smack/Connection;
.source "SocketConnection.java"


# instance fields
.field private connectedHost:Ljava/lang/String;

.field connectionID:Ljava/lang/String;

.field private curShortConnCount:I

.field protected failedException:Ljava/lang/Exception;

.field protected volatile lastConnectedTime:J

.field protected volatile lastPingReceived:J

.field protected volatile lastPingSent:J

.field protected pushService:Lcom/xiaomi/push/service/XMPushService;

.field protected socket:Ljava/net/Socket;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/smack/ConnectionConfiguration;)V
    .locals 2

    invoke-direct {p0, p1, p2}, Lcom/xiaomi/smack/Connection;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/smack/ConnectionConfiguration;)V

    const/4 p2, 0x0

    iput-object p2, p0, Lcom/xiaomi/smack/SocketConnection;->failedException:Ljava/lang/Exception;

    iput-object p2, p0, Lcom/xiaomi/smack/SocketConnection;->connectionID:Ljava/lang/String;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/xiaomi/smack/SocketConnection;->lastPingSent:J

    iput-wide v0, p0, Lcom/xiaomi/smack/SocketConnection;->lastPingReceived:J

    iput-wide v0, p0, Lcom/xiaomi/smack/SocketConnection;->lastConnectedTime:J

    iput-object p1, p0, Lcom/xiaomi/smack/SocketConnection;->pushService:Lcom/xiaomi/push/service/XMPushService;

    return-void
.end method

.method private connectDirectly(Ljava/lang/String;I)V
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move/from16 v2, p2

    const/4 v3, 0x0

    iput-object v3, v1, Lcom/xiaomi/smack/SocketConnection;->failedException:Ljava/lang/Exception;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "get bucket for host : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->ps(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual/range {p0 .. p1}, Lcom/xiaomi/smack/SocketConnection;->getFallback(Ljava/lang/String;)Lcom/xiaomi/network/Fallback;

    move-result-object v12

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v4}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->pe(Ljava/lang/Integer;)V

    const/4 v4, 0x1

    if-eqz v12, :cond_0

    invoke-virtual {v12, v4}, Lcom/xiaomi/network/Fallback;->getHosts(Z)Ljava/util/ArrayList;

    move-result-object v3

    :cond_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    const-wide/16 v5, 0x0

    iput-wide v5, v1, Lcom/xiaomi/smack/SocketConnection;->lastConnectedTime:J

    iget-object v0, v1, Lcom/xiaomi/smack/SocketConnection;->pushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/network/Network;->getActiveConnPoint(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v0, 0x0

    const/4 v5, 0x0

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    iget v0, v1, Lcom/xiaomi/smack/SocketConnection;->connTimes:I

    add-int/2addr v0, v4

    iput v0, v1, Lcom/xiaomi/smack/SocketConnection;->connTimes:I

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "begin to connect to "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/xiaomi/smack/SocketConnection;->createSocket()Ljava/net/Socket;

    move-result-object v0

    iput-object v0, v1, Lcom/xiaomi/smack/SocketConnection;->socket:Ljava/net/Socket;

    invoke-static {v11, v2}, Lcom/xiaomi/network/Host;->from(Ljava/lang/String;I)Ljava/net/InetSocketAddress;

    move-result-object v0

    iget-object v6, v1, Lcom/xiaomi/smack/SocketConnection;->socket:Ljava/net/Socket;

    const/16 v7, 0x1f40

    invoke-virtual {v6, v0, v7}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    const-string v0, "tcp connected"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v0, v1, Lcom/xiaomi/smack/SocketConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v0, v4}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    iput-object v11, v1, Lcom/xiaomi/smack/SocketConnection;->connectedHost:Ljava/lang/String;

    invoke-virtual/range {p0 .. p0}, Lcom/xiaomi/smack/SocketConnection;->initConnection()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/4 v0, 0x0

    sub-long/2addr v5, v15

    iput-wide v5, v1, Lcom/xiaomi/smack/SocketConnection;->connectTime:J

    iput-object v13, v1, Lcom/xiaomi/smack/SocketConnection;->connectionPoint:Ljava/lang/String;

    if-eqz v12, :cond_2

    iget-wide v7, v1, Lcom/xiaomi/smack/SocketConnection;->connectTime:J

    const-wide/16 v9, 0x0

    move-object v5, v12

    move-object v6, v11

    invoke-virtual/range {v5 .. v10}, Lcom/xiaomi/network/Fallback;->succeedHost(Ljava/lang/String;JJ)V

    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    iput-wide v5, v1, Lcom/xiaomi/smack/SocketConnection;->lastConnectedTime:J

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "connected to "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " in "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v5, v1, Lcom/xiaomi/smack/SocketConnection;->connectTime:J

    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/16 v17, 0x1

    goto/16 :goto_4

    :catchall_0
    move-exception v0

    goto/16 :goto_3

    :catch_0
    move-exception v0

    const/16 v17, 0x1

    goto :goto_1

    :catch_1
    move-exception v0

    const/16 v17, 0x1

    goto/16 :goto_2

    :catchall_1
    move-exception v0

    move v4, v5

    goto/16 :goto_3

    :catch_2
    move-exception v0

    move/from16 v17, v5

    :goto_1
    :try_start_2
    new-instance v5, Ljava/lang/Exception;

    const-string v6, "abnormal exception"

    invoke-direct {v5, v6, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iput-object v5, v1, Lcom/xiaomi/smack/SocketConnection;->failedException:Ljava/lang/Exception;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-nez v17, :cond_5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SMACK: Could not connect to:"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    const-string v0, "SMACK: Could not connect to "

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " port:"

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " err:"

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v1, Lcom/xiaomi/smack/SocketConnection;->failedException:Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v1, Lcom/xiaomi/smack/SocketConnection;->failedException:Ljava/lang/Exception;

    invoke-static {v11, v0}, Lcom/xiaomi/stats/StatsHelper;->connectFail(Ljava/lang/String;Ljava/lang/Exception;)V

    if-eqz v12, :cond_3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long v7, v5, v15

    const-wide/16 v9, 0x0

    iget-object v0, v1, Lcom/xiaomi/smack/SocketConnection;->failedException:Ljava/lang/Exception;

    move-object v5, v12

    move-object v6, v11

    move-object v11, v0

    invoke-virtual/range {v5 .. v11}, Lcom/xiaomi/network/Fallback;->failedHost(Ljava/lang/String;JJLjava/lang/Exception;)V

    :cond_3
    iget-object v0, v1, Lcom/xiaomi/smack/SocketConnection;->pushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/network/Network;->getActiveConnPoint(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v13, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    goto/16 :goto_4

    :catch_3
    move-exception v0

    move/from16 v17, v5

    :goto_2
    :try_start_3
    iput-object v0, v1, Lcom/xiaomi/smack/SocketConnection;->failedException:Ljava/lang/Exception;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-nez v17, :cond_5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SMACK: Could not connect to:"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    const-string v0, "SMACK: Could not connect to "

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " port:"

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " err:"

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v1, Lcom/xiaomi/smack/SocketConnection;->failedException:Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v1, Lcom/xiaomi/smack/SocketConnection;->failedException:Ljava/lang/Exception;

    invoke-static {v11, v0}, Lcom/xiaomi/stats/StatsHelper;->connectFail(Ljava/lang/String;Ljava/lang/Exception;)V

    if-eqz v12, :cond_4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long v7, v5, v15

    const-wide/16 v9, 0x0

    iget-object v0, v1, Lcom/xiaomi/smack/SocketConnection;->failedException:Ljava/lang/Exception;

    move-object v5, v12

    move-object v6, v11

    move-object v11, v0

    invoke-virtual/range {v5 .. v11}, Lcom/xiaomi/network/Fallback;->failedHost(Ljava/lang/String;JJLjava/lang/Exception;)V

    :cond_4
    iget-object v0, v1, Lcom/xiaomi/smack/SocketConnection;->pushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/network/Network;->getActiveConnPoint(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v13, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    goto/16 :goto_4

    :cond_5
    move/from16 v5, v17

    goto/16 :goto_0

    :catchall_2
    move-exception v0

    move/from16 v4, v17

    :goto_3
    if-nez v4, :cond_7

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SMACK: Could not connect to:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    const-string v3, "SMACK: Could not connect to "

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " port:"

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " err:"

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v1, Lcom/xiaomi/smack/SocketConnection;->failedException:Ljava/lang/Exception;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n"

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v1, Lcom/xiaomi/smack/SocketConnection;->failedException:Ljava/lang/Exception;

    invoke-static {v11, v2}, Lcom/xiaomi/stats/StatsHelper;->connectFail(Ljava/lang/String;Ljava/lang/Exception;)V

    if-eqz v12, :cond_6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v7, v2, v15

    const-wide/16 v9, 0x0

    iget-object v2, v1, Lcom/xiaomi/smack/SocketConnection;->failedException:Ljava/lang/Exception;

    move-object v5, v12

    move-object v6, v11

    move-object v11, v2

    invoke-virtual/range {v5 .. v11}, Lcom/xiaomi/network/Fallback;->failedHost(Ljava/lang/String;JJLjava/lang/Exception;)V

    :cond_6
    iget-object v2, v1, Lcom/xiaomi/smack/SocketConnection;->pushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/network/Network;->getActiveConnPoint(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v13, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    move/from16 v17, v4

    goto :goto_4

    :cond_7
    throw v0

    :cond_8
    move/from16 v17, v5

    :goto_4
    invoke-static {}, Lcom/xiaomi/network/HostManager;->getInstance()Lcom/xiaomi/network/HostManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/network/HostManager;->persist()V

    if-eqz v17, :cond_9

    return-void

    :cond_9
    new-instance v0, Lcom/xiaomi/smack/XMPPException;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/xiaomi/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private connectUsingConfiguration(Lcom/xiaomi/smack/ConnectionConfiguration;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/xiaomi/smack/ConnectionConfiguration;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/xiaomi/smack/ConnectionConfiguration;->getPort()I

    move-result p1

    invoke-direct {p0, v0, p1}, Lcom/xiaomi/smack/SocketConnection;->connectDirectly(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public batchSend([Lcom/xiaomi/slim/Blob;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation

    new-instance p1, Lcom/xiaomi/smack/XMPPException;

    const-string v0, "Don\'t support send Blob"

    invoke-direct {p1, v0}, Lcom/xiaomi/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public declared-synchronized connect()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/xiaomi/smack/SocketConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/xiaomi/smack/SocketConnection;->isConnecting()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v1, v0}, Lcom/xiaomi/smack/SocketConnection;->setConnectionStatus(IILjava/lang/Exception;)V

    iget-object v0, p0, Lcom/xiaomi/smack/SocketConnection;->config:Lcom/xiaomi/smack/ConnectionConfiguration;

    invoke-direct {p0, v0}, Lcom/xiaomi/smack/SocketConnection;->connectUsingConfiguration(Lcom/xiaomi/smack/ConnectionConfiguration;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :goto_0
    :try_start_1
    const-string v0, "WARNING: current xmpp has connected"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_2
    new-instance v1, Lcom/xiaomi/smack/XMPPException;

    invoke-direct {v1, v0}, Lcom/xiaomi/smack/XMPPException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_1
    monitor-exit p0

    throw v0
.end method

.method public createSocket()Ljava/net/Socket;
    .locals 1

    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    return-object v0
.end method

.method public disconnect(ILjava/lang/Exception;)V
    .locals 4

    invoke-virtual {p0, p1, p2}, Lcom/xiaomi/smack/SocketConnection;->shutdown(ILjava/lang/Exception;)V

    if-nez p2, :cond_0

    const/16 v0, 0x12

    if-ne p1, v0, :cond_1

    :cond_0
    iget-wide v0, p0, Lcom/xiaomi/smack/SocketConnection;->lastConnectedTime:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_1

    invoke-virtual {p0, p2}, Lcom/xiaomi/smack/SocketConnection;->sinkdownHost(Ljava/lang/Exception;)V

    :cond_1
    return-void
.end method

.method public getChallenge()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/smack/SocketConnection;->challenge:Ljava/lang/String;

    return-object v0
.end method

.method getFallback(Ljava/lang/String;)Lcom/xiaomi/network/Fallback;
    .locals 2

    invoke-static {}, Lcom/xiaomi/network/HostManager;->getInstance()Lcom/xiaomi/network/HostManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/xiaomi/network/HostManager;->getFallbacksByHost(Ljava/lang/String;Z)Lcom/xiaomi/network/Fallback;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/network/Fallback;->isEffective()Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Lcom/xiaomi/smack/SocketConnection$3;

    invoke-direct {v1, p0, p1}, Lcom/xiaomi/smack/SocketConnection$3;-><init>(Lcom/xiaomi/smack/SocketConnection;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/xiaomi/smack/util/TaskExecutor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/smack/SocketConnection;->connectedHost:Ljava/lang/String;

    return-object v0
.end method

.method protected declared-synchronized initConnection()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;,
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    monitor-exit p0

    return-void
.end method

.method public notifyConnectionError(ILjava/lang/Exception;)V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/smack/SocketConnection;->pushService:Lcom/xiaomi/push/service/XMPushService;

    new-instance v1, Lcom/xiaomi/smack/SocketConnection$2;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2, p1, p2}, Lcom/xiaomi/smack/SocketConnection$2;-><init>(Lcom/xiaomi/smack/SocketConnection;IILjava/lang/Exception;)V

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/XMPushService;->executeJob(Lcom/xiaomi/push/service/XMPushService$Job;)V

    return-void
.end method

.method public ping(Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0, p1}, Lcom/xiaomi/smack/SocketConnection;->sendPing(Z)V

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/smack/SocketConnection;->pushService:Lcom/xiaomi/push/service/XMPushService;

    new-instance v2, Lcom/xiaomi/smack/SocketConnection$1;

    const/16 v3, 0xd

    invoke-direct {v2, p0, v3, v0, v1}, Lcom/xiaomi/smack/SocketConnection$1;-><init>(Lcom/xiaomi/smack/SocketConnection;IJ)V

    const-wide/16 v0, 0x2710

    invoke-virtual {p1, v2, v0, v1}, Lcom/xiaomi/push/service/XMPushService;->executeJobDelayed(Lcom/xiaomi/push/service/XMPushService$Job;J)V

    :cond_0
    return-void
.end method

.method protected abstract sendPing(Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation
.end method

.method protected declared-synchronized shutdown(ILjava/lang/Exception;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/xiaomi/smack/SocketConnection;->getConnectionStatus()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-virtual {p0, v1, p1, p2}, Lcom/xiaomi/smack/SocketConnection;->setConnectionStatus(IILjava/lang/Exception;)V

    const-string p1, ""

    iput-object p1, p0, Lcom/xiaomi/smack/SocketConnection;->challenge:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iget-object p1, p0, Lcom/xiaomi/smack/SocketConnection;->socket:Ljava/net/Socket;

    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catch_0
    const-wide/16 p1, 0x0

    :try_start_3
    iput-wide p1, p0, Lcom/xiaomi/smack/SocketConnection;->lastPingSent:J

    iput-wide p1, p0, Lcom/xiaomi/smack/SocketConnection;->lastPingReceived:J
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected sinkdownHost(Ljava/lang/Exception;)V
    .locals 5

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/xiaomi/smack/SocketConnection;->lastConnectedTime:J

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x493e0

    cmp-long v4, v0, v2

    const/4 v0, 0x0

    if-gez v4, :cond_0

    iget-object v1, p0, Lcom/xiaomi/smack/SocketConnection;->pushService:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/network/Network;->hasNetwork(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/xiaomi/smack/SocketConnection;->curShortConnCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/xiaomi/smack/SocketConnection;->curShortConnCount:I

    iget v1, p0, Lcom/xiaomi/smack/SocketConnection;->curShortConnCount:I

    const/4 v2, 0x2

    if-lt v1, v2, :cond_1

    invoke-virtual {p0}, Lcom/xiaomi/smack/SocketConnection;->getHost()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "max short conn time reached, sink down current host:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v1, v2, v3, p1}, Lcom/xiaomi/smack/SocketConnection;->sinkdownHost(Ljava/lang/String;JLjava/lang/Exception;)V

    iput v0, p0, Lcom/xiaomi/smack/SocketConnection;->curShortConnCount:I

    goto :goto_0

    :cond_0
    iput v0, p0, Lcom/xiaomi/smack/SocketConnection;->curShortConnCount:I

    :cond_1
    :goto_0
    return-void
.end method

.method protected sinkdownHost(Ljava/lang/String;JLjava/lang/Exception;)V
    .locals 10

    invoke-static {}, Lcom/xiaomi/smack/ConnectionConfiguration;->getXmppServerHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/xiaomi/network/HostManager;->getInstance()Lcom/xiaomi/network/HostManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/xiaomi/network/HostManager;->getFallbacksByHost(Ljava/lang/String;Z)Lcom/xiaomi/network/Fallback;

    move-result-object v3

    if-eqz v3, :cond_0

    const-wide/16 v7, 0x0

    move-object v4, p1

    move-wide v5, p2

    move-object v9, p4

    invoke-virtual/range {v3 .. v9}, Lcom/xiaomi/network/Fallback;->failedHost(Ljava/lang/String;JJLjava/lang/Exception;)V

    invoke-static {}, Lcom/xiaomi/network/HostManager;->getInstance()Lcom/xiaomi/network/HostManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/xiaomi/network/HostManager;->persist()V

    :cond_0
    return-void
.end method

.method public updateLastReceived()V
    .locals 2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/smack/SocketConnection;->lastPingReceived:J

    return-void
.end method

.method public updateLastSent()V
    .locals 2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/smack/SocketConnection;->lastPingSent:J

    return-void
.end method
