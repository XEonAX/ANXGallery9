.class public Lcom/xiaomi/slim/BlobWriter;
.super Ljava/lang/Object;
.source "BlobWriter.java"


# instance fields
.field mBuffer:Ljava/nio/ByteBuffer;

.field private mCRCBuf:Ljava/nio/ByteBuffer;

.field private mChecksumTool:Ljava/util/zip/Adler32;

.field private mConnection:Lcom/xiaomi/slim/SlimConnection;

.field private mDSTSavings:I

.field private mKey:[B

.field private mOut:Ljava/io/OutputStream;

.field private mTimeZone:I


# direct methods
.method constructor <init>(Ljava/io/OutputStream;Lcom/xiaomi/slim/SlimConnection;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x800

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    const/4 v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/slim/BlobWriter;->mCRCBuf:Ljava/nio/ByteBuffer;

    new-instance v0, Ljava/util/zip/Adler32;

    invoke-direct {v0}, Ljava/util/zip/Adler32;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/slim/BlobWriter;->mChecksumTool:Ljava/util/zip/Adler32;

    new-instance v0, Ljava/io/BufferedOutputStream;

    invoke-direct {v0, p1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/xiaomi/slim/BlobWriter;->mOut:Ljava/io/OutputStream;

    iput-object p2, p0, Lcom/xiaomi/slim/BlobWriter;->mConnection:Lcom/xiaomi/slim/SlimConnection;

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/TimeZone;->getRawOffset()I

    move-result p2

    const v0, 0x36ee80

    div-int/2addr p2, v0

    iput p2, p0, Lcom/xiaomi/slim/BlobWriter;->mTimeZone:I

    invoke-virtual {p1}, Ljava/util/TimeZone;->useDaylightTime()Z

    move-result p1

    iput p1, p0, Lcom/xiaomi/slim/BlobWriter;->mDSTSavings:I

    return-void
.end method


# virtual methods
.method public openStream()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    invoke-direct {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;-><init>()V

    const/16 v1, 0x6a

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setVersion(I)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setModel(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    invoke-static {}, Lcom/xiaomi/channel/commonutils/android/SystemUtils;->getManufacturerOSVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setOs(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    invoke-static {}, Lcom/xiaomi/push/service/ServiceConfig;->getDeviceUUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setUdid(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    const/16 v1, 0x26

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setSdk(I)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    iget-object v2, p0, Lcom/xiaomi/slim/BlobWriter;->mConnection:Lcom/xiaomi/slim/SlimConnection;

    invoke-virtual {v2}, Lcom/xiaomi/slim/SlimConnection;->getConnectionPoint()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setConnpt(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    iget-object v2, p0, Lcom/xiaomi/slim/BlobWriter;->mConnection:Lcom/xiaomi/slim/SlimConnection;

    invoke-virtual {v2}, Lcom/xiaomi/slim/SlimConnection;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setHost(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setLocale(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v0, v2}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setAndver(I)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    iget-object v2, p0, Lcom/xiaomi/slim/BlobWriter;->mConnection:Lcom/xiaomi/slim/SlimConnection;

    invoke-virtual {v2}, Lcom/xiaomi/slim/SlimConnection;->getConfiguration()Lcom/xiaomi/smack/ConnectionConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Lcom/xiaomi/smack/ConnectionConfiguration;->getConnectionBlob()[B

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-static {v2}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->parseFrom([B)Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setPsc(Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    :cond_0
    new-instance v2, Lcom/xiaomi/slim/Blob;

    invoke-direct {v2}, Lcom/xiaomi/slim/Blob;-><init>()V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/xiaomi/slim/Blob;->setChannelId(I)V

    const-string v3, "CONN"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/xiaomi/slim/Blob;->setCmd(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v5, 0x0

    const-string v3, "xiaomi.com"

    invoke-virtual {v2, v5, v6, v3, v4}, Lcom/xiaomi/slim/Blob;->setFrom(JLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->toByteArray()[B

    move-result-object v0

    invoke-virtual {v2, v0, v4}, Lcom/xiaomi/slim/Blob;->setPayload([BLjava/lang/String;)V

    invoke-virtual {p0, v2}, Lcom/xiaomi/slim/BlobWriter;->write(Lcom/xiaomi/slim/Blob;)I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[slim] open conn: andver="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " sdk="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " hash="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/xiaomi/push/service/ServiceConfig;->getDeviceUUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " tz="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/xiaomi/slim/BlobWriter;->mTimeZone:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/xiaomi/slim/BlobWriter;->mDSTSavings:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " Model="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " os="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    return-void
.end method

.method public shutdown()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/xiaomi/slim/Blob;

    invoke-direct {v0}, Lcom/xiaomi/slim/Blob;-><init>()V

    const-string v1, "CLOSE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/slim/Blob;->setCmd(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/slim/BlobWriter;->write(Lcom/xiaomi/slim/Blob;)I

    iget-object v0, p0, Lcom/xiaomi/slim/BlobWriter;->mOut:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    return-void
.end method

.method public write(Lcom/xiaomi/slim/Blob;)I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getSerializedSize()I

    move-result v0

    const v1, 0x8000

    const/4 v2, 0x0

    if-le v0, v1, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Blob size="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " should be less than "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " Drop blob chid="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getChannelId()I

    move-result v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " id="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getPacketID()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    return v2

    :cond_0
    iget-object v1, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    add-int/lit8 v1, v0, 0x8

    const/4 v3, 0x4

    add-int/2addr v1, v3

    iget-object v4, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v4

    if-gt v1, v4, :cond_1

    iget-object v4, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v4

    const/16 v5, 0x1000

    if-le v4, v5, :cond_2

    :cond_1
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    :cond_2
    iget-object v1, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    const/16 v4, -0x3d02

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    const/4 v4, 0x5

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    iget-object v4, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v4}, Lcom/xiaomi/slim/Blob;->toByteArray(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v4

    iput-object v4, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    const-string v4, "CONN"

    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getCmd()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    iget-object v4, p0, Lcom/xiaomi/slim/BlobWriter;->mKey:[B

    if-nez v4, :cond_3

    iget-object v4, p0, Lcom/xiaomi/slim/BlobWriter;->mConnection:Lcom/xiaomi/slim/SlimConnection;

    invoke-virtual {v4}, Lcom/xiaomi/slim/SlimConnection;->getKey()[B

    move-result-object v4

    iput-object v4, p0, Lcom/xiaomi/slim/BlobWriter;->mKey:[B

    :cond_3
    iget-object v4, p0, Lcom/xiaomi/slim/BlobWriter;->mKey:[B

    iget-object v5, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    const/4 v6, 0x1

    invoke-static {v4, v5, v6, v1, v0}, Lcom/xiaomi/push/service/RC4Cryption;->encrypt([B[BZII)[B

    :cond_4
    iget-object v0, p0, Lcom/xiaomi/slim/BlobWriter;->mChecksumTool:Ljava/util/zip/Adler32;

    invoke-virtual {v0}, Ljava/util/zip/Adler32;->reset()V

    iget-object v0, p0, Lcom/xiaomi/slim/BlobWriter;->mChecksumTool:Ljava/util/zip/Adler32;

    iget-object v1, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iget-object v4, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    invoke-virtual {v0, v1, v2, v4}, Ljava/util/zip/Adler32;->update([BII)V

    iget-object v0, p0, Lcom/xiaomi/slim/BlobWriter;->mChecksumTool:Ljava/util/zip/Adler32;

    invoke-virtual {v0}, Ljava/util/zip/Adler32;->getValue()J

    move-result-wide v0

    long-to-int v0, v0

    iget-object v1, p0, Lcom/xiaomi/slim/BlobWriter;->mCRCBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2, v0}, Ljava/nio/ByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/xiaomi/slim/BlobWriter;->mOut:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iget-object v4, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    invoke-virtual {v0, v1, v2, v4}, Ljava/io/OutputStream;->write([BII)V

    iget-object v0, p0, Lcom/xiaomi/slim/BlobWriter;->mOut:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/xiaomi/slim/BlobWriter;->mCRCBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    iget-object v0, p0, Lcom/xiaomi/slim/BlobWriter;->mOut:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    iget-object v0, p0, Lcom/xiaomi/slim/BlobWriter;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/2addr v0, v3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[Slim] Wrote {cmd="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getCmd()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ";chid="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/slim/Blob;->getChannelId()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ";len="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "}"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    return v0
.end method
