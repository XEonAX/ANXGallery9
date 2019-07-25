.class public Lcom/miui/gallery/util/uil/BlobCache;
.super Ljava/lang/Object;
.source "BlobCache.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;
    }
.end annotation


# instance fields
.field private mActiveBytes:I

.field private mActiveDataFile:Ljava/io/RandomAccessFile;

.field private mActiveEntries:I

.field private mActiveHashStart:I

.field private mActiveRegion:I

.field private mAdler32:Ljava/util/zip/Adler32;

.field private mBlobHeader:[B

.field private mDataFile0:Ljava/io/RandomAccessFile;

.field private mDataFile1:Ljava/io/RandomAccessFile;

.field private mFileOffset:I

.field private mInactiveDataFile:Ljava/io/RandomAccessFile;

.field private mInactiveHashStart:I

.field private mIndexBuffer:Ljava/nio/MappedByteBuffer;

.field private mIndexChannel:Ljava/nio/channels/FileChannel;

.field private mIndexFile:Ljava/io/RandomAccessFile;

.field private mIndexHeader:[B

.field private mLookupRequest:Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;

.field private mMaxBytes:I

.field private mMaxEntries:I

.field private mSlotOffset:I

.field private mVersion:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IIZI)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x20

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexHeader:[B

    const/16 v0, 0x14

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mBlobHeader:[B

    new-instance v0, Ljava/util/zip/Adler32;

    invoke-direct {v0}, Ljava/util/zip/Adler32;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mAdler32:Ljava/util/zip/Adler32;

    new-instance v0, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;

    invoke-direct {v0}, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mLookupRequest:Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;

    new-instance v0, Ljava/io/RandomAccessFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".idx"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "rw"

    invoke-direct {v0, v1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    new-instance v0, Ljava/io/RandomAccessFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "rw"

    invoke-direct {v0, v1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    new-instance v0, Ljava/io/RandomAccessFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".1"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "rw"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    iput p5, p0, Lcom/miui/gallery/util/uil/BlobCache;->mVersion:I

    if-nez p4, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/BlobCache;->loadIndex()Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0, p2, p3}, Lcom/miui/gallery/util/uil/BlobCache;->resetCache(II)V

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/BlobCache;->loadIndex()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/util/uil/BlobCache;->closeAll()V

    new-instance p1, Ljava/io/IOException;

    const-string p2, "unable to load index"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private clearHash(I)V
    .locals 5

    const/16 v0, 0x400

    new-array v1, v0, [B

    iget-object v2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    invoke-virtual {v2, p1}, Ljava/nio/MappedByteBuffer;->position(I)Ljava/nio/Buffer;

    iget p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxEntries:I

    mul-int/lit8 p1, p1, 0xc

    :goto_0
    if-lez p1, :cond_0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    const/4 v4, 0x0

    invoke-virtual {v3, v1, v4, v2}, Ljava/nio/MappedByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    sub-int/2addr p1, v2

    goto :goto_0

    :cond_0
    return-void
.end method

.method private closeAll()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexChannel:Ljava/nio/channels/FileChannel;

    invoke-static {v0}, Lcom/miui/gallery/util/uil/BlobCache;->closeSilently(Ljava/io/Closeable;)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    invoke-static {v0}, Lcom/miui/gallery/util/uil/BlobCache;->closeSilently(Ljava/io/Closeable;)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    invoke-static {v0}, Lcom/miui/gallery/util/uil/BlobCache;->closeSilently(Ljava/io/Closeable;)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    invoke-static {v0}, Lcom/miui/gallery/util/uil/BlobCache;->closeSilently(Ljava/io/Closeable;)V

    return-void
.end method

.method static closeSilently(Ljava/io/Closeable;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method private static deleteFileSilently(Ljava/lang/String;)V
    .locals 1

    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public static deleteFiles(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".idx"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/uil/BlobCache;->deleteFileSilently(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/uil/BlobCache;->deleteFileSilently(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".1"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/util/uil/BlobCache;->deleteFileSilently(Ljava/lang/String;)V

    return-void
.end method

.method private flipRegion()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveRegion:I

    rsub-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveRegion:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveEntries:I

    const/4 v0, 0x4

    iput v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveBytes:I

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexHeader:[B

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveRegion:I

    const/16 v2, 0xc

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexHeader:[B

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveEntries:I

    const/16 v2, 0x10

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexHeader:[B

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveBytes:I

    const/16 v2, 0x14

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/BlobCache;->updateIndexHeader()V

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/BlobCache;->setActiveVariables()V

    iget v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveHashStart:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/util/uil/BlobCache;->clearHash(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/BlobCache;->syncIndex()V

    return-void
.end method

.method private getBlob(Ljava/io/RandomAccessFile;ILcom/miui/gallery/util/uil/BlobCache$LookupRequest;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mBlobHeader:[B

    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v1

    int-to-long v3, p2

    const/4 v5, 0x0

    :try_start_0
    invoke-virtual {p1, v3, v4}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-virtual {p1, v0}, Ljava/io/RandomAccessFile;->read([B)I

    move-result v3

    const/16 v4, 0x14

    if-eq v3, v4, :cond_0

    const-string p2, "BlobCache"

    const-string p3, "cannot read blob header"

    invoke-static {p2, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p1, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    return v5

    :cond_0
    :try_start_1
    invoke-static {v0, v5}, Lcom/miui/gallery/util/uil/BlobCache;->readLong([BI)J

    move-result-wide v6
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-wide/16 v8, 0x0

    cmp-long v3, v6, v8

    if-nez v3, :cond_1

    invoke-virtual {p1, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    return v5

    :cond_1
    :try_start_2
    iget-wide v8, p3, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->key:J

    cmp-long v3, v6, v8

    if-eqz v3, :cond_2

    const-string p2, "BlobCache"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "blob key does not match: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-virtual {p1, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    return v5

    :cond_2
    const/16 v3, 0x8

    :try_start_3
    invoke-static {v0, v3}, Lcom/miui/gallery/util/uil/BlobCache;->readInt([BI)I

    move-result v3

    const/16 v6, 0xc

    invoke-static {v0, v6}, Lcom/miui/gallery/util/uil/BlobCache;->readInt([BI)I

    move-result v6

    if-eq v6, p2, :cond_3

    const-string p2, "BlobCache"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "blob offset does not match: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    invoke-virtual {p1, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    return v5

    :cond_3
    const/16 v6, 0x10

    :try_start_4
    invoke-static {v0, v6}, Lcom/miui/gallery/util/uil/BlobCache;->readInt([BI)I

    move-result v0

    if-ltz v0, :cond_9

    iget v6, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxBytes:I

    sub-int/2addr v6, p2

    sub-int/2addr v6, v4

    if-le v0, v6, :cond_4

    goto :goto_0

    :cond_4
    iget-object p2, p3, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->buffer:[B

    if-eqz p2, :cond_5

    iget-object p2, p3, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->buffer:[B

    array-length p2, p2

    if-ge p2, v0, :cond_6

    :cond_5
    new-array p2, v0, [B

    iput-object p2, p3, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->buffer:[B

    :cond_6
    iget-object p2, p3, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->buffer:[B

    iput v0, p3, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->length:I

    invoke-virtual {p1, p2, v5, v0}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result p3

    if-eq p3, v0, :cond_7

    const-string p2, "BlobCache"

    const-string p3, "cannot read blob data"

    invoke-static {p2, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    invoke-virtual {p1, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    return v5

    :cond_7
    :try_start_5
    invoke-virtual {p0, p2, v5, v0}, Lcom/miui/gallery/util/uil/BlobCache;->checkSum([BII)I

    move-result p2

    if-eq p2, v3, :cond_8

    const-string p2, "BlobCache"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "blob checksum does not match: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    invoke-virtual {p1, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    return v5

    :cond_8
    const/4 p2, 0x1

    invoke-virtual {p1, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    return p2

    :cond_9
    :goto_0
    :try_start_6
    const-string p2, "BlobCache"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid blob length: "

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    invoke-virtual {p1, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    return v5

    :catchall_0
    move-exception p2

    goto :goto_1

    :catch_0
    move-exception p2

    :try_start_7
    const-string p3, "BlobCache"

    const-string v0, "getBlob failed."

    invoke-static {p3, v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    invoke-virtual {p1, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    return v5

    :goto_1
    invoke-virtual {p1, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    throw p2
.end method

.method private insertInternal(J[BI)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mBlobHeader:[B

    invoke-virtual {p0, p3}, Lcom/miui/gallery/util/uil/BlobCache;->checkSum([B)I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v0, v2, p1, p2}, Lcom/miui/gallery/util/uil/BlobCache;->writeLong([BIJ)V

    const/16 v3, 0x8

    invoke-static {v0, v3, v1}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveBytes:I

    const/16 v4, 0xc

    invoke-static {v0, v4, v1}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    const/16 v1, 0x10

    invoke-static {v0, v1, p4}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    iget-object v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveDataFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v1, v0}, Ljava/io/RandomAccessFile;->write([B)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveDataFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p3, v2, p4}, Ljava/io/RandomAccessFile;->write([BII)V

    iget-object p3, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    iget v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mSlotOffset:I

    invoke-virtual {p3, v0, p1, p2}, Ljava/nio/MappedByteBuffer;->putLong(IJ)Ljava/nio/ByteBuffer;

    iget-object p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    iget p2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mSlotOffset:I

    add-int/2addr p2, v3

    iget p3, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveBytes:I

    invoke-virtual {p1, p2, p3}, Ljava/nio/MappedByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    iget p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveBytes:I

    const/16 p2, 0x14

    add-int/2addr p4, p2

    add-int/2addr p1, p4

    iput p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveBytes:I

    iget-object p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexHeader:[B

    iget p3, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveBytes:I

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    return-void
.end method

.method private loadIndex()Z
    .locals 12

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexHeader:[B

    iget-object v2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v1}, Ljava/io/RandomAccessFile;->read([B)I

    move-result v2

    const/16 v3, 0x20

    if-eq v2, v3, :cond_0

    const-string v1, "BlobCache"

    const-string v2, "cannot read header"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_0
    invoke-static {v1, v0}, Lcom/miui/gallery/util/uil/BlobCache;->readInt([BI)I

    move-result v2

    const v4, -0x4cd8cfd0

    if-eq v2, v4, :cond_1

    const-string v1, "BlobCache"

    const-string v2, "cannot read header magic"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_1
    const/16 v2, 0x18

    invoke-static {v1, v2}, Lcom/miui/gallery/util/uil/BlobCache;->readInt([BI)I

    move-result v2

    iget v4, p0, Lcom/miui/gallery/util/uil/BlobCache;->mVersion:I

    if-eq v2, v4, :cond_2

    const-string v1, "BlobCache"

    const-string v2, "version mismatch"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_2
    const/4 v2, 0x4

    invoke-static {v1, v2}, Lcom/miui/gallery/util/uil/BlobCache;->readInt([BI)I

    move-result v4

    iput v4, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxEntries:I

    const/16 v4, 0x8

    invoke-static {v1, v4}, Lcom/miui/gallery/util/uil/BlobCache;->readInt([BI)I

    move-result v4

    iput v4, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxBytes:I

    const/16 v4, 0xc

    invoke-static {v1, v4}, Lcom/miui/gallery/util/uil/BlobCache;->readInt([BI)I

    move-result v5

    iput v5, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveRegion:I

    const/16 v5, 0x10

    invoke-static {v1, v5}, Lcom/miui/gallery/util/uil/BlobCache;->readInt([BI)I

    move-result v5

    iput v5, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveEntries:I

    const/16 v5, 0x14

    invoke-static {v1, v5}, Lcom/miui/gallery/util/uil/BlobCache;->readInt([BI)I

    move-result v5

    iput v5, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveBytes:I

    const/16 v5, 0x1c

    invoke-static {v1, v5}, Lcom/miui/gallery/util/uil/BlobCache;->readInt([BI)I

    move-result v6

    invoke-virtual {p0, v1, v0, v5}, Lcom/miui/gallery/util/uil/BlobCache;->checkSum([BII)I

    move-result v1

    if-eq v1, v6, :cond_3

    const-string v1, "BlobCache"

    const-string v2, "header checksum does not match"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_3
    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxEntries:I

    if-gtz v1, :cond_4

    const-string v1, "BlobCache"

    const-string v2, "invalid max entries"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_4
    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxBytes:I

    if-gtz v1, :cond_5

    const-string v1, "BlobCache"

    const-string v2, "invalid max bytes"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_5
    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveRegion:I

    const/4 v5, 0x1

    if-eqz v1, :cond_6

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveRegion:I

    if-eq v1, v5, :cond_6

    const-string v1, "BlobCache"

    const-string v2, "invalid active region"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_6
    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveEntries:I

    if-ltz v1, :cond_f

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveEntries:I

    iget v6, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxEntries:I

    if-le v1, v6, :cond_7

    goto/16 :goto_1

    :cond_7
    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveBytes:I

    if-lt v1, v2, :cond_e

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveBytes:I

    iget v6, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxBytes:I

    if-le v1, v6, :cond_8

    goto/16 :goto_0

    :cond_8
    iget-object v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v6

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxEntries:I

    mul-int/lit8 v1, v1, 0xc

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v3

    int-to-long v3, v1

    cmp-long v1, v6, v3

    if-eqz v1, :cond_9

    const-string v1, "BlobCache"

    const-string v2, "invalid index file length"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_9
    new-array v1, v2, [B

    iget-object v3, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    invoke-virtual {v3, v1}, Ljava/io/RandomAccessFile;->read([B)I

    move-result v3

    if-eq v3, v2, :cond_a

    const-string v1, "BlobCache"

    const-string v2, "cannot read data file magic"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_a
    invoke-static {v1, v0}, Lcom/miui/gallery/util/uil/BlobCache;->readInt([BI)I

    move-result v3

    const v4, -0x42db7af0

    if-eq v3, v4, :cond_b

    const-string v1, "BlobCache"

    const-string v2, "invalid data file magic"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_b
    iget-object v3, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    invoke-virtual {v3, v1}, Ljava/io/RandomAccessFile;->read([B)I

    move-result v3

    if-eq v3, v2, :cond_c

    const-string v1, "BlobCache"

    const-string v2, "cannot read data file magic"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_c
    invoke-static {v1, v0}, Lcom/miui/gallery/util/uil/BlobCache;->readInt([BI)I

    move-result v1

    if-eq v1, v4, :cond_d

    const-string v1, "BlobCache"

    const-string v2, "invalid data file magic"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_d
    iget-object v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexChannel:Ljava/nio/channels/FileChannel;

    iget-object v6, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexChannel:Ljava/nio/channels/FileChannel;

    sget-object v7, Ljava/nio/channels/FileChannel$MapMode;->READ_WRITE:Ljava/nio/channels/FileChannel$MapMode;

    const-wide/16 v8, 0x0

    iget-object v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v10

    invoke-virtual/range {v6 .. v11}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    iget-object v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/MappedByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/BlobCache;->setActiveVariables()V

    return v5

    :cond_e
    :goto_0
    const-string v1, "BlobCache"

    const-string v2, "invalid active bytes"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_f
    :goto_1
    const-string v1, "BlobCache"

    const-string v2, "invalid active entries"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v1

    const-string v2, "BlobCache"

    const-string v3, "loadIndex failed."

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method private lookupInternal(JI)Z
    .locals 8

    iget v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxEntries:I

    int-to-long v0, v0

    rem-long v0, p1, v0

    long-to-int v0, v0

    if-gez v0, :cond_0

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxEntries:I

    add-int/2addr v0, v1

    :cond_0
    move v1, v0

    :cond_1
    :goto_0
    mul-int/lit8 v2, v1, 0xc

    add-int/2addr v2, p3

    iget-object v3, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    invoke-virtual {v3, v2}, Ljava/nio/MappedByteBuffer;->getLong(I)J

    move-result-wide v3

    iget-object v5, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    add-int/lit8 v6, v2, 0x8

    invoke-virtual {v5, v6}, Ljava/nio/MappedByteBuffer;->getInt(I)I

    move-result v5

    const/4 v6, 0x0

    if-nez v5, :cond_2

    iput v2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mSlotOffset:I

    return v6

    :cond_2
    cmp-long v7, v3, p1

    if-nez v7, :cond_3

    iput v2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mSlotOffset:I

    iput v5, p0, Lcom/miui/gallery/util/uil/BlobCache;->mFileOffset:I

    const/4 p1, 0x1

    return p1

    :cond_3
    add-int/lit8 v1, v1, 0x1

    iget v2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxEntries:I

    if-lt v1, v2, :cond_4

    const/4 v1, 0x0

    :cond_4
    if-ne v1, v0, :cond_1

    const-string v2, "BlobCache"

    const-string v3, "corrupted index: clear the slot."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    mul-int/lit8 v3, v1, 0xc

    add-int/2addr v3, p3

    add-int/lit8 v3, v3, 0x8

    invoke-virtual {v2, v3, v6}, Ljava/nio/MappedByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    goto :goto_0
.end method

.method static readInt([BI)I
    .locals 2

    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 p1, p1, 0x3

    aget-byte p0, p0, p1

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p0, p0, 0x18

    or-int/2addr p0, v0

    return p0
.end method

.method static readLong([BI)J
    .locals 5

    add-int/lit8 v0, p1, 0x7

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    int-to-long v0, v0

    const/4 v2, 0x6

    :goto_0
    if-ltz v2, :cond_0

    const/16 v3, 0x8

    shl-long/2addr v0, v3

    add-int v3, p1, v2

    aget-byte v3, p0, v3

    and-int/lit16 v3, v3, 0xff

    int-to-long v3, v3

    or-long/2addr v0, v3

    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_0
    return-wide v0
.end method

.method private resetCache(II)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->setLength(J)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    mul-int/lit8 v3, p1, 0xc

    mul-int/lit8 v3, v3, 0x2

    add-int/lit8 v3, v3, 0x20

    int-to-long v3, v3

    invoke-virtual {v0, v3, v4}, Ljava/io/RandomAccessFile;->setLength(J)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexHeader:[B

    const/4 v3, 0x0

    const v4, -0x4cd8cfd0

    invoke-static {v0, v3, v4}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    const/4 v4, 0x4

    invoke-static {v0, v4, p1}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    const/16 p1, 0x8

    invoke-static {v0, p1, p2}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    const/16 p1, 0xc

    invoke-static {v0, p1, v3}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    const/16 p1, 0x10

    invoke-static {v0, p1, v3}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    const/16 p1, 0x14

    invoke-static {v0, p1, v4}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    iget p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mVersion:I

    const/16 p2, 0x18

    invoke-static {v0, p2, p1}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    const/16 p1, 0x1c

    invoke-virtual {p0, v0, v3, p1}, Lcom/miui/gallery/util/uil/BlobCache;->checkSum([BII)I

    move-result p2

    invoke-static {v0, p1, p2}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    iget-object p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    invoke-virtual {p1, v0}, Ljava/io/RandomAccessFile;->write([B)V

    iget-object p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    invoke-virtual {p1, v1, v2}, Ljava/io/RandomAccessFile;->setLength(J)V

    iget-object p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    invoke-virtual {p1, v1, v2}, Ljava/io/RandomAccessFile;->setLength(J)V

    iget-object p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    invoke-virtual {p1, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    invoke-virtual {p1, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    const p1, -0x42db7af0

    invoke-static {v0, v3, p1}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    iget-object p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    invoke-virtual {p1, v0, v3, v4}, Ljava/io/RandomAccessFile;->write([BII)V

    iget-object p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    invoke-virtual {p1, v0, v3, v4}, Ljava/io/RandomAccessFile;->write([BII)V

    return-void
.end method

.method private setActiveVariables()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveRegion:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    :goto_0
    iput-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveDataFile:Ljava/io/RandomAccessFile;

    iget v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveRegion:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    :goto_1
    iput-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mInactiveDataFile:Ljava/io/RandomAccessFile;

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveDataFile:Ljava/io/RandomAccessFile;

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveBytes:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->setLength(J)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveDataFile:Ljava/io/RandomAccessFile;

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveBytes:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    const/16 v0, 0x20

    iput v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveHashStart:I

    iput v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mInactiveHashStart:I

    iget v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveRegion:I

    if-nez v0, :cond_2

    iget v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mInactiveHashStart:I

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxEntries:I

    mul-int/lit8 v1, v1, 0xc

    add-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mInactiveHashStart:I

    goto :goto_2

    :cond_2
    iget v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveHashStart:I

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxEntries:I

    mul-int/lit8 v1, v1, 0xc

    add-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveHashStart:I

    :goto_2
    return-void
.end method

.method private updateIndexHeader()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexHeader:[B

    iget-object v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexHeader:[B

    const/4 v2, 0x0

    const/16 v3, 0x1c

    invoke-virtual {p0, v1, v2, v3}, Lcom/miui/gallery/util/uil/BlobCache;->checkSum([BII)I

    move-result v1

    invoke-static {v0, v3, v1}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    invoke-virtual {v0, v2}, Ljava/nio/MappedByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    iget-object v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexHeader:[B

    invoke-virtual {v0, v1}, Ljava/nio/MappedByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    return-void
.end method

.method static writeInt([BII)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    add-int v1, p1, v0

    and-int/lit16 v2, p2, 0xff

    int-to-byte v2, v2

    aput-byte v2, p0, v1

    shr-int/lit8 p2, p2, 0x8

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method static writeLong([BIJ)V
    .locals 5

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x8

    if-ge v0, v1, :cond_0

    add-int v2, p1, v0

    const-wide/16 v3, 0xff

    and-long/2addr v3, p2

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, p0, v2

    shr-long/2addr p2, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method checkSum([B)I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mAdler32:Ljava/util/zip/Adler32;

    invoke-virtual {v0}, Ljava/util/zip/Adler32;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mAdler32:Ljava/util/zip/Adler32;

    invoke-virtual {v0, p1}, Ljava/util/zip/Adler32;->update([B)V

    iget-object p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mAdler32:Ljava/util/zip/Adler32;

    invoke-virtual {p1}, Ljava/util/zip/Adler32;->getValue()J

    move-result-wide v0

    long-to-int p1, v0

    return p1
.end method

.method checkSum([BII)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mAdler32:Ljava/util/zip/Adler32;

    invoke-virtual {v0}, Ljava/util/zip/Adler32;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mAdler32:Ljava/util/zip/Adler32;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/zip/Adler32;->update([BII)V

    iget-object p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mAdler32:Ljava/util/zip/Adler32;

    invoke-virtual {p1}, Ljava/util/zip/Adler32;->getValue()J

    move-result-wide p1

    long-to-int p1, p1

    return p1
.end method

.method public close()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/BlobCache;->syncAll()V

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/BlobCache;->closeAll()V

    return-void
.end method

.method public insert(J[B)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    array-length v0, p3

    add-int/lit8 v0, v0, 0x18

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxBytes:I

    if-gt v0, v1, :cond_3

    iget v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveBytes:I

    add-int/lit8 v0, v0, 0x14

    array-length v1, p3

    add-int/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxBytes:I

    if-gt v0, v1, :cond_0

    iget v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveEntries:I

    mul-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxEntries:I

    if-lt v0, v1, :cond_1

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/util/uil/BlobCache;->flipRegion()V

    :cond_1
    iget v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveHashStart:I

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/util/uil/BlobCache;->lookupInternal(JI)Z

    move-result v0

    if-nez v0, :cond_2

    iget v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveEntries:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveEntries:I

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexHeader:[B

    const/16 v1, 0x10

    iget v2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveEntries:I

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    :cond_2
    array-length v0, p3

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/miui/gallery/util/uil/BlobCache;->insertInternal(J[BI)V

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/BlobCache;->updateIndexHeader()V

    return-void

    :cond_3
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "blob is too large!"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public lookup(Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-wide v0, p1, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->key:J

    iget v2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveHashStart:I

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/util/uil/BlobCache;->lookupInternal(JI)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveDataFile:Ljava/io/RandomAccessFile;

    iget v2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mFileOffset:I

    invoke-direct {p0, v0, v2, p1}, Lcom/miui/gallery/util/uil/BlobCache;->getBlob(Ljava/io/RandomAccessFile;ILcom/miui/gallery/util/uil/BlobCache$LookupRequest;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mSlotOffset:I

    iget-wide v2, p1, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->key:J

    iget v4, p0, Lcom/miui/gallery/util/uil/BlobCache;->mInactiveHashStart:I

    invoke-direct {p0, v2, v3, v4}, Lcom/miui/gallery/util/uil/BlobCache;->lookupInternal(JI)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mInactiveDataFile:Ljava/io/RandomAccessFile;

    iget v3, p0, Lcom/miui/gallery/util/uil/BlobCache;->mFileOffset:I

    invoke-direct {p0, v2, v3, p1}, Lcom/miui/gallery/util/uil/BlobCache;->getBlob(Ljava/io/RandomAccessFile;ILcom/miui/gallery/util/uil/BlobCache$LookupRequest;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget v2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveBytes:I

    add-int/lit8 v2, v2, 0x14

    iget v3, p1, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->length:I

    add-int/2addr v2, v3

    iget v3, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxBytes:I

    if-gt v2, v3, :cond_2

    iget v2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveEntries:I

    mul-int/lit8 v2, v2, 0x2

    iget v3, p0, Lcom/miui/gallery/util/uil/BlobCache;->mMaxEntries:I

    if-lt v2, v3, :cond_1

    goto :goto_1

    :cond_1
    iput v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mSlotOffset:I

    :try_start_0
    iget-wide v2, p1, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->key:J

    iget-object v0, p1, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->buffer:[B

    iget p1, p1, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->length:I

    invoke-direct {p0, v2, v3, v0, p1}, Lcom/miui/gallery/util/uil/BlobCache;->insertInternal(J[BI)V

    iget p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveEntries:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveEntries:I

    iget-object p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexHeader:[B

    const/16 v0, 0x10

    iget v2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mActiveEntries:I

    invoke-static {p1, v0, v2}, Lcom/miui/gallery/util/uil/BlobCache;->writeInt([BII)V

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/BlobCache;->updateIndexHeader()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p1, "BlobCache"

    const-string v0, "cannot copy over"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return v1

    :cond_2
    :goto_1
    return v1

    :cond_3
    const/4 p1, 0x0

    return p1
.end method

.method public lookup(J)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mLookupRequest:Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;

    iput-wide p1, v1, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->key:J

    iget-object p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mLookupRequest:Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/uil/BlobCache;->lookup(Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mLookupRequest:Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;

    iget-object p1, p1, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->buffer:[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mLookupRequest:Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;

    iput-object v0, p2, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->buffer:[B

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/util/uil/BlobCache;->mLookupRequest:Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;

    iput-object v0, p1, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->buffer:[B

    return-object v0

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/miui/gallery/util/uil/BlobCache;->mLookupRequest:Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;

    iput-object v0, p2, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->buffer:[B

    throw p1
.end method

.method public syncAll()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/BlobCache;->syncIndex()V

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/FileDescriptor;->sync()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "BlobCache"

    const-string v2, "sync data file 0 failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    :try_start_1
    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/FileDescriptor;->sync()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    const-string v1, "BlobCache"

    const-string v2, "sync data file 1 failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-void
.end method

.method public syncIndex()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/util/uil/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    invoke-virtual {v0}, Ljava/nio/MappedByteBuffer;->force()Ljava/nio/MappedByteBuffer;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "BlobCache"

    const-string v2, "sync index failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method
