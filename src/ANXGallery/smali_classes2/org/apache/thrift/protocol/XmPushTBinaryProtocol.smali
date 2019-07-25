.class public Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;
.super Lorg/apache/thrift/protocol/TBinaryProtocol;
.source "XmPushTBinaryProtocol.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/thrift/protocol/XmPushTBinaryProtocol$Factory;
    }
.end annotation


# static fields
.field private static MAX_THRIFT_BINARY_SIZE:I = 0x6400000

.field private static MAX_THRIFT_LIST_SIZE:I = 0x2710

.field private static MAX_THRIFT_MAP_SIZE:I = 0x2710

.field private static MAX_THRIFT_SET_SIZE:I = 0x2710

.field private static MAX_THRIFT_STRING_SIZE:I = 0xa00000


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lorg/apache/thrift/transport/TTransport;ZZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/thrift/protocol/TBinaryProtocol;-><init>(Lorg/apache/thrift/transport/TTransport;ZZ)V

    return-void
.end method


# virtual methods
.method public readBinary()Ljava/nio/ByteBuffer;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->readI32()I

    move-result v0

    sget v1, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->MAX_THRIFT_BINARY_SIZE:I

    if-gt v0, v1, :cond_1

    invoke-virtual {p0, v0}, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->checkReadLength(I)V

    iget-object v1, p0, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v1}, Lorg/apache/thrift/transport/TTransport;->getBytesRemainingInBuffer()I

    move-result v1

    if-lt v1, v0, :cond_0

    iget-object v1, p0, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v1}, Lorg/apache/thrift/transport/TTransport;->getBuffer()[B

    move-result-object v1

    iget-object v2, p0, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v2}, Lorg/apache/thrift/transport/TTransport;->getBufferPosition()I

    move-result v2

    invoke-static {v1, v2, v0}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v2, v0}, Lorg/apache/thrift/transport/TTransport;->consumeBuffer(I)V

    return-object v1

    :cond_0
    new-array v1, v0, [B

    iget-object v2, p0, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3, v0}, Lorg/apache/thrift/transport/TTransport;->readAll([BII)I

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0

    :cond_1
    new-instance v1, Lorg/apache/thrift/protocol/TProtocolException;

    const/4 v2, 0x3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Thrift binary size "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " out of range!"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Lorg/apache/thrift/protocol/TProtocolException;-><init>(ILjava/lang/String;)V

    throw v1
.end method

.method public readListBegin()Lorg/apache/thrift/protocol/TList;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->readByte()B

    move-result v0

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->readI32()I

    move-result v1

    sget v2, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->MAX_THRIFT_LIST_SIZE:I

    if-gt v1, v2, :cond_0

    new-instance v2, Lorg/apache/thrift/protocol/TList;

    invoke-direct {v2, v0, v1}, Lorg/apache/thrift/protocol/TList;-><init>(BI)V

    return-object v2

    :cond_0
    new-instance v0, Lorg/apache/thrift/protocol/TProtocolException;

    const/4 v2, 0x3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Thrift list size "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " out of range!"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lorg/apache/thrift/protocol/TProtocolException;-><init>(ILjava/lang/String;)V

    throw v0
.end method

.method public readMapBegin()Lorg/apache/thrift/protocol/TMap;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->readByte()B

    move-result v0

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->readByte()B

    move-result v1

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->readI32()I

    move-result v2

    sget v3, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->MAX_THRIFT_MAP_SIZE:I

    if-gt v2, v3, :cond_0

    new-instance v3, Lorg/apache/thrift/protocol/TMap;

    invoke-direct {v3, v0, v1, v2}, Lorg/apache/thrift/protocol/TMap;-><init>(BBI)V

    return-object v3

    :cond_0
    new-instance v0, Lorg/apache/thrift/protocol/TProtocolException;

    const/4 v1, 0x3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Thrift map size "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " out of range!"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/thrift/protocol/TProtocolException;-><init>(ILjava/lang/String;)V

    throw v0
.end method

.method public readSetBegin()Lorg/apache/thrift/protocol/TSet;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->readByte()B

    move-result v0

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->readI32()I

    move-result v1

    sget v2, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->MAX_THRIFT_SET_SIZE:I

    if-gt v1, v2, :cond_0

    new-instance v2, Lorg/apache/thrift/protocol/TSet;

    invoke-direct {v2, v0, v1}, Lorg/apache/thrift/protocol/TSet;-><init>(BI)V

    return-object v2

    :cond_0
    new-instance v0, Lorg/apache/thrift/protocol/TProtocolException;

    const/4 v2, 0x3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Thrift set size "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " out of range!"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lorg/apache/thrift/protocol/TProtocolException;-><init>(ILjava/lang/String;)V

    throw v0
.end method

.method public readString()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->readI32()I

    move-result v0

    sget v1, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->MAX_THRIFT_STRING_SIZE:I

    if-gt v0, v1, :cond_1

    iget-object v1, p0, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v1}, Lorg/apache/thrift/transport/TTransport;->getBytesRemainingInBuffer()I

    move-result v1

    if-lt v1, v0, :cond_0

    :try_start_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v2}, Lorg/apache/thrift/transport/TTransport;->getBuffer()[B

    move-result-object v2

    iget-object v3, p0, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v3}, Lorg/apache/thrift/transport/TTransport;->getBufferPosition()I

    move-result v3

    const-string v4, "UTF-8"

    invoke-direct {v1, v2, v3, v0, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    iget-object v2, p0, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v2, v0}, Lorg/apache/thrift/transport/TTransport;->consumeBuffer(I)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    new-instance v0, Lorg/apache/thrift/TException;

    const-string v1, "JVM DOES NOT SUPPORT UTF-8"

    invoke-direct {v0, v1}, Lorg/apache/thrift/TException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {p0, v0}, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;->readStringBody(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    new-instance v1, Lorg/apache/thrift/protocol/TProtocolException;

    const/4 v2, 0x3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Thrift string size "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " out of range!"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Lorg/apache/thrift/protocol/TProtocolException;-><init>(ILjava/lang/String;)V

    throw v1
.end method
