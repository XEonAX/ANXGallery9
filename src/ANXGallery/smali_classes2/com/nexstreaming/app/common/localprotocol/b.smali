.class public Lcom/nexstreaming/app/common/localprotocol/b;
.super Ljava/lang/Object;
.source "nexClient.java"


# instance fields
.field a:Landroid/net/LocalSocket;

.field private b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/app/common/localprotocol/b;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a(SIZ)Lcom/nexstreaming/app/common/localprotocol/c$a;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/app/common/localprotocol/b;->a:Landroid/net/LocalSocket;

    if-eqz v0, :cond_2

    const/16 v1, 0x10

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    array-length v3, v3

    invoke-static {v0, v2, v3}, Lcom/nexstreaming/app/common/localprotocol/c;->a(Landroid/net/LocalSocket;[BI)V

    invoke-static {v1, p2, p3}, Lcom/nexstreaming/app/common/localprotocol/c;->a(Ljava/nio/ByteBuffer;IZ)Lcom/nexstreaming/app/common/localprotocol/c$b;

    move-result-object p2

    iget-boolean p3, p2, Lcom/nexstreaming/app/common/localprotocol/c$b;->b:Z

    if-eqz p3, :cond_1

    iget p3, p2, Lcom/nexstreaming/app/common/localprotocol/c$b;->d:I

    if-ne p1, p3, :cond_0

    new-instance p1, Lcom/nexstreaming/app/common/localprotocol/c$a;

    invoke-direct {p1, p2}, Lcom/nexstreaming/app/common/localprotocol/c$a;-><init>(Lcom/nexstreaming/app/common/localprotocol/c$b;)V

    iget p2, p2, Lcom/nexstreaming/app/common/localprotocol/c$b;->g:I

    new-array p2, p2, [B

    iput-object p2, p1, Lcom/nexstreaming/app/common/localprotocol/c$a;->a:[B

    iget-object p2, p1, Lcom/nexstreaming/app/common/localprotocol/c$a;->a:[B

    iget-object p3, p1, Lcom/nexstreaming/app/common/localprotocol/c$a;->a:[B

    array-length p3, p3

    invoke-static {v0, p2, p3}, Lcom/nexstreaming/app/common/localprotocol/c;->a(Landroid/net/LocalSocket;[BI)V

    return-object p1

    :cond_0
    const-string p1, "nexClient"

    const-string p2, "\'receive\' command is invalid. "

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p1, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {p1}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "\'receive\' Header is invalid. error="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p2, Lcom/nexstreaming/app/common/localprotocol/c$b;->f:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "nexClient"

    invoke-static {p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p1, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {p1}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    throw p1

    :cond_2
    const-string p1, "nexClient"

    const-string p2, "\'receive\' request on closed Socket "

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p1, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {p1}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    throw p1
.end method

.method public a(SI[B)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/app/common/localprotocol/b;->a:Landroid/net/LocalSocket;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    array-length v2, p3

    invoke-static {p1, p2, v2}, Lcom/nexstreaming/app/common/localprotocol/c;->a(SII)[B

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {v0}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/io/OutputStream;->write([B)V

    return-void

    :cond_0
    const-string p1, "nexClient"

    const-string p2, "\'send\' request on closed Socket "

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p1, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {p1}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    throw p1
.end method

.method public a()Z
    .locals 4

    new-instance v0, Landroid/net/LocalSocket;

    invoke-direct {v0}, Landroid/net/LocalSocket;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/app/common/localprotocol/b;->a:Landroid/net/LocalSocket;

    :try_start_0
    iget-object v0, p0, Lcom/nexstreaming/app/common/localprotocol/b;->a:Landroid/net/LocalSocket;

    new-instance v1, Landroid/net/LocalSocketAddress;

    iget-object v2, p0, Lcom/nexstreaming/app/common/localprotocol/b;->b:Ljava/lang/String;

    invoke-direct {v1, v2}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    const-string v1, "nexClient"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " while connect Socket"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return v0
.end method

.method public b()Z
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/nexstreaming/app/common/localprotocol/b;->a:Landroid/net/LocalSocket;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/nexstreaming/app/common/localprotocol/b;->a:Landroid/net/LocalSocket;

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    :try_start_1
    invoke-virtual {v0}, Landroid/net/LocalSocket;->shutdownInput()V

    invoke-virtual {v0}, Landroid/net/LocalSocket;->shutdownOutput()V

    invoke-virtual {v0}, Landroid/net/LocalSocket;->close()V

    const-string v0, "nexClient"

    const-string v1, "Socket is closed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    const-string v1, "nexClient"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " while closing Socket"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const/4 v0, 0x0

    return v0

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method
