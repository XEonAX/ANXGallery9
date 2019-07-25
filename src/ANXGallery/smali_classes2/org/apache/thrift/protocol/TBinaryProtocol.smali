.class public Lorg/apache/thrift/protocol/TBinaryProtocol;
.super Lorg/apache/thrift/protocol/TProtocol;
.source "TBinaryProtocol.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/thrift/protocol/TBinaryProtocol$Factory;
    }
.end annotation


# static fields
.field private static final ANONYMOUS_STRUCT:Lorg/apache/thrift/protocol/TStruct;


# instance fields
.field private bin:[B

.field private bout:[B

.field protected checkReadLength_:Z

.field private i16out:[B

.field private i16rd:[B

.field private i32out:[B

.field private i32rd:[B

.field private i64out:[B

.field private i64rd:[B

.field protected readLength_:I

.field protected strictRead_:Z

.field protected strictWrite_:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lorg/apache/thrift/protocol/TStruct;

    invoke-direct {v0}, Lorg/apache/thrift/protocol/TStruct;-><init>()V

    sput-object v0, Lorg/apache/thrift/protocol/TBinaryProtocol;->ANONYMOUS_STRUCT:Lorg/apache/thrift/protocol/TStruct;

    return-void
.end method

.method public constructor <init>(Lorg/apache/thrift/transport/TTransport;ZZ)V
    .locals 4

    invoke-direct {p0, p1}, Lorg/apache/thrift/protocol/TProtocol;-><init>(Lorg/apache/thrift/transport/TTransport;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->strictRead_:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->strictWrite_:Z

    iput-boolean p1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->checkReadLength_:Z

    new-array p1, v0, [B

    iput-object p1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->bout:[B

    const/4 p1, 0x2

    new-array v1, p1, [B

    iput-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i16out:[B

    const/4 v1, 0x4

    new-array v2, v1, [B

    iput-object v2, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i32out:[B

    const/16 v2, 0x8

    new-array v3, v2, [B

    iput-object v3, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i64out:[B

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->bin:[B

    new-array p1, p1, [B

    iput-object p1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i16rd:[B

    new-array p1, v1, [B

    iput-object p1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i32rd:[B

    new-array p1, v2, [B

    iput-object p1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i64rd:[B

    iput-boolean p2, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->strictRead_:Z

    iput-boolean p3, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->strictWrite_:Z

    return-void
.end method

.method private readAll([BII)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    invoke-virtual {p0, p3}, Lorg/apache/thrift/protocol/TBinaryProtocol;->checkReadLength(I)V

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/thrift/transport/TTransport;->readAll([BII)I

    move-result p1

    return p1
.end method


# virtual methods
.method protected checkReadLength(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    if-ltz p1, :cond_2

    iget-boolean v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->checkReadLength_:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->readLength_:I

    sub-int/2addr v0, p1

    iput v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->readLength_:I

    iget v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->readLength_:I

    if-ltz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lorg/apache/thrift/TException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Message length exceeded: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/apache/thrift/TException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    return-void

    :cond_2
    new-instance v0, Lorg/apache/thrift/TException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Negative length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/apache/thrift/TException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readBinary()Ljava/nio/ByteBuffer;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readI32()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->checkReadLength(I)V

    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v1}, Lorg/apache/thrift/transport/TTransport;->getBytesRemainingInBuffer()I

    move-result v1

    if-lt v1, v0, :cond_0

    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v1}, Lorg/apache/thrift/transport/TTransport;->getBuffer()[B

    move-result-object v1

    iget-object v2, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v2}, Lorg/apache/thrift/transport/TTransport;->getBufferPosition()I

    move-result v2

    invoke-static {v1, v2, v0}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v2, v0}, Lorg/apache/thrift/transport/TTransport;->consumeBuffer(I)V

    return-object v1

    :cond_0
    new-array v1, v0, [B

    iget-object v2, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3, v0}, Lorg/apache/thrift/transport/TTransport;->readAll([BII)I

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public readBool()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readByte()B

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public readByte()B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v0}, Lorg/apache/thrift/transport/TTransport;->getBytesRemainingInBuffer()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v0}, Lorg/apache/thrift/transport/TTransport;->getBuffer()[B

    move-result-object v0

    iget-object v2, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v2}, Lorg/apache/thrift/transport/TTransport;->getBufferPosition()I

    move-result v2

    aget-byte v0, v0, v2

    iget-object v2, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v2, v1}, Lorg/apache/thrift/transport/TTransport;->consumeBuffer(I)V

    return v0

    :cond_0
    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->bin:[B

    const/4 v2, 0x0

    invoke-direct {p0, v0, v2, v1}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readAll([BII)I

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->bin:[B

    aget-byte v0, v0, v2

    return v0
.end method

.method public readDouble()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readI64()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    return-wide v0
.end method

.method public readFieldBegin()Lorg/apache/thrift/protocol/TField;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readByte()B

    move-result v0

    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readI16()S

    move-result v1

    :goto_0
    new-instance v2, Lorg/apache/thrift/protocol/TField;

    const-string v3, ""

    invoke-direct {v2, v3, v0, v1}, Lorg/apache/thrift/protocol/TField;-><init>(Ljava/lang/String;BS)V

    return-object v2
.end method

.method public readFieldEnd()V
    .locals 0

    return-void
.end method

.method public readI16()S
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i16rd:[B

    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v1}, Lorg/apache/thrift/transport/TTransport;->getBytesRemainingInBuffer()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-lt v1, v3, :cond_0

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v0}, Lorg/apache/thrift/transport/TTransport;->getBuffer()[B

    move-result-object v0

    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v1}, Lorg/apache/thrift/transport/TTransport;->getBufferPosition()I

    move-result v2

    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v1, v3}, Lorg/apache/thrift/transport/TTransport;->consumeBuffer(I)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i16rd:[B

    invoke-direct {p0, v1, v2, v3}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readAll([BII)I

    :goto_0
    aget-byte v1, v0, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    add-int/lit8 v2, v2, 0x1

    aget-byte v0, v0, v2

    and-int/lit16 v0, v0, 0xff

    or-int/2addr v0, v1

    int-to-short v0, v0

    return v0
.end method

.method public readI32()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i32rd:[B

    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v1}, Lorg/apache/thrift/transport/TTransport;->getBytesRemainingInBuffer()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x4

    if-lt v1, v3, :cond_0

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v0}, Lorg/apache/thrift/transport/TTransport;->getBuffer()[B

    move-result-object v0

    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v1}, Lorg/apache/thrift/transport/TTransport;->getBufferPosition()I

    move-result v2

    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v1, v3}, Lorg/apache/thrift/transport/TTransport;->consumeBuffer(I)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i32rd:[B

    invoke-direct {p0, v1, v2, v3}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readAll([BII)I

    :goto_0
    aget-byte v1, v0, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    add-int/lit8 v3, v2, 0x1

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x10

    or-int/2addr v1, v3

    add-int/lit8 v3, v2, 0x2

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v1, v3

    add-int/lit8 v2, v2, 0x3

    aget-byte v0, v0, v2

    and-int/lit16 v0, v0, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method public readI64()J
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i64rd:[B

    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v1}, Lorg/apache/thrift/transport/TTransport;->getBytesRemainingInBuffer()I

    move-result v1

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-lt v1, v3, :cond_0

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v0}, Lorg/apache/thrift/transport/TTransport;->getBuffer()[B

    move-result-object v0

    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v1}, Lorg/apache/thrift/transport/TTransport;->getBufferPosition()I

    move-result v2

    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v1, v3}, Lorg/apache/thrift/transport/TTransport;->consumeBuffer(I)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i64rd:[B

    invoke-direct {p0, v1, v2, v3}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readAll([BII)I

    :goto_0
    aget-byte v1, v0, v2

    and-int/lit16 v1, v1, 0xff

    int-to-long v4, v1

    const/16 v1, 0x38

    shl-long/2addr v4, v1

    add-int/lit8 v1, v2, 0x1

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    int-to-long v6, v1

    const/16 v1, 0x30

    shl-long/2addr v6, v1

    or-long/2addr v4, v6

    add-int/lit8 v1, v2, 0x2

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    int-to-long v6, v1

    const/16 v1, 0x28

    shl-long/2addr v6, v1

    or-long/2addr v4, v6

    add-int/lit8 v1, v2, 0x3

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    int-to-long v6, v1

    const/16 v1, 0x20

    shl-long/2addr v6, v1

    or-long/2addr v4, v6

    add-int/lit8 v1, v2, 0x4

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    int-to-long v6, v1

    const/16 v1, 0x18

    shl-long/2addr v6, v1

    or-long/2addr v4, v6

    add-int/lit8 v1, v2, 0x5

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    int-to-long v6, v1

    const/16 v1, 0x10

    shl-long/2addr v6, v1

    or-long/2addr v4, v6

    add-int/lit8 v1, v2, 0x6

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    int-to-long v6, v1

    shl-long/2addr v6, v3

    or-long/2addr v4, v6

    add-int/lit8 v2, v2, 0x7

    aget-byte v0, v0, v2

    and-int/lit16 v0, v0, 0xff

    int-to-long v0, v0

    or-long/2addr v0, v4

    return-wide v0
.end method

.method public readListBegin()Lorg/apache/thrift/protocol/TList;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    new-instance v0, Lorg/apache/thrift/protocol/TList;

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readByte()B

    move-result v1

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readI32()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lorg/apache/thrift/protocol/TList;-><init>(BI)V

    return-object v0
.end method

.method public readListEnd()V
    .locals 0

    return-void
.end method

.method public readMapBegin()Lorg/apache/thrift/protocol/TMap;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    new-instance v0, Lorg/apache/thrift/protocol/TMap;

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readByte()B

    move-result v1

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readByte()B

    move-result v2

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readI32()I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/thrift/protocol/TMap;-><init>(BBI)V

    return-object v0
.end method

.method public readMapEnd()V
    .locals 0

    return-void
.end method

.method public readSetBegin()Lorg/apache/thrift/protocol/TSet;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    new-instance v0, Lorg/apache/thrift/protocol/TSet;

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readByte()B

    move-result v1

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readI32()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lorg/apache/thrift/protocol/TSet;-><init>(BI)V

    return-object v0
.end method

.method public readSetEnd()V
    .locals 0

    return-void
.end method

.method public readString()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readI32()I

    move-result v0

    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v1}, Lorg/apache/thrift/transport/TTransport;->getBytesRemainingInBuffer()I

    move-result v1

    if-lt v1, v0, :cond_0

    :try_start_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v2}, Lorg/apache/thrift/transport/TTransport;->getBuffer()[B

    move-result-object v2

    iget-object v3, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {v3}, Lorg/apache/thrift/transport/TTransport;->getBufferPosition()I

    move-result v3

    const-string v4, "UTF-8"

    invoke-direct {v1, v2, v3, v0, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    iget-object v2, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

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
    invoke-virtual {p0, v0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->readStringBody(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readStringBody(I)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/thrift/protocol/TBinaryProtocol;->checkReadLength(I)V

    new-array v0, p1, [B

    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2, p1}, Lorg/apache/thrift/transport/TTransport;->readAll([BII)I

    new-instance p1, Ljava/lang/String;

    const-string v1, "UTF-8"

    invoke-direct {p1, v0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    new-instance p1, Lorg/apache/thrift/TException;

    const-string v0, "JVM DOES NOT SUPPORT UTF-8"

    invoke-direct {p1, v0}, Lorg/apache/thrift/TException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public readStructBegin()Lorg/apache/thrift/protocol/TStruct;
    .locals 1

    sget-object v0, Lorg/apache/thrift/protocol/TBinaryProtocol;->ANONYMOUS_STRUCT:Lorg/apache/thrift/protocol/TStruct;

    return-object v0
.end method

.method public readStructEnd()V
    .locals 0

    return-void
.end method

.method public setReadLength(I)V
    .locals 0

    iput p1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->readLength_:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->checkReadLength_:Z

    return-void
.end method

.method public writeBinary(Ljava/nio/ByteBuffer;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->writeI32(I)V

    iget-object v1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result p1

    add-int/2addr v3, p1

    invoke-virtual {v1, v2, v3, v0}, Lorg/apache/thrift/transport/TTransport;->write([BII)V

    return-void
.end method

.method public writeBool(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lorg/apache/thrift/protocol/TBinaryProtocol;->writeByte(B)V

    return-void
.end method

.method public writeByte(B)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->bout:[B

    const/4 v1, 0x0

    aput-byte p1, v0, v1

    iget-object p1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->bout:[B

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v1, v2}, Lorg/apache/thrift/transport/TTransport;->write([BII)V

    return-void
.end method

.method public writeFieldBegin(Lorg/apache/thrift/protocol/TField;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    iget-byte v0, p1, Lorg/apache/thrift/protocol/TField;->type:B

    invoke-virtual {p0, v0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->writeByte(B)V

    iget-short p1, p1, Lorg/apache/thrift/protocol/TField;->id:S

    invoke-virtual {p0, p1}, Lorg/apache/thrift/protocol/TBinaryProtocol;->writeI16(S)V

    return-void
.end method

.method public writeFieldEnd()V
    .locals 0

    return-void
.end method

.method public writeFieldStop()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->writeByte(B)V

    return-void
.end method

.method public writeI16(S)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i16out:[B

    shr-int/lit8 v1, p1, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i16out:[B

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    const/4 v1, 0x1

    aput-byte p1, v0, v1

    iget-object p1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i16out:[B

    const/4 v1, 0x2

    invoke-virtual {p1, v0, v2, v1}, Lorg/apache/thrift/transport/TTransport;->write([BII)V

    return-void
.end method

.method public writeI32(I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i32out:[B

    shr-int/lit8 v1, p1, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i32out:[B

    shr-int/lit8 v1, p1, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v3, 0x1

    aput-byte v1, v0, v3

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i32out:[B

    shr-int/lit8 v1, p1, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v3, 0x2

    aput-byte v1, v0, v3

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i32out:[B

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    const/4 v1, 0x3

    aput-byte p1, v0, v1

    iget-object p1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i32out:[B

    const/4 v1, 0x4

    invoke-virtual {p1, v0, v2, v1}, Lorg/apache/thrift/transport/TTransport;->write([BII)V

    return-void
.end method

.method public writeI64(J)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i64out:[B

    const/16 v1, 0x38

    shr-long v1, p1, v1

    const-wide/16 v3, 0xff

    and-long/2addr v1, v3

    long-to-int v1, v1

    int-to-byte v1, v1

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i64out:[B

    const/16 v1, 0x30

    shr-long v5, p1, v1

    and-long/2addr v5, v3

    long-to-int v1, v5

    int-to-byte v1, v1

    const/4 v5, 0x1

    aput-byte v1, v0, v5

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i64out:[B

    const/16 v1, 0x28

    shr-long v5, p1, v1

    and-long/2addr v5, v3

    long-to-int v1, v5

    int-to-byte v1, v1

    const/4 v5, 0x2

    aput-byte v1, v0, v5

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i64out:[B

    const/16 v1, 0x20

    shr-long v5, p1, v1

    and-long/2addr v5, v3

    long-to-int v1, v5

    int-to-byte v1, v1

    const/4 v5, 0x3

    aput-byte v1, v0, v5

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i64out:[B

    const/16 v1, 0x18

    shr-long v5, p1, v1

    and-long/2addr v5, v3

    long-to-int v1, v5

    int-to-byte v1, v1

    const/4 v5, 0x4

    aput-byte v1, v0, v5

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i64out:[B

    const/16 v1, 0x10

    shr-long v5, p1, v1

    and-long/2addr v5, v3

    long-to-int v1, v5

    int-to-byte v1, v1

    const/4 v5, 0x5

    aput-byte v1, v0, v5

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i64out:[B

    const/16 v1, 0x8

    shr-long v5, p1, v1

    and-long/2addr v5, v3

    long-to-int v5, v5

    int-to-byte v5, v5

    const/4 v6, 0x6

    aput-byte v5, v0, v6

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i64out:[B

    and-long/2addr p1, v3

    long-to-int p1, p1

    int-to-byte p1, p1

    const/4 p2, 0x7

    aput-byte p1, v0, p2

    iget-object p1, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    iget-object p2, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->i64out:[B

    invoke-virtual {p1, p2, v2, v1}, Lorg/apache/thrift/transport/TTransport;->write([BII)V

    return-void
.end method

.method public writeListBegin(Lorg/apache/thrift/protocol/TList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    iget-byte v0, p1, Lorg/apache/thrift/protocol/TList;->elemType:B

    invoke-virtual {p0, v0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->writeByte(B)V

    iget p1, p1, Lorg/apache/thrift/protocol/TList;->size:I

    invoke-virtual {p0, p1}, Lorg/apache/thrift/protocol/TBinaryProtocol;->writeI32(I)V

    return-void
.end method

.method public writeListEnd()V
    .locals 0

    return-void
.end method

.method public writeMapBegin(Lorg/apache/thrift/protocol/TMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    iget-byte v0, p1, Lorg/apache/thrift/protocol/TMap;->keyType:B

    invoke-virtual {p0, v0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->writeByte(B)V

    iget-byte v0, p1, Lorg/apache/thrift/protocol/TMap;->valueType:B

    invoke-virtual {p0, v0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->writeByte(B)V

    iget p1, p1, Lorg/apache/thrift/protocol/TMap;->size:I

    invoke-virtual {p0, p1}, Lorg/apache/thrift/protocol/TBinaryProtocol;->writeI32(I)V

    return-void
.end method

.method public writeMapEnd()V
    .locals 0

    return-void
.end method

.method public writeString(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    :try_start_0
    const-string v0, "UTF-8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    array-length v0, p1

    invoke-virtual {p0, v0}, Lorg/apache/thrift/protocol/TBinaryProtocol;->writeI32(I)V

    iget-object v0, p0, Lorg/apache/thrift/protocol/TBinaryProtocol;->trans_:Lorg/apache/thrift/transport/TTransport;

    const/4 v1, 0x0

    array-length v2, p1

    invoke-virtual {v0, p1, v1, v2}, Lorg/apache/thrift/transport/TTransport;->write([BII)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    new-instance p1, Lorg/apache/thrift/TException;

    const-string v0, "JVM DOES NOT SUPPORT UTF-8"

    invoke-direct {p1, v0}, Lorg/apache/thrift/TException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeStructBegin(Lorg/apache/thrift/protocol/TStruct;)V
    .locals 0

    return-void
.end method

.method public writeStructEnd()V
    .locals 0

    return-void
.end method
