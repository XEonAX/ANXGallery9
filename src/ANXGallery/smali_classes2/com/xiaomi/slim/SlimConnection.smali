.class public Lcom/xiaomi/slim/SlimConnection;
.super Lcom/xiaomi/smack/SocketConnection;
.source "SlimConnection.java"


# instance fields
.field private mKey:[B

.field private mReader:Lcom/xiaomi/slim/BlobReader;

.field private mReaderThread:Ljava/lang/Thread;

.field private mWriter:Lcom/xiaomi/slim/BlobWriter;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/smack/ConnectionConfiguration;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/xiaomi/smack/SocketConnection;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/smack/ConnectionConfiguration;)V

    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/slim/SlimConnection;)Lcom/xiaomi/slim/BlobReader;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/slim/SlimConnection;->mReader:Lcom/xiaomi/slim/BlobReader;

    return-object p0
.end method

.method private getPing(Z)Lcom/xiaomi/slim/Blob;
    .locals 2

    new-instance v0, Lcom/xiaomi/slim/Ping;

    invoke-direct {v0}, Lcom/xiaomi/slim/Ping;-><init>()V

    if-eqz p1, :cond_0

    const-string p1, "1"

    invoke-virtual {v0, p1}, Lcom/xiaomi/slim/Ping;->setPacketID(Ljava/lang/String;)V

    :cond_0
    invoke-static {}, Lcom/xiaomi/stats/StatsHelper;->retriveStatsAsByte()[B

    move-result-object p1

    if-eqz p1, :cond_1

    new-instance v1, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgPing;

    invoke-direct {v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgPing;-><init>()V

    invoke-static {p1}, Lcom/google/protobuf/micro/ByteStringMicro;->copyFrom([B)Lcom/google/protobuf/micro/ByteStringMicro;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgPing;->setStats(Lcom/google/protobuf/micro/ByteStringMicro;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgPing;

    invoke-virtual {v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgPing;->toByteArray()[B

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/xiaomi/slim/Ping;->setPayload([BLjava/lang/String;)V

    :cond_1
    return-object v0
.end method

.method private initReaderAndWriter()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation

    :try_start_0
    new-instance v0, Lcom/xiaomi/slim/BlobReader;

    iget-object v1, p0, Lcom/xiaomi/slim/SlimConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/xiaomi/slim/BlobReader;-><init>(Ljava/io/InputStream;Lcom/xiaomi/slim/SlimConnection;)V

    iput-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->mReader:Lcom/xiaomi/slim/BlobReader;

    new-instance v0, Lcom/xiaomi/slim/BlobWriter;

    iget-object v1, p0, Lcom/xiaomi/slim/SlimConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/xiaomi/slim/BlobWriter;-><init>(Ljava/io/OutputStream;Lcom/xiaomi/slim/SlimConnection;)V

    iput-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->mWriter:Lcom/xiaomi/slim/BlobWriter;

    new-instance v0, Lcom/xiaomi/slim/SlimConnection$1;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Blob Reader ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/xiaomi/slim/SlimConnection;->connectionCounterValue:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/xiaomi/slim/SlimConnection$1;-><init>(Lcom/xiaomi/slim/SlimConnection;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->mReaderThread:Ljava/lang/Thread;

    iget-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->mReaderThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Lcom/xiaomi/smack/XMPPException;

    const-string v2, "Error to init reader and writer"

    invoke-direct {v1, v2, v0}, Lcom/xiaomi/smack/XMPPException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public batchSend([Lcom/xiaomi/slim/Blob;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    invoke-virtual {p0, v2}, Lcom/xiaomi/slim/SlimConnection;->send(Lcom/xiaomi/slim/Blob;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public declared-synchronized bind(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/xiaomi/slim/SlimConnection;->getChallenge()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, p0}, Lcom/xiaomi/slim/Binder;->bind(Lcom/xiaomi/push/service/PushClientsManager$ClientLoginInfo;Ljava/lang/String;Lcom/xiaomi/smack/Connection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized getKey()[B
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->mKey:[B

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->challenge:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/xiaomi/push/service/ServiceConfig;->getDeviceUUID()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/xiaomi/slim/SlimConnection;->challenge:Ljava/lang/String;

    iget-object v3, p0, Lcom/xiaomi/slim/SlimConnection;->challenge:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/slim/SlimConnection;->challenge:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v1, v0}, Lcom/xiaomi/push/service/RC4Cryption;->encrypt([B[B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->mKey:[B

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->mKey:[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized initConnection()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;,
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/xiaomi/slim/SlimConnection;->initReaderAndWriter()V

    iget-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->mWriter:Lcom/xiaomi/slim/BlobWriter;

    invoke-virtual {v0}, Lcom/xiaomi/slim/BlobWriter;->openStream()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isBinaryConnection()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method notifyDataArrived(Lcom/xiaomi/slim/Blob;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->hasErr()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[Slim] RCV blob chid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getChannelId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "; id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getPacketID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "; errCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getErrCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "; err="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getErrStr()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    :cond_1
    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getChannelId()I

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "PING"

    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getCmd()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[Slim] RCV ping id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getPacketID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/slim/SlimConnection;->updateLastReceived()V

    goto :goto_0

    :cond_2
    const-string v0, "CLOSE"

    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getCmd()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/16 v0, 0xd

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/slim/SlimConnection;->notifyConnectionError(ILjava/lang/Exception;)V

    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->recvListeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/smack/Connection$ListenerWrapper;

    invoke-virtual {v1, p1}, Lcom/xiaomi/smack/Connection$ListenerWrapper;->notifyListener(Lcom/xiaomi/slim/Blob;)V

    goto :goto_1

    :cond_4
    return-void
.end method

.method notifyDataArrived(Lcom/xiaomi/smack/packet/Packet;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->recvListeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/smack/Connection$ListenerWrapper;

    invoke-virtual {v1, p1}, Lcom/xiaomi/smack/Connection$ListenerWrapper;->notifyListener(Lcom/xiaomi/smack/packet/Packet;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public send(Lcom/xiaomi/slim/Blob;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->mWriter:Lcom/xiaomi/slim/BlobWriter;

    if-eqz v0, :cond_2

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->mWriter:Lcom/xiaomi/slim/BlobWriter;

    invoke-virtual {v0, p1}, Lcom/xiaomi/slim/BlobWriter;->write(Lcom/xiaomi/slim/Blob;)I

    move-result v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/xiaomi/slim/SlimConnection;->writeAlive:J

    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v3, p0, Lcom/xiaomi/slim/SlimConnection;->mPushService:Lcom/xiaomi/push/service/XMPushService;

    int-to-long v5, v0

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    invoke-static/range {v3 .. v10}, Lcom/xiaomi/smack/util/TrafficUtils;->distributionTraffic(Landroid/content/Context;Ljava/lang/String;JZZJ)V

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->sendListeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/smack/Connection$ListenerWrapper;

    invoke-virtual {v1, p1}, Lcom/xiaomi/smack/Connection$ListenerWrapper;->notifyListener(Lcom/xiaomi/slim/Blob;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_1
    return-void

    :catch_0
    move-exception p1

    new-instance v0, Lcom/xiaomi/smack/XMPPException;

    invoke-direct {v0, p1}, Lcom/xiaomi/smack/XMPPException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :cond_2
    new-instance p1, Lcom/xiaomi/smack/XMPPException;

    const-string v0, "the writer is null."

    invoke-direct {p1, v0}, Lcom/xiaomi/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public sendPacket(Lcom/xiaomi/smack/packet/Packet;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/xiaomi/slim/Blob;->from(Lcom/xiaomi/smack/packet/Packet;Ljava/lang/String;)Lcom/xiaomi/slim/Blob;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/xiaomi/slim/SlimConnection;->send(Lcom/xiaomi/slim/Blob;)V

    return-void
.end method

.method protected sendPing(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->mWriter:Lcom/xiaomi/slim/BlobWriter;

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/xiaomi/slim/SlimConnection;->getPing(Z)Lcom/xiaomi/slim/Blob;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[Slim] SND ping id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getPacketID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/xiaomi/slim/SlimConnection;->send(Lcom/xiaomi/slim/Blob;)V

    invoke-virtual {p0}, Lcom/xiaomi/slim/SlimConnection;->updateLastSent()V

    return-void

    :cond_0
    new-instance p1, Lcom/xiaomi/smack/XMPPException;

    const-string v0, "The BlobWriter is null."

    invoke-direct {p1, v0}, Lcom/xiaomi/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected declared-synchronized shutdown(ILjava/lang/Exception;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->mReader:Lcom/xiaomi/slim/BlobReader;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->mReader:Lcom/xiaomi/slim/BlobReader;

    invoke-virtual {v0}, Lcom/xiaomi/slim/BlobReader;->shutdown()V

    iput-object v1, p0, Lcom/xiaomi/slim/SlimConnection;->mReader:Lcom/xiaomi/slim/BlobReader;

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->mWriter:Lcom/xiaomi/slim/BlobWriter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    :try_start_1
    iget-object v0, p0, Lcom/xiaomi/slim/SlimConnection;->mWriter:Lcom/xiaomi/slim/BlobWriter;

    invoke-virtual {v0}, Lcom/xiaomi/slim/BlobWriter;->shutdown()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :goto_0
    iput-object v1, p0, Lcom/xiaomi/slim/SlimConnection;->mWriter:Lcom/xiaomi/slim/BlobWriter;

    :cond_1
    iput-object v1, p0, Lcom/xiaomi/slim/SlimConnection;->mKey:[B

    invoke-super {p0, p1, p2}, Lcom/xiaomi/smack/SocketConnection;->shutdown(ILjava/lang/Exception;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized unbind(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/smack/XMPPException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-static {p1, p2, p0}, Lcom/xiaomi/slim/Binder;->unbind(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/smack/Connection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
