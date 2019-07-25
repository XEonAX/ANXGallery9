.class public Lcn/kuaipan/android/utils/RandomFileInputStream;
.super Ljava/io/InputStream;
.source "RandomFileInputStream.java"


# instance fields
.field private closed:Z

.field private final file:Ljava/io/File;

.field private markedPos:J

.field private pos:J

.field private rFile:Ljava/io/RandomAccessFile;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->pos:J

    iput-wide v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->markedPos:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->closed:Z

    iput-object p1, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->file:Ljava/io/File;

    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "r"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->rFile:Ljava/io/RandomAccessFile;

    return-void
.end method


# virtual methods
.method public declared-synchronized available()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->rFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v0

    iget-wide v2, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->pos:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v4, 0x0

    sub-long/2addr v0, v2

    long-to-int v0, v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->rFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getCurrentPos()J
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->pos:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public mark(I)V
    .locals 2

    iget-boolean p1, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->closed:Z

    if-nez p1, :cond_0

    iget-wide v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->pos:J

    iput-wide v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->markedPos:J

    :cond_0
    return-void
.end method

.method public markSupported()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public declared-synchronized moveToPos(J)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->rFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v0

    cmp-long v2, p1, v0

    if-gez v2, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->rFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2}, Ljava/io/RandomAccessFile;->seek(J)V

    iput-wide p1, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->pos:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Seek possion is not availabel"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized read()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->rFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->read()I

    move-result v0

    if-ltz v0, :cond_0

    iget-wide v1, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->pos:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->pos:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return v0

    :cond_1
    :try_start_1
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized read([B)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->rFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1}, Ljava/io/RandomAccessFile;->read([B)I

    move-result p1

    if-lez p1, :cond_0

    iget-wide v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->pos:J

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->pos:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return p1

    :cond_1
    :try_start_1
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
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
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->rFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result p1

    if-lez p1, :cond_0

    iget-wide p2, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->pos:J

    int-to-long v0, p1

    add-long/2addr p2, v0

    iput-wide p2, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->pos:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return p1

    :cond_1
    :try_start_1
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized reset()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->closed:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->closed:Z

    new-instance v0, Ljava/io/RandomAccessFile;

    iget-object v1, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->file:Ljava/io/File;

    const-string v2, "r"

    invoke-direct {v0, v1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->rFile:Ljava/io/RandomAccessFile;

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->rFile:Ljava/io/RandomAccessFile;

    iget-wide v1, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->markedPos:J

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-wide v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->markedPos:J

    iput-wide v0, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->pos:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public skip(J)J
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    return-wide v0

    :cond_0
    cmp-long v2, p1, v0

    if-ltz v2, :cond_5

    const-wide/16 v2, 0x2000

    cmp-long v4, p1, v2

    if-gez v4, :cond_1

    long-to-int v2, p1

    goto :goto_0

    :cond_1
    const/16 v2, 0x2000

    :goto_0
    monitor-enter p0

    int-to-long v3, v2

    :try_start_0
    div-long/2addr p1, v3

    move-wide v5, v0

    :goto_1
    cmp-long v7, p1, v0

    if-ltz v7, :cond_4

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v7

    if-nez v7, :cond_3

    iget-object v7, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->rFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v7, v2}, Ljava/io/RandomAccessFile;->skipBytes(I)I

    move-result v7

    int-to-long v7, v7

    add-long/2addr v5, v7

    iget-wide v9, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->pos:J

    const/4 v11, 0x0

    add-long/2addr v9, v7

    iput-wide v9, p0, Lcn/kuaipan/android/utils/RandomFileInputStream;->pos:J

    cmp-long v9, v7, v3

    if-gez v9, :cond_2

    monitor-exit p0

    return-wide v5

    :cond_2
    const-wide/16 v7, 0x1

    sub-long/2addr p1, v7

    goto :goto_1

    :cond_3
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V

    throw p1

    :cond_4
    monitor-exit p0

    return-wide v5

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_5
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Number of bytes to skip cannot be negative"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
