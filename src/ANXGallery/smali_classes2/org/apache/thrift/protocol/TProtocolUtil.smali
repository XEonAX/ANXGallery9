.class public Lorg/apache/thrift/protocol/TProtocolUtil;
.super Ljava/lang/Object;
.source "TProtocolUtil.java"


# static fields
.field private static maxSkipDepth:I = 0x7fffffff


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static skip(Lorg/apache/thrift/protocol/TProtocol;B)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    sget v0, Lorg/apache/thrift/protocol/TProtocolUtil;->maxSkipDepth:I

    invoke-static {p0, p1, v0}, Lorg/apache/thrift/protocol/TProtocolUtil;->skip(Lorg/apache/thrift/protocol/TProtocol;BI)V

    return-void
.end method

.method public static skip(Lorg/apache/thrift/protocol/TProtocol;BI)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    if-lez p2, :cond_4

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_4

    :pswitch_1
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readListBegin()Lorg/apache/thrift/protocol/TList;

    move-result-object p1

    :goto_0
    iget v1, p1, Lorg/apache/thrift/protocol/TList;->size:I

    if-ge v0, v1, :cond_0

    iget-byte v1, p1, Lorg/apache/thrift/protocol/TList;->elemType:B

    add-int/lit8 v2, p2, -0x1

    invoke-static {p0, v1, v2}, Lorg/apache/thrift/protocol/TProtocolUtil;->skip(Lorg/apache/thrift/protocol/TProtocol;BI)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readListEnd()V

    goto/16 :goto_4

    :pswitch_2
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readSetBegin()Lorg/apache/thrift/protocol/TSet;

    move-result-object p1

    :goto_1
    iget v1, p1, Lorg/apache/thrift/protocol/TSet;->size:I

    if-ge v0, v1, :cond_1

    iget-byte v1, p1, Lorg/apache/thrift/protocol/TSet;->elemType:B

    add-int/lit8 v2, p2, -0x1

    invoke-static {p0, v1, v2}, Lorg/apache/thrift/protocol/TProtocolUtil;->skip(Lorg/apache/thrift/protocol/TProtocol;BI)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readSetEnd()V

    goto :goto_4

    :pswitch_3
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readMapBegin()Lorg/apache/thrift/protocol/TMap;

    move-result-object p1

    :goto_2
    iget v1, p1, Lorg/apache/thrift/protocol/TMap;->size:I

    if-ge v0, v1, :cond_2

    iget-byte v1, p1, Lorg/apache/thrift/protocol/TMap;->keyType:B

    add-int/lit8 v2, p2, -0x1

    invoke-static {p0, v1, v2}, Lorg/apache/thrift/protocol/TProtocolUtil;->skip(Lorg/apache/thrift/protocol/TProtocol;BI)V

    iget-byte v1, p1, Lorg/apache/thrift/protocol/TMap;->valueType:B

    invoke-static {p0, v1, v2}, Lorg/apache/thrift/protocol/TProtocolUtil;->skip(Lorg/apache/thrift/protocol/TProtocol;BI)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readMapEnd()V

    goto :goto_4

    :pswitch_4
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readStructBegin()Lorg/apache/thrift/protocol/TStruct;

    :goto_3
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readFieldBegin()Lorg/apache/thrift/protocol/TField;

    move-result-object p1

    iget-byte v0, p1, Lorg/apache/thrift/protocol/TField;->type:B

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readStructEnd()V

    goto :goto_4

    :cond_3
    iget-byte p1, p1, Lorg/apache/thrift/protocol/TField;->type:B

    add-int/lit8 v0, p2, -0x1

    :try_start_0
    invoke-static {p0, p1, v0}, Lorg/apache/thrift/protocol/TProtocolUtil;->skip(Lorg/apache/thrift/protocol/TProtocol;BI)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readFieldEnd()V

    goto :goto_3

    :pswitch_5
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readBinary()Ljava/nio/ByteBuffer;

    goto :goto_4

    :pswitch_6
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readI64()J

    goto :goto_4

    :pswitch_7
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readI32()I

    goto :goto_4

    :pswitch_8
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readI16()S

    goto :goto_4

    :pswitch_9
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readDouble()D

    goto :goto_4

    :pswitch_a
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readByte()B

    goto :goto_4

    :pswitch_b
    invoke-virtual {p0}, Lorg/apache/thrift/protocol/TProtocol;->readBool()Z

    :goto_4
    return-void

    :cond_4
    new-instance p0, Lorg/apache/thrift/TException;

    const-string p1, "Maximum skip depth exceeded"

    invoke-direct {p0, p1}, Lorg/apache/thrift/TException;-><init>(Ljava/lang/String;)V

    throw p0

    :catch_0
    move-exception p0

    throw p0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_0
        :pswitch_8
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
