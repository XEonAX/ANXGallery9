.class public Lorg/apache/thrift/TDeserializer;
.super Ljava/lang/Object;
.source "TDeserializer.java"


# instance fields
.field private final protocol_:Lorg/apache/thrift/protocol/TProtocol;

.field private final trans_:Lorg/apache/thrift/transport/TMemoryInputTransport;


# direct methods
.method public constructor <init>()V
    .locals 1

    new-instance v0, Lorg/apache/thrift/protocol/TBinaryProtocol$Factory;

    invoke-direct {v0}, Lorg/apache/thrift/protocol/TBinaryProtocol$Factory;-><init>()V

    invoke-direct {p0, v0}, Lorg/apache/thrift/TDeserializer;-><init>(Lorg/apache/thrift/protocol/TProtocolFactory;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/thrift/protocol/TProtocolFactory;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lorg/apache/thrift/transport/TMemoryInputTransport;

    invoke-direct {v0}, Lorg/apache/thrift/transport/TMemoryInputTransport;-><init>()V

    iput-object v0, p0, Lorg/apache/thrift/TDeserializer;->trans_:Lorg/apache/thrift/transport/TMemoryInputTransport;

    iget-object v0, p0, Lorg/apache/thrift/TDeserializer;->trans_:Lorg/apache/thrift/transport/TMemoryInputTransport;

    invoke-interface {p1, v0}, Lorg/apache/thrift/protocol/TProtocolFactory;->getProtocol(Lorg/apache/thrift/transport/TTransport;)Lorg/apache/thrift/protocol/TProtocol;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/thrift/TDeserializer;->protocol_:Lorg/apache/thrift/protocol/TProtocol;

    return-void
.end method


# virtual methods
.method public deserialize(Lorg/apache/thrift/TBase;[B)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/TException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lorg/apache/thrift/TDeserializer;->trans_:Lorg/apache/thrift/transport/TMemoryInputTransport;

    invoke-virtual {v0, p2}, Lorg/apache/thrift/transport/TMemoryInputTransport;->reset([B)V

    iget-object p2, p0, Lorg/apache/thrift/TDeserializer;->protocol_:Lorg/apache/thrift/protocol/TProtocol;

    invoke-interface {p1, p2}, Lorg/apache/thrift/TBase;->read(Lorg/apache/thrift/protocol/TProtocol;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lorg/apache/thrift/TDeserializer;->protocol_:Lorg/apache/thrift/protocol/TProtocol;

    invoke-virtual {p1}, Lorg/apache/thrift/protocol/TProtocol;->reset()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lorg/apache/thrift/TDeserializer;->protocol_:Lorg/apache/thrift/protocol/TProtocol;

    invoke-virtual {p2}, Lorg/apache/thrift/protocol/TProtocol;->reset()V

    throw p1
.end method
