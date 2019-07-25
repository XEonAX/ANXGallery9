.class public Lcn/kuaipan/android/kss/download/KssAccessor;
.super Ljava/lang/Object;
.source "KssAccessor.java"


# instance fields
.field private mClosed:Z

.field private mFileAccessor:Ljava/io/RandomAccessFile;

.field private mFilelocker:Ljava/nio/channels/FileLock;

.field private final mLocker:Ljava/util/concurrent/locks/ReentrantLock;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mClosed:Z

    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mLocker:Ljava/util/concurrent/locks/ReentrantLock;

    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "rws"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFileAccessor:Ljava/io/RandomAccessFile;

    iget-object v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFileAccessor:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->tryLock()Ljava/nio/channels/FileLock;

    move-result-object v0

    iput-object v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFilelocker:Ljava/nio/channels/FileLock;

    iget-object v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFilelocker:Ljava/nio/channels/FileLock;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed Lock the target file: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mClosed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mClosed:Z

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFilelocker:Ljava/nio/channels/FileLock;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFilelocker:Ljava/nio/channels/FileLock;

    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->release()V

    iput-object v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFilelocker:Ljava/nio/channels/FileLock;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    iget-object v1, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFileAccessor:Ljava/io/RandomAccessFile;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFileAccessor:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    iput-object v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFileAccessor:Ljava/io/RandomAccessFile;

    :cond_2
    return-void

    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFileAccessor:Ljava/io/RandomAccessFile;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFileAccessor:Ljava/io/RandomAccessFile;

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    iput-object v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFileAccessor:Ljava/io/RandomAccessFile;

    :cond_3
    throw v1
.end method

.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcn/kuaipan/android/kss/download/KssAccessor;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void

    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public inflate(J)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mClosed:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcn/kuaipan/android/kss/download/KssAccessor;->lock()V

    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFileAccessor:Ljava/io/RandomAccessFile;

    const-wide/16 v1, 0x1

    sub-long/2addr p1, v1

    invoke-virtual {v0, p1, p2}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object p1, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFileAccessor:Ljava/io/RandomAccessFile;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/io/RandomAccessFile;->write(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Lcn/kuaipan/android/kss/download/KssAccessor;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    invoke-virtual {p0}, Lcn/kuaipan/android/kss/download/KssAccessor;->unlock()V

    throw p1

    :cond_0
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1}, Ljava/io/IOException;-><init>()V

    throw p1
.end method

.method public lock()V
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mLocker:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    return-void
.end method

.method public sha1(JJ)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mClosed:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcn/kuaipan/android/kss/download/KssAccessor;->lock()V

    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFileAccessor:Ljava/io/RandomAccessFile;

    invoke-static {v0, p1, p2, p3, p4}, Lcn/kuaipan/android/utils/Encode;->SHA1Encode(Ljava/io/RandomAccessFile;JJ)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Lcn/kuaipan/android/kss/download/KssAccessor;->unlock()V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-virtual {p0}, Lcn/kuaipan/android/kss/download/KssAccessor;->unlock()V

    throw p1

    :cond_0
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1}, Ljava/io/IOException;-><init>()V

    throw p1
.end method

.method public unlock()V
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mLocker:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void
.end method

.method public write([BIILcn/kuaipan/android/kss/download/LoadRecorder;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mClosed:Z

    if-nez v0, :cond_3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcn/kuaipan/android/kss/download/KssAccessor;->lock()V

    if-eqz p4, :cond_0

    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFileAccessor:Ljava/io/RandomAccessFile;

    invoke-virtual {p4}, Lcn/kuaipan/android/kss/download/LoadRecorder;->getStart()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    int-to-long v0, p3

    invoke-virtual {p4}, Lcn/kuaipan/android/kss/download/LoadRecorder;->size()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int p3, v0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    :goto_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/download/KssAccessor;->mFileAccessor:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/RandomAccessFile;->write([BII)V

    if-eqz p4, :cond_1

    invoke-virtual {p4, p3}, Lcn/kuaipan/android/kss/download/LoadRecorder;->add(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    invoke-virtual {p0}, Lcn/kuaipan/android/kss/download/KssAccessor;->unlock()V

    return p3

    :goto_1
    invoke-virtual {p0}, Lcn/kuaipan/android/kss/download/KssAccessor;->unlock()V

    throw p1

    :cond_2
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V

    throw p1

    :cond_3
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1}, Ljava/io/IOException;-><init>()V

    throw p1
.end method
