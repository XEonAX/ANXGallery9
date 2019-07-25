.class public final Lorg/apache/thrift/transport/TMemoryInputTransport;
.super Lorg/apache/thrift/transport/TTransport;
.source "TMemoryInputTransport.java"


# instance fields
.field private buf_:[B

.field private endPos_:I

.field private pos_:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lorg/apache/thrift/transport/TTransport;-><init>()V

    return-void
.end method


# virtual methods
.method public consumeBuffer(I)V
    .locals 1

    iget v0, p0, Lorg/apache/thrift/transport/TMemoryInputTransport;->pos_:I

    add-int/2addr v0, p1

    iput v0, p0, Lorg/apache/thrift/transport/TMemoryInputTransport;->pos_:I

    return-void
.end method

.method public getBuffer()[B
    .locals 1

    iget-object v0, p0, Lorg/apache/thrift/transport/TMemoryInputTransport;->buf_:[B

    return-object v0
.end method

.method public getBufferPosition()I
    .locals 1

    iget v0, p0, Lorg/apache/thrift/transport/TMemoryInputTransport;->pos_:I

    return v0
.end method

.method public getBytesRemainingInBuffer()I
    .locals 2

    iget v0, p0, Lorg/apache/thrift/transport/TMemoryInputTransport;->endPos_:I

    iget v1, p0, Lorg/apache/thrift/transport/TMemoryInputTransport;->pos_:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public read([BII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/transport/TTransportException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/apache/thrift/transport/TMemoryInputTransport;->getBytesRemainingInBuffer()I

    move-result v0

    if-le p3, v0, :cond_0

    move p3, v0

    :cond_0
    if-lez p3, :cond_1

    iget-object v0, p0, Lorg/apache/thrift/transport/TMemoryInputTransport;->buf_:[B

    iget v1, p0, Lorg/apache/thrift/transport/TMemoryInputTransport;->pos_:I

    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-virtual {p0, p3}, Lorg/apache/thrift/transport/TMemoryInputTransport;->consumeBuffer(I)V

    :cond_1
    return p3
.end method

.method public reset([B)V
    .locals 2

    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lorg/apache/thrift/transport/TMemoryInputTransport;->reset([BII)V

    return-void
.end method

.method public reset([BII)V
    .locals 0

    iput-object p1, p0, Lorg/apache/thrift/transport/TMemoryInputTransport;->buf_:[B

    iput p2, p0, Lorg/apache/thrift/transport/TMemoryInputTransport;->pos_:I

    add-int/2addr p2, p3

    iput p2, p0, Lorg/apache/thrift/transport/TMemoryInputTransport;->endPos_:I

    return-void
.end method

.method public write([BII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/transport/TTransportException;
        }
    .end annotation

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "No writing allowed!"

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
