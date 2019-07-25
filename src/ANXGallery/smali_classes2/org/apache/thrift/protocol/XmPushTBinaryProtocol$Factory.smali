.class public Lorg/apache/thrift/protocol/XmPushTBinaryProtocol$Factory;
.super Lorg/apache/thrift/protocol/TBinaryProtocol$Factory;
.source "XmPushTBinaryProtocol.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lorg/apache/thrift/protocol/TBinaryProtocol$Factory;-><init>(ZZ)V

    return-void
.end method

.method public constructor <init>(ZZI)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/thrift/protocol/TBinaryProtocol$Factory;-><init>(ZZI)V

    return-void
.end method


# virtual methods
.method public getProtocol(Lorg/apache/thrift/transport/TTransport;)Lorg/apache/thrift/protocol/TProtocol;
    .locals 3

    new-instance v0, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;

    iget-boolean v1, p0, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol$Factory;->strictRead_:Z

    iget-boolean v2, p0, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol$Factory;->strictWrite_:Z

    invoke-direct {v0, p1, v1, v2}, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol;-><init>(Lorg/apache/thrift/transport/TTransport;ZZ)V

    iget p1, p0, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol$Factory;->readLength_:I

    if-eqz p1, :cond_0

    iget p1, p0, Lorg/apache/thrift/protocol/XmPushTBinaryProtocol$Factory;->readLength_:I

    invoke-virtual {v0, p1}, Lorg/apache/thrift/protocol/TBinaryProtocol;->setReadLength(I)V

    :cond_0
    return-object v0
.end method
