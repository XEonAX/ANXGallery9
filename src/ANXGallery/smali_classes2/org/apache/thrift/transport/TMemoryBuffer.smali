.class public Lorg/apache/thrift/transport/TMemoryBuffer;
.super Lorg/apache/thrift/transport/TTransport;
.source "TMemoryBuffer.java"


# instance fields
.field private arr_:Lorg/apache/thrift/TByteArrayOutputStream;

.field private pos_:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Lorg/apache/thrift/transport/TTransport;-><init>()V

    new-instance v0, Lorg/apache/thrift/TByteArrayOutputStream;

    invoke-direct {v0, p1}, Lorg/apache/thrift/TByteArrayOutputStream;-><init>(I)V

    iput-object v0, p0, Lorg/apache/thrift/transport/TMemoryBuffer;->arr_:Lorg/apache/thrift/TByteArrayOutputStream;

    return-void
.end method


# virtual methods
.method public length()I
    .locals 1

    iget-object v0, p0, Lorg/apache/thrift/transport/TMemoryBuffer;->arr_:Lorg/apache/thrift/TByteArrayOutputStream;

    invoke-virtual {v0}, Lorg/apache/thrift/TByteArrayOutputStream;->size()I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 3

    iget-object v0, p0, Lorg/apache/thrift/transport/TMemoryBuffer;->arr_:Lorg/apache/thrift/TByteArrayOutputStream;

    invoke-virtual {v0}, Lorg/apache/thrift/TByteArrayOutputStream;->get()[B

    move-result-object v0

    iget-object v1, p0, Lorg/apache/thrift/transport/TMemoryBuffer;->arr_:Lorg/apache/thrift/TByteArrayOutputStream;

    invoke-virtual {v1}, Lorg/apache/thrift/TByteArrayOutputStream;->len()I

    move-result v1

    iget v2, p0, Lorg/apache/thrift/transport/TMemoryBuffer;->pos_:I

    sub-int/2addr v1, v2

    if-le p3, v1, :cond_0

    iget-object p3, p0, Lorg/apache/thrift/transport/TMemoryBuffer;->arr_:Lorg/apache/thrift/TByteArrayOutputStream;

    invoke-virtual {p3}, Lorg/apache/thrift/TByteArrayOutputStream;->len()I

    move-result p3

    iget v1, p0, Lorg/apache/thrift/transport/TMemoryBuffer;->pos_:I

    sub-int/2addr p3, v1

    :cond_0
    if-lez p3, :cond_1

    iget v1, p0, Lorg/apache/thrift/transport/TMemoryBuffer;->pos_:I

    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget p1, p0, Lorg/apache/thrift/transport/TMemoryBuffer;->pos_:I

    add-int/2addr p1, p3

    iput p1, p0, Lorg/apache/thrift/transport/TMemoryBuffer;->pos_:I

    :cond_1
    return p3
.end method

.method public write([BII)V
    .locals 1

    iget-object v0, p0, Lorg/apache/thrift/transport/TMemoryBuffer;->arr_:Lorg/apache/thrift/TByteArrayOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/thrift/TByteArrayOutputStream;->write([BII)V

    return-void
.end method
