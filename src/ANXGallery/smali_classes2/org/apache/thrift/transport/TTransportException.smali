.class public Lorg/apache/thrift/transport/TTransportException;
.super Lorg/apache/thrift/TException;
.source "TTransportException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field protected type_:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lorg/apache/thrift/TException;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/thrift/transport/TTransportException;->type_:I

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Lorg/apache/thrift/TException;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/thrift/transport/TTransportException;->type_:I

    iput p1, p0, Lorg/apache/thrift/transport/TTransportException;->type_:I

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p2}, Lorg/apache/thrift/TException;-><init>(Ljava/lang/String;)V

    const/4 p2, 0x0

    iput p2, p0, Lorg/apache/thrift/transport/TTransportException;->type_:I

    iput p1, p0, Lorg/apache/thrift/transport/TTransportException;->type_:I

    return-void
.end method

.method public constructor <init>(ILjava/lang/Throwable;)V
    .locals 0

    invoke-direct {p0, p2}, Lorg/apache/thrift/TException;-><init>(Ljava/lang/Throwable;)V

    const/4 p2, 0x0

    iput p2, p0, Lorg/apache/thrift/transport/TTransportException;->type_:I

    iput p1, p0, Lorg/apache/thrift/transport/TTransportException;->type_:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/apache/thrift/TException;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    iput p1, p0, Lorg/apache/thrift/transport/TTransportException;->type_:I

    return-void
.end method
