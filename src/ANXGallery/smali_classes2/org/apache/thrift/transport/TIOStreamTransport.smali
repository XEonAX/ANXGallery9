.class public Lorg/apache/thrift/transport/TIOStreamTransport;
.super Lorg/apache/thrift/transport/TTransport;
.source "TIOStreamTransport.java"


# instance fields
.field protected inputStream_:Ljava/io/InputStream;

.field protected outputStream_:Ljava/io/OutputStream;


# direct methods
.method protected constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lorg/apache/thrift/transport/TTransport;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/thrift/transport/TIOStreamTransport;->inputStream_:Ljava/io/InputStream;

    iput-object v0, p0, Lorg/apache/thrift/transport/TIOStreamTransport;->outputStream_:Ljava/io/OutputStream;

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1

    invoke-direct {p0}, Lorg/apache/thrift/transport/TTransport;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/thrift/transport/TIOStreamTransport;->inputStream_:Ljava/io/InputStream;

    iput-object v0, p0, Lorg/apache/thrift/transport/TIOStreamTransport;->outputStream_:Ljava/io/OutputStream;

    iput-object p1, p0, Lorg/apache/thrift/transport/TIOStreamTransport;->outputStream_:Ljava/io/OutputStream;

    return-void
.end method


# virtual methods
.method public read([BII)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/transport/TTransportException;
        }
    .end annotation

    iget-object v0, p0, Lorg/apache/thrift/transport/TIOStreamTransport;->inputStream_:Ljava/io/InputStream;

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lorg/apache/thrift/transport/TIOStreamTransport;->inputStream_:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-ltz p1, :cond_0

    return p1

    :cond_0
    new-instance p1, Lorg/apache/thrift/transport/TTransportException;

    const/4 p2, 0x4

    invoke-direct {p1, p2}, Lorg/apache/thrift/transport/TTransportException;-><init>(I)V

    throw p1

    :catch_0
    move-exception p1

    new-instance p2, Lorg/apache/thrift/transport/TTransportException;

    const/4 p3, 0x0

    invoke-direct {p2, p3, p1}, Lorg/apache/thrift/transport/TTransportException;-><init>(ILjava/lang/Throwable;)V

    throw p2

    :cond_1
    new-instance p1, Lorg/apache/thrift/transport/TTransportException;

    const/4 p2, 0x1

    const-string p3, "Cannot read from null inputStream"

    invoke-direct {p1, p2, p3}, Lorg/apache/thrift/transport/TTransportException;-><init>(ILjava/lang/String;)V

    throw p1
.end method

.method public write([BII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/thrift/transport/TTransportException;
        }
    .end annotation

    iget-object v0, p0, Lorg/apache/thrift/transport/TIOStreamTransport;->outputStream_:Ljava/io/OutputStream;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lorg/apache/thrift/transport/TIOStreamTransport;->outputStream_:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    new-instance p2, Lorg/apache/thrift/transport/TTransportException;

    const/4 p3, 0x0

    invoke-direct {p2, p3, p1}, Lorg/apache/thrift/transport/TTransportException;-><init>(ILjava/lang/Throwable;)V

    throw p2

    :cond_0
    new-instance p1, Lorg/apache/thrift/transport/TTransportException;

    const/4 p2, 0x1

    const-string p3, "Cannot write to null outputStream"

    invoke-direct {p1, p2, p3}, Lorg/apache/thrift/transport/TTransportException;-><init>(ILjava/lang/String;)V

    throw p1
.end method
