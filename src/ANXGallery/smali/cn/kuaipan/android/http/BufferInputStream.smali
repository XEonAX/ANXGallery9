.class public Lcn/kuaipan/android/http/BufferInputStream;
.super Ljava/io/InputStream;
.source "BufferInputStream.java"


# static fields
.field private static final tempBuf:[B


# instance fields
.field private buf:Lcn/kuaipan/android/http/RandomInputBuffer;

.field private markpos:I

.field private pos:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x2000

    new-array v0, v0, [B

    sput-object v0, Lcn/kuaipan/android/http/BufferInputStream;->tempBuf:[B

    return-void
.end method

.method public constructor <init>(Lcn/kuaipan/android/http/RandomInputBuffer;)V
    .locals 1

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcn/kuaipan/android/http/BufferInputStream;->markpos:I

    iput-object p1, p0, Lcn/kuaipan/android/http/BufferInputStream;->buf:Lcn/kuaipan/android/http/RandomInputBuffer;

    return-void
.end method

.method private streamClosed()Ljava/io/IOException;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/io/IOException;

    const-string v1, "BufferedInputStream is closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public available()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcn/kuaipan/android/http/BufferInputStream;->buf:Lcn/kuaipan/android/http/RandomInputBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/http/BufferInputStream;->buf:Lcn/kuaipan/android/http/RandomInputBuffer;

    iget v1, p0, Lcn/kuaipan/android/http/BufferInputStream;->pos:I

    invoke-virtual {v0, v1}, Lcn/kuaipan/android/http/RandomInputBuffer;->available(I)I

    move-result v0

    return v0

    :cond_0
    invoke-direct {p0}, Lcn/kuaipan/android/http/BufferInputStream;->streamClosed()Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    iput-object v0, p0, Lcn/kuaipan/android/http/BufferInputStream;->buf:Lcn/kuaipan/android/http/RandomInputBuffer;

    return-void
.end method

.method public declared-synchronized mark(I)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iget p1, p0, Lcn/kuaipan/android/http/BufferInputStream;->pos:I

    iput p1, p0, Lcn/kuaipan/android/http/BufferInputStream;->markpos:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public markSupported()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public declared-synchronized read()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/http/BufferInputStream;->buf:Lcn/kuaipan/android/http/RandomInputBuffer;

    if-eqz v0, :cond_1

    iget v1, p0, Lcn/kuaipan/android/http/BufferInputStream;->pos:I

    invoke-virtual {v0, v1}, Lcn/kuaipan/android/http/RandomInputBuffer;->read(I)I

    move-result v0

    if-ltz v0, :cond_0

    iget v1, p0, Lcn/kuaipan/android/http/BufferInputStream;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcn/kuaipan/android/http/BufferInputStream;->pos:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return v0

    :cond_1
    :try_start_1
    invoke-direct {p0}, Lcn/kuaipan/android/http/BufferInputStream;->streamClosed()Ljava/io/IOException;

    move-result-object v0

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized read([BII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/http/BufferInputStream;->buf:Lcn/kuaipan/android/http/RandomInputBuffer;

    if-eqz v0, :cond_1

    iget v1, p0, Lcn/kuaipan/android/http/BufferInputStream;->pos:I

    invoke-virtual {v0, v1, p1, p2, p3}, Lcn/kuaipan/android/http/RandomInputBuffer;->read(I[BII)I

    move-result p1

    if-lez p1, :cond_0

    iget p2, p0, Lcn/kuaipan/android/http/BufferInputStream;->pos:I

    add-int/2addr p2, p1

    iput p2, p0, Lcn/kuaipan/android/http/BufferInputStream;->pos:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return p1

    :cond_1
    :try_start_1
    invoke-direct {p0}, Lcn/kuaipan/android/http/BufferInputStream;->streamClosed()Ljava/io/IOException;

    move-result-object p1

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized reset()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/http/BufferInputStream;->buf:Lcn/kuaipan/android/http/RandomInputBuffer;

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    iget v1, p0, Lcn/kuaipan/android/http/BufferInputStream;->markpos:I

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcn/kuaipan/android/http/BufferInputStream;->markpos:I

    iput v0, p0, Lcn/kuaipan/android/http/BufferInputStream;->pos:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Mark has been invalidated."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream is closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized skip(J)J
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    const-wide/16 v0, 0x1

    cmp-long v2, p1, v0

    if-gez v2, :cond_0

    const-wide/16 p1, 0x0

    monitor-exit p0

    return-wide p1

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/http/BufferInputStream;->buf:Lcn/kuaipan/android/http/RandomInputBuffer;

    if-eqz v0, :cond_2

    iget v1, p0, Lcn/kuaipan/android/http/BufferInputStream;->pos:I

    int-to-long v1, v1

    add-long/2addr v1, p1

    const/4 p1, 0x0

    const/4 p2, 0x0

    :goto_0
    iget v3, p0, Lcn/kuaipan/android/http/BufferInputStream;->pos:I

    int-to-long v3, v3

    cmp-long v5, v1, v3

    if-lez v5, :cond_1

    iget v3, p0, Lcn/kuaipan/android/http/BufferInputStream;->pos:I

    sget-object v4, Lcn/kuaipan/android/http/BufferInputStream;->tempBuf:[B

    sget-object v5, Lcn/kuaipan/android/http/BufferInputStream;->tempBuf:[B

    array-length v5, v5

    int-to-long v5, v5

    iget v7, p0, Lcn/kuaipan/android/http/BufferInputStream;->pos:I

    int-to-long v7, v7

    sub-long v7, v1, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v5, v5

    invoke-virtual {v0, v3, v4, p1, v5}, Lcn/kuaipan/android/http/RandomInputBuffer;->read(I[BII)I

    move-result v3

    if-ltz v3, :cond_1

    iget v4, p0, Lcn/kuaipan/android/http/BufferInputStream;->pos:I

    add-int/2addr v4, v3

    iput v4, p0, Lcn/kuaipan/android/http/BufferInputStream;->pos:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/2addr p2, v3

    goto :goto_0

    :cond_1
    int-to-long p1, p2

    monitor-exit p0

    return-wide p1

    :cond_2
    :try_start_1
    invoke-direct {p0}, Lcn/kuaipan/android/http/BufferInputStream;->streamClosed()Ljava/io/IOException;

    move-result-object p1

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
