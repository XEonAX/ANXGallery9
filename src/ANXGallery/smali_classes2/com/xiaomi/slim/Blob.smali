.class public Lcom/xiaomi/slim/Blob;
.super Ljava/lang/Object;
.source "Blob.java"


# static fields
.field private static final EMPTY:[B

.field private static id:J

.field private static prefix:Ljava/lang/String;


# instance fields
.field private mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

.field mPackageName:Ljava/lang/String;

.field private mPayload:[B

.field private mPayloadType:S


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x5

    invoke-static {v1}, Lcom/xiaomi/smack/util/StringUtils;->randomString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/slim/Blob;->prefix:Ljava/lang/String;

    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/xiaomi/slim/Blob;->id:J

    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/xiaomi/slim/Blob;->EMPTY:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    iput-short v0, p0, Lcom/xiaomi/slim/Blob;->mPayloadType:S

    sget-object v0, Lcom/xiaomi/slim/Blob;->EMPTY:[B

    iput-object v0, p0, Lcom/xiaomi/slim/Blob;->mPayload:[B

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/slim/Blob;->mPackageName:Ljava/lang/String;

    new-instance v0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-direct {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    return-void
.end method

.method constructor <init>(Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;S[B)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    iput-short v0, p0, Lcom/xiaomi/slim/Blob;->mPayloadType:S

    sget-object v0, Lcom/xiaomi/slim/Blob;->EMPTY:[B

    iput-object v0, p0, Lcom/xiaomi/slim/Blob;->mPayload:[B

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/slim/Blob;->mPackageName:Ljava/lang/String;

    iput-object p1, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    iput-short p2, p0, Lcom/xiaomi/slim/Blob;->mPayloadType:S

    iput-object p3, p0, Lcom/xiaomi/slim/Blob;->mPayload:[B

    return-void
.end method

.method public static from(Lcom/xiaomi/smack/packet/Packet;Ljava/lang/String;)Lcom/xiaomi/slim/Blob;
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    new-instance v0, Lcom/xiaomi/slim/Blob;

    invoke-direct {v0}, Lcom/xiaomi/slim/Blob;-><init>()V

    :try_start_0
    invoke-virtual {p0}, Lcom/xiaomi/smack/packet/Packet;->getChannelId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Blob parse chid err "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v0, v1}, Lcom/xiaomi/slim/Blob;->setChannelId(I)V

    invoke-virtual {p0}, Lcom/xiaomi/smack/packet/Packet;->getPacketID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/slim/Blob;->setPacketID(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/smack/packet/Packet;->getFrom()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/slim/Blob;->setFrom(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/smack/packet/Packet;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/slim/Blob;->setPackageName(Ljava/lang/String;)V

    const-string v1, "XMLMSG"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/slim/Blob;->setCmd(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_1
    invoke-virtual {p0}, Lcom/xiaomi/smack/packet/Packet;->toXML()Ljava/lang/String;

    move-result-object p0

    const-string v1, "utf8"

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Lcom/xiaomi/slim/Blob;->setPayload([BLjava/lang/String;)V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x3

    invoke-virtual {v0, p0}, Lcom/xiaomi/slim/Blob;->setPayloadType(S)V

    goto :goto_1

    :cond_0
    const/4 p0, 0x2

    invoke-virtual {v0, p0}, Lcom/xiaomi/slim/Blob;->setPayloadType(S)V

    const-string p0, "SECMSG"

    invoke-virtual {v0, p0, v2}, Lcom/xiaomi/slim/Blob;->setCmd(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Blob setPayload err\uff1a "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    :goto_1
    return-object v0
.end method

.method static from(Ljava/nio/ByteBuffer;)Lcom/xiaomi/slim/Blob;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result v1

    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result v2

    const/4 v3, 0x4

    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v3

    new-instance v4, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-direct {v4}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;-><init>()V

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v6

    add-int/lit8 v6, v6, 0x8

    invoke-virtual {v4, v5, v6, v2}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->mergeFrom([BII)Lcom/google/protobuf/micro/MessageMicro;

    new-array v5, v3, [B

    add-int/lit8 v2, v2, 0x8

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {p0, v5, v0, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    new-instance p0, Lcom/xiaomi/slim/Blob;

    invoke-direct {p0, v4, v1, v5}, Lcom/xiaomi/slim/Blob;-><init>(Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;S[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "read Blob err :"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    new-instance p0, Ljava/io/IOException;

    const-string v0, "Malformed Input"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static declared-synchronized nextID()Ljava/lang/String;
    .locals 6

    const-class v0, Lcom/xiaomi/slim/Blob;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/xiaomi/slim/Blob;->prefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-wide v2, Lcom/xiaomi/slim/Blob;->id:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    sput-wide v4, Lcom/xiaomi/slim/Blob;->id:J

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public getChannelId()I
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getChid()I

    move-result v0

    return v0
.end method

.method public getCmd()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getCmd()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDecryptedPayload(Ljava/lang/String;)[B
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getCipher()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/xiaomi/slim/Blob;->getPacketID()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/xiaomi/push/service/RC4Cryption;->generateKeyForRC4(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object p1

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mPayload:[B

    invoke-static {p1, v0}, Lcom/xiaomi/push/service/RC4Cryption;->encrypt([B[B)[B

    move-result-object p1

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {p1}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getCipher()I

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/slim/Blob;->mPayload:[B

    return-object p1

    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "unknow cipher = "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getCipher()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/xiaomi/slim/Blob;->mPayload:[B

    return-object p1
.end method

.method public getErrCode()I
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getErrCode()I

    move-result v0

    return v0
.end method

.method public getErrStr()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getErrStr()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFullUserName()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasUuid()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getUuid()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getServer()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getResource()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mPackageName:Ljava/lang/String;

    return-object v0
.end method

.method public getPacketID()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getId()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ID_NOT_AVAILABLE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v1, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasId()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {}, Lcom/xiaomi/slim/Blob;->nextID()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v1, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setId(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    :cond_1
    return-object v0
.end method

.method public getPayload()[B
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mPayload:[B

    return-object v0
.end method

.method public getPayloadType()S
    .locals 1

    iget-short v0, p0, Lcom/xiaomi/slim/Blob;->mPayloadType:S

    return v0
.end method

.method public getSerializedSize()I
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getSerializedSize()I

    move-result v0

    add-int/lit8 v0, v0, 0x8

    iget-object v1, p0, Lcom/xiaomi/slim/Blob;->mPayload:[B

    array-length v1, v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getSubcmd()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getSubcmd()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasErr()Z
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasErrCode()Z

    move-result v0

    return v0
.end method

.method public setChannelId(I)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setChid(I)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    return-void
.end method

.method public setCmd(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setCmd(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    iget-object p1, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {p1}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->clearSubcmd()Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {p1, p2}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setSubcmd(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    :cond_0
    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "command should not be empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setFrom(JLjava/lang/String;Ljava/lang/String;)V
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-eqz v2, :cond_0

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0, p1, p2}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setUuid(J)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {p1, p3}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setServer(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    :cond_1
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {p1, p4}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setResource(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    :cond_2
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "@"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    const-string v3, "/"

    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    iget-object v3, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v3, v1, v2}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setUuid(J)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    iget-object v1, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v1, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setServer(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setResource(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Blob parse user err "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void
.end method

.method public setPackageName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/slim/Blob;->mPackageName:Ljava/lang/String;

    return-void
.end method

.method public setPacketID(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setId(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    return-void
.end method

.method public setPayload([BLjava/lang/String;)V
    .locals 2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setCipher(I)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {p0}, Lcom/xiaomi/slim/Blob;->getPacketID()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/xiaomi/push/service/RC4Cryption;->generateKeyForRC4(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object p2

    invoke-static {p2, p1}, Lcom/xiaomi/push/service/RC4Cryption;->encrypt([B[B)[B

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/slim/Blob;->mPayload:[B

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setCipher(I)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    iput-object p1, p0, Lcom/xiaomi/slim/Blob;->mPayload:[B

    :goto_0
    return-void
.end method

.method public setPayloadType(S)V
    .locals 0

    iput-short p1, p0, Lcom/xiaomi/slim/Blob;->mPayloadType:S

    return-void
.end method

.method toByteArray(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 5

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/xiaomi/slim/Blob;->getSerializedSize()I

    move-result p1

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    :cond_0
    iget-short v0, p0, Lcom/xiaomi/slim/Blob;->mPayloadType:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getCachedSize()I

    move-result v0

    int-to-short v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mPayload:[B

    array-length v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    iget-object v1, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v3

    add-int/2addr v3, v0

    iget-object v4, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v4}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getCachedSize()I

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->toByteArray([BII)V

    iget-object v1, p0, Lcom/xiaomi/slim/Blob;->mHeader:Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    invoke-virtual {v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getCachedSize()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v0, p0, Lcom/xiaomi/slim/Blob;->mPayload:[B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Blob [chid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/xiaomi/slim/Blob;->getChannelId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "; Id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/xiaomi/slim/Blob;->getPacketID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "; cmd="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/xiaomi/slim/Blob;->getCmd()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "; type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/xiaomi/slim/Blob;->getPayloadType()S

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "; from="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/xiaomi/slim/Blob;->getFullUserName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
