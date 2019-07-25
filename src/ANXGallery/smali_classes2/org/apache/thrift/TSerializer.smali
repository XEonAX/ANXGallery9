.class public Lorg/apache/thrift/TSerializer;
.super Ljava/lang/Object;
.source "TSerializer.java"


# instance fields
.field private final baos_:Ljava/io/ByteArrayOutputStream;

.field private protocol_:Lorg/apache/thrift/protocol/TProtocol;

.field private final transport_:Lorg/apache/thrift/transport/TIOStreamTransport;


# direct methods
.method public constructor <init>()V
    .locals 1

    new-instance v0, Lorg/apache/thrift/protocol/TBinaryProtocol$Factory;

    invoke-direct {v0}, Lorg/apache/thrift/protocol/TBinaryProtocol$Factory;-><init>()V

    invoke-direct {p0, v0}, Lorg/apache/thrift/TSerializer;-><init>(Lorg/apache/thrift/protocol/TProtocolFactory;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/thrift/protocol/TProtocolFactory;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lorg/apache/thrift/TSerializer;->baos_:Ljava/io/ByteArrayOutputStream;

    new-instance v0, Lorg/apache/thrift/transport/TIOStreamTransport;

    iget-object v1, p0, Lorg/apache/thrift/TSerializer;->baos_:Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, v1}, Lorg/apache/thrift/transport/TIOStreamTransport;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/apache/thrift/TSerializer;->transport_:Lorg/apache/thrift/transport/TIOStreamTransport;

    iget-object v0, p0, Lorg/apache/thrift/TSerializer;->transport_:Lorg/apache/thrift/transport/TIOStreamTransport;

    invoke-interface {p1, v0}, Lorg/apache/thrift/protocol/TProtocolFactory;->getProtocol(Lorg/apache/thrift/transport/TTransport;)Lorg/apache/thrift/protocol/TProtocol;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/thrift/TSerializer;->protocol_:Lorg/apache/thrift/protocol/TProtocol;

    return-void
.end method


# virtual methods
.method public serialize(Lorg/apache/thrift/TBase;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    iget-object v0, p0, Lorg/apache/thrift/TSerializer;->baos_:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->reset()V

    iget-object v0, p0, Lorg/apache/thrift/TSerializer;->protocol_:Lorg/apache/thrift/protocol/TProtocol;

    invoke-interface {p1, v0}, Lorg/apache/thrift/TBase;->write(Lorg/apache/thrift/protocol/TProtocol;)V

    iget-object p1, p0, Lorg/apache/thrift/TSerializer;->baos_:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    return-object p1
.end method
