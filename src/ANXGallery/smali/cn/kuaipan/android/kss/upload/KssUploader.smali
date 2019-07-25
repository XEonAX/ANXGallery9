.class public Lcn/kuaipan/android/kss/upload/KssUploader;
.super Ljava/lang/Object;
.source "KssUploader.java"

# interfaces
.implements Lcn/kuaipan/android/kss/KssDef;


# static fields
.field public static volatile sBreakForUT:Z


# instance fields
.field private final CRC32:Ljava/util/zip/CRC32;

.field private final CRC_BUF:[B

.field private mChunkSize:J

.field private final mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

.field private final mTransmitter:Lcn/kuaipan/android/http/KscHttpTransmitter;


# direct methods
.method public constructor <init>(Lcn/kuaipan/android/http/KscHttpTransmitter;Lcn/kuaipan/android/kss/upload/UploadTaskStore;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->CRC32:Ljava/util/zip/CRC32;

    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->CRC_BUF:[B

    const-wide/32 v0, 0x10000

    iput-wide v0, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->mChunkSize:J

    iput-object p2, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    iput-object p1, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->mTransmitter:Lcn/kuaipan/android/http/KscHttpTransmitter;

    return-void
.end method

.method private _uploadChunk(Landroid/net/Uri;JLcn/kuaipan/android/utils/RandomFileInputStream;Lcn/kuaipan/android/kss/RC4Encoder;Lcn/kuaipan/android/http/IKscTransferListener;Lcn/kuaipan/android/kss/upload/KssUploadInfo;)Lcn/kuaipan/android/kss/upload/UploadChunkInfo;
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcn/kuaipan/android/exception/KscException;,
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v7, p0

    move-object/from16 v13, p4

    move-object/from16 v14, p5

    move-object/from16 v11, p6

    new-instance v12, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v0, 0x3

    invoke-direct {v12, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    const/4 v15, 0x0

    :goto_0
    move-object v0, v15

    :goto_1
    invoke-virtual {v12}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    if-ltz v1, :cond_a

    invoke-virtual/range {p4 .. p4}, Lcn/kuaipan/android/utils/RandomFileInputStream;->reset()V

    invoke-virtual/range {p4 .. p4}, Lcn/kuaipan/android/utils/RandomFileInputStream;->available()I

    move-result v0

    int-to-long v0, v0

    add-long v0, v0, p2

    const-wide/32 v2, 0x400000

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    const-wide/16 v4, 0x0

    cmp-long v6, v0, v4

    if-gez v6, :cond_0

    const-string v0, "KssUploader"

    const-string v1, "blockSize<0, adjust blockSize to 4M"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-wide/from16 v16, v2

    goto :goto_2

    :cond_0
    move-wide/from16 v16, v0

    :goto_2
    iget-wide v0, v7, Lcn/kuaipan/android/kss/upload/KssUploader;->mChunkSize:J

    sub-long v2, v16, p2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    invoke-virtual/range {p7 .. p7}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->getMaxChunkSize()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    move-object/from16 v9, p7

    iget-object v2, v9, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->mExpectInfo:Lcn/kuaipan/android/kss/upload/ServerExpect;

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcn/kuaipan/android/kss/upload/ServerExpect;->validate()V

    iget-wide v10, v2, Lcn/kuaipan/android/kss/upload/ServerExpect;->nextChunkSize:J

    cmp-long v3, v10, v4

    const/4 v6, 0x0

    if-lez v3, :cond_1

    iget-wide v10, v2, Lcn/kuaipan/android/kss/upload/ServerExpect;->nextChunkSize:J

    invoke-static {v0, v1, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v10

    const-string v3, "KssUploader"

    const-string v8, "Adjust chunk size from %d to %d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v4, v6

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v5, 0x1

    aput-object v0, v4, v5

    invoke-static {v8, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    :cond_1
    const/4 v5, 0x1

    move-wide v10, v0

    :goto_3
    iget v0, v2, Lcn/kuaipan/android/kss/upload/ServerExpect;->uploadDelay:I

    if-lez v0, :cond_3

    const-string v0, "KssUploader"

    const-string v1, "Sleeping for delay %d(s)"

    new-array v3, v5, [Ljava/lang/Object;

    iget v4, v2, Lcn/kuaipan/android/kss/upload/ServerExpect;->uploadDelay:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, v2, Lcn/kuaipan/android/kss/upload/ServerExpect;->uploadDelay:I

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_4

    :cond_2
    const/4 v5, 0x1

    move-wide v10, v0

    :cond_3
    :goto_4
    new-instance v0, Lcn/kuaipan/android/http/DecoderInputStream;

    const/16 v1, 0x2000

    invoke-direct {v0, v13, v14, v1}, Lcn/kuaipan/android/http/DecoderInputStream;-><init>(Ljava/io/InputStream;Lcn/kuaipan/android/http/IKscDecoder;I)V

    invoke-direct {v7, v0, v10, v11}, Lcn/kuaipan/android/kss/upload/KssUploader;->getCRC(Ljava/io/InputStream;J)I

    move-result v0

    int-to-long v2, v0

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v4, "body_sum"

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v4, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual/range {p4 .. p4}, Lcn/kuaipan/android/utils/RandomFileInputStream;->reset()V

    new-instance v3, Lcn/kuaipan/android/http/DecoderInputStream;

    invoke-direct {v3, v13, v14, v1}, Lcn/kuaipan/android/http/DecoderInputStream;-><init>(Ljava/io/InputStream;Lcn/kuaipan/android/http/IKscDecoder;I)V

    move-object/from16 v8, p6

    if-eqz v8, :cond_4

    const-wide/16 v0, 0x0

    :try_start_0
    invoke-interface {v8, v0, v1}, Lcn/kuaipan/android/http/IKscTransferListener;->setSendPos(J)V

    goto :goto_5

    :catch_0
    move-exception v0

    move-object v4, v12

    const/4 v3, 0x1

    goto :goto_7

    :cond_4
    :goto_5
    move-object/from16 v1, p0

    const/16 v18, 0x1

    move-wide v4, v10

    move-object/from16 v6, p6

    invoke-direct/range {v1 .. v6}, Lcn/kuaipan/android/kss/upload/KssUploader;->doUpload(Landroid/net/Uri;Ljava/io/InputStream;JLcn/kuaipan/android/http/IKscTransferListener;)Lcn/kuaipan/android/kss/upload/UploadChunkInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->isContinue()Z

    move-result v1

    if-nez v1, :cond_7

    invoke-virtual {v0}, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->isComplete()Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_6

    :cond_5
    invoke-virtual {v0}, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->canRetry()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {v12}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v1

    if-ltz v1, :cond_6

    const-string v1, "KssUploader"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "upload needChunkRetry: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->stat:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lcn/kuaipan/android/exception/KscException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v11, v8

    goto/16 :goto_1

    :cond_6
    return-object v0

    :cond_7
    :goto_6
    move-object v8, v0

    move-wide v1, v10

    const/4 v3, 0x1

    move-wide/from16 v9, p2

    move-object v4, v12

    move-wide v11, v1

    move-wide/from16 v13, v16

    :try_start_1
    invoke-static/range {v8 .. v14}, Lcn/kuaipan/android/kss/upload/KssUploader;->updatePos(Lcn/kuaipan/android/kss/upload/UploadChunkInfo;JJJ)V

    iget-wide v5, v7, Lcn/kuaipan/android/kss/upload/KssUploader;->mChunkSize:J

    cmp-long v8, v1, v5

    if-ltz v8, :cond_a

    sget-wide v1, Lcn/kuaipan/android/kss/upload/KssUploader;->MAX_CHUNKSIZE:J

    iget-wide v5, v7, Lcn/kuaipan/android/kss/upload/KssUploader;->mChunkSize:J

    shl-long/2addr v5, v3

    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    iput-wide v1, v7, Lcn/kuaipan/android/kss/upload/KssUploader;->mChunkSize:J
    :try_end_1
    .catch Lcn/kuaipan/android/exception/KscException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_8

    :catch_1
    move-exception v0

    :goto_7
    invoke-static {v0}, Lcn/kuaipan/android/exception/ErrorHelper;->isNetworkException(Ljava/lang/Throwable;)Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v1

    if-ltz v1, :cond_9

    const-wide/32 v0, 0x10000

    iget-wide v5, v7, Lcn/kuaipan/android/kss/upload/KssUploader;->mChunkSize:J

    shr-long v2, v5, v3

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, v7, Lcn/kuaipan/android/kss/upload/KssUploader;->mChunkSize:J

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_8

    const-wide/16 v0, 0x1388

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    move-object/from16 v13, p4

    move-object/from16 v14, p5

    move-object/from16 v11, p6

    move-object v12, v4

    goto/16 :goto_0

    :cond_8
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    :cond_9
    throw v0

    :cond_a
    :goto_8
    return-object v0
.end method

.method private deleteUploadInfo(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-virtual {v0, p1}, Lcn/kuaipan/android/kss/upload/UploadTaskStore;->removeUploadInfo(I)V

    return-void
.end method

.method private doUpload(Landroid/net/Uri;Ljava/io/InputStream;JLcn/kuaipan/android/http/IKscTransferListener;)Lcn/kuaipan/android/kss/upload/UploadChunkInfo;
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcn/kuaipan/android/exception/KscException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const/4 v1, 0x0

    :try_start_0
    new-instance v0, Lcn/kuaipan/android/http/KscHttpRequest;

    sget-object v2, Lcn/kuaipan/android/http/KscHttpRequest$HttpMethod;->POST:Lcn/kuaipan/android/http/KscHttpRequest$HttpMethod;

    move-object/from16 v3, p1

    move-object/from16 v4, p5

    invoke-direct {v0, v2, v3, v1, v4}, Lcn/kuaipan/android/http/KscHttpRequest;-><init>(Lcn/kuaipan/android/http/KscHttpRequest$HttpMethod;Landroid/net/Uri;Lcn/kuaipan/android/http/IKscDecoder;Lcn/kuaipan/android/http/IKscTransferListener;)V

    new-instance v2, Lcn/kuaipan/android/kss/upload/KssInputStreamEntity;

    move-object/from16 v4, p2

    move-wide/from16 v5, p3

    invoke-direct {v2, v4, v5, v6}, Lcn/kuaipan/android/kss/upload/KssInputStreamEntity;-><init>(Ljava/io/InputStream;J)V

    invoke-virtual {v0, v2}, Lcn/kuaipan/android/http/KscHttpRequest;->setPostEntity(Lorg/apache/http/entity/AbstractHttpEntity;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    move-object/from16 v2, p0

    :try_start_1
    iget-object v6, v2, Lcn/kuaipan/android/kss/upload/KssUploader;->mTransmitter:Lcn/kuaipan/android/http/KscHttpTransmitter;

    const/4 v7, 0x4

    invoke-virtual {v6, v0, v7}, Lcn/kuaipan/android/http/KscHttpTransmitter;->execute(Lcn/kuaipan/android/http/KscHttpRequest;I)Lcn/kuaipan/android/http/KscHttpResponse;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const/4 v8, 0x0

    sub-long v11, v6, v4

    const-wide/16 v4, 0x0

    invoke-virtual {v0}, Lcn/kuaipan/android/http/KscHttpResponse;->getResponse()Lorg/apache/http/HttpResponse;

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-virtual {v0}, Lcn/kuaipan/android/http/KscHttpResponse;->getResponse()Lorg/apache/http/HttpResponse;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-interface {v6}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v4

    :cond_0
    move-wide v13, v4

    invoke-virtual {v0}, Lcn/kuaipan/android/http/KscHttpResponse;->getStatusCode()I

    move-result v4

    const-string v5, ""

    invoke-virtual {v0}, Lcn/kuaipan/android/http/KscHttpResponse;->getError()Ljava/lang/Throwable;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-virtual {v0}, Lcn/kuaipan/android/http/KscHttpResponse;->getError()Ljava/lang/Throwable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    :cond_1
    move-object/from16 v16, v5

    invoke-static {}, Lcom/xiaomi/micloudsdk/stat/MiCloudStatManager;->getInstance()Lcom/xiaomi/micloudsdk/stat/MiCloudStatManager;

    move-result-object v9

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v10

    move v15, v4

    invoke-virtual/range {v9 .. v16}, Lcom/xiaomi/micloudsdk/stat/MiCloudStatManager;->addHttpEvent(Ljava/lang/String;JJILjava/lang/String;)V

    invoke-static {v0}, Lcn/kuaipan/android/exception/ErrorHelper;->throwError(Lcn/kuaipan/android/http/KscHttpResponse;)V

    const/16 v3, 0xc8

    if-ne v4, v3, :cond_3

    invoke-static {v0}, Lcn/kuaipan/android/utils/ApiDataHelper;->contentToMap(Lcn/kuaipan/android/http/KscHttpResponse;)Ljava/util/Map;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    new-instance v1, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;

    invoke-direct {v1, v3}, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;-><init>(Ljava/util/Map;)V

    invoke-static {v0}, Lcn/kuaipan/android/kss/upload/ServerExpect;->getServerExpect(Lcn/kuaipan/android/http/KscHttpResponse;)Lcn/kuaipan/android/kss/upload/ServerExpect;

    move-result-object v0

    iput-object v0, v1, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->expect_info:Lcn/kuaipan/android/kss/upload/ServerExpect;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v3, :cond_2

    instance-of v0, v3, Lcn/kuaipan/android/utils/IObtainable;

    if-eqz v0, :cond_2

    check-cast v3, Lcn/kuaipan/android/utils/IObtainable;

    invoke-interface {v3}, Lcn/kuaipan/android/utils/IObtainable;->recycle()V

    :cond_2
    return-object v1

    :catchall_0
    move-exception v0

    move-object v1, v3

    goto :goto_0

    :cond_3
    :try_start_3
    new-instance v3, Lcn/kuaipan/android/exception/ServerException;

    invoke-virtual {v0}, Lcn/kuaipan/android/http/KscHttpResponse;->dump()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v4, v0}, Lcn/kuaipan/android/exception/ServerException;-><init>(ILjava/lang/String;)V

    const-string v0, "KssUploader"

    const-string v4, "Exception in doUpload"

    invoke-static {v0, v4, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v0

    goto :goto_0

    :catchall_2
    move-exception v0

    move-object/from16 v2, p0

    :goto_0
    if-eqz v1, :cond_4

    instance-of v3, v1, Lcn/kuaipan/android/utils/IObtainable;

    if-eqz v3, :cond_4

    check-cast v1, Lcn/kuaipan/android/utils/IObtainable;

    invoke-interface {v1}, Lcn/kuaipan/android/utils/IObtainable;->recycle()V

    :cond_4
    throw v0
.end method

.method private declared-synchronized getCRC(Ljava/io/InputStream;J)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->CRC32:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-lez v2, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->CRC_BUF:[B

    iget-object v1, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->CRC_BUF:[B

    array-length v1, v1

    int-to-long v1, v1

    invoke-static {v1, v2, p2, p3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v1, v1

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    if-ltz v0, :cond_0

    int-to-long v3, v0

    sub-long/2addr p2, v3

    iget-object v1, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->CRC32:Ljava/util/zip/CRC32;

    iget-object v3, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->CRC_BUF:[B

    invoke-virtual {v1, v3, v2, v0}, Ljava/util/zip/CRC32;->update([BII)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->CRC32:Ljava/util/zip/CRC32;

    invoke-virtual {p1}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    long-to-int p1, p1

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private getUploadPos(I)Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-virtual {v0, p1}, Lcn/kuaipan/android/kss/upload/UploadTaskStore;->getUploadPos(I)Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;

    move-result-object p1

    return-object p1
.end method

.method private static updatePos(Lcn/kuaipan/android/kss/upload/UploadChunkInfo;JJJ)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->isComplete()Z

    move-result v0

    if-eqz v0, :cond_1

    iput-wide p5, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->next_pos:J

    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->left_bytes:J

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->isContinue()Z

    move-result v0

    if-eqz v0, :cond_3

    add-long/2addr p1, p3

    sub-long/2addr p5, p1

    iget-wide p3, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->next_pos:J

    cmp-long v0, p3, p1

    if-nez v0, :cond_2

    iget-wide p3, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->left_bytes:J

    cmp-long v0, p3, p5

    if-eqz v0, :cond_4

    :cond_2
    const-string p3, "KssUploader"

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Chunk pos is ("

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v0, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->next_pos:J

    invoke-virtual {p4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v0, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->left_bytes:J

    invoke-virtual {p4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "), but in process is ("

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p5, p6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p3, p4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iput-wide p1, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->next_pos:J

    iput-wide p5, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->left_bytes:J

    goto :goto_0

    :cond_3
    iput-wide p1, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->next_pos:J

    sub-long/2addr p5, p1

    iput-wide p5, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->left_bytes:J

    :cond_4
    :goto_0
    return-void
.end method

.method private updateUploadInfo(ILcn/kuaipan/android/kss/upload/KssUploadInfo;Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;)V
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/upload/KssUploader;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-virtual {v0, p1, p2, p3}, Lcn/kuaipan/android/kss/upload/UploadTaskStore;->updateUploadInfo(ILcn/kuaipan/android/kss/upload/KssUploadInfo;Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;)V

    return-void
.end method

.method private uploadBlock(ILjava/io/File;Lcn/kuaipan/android/kss/FileTranceListener;Lcn/kuaipan/android/kss/upload/KssUploadInfo;I)V
    .locals 32
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcn/kuaipan/android/exception/KscException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    move-object/from16 v8, p0

    move/from16 v0, p1

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    move/from16 v11, p5

    invoke-direct/range {p0 .. p1}, Lcn/kuaipan/android/kss/upload/KssUploader;->getUploadPos(I)Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v2, v1, Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;->upload_id:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-wide v3, v1, Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;->pos:J

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :cond_1
    const-wide/16 v3, 0x0

    :goto_0
    const-wide/32 v5, 0x10000

    rem-long v5, v3, v5

    sub-long/2addr v3, v5

    add-int/lit8 v1, v11, 0x1

    int-to-long v5, v1

    const-wide/32 v15, 0x400000

    mul-long v6, v5, v15

    cmp-long v1, v3, v6

    if-gez v1, :cond_3

    int-to-long v12, v11

    mul-long v12, v12, v15

    cmp-long v1, v3, v12

    if-gez v1, :cond_2

    goto :goto_2

    :cond_2
    :goto_1
    move-wide v12, v3

    goto :goto_3

    :cond_3
    :goto_2
    int-to-long v3, v11

    mul-long v3, v3, v15

    goto :goto_1

    :goto_3
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-static {v3, v4, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v19

    invoke-virtual/range {p4 .. p4}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->getRequestResult()Lcn/kuaipan/android/kss/IKssUploadRequestResult;

    move-result-object v5

    const-string v1, "KssUploader"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RC4 key:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v5}, Lcn/kuaipan/android/kss/IKssUploadRequestResult;->getSecureKey()[B

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    new-instance v4, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x3

    invoke-direct {v4, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_6
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    move-object/from16 v26, v2

    const/4 v1, 0x0

    :goto_4
    :try_start_1
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    if-ltz v2, :cond_f

    new-instance v3, Lcn/kuaipan/android/kss/RC4Encoder;

    invoke-interface {v5}, Lcn/kuaipan/android/kss/IKssUploadRequestResult;->getSecureKey()[B

    move-result-object v2

    invoke-direct {v3, v2}, Lcn/kuaipan/android/kss/RC4Encoder;-><init>([B)V

    new-instance v2, Lcn/kuaipan/android/utils/RandomFileInputStream;

    move-object/from16 v14, p2

    invoke-direct {v2, v14}, Lcn/kuaipan/android/utils/RandomFileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    :try_start_2
    invoke-virtual {v2, v12, v13}, Lcn/kuaipan/android/utils/RandomFileInputStream;->moveToPos(J)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz v9, :cond_4

    :try_start_3
    invoke-virtual {v9, v12, v13}, Lcn/kuaipan/android/kss/FileTranceListener;->setSendPos(J)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_5

    :catch_0
    move-exception v0

    move-object v14, v2

    goto/16 :goto_c

    :cond_4
    :goto_5
    :try_start_4
    new-instance v1, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;

    rem-long v22, v12, v15

    const/16 v21, 0x0

    sub-long v24, v19, v12

    move-object/from16 v21, v1

    invoke-direct/range {v21 .. v26}, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;-><init>(JJLjava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-object/from16 v28, v2

    move-object/from16 v27, v3

    :goto_6
    :try_start_5
    iget-wide v2, v1, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->next_pos:J

    cmp-long v21, v2, v19

    if-gez v21, :cond_c

    iget-wide v2, v1, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->left_bytes:J

    const-wide/16 v17, 0x0

    cmp-long v21, v2, v17

    if-lez v21, :cond_b

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v2

    if-nez v2, :cond_a

    if-nez v9, :cond_5

    move-object/from16 v21, v1

    const/16 v22, 0x0

    goto :goto_7

    :cond_5
    iget-wide v2, v1, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->next_pos:J

    const/16 v21, 0x0

    add-long/2addr v2, v12

    invoke-virtual {v9, v2, v3}, Lcn/kuaipan/android/kss/FileTranceListener;->getChunkListaner(J)Lcn/kuaipan/android/http/IKscTransferListener;

    move-result-object v2
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-object/from16 v21, v1

    move-object/from16 v22, v2

    :goto_7
    move-object/from16 v1, p0

    move-object/from16 v23, v28

    move-object/from16 v2, v23

    move-object/from16 v24, v27

    move-object/from16 v3, v24

    move-object/from16 v25, v4

    move-object/from16 v4, v22

    move-object/from16 v29, v5

    move-object/from16 v5, p4

    move-wide/from16 v30, v12

    move-wide v12, v6

    move/from16 v6, p5

    move-object/from16 v7, v21

    :try_start_6
    invoke-direct/range {v1 .. v7}, Lcn/kuaipan/android/kss/upload/KssUploader;->uploadChunk(Lcn/kuaipan/android/utils/RandomFileInputStream;Lcn/kuaipan/android/kss/RC4Encoder;Lcn/kuaipan/android/http/IKscTransferListener;Lcn/kuaipan/android/kss/upload/KssUploadInfo;ILcn/kuaipan/android/kss/upload/UploadChunkInfo;)Lcn/kuaipan/android/kss/upload/UploadChunkInfo;

    move-result-object v1

    if-eqz v1, :cond_9

    invoke-virtual {v1}, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->isContinue()Z

    move-result v2

    if-eqz v2, :cond_7

    new-instance v2, Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;

    invoke-direct {v2}, Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;-><init>()V

    int-to-long v3, v11

    mul-long v3, v3, v15

    iget-wide v5, v1, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->next_pos:J

    const/4 v7, 0x0

    add-long/2addr v3, v5

    iput-wide v3, v2, Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;->pos:J

    iget-object v3, v1, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->upload_id:Ljava/lang/String;

    iput-object v3, v2, Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;->upload_id:Ljava/lang/String;

    invoke-direct {v8, v0, v10, v2}, Lcn/kuaipan/android/kss/upload/KssUploader;->updateUploadInfo(ILcn/kuaipan/android/kss/upload/KssUploadInfo;Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;)V

    sget-boolean v2, Lcn/kuaipan/android/kss/upload/KssUploader;->sBreakForUT:Z

    if-eqz v2, :cond_6

    const-string v2, "KssUploader"

    const-string v3, "break for UT"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    :cond_6
    move-wide v6, v12

    move-object/from16 v28, v23

    move-object/from16 v27, v24

    move-object/from16 v4, v25

    move-object/from16 v5, v29

    move-wide/from16 v12, v30

    goto :goto_6

    :cond_7
    invoke-virtual {v1}, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->isComplete()Z

    move-result v2

    if-eqz v2, :cond_8

    new-instance v2, Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;

    invoke-direct {v2}, Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;-><init>()V

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-static {v12, v13, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    iput-wide v3, v2, Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;->pos:J

    const-string v3, ""

    iput-object v3, v2, Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;->upload_id:Ljava/lang/String;

    move-object/from16 v3, v29

    invoke-interface {v3, v11}, Lcn/kuaipan/android/kss/IKssUploadRequestResult;->getBlock(I)Lcn/kuaipan/android/kss/IKssUploadRequestResult$Block;

    move-result-object v4

    iget-object v5, v1, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->commit_meta:Ljava/lang/String;

    iput-object v5, v4, Lcn/kuaipan/android/kss/IKssUploadRequestResult$Block;->meta:Ljava/lang/String;

    const/4 v5, 0x1

    iput-boolean v5, v4, Lcn/kuaipan/android/kss/IKssUploadRequestResult$Block;->exist:Z

    invoke-direct {v8, v0, v10, v2}, Lcn/kuaipan/android/kss/upload/KssUploader;->updateUploadInfo(ILcn/kuaipan/android/kss/upload/KssUploadInfo;Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;)V

    goto :goto_9

    :cond_8
    move-object/from16 v3, v29

    goto :goto_9

    :cond_9
    new-instance v0, Lcn/kuaipan/android/exception/KscRuntimeException;

    const v1, 0x7a128

    const-string v2, "Return chunkInfo is null"

    invoke-direct {v0, v1, v2}, Lcn/kuaipan/android/exception/KscRuntimeException;-><init>(ILjava/lang/String;)V

    throw v0

    :cond_a
    move-object/from16 v23, v28

    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    :cond_b
    move-object/from16 v21, v1

    move-object/from16 v25, v4

    move-object v3, v5

    move-wide v12, v6

    move-object/from16 v23, v28

    goto :goto_8

    :cond_c
    move-object/from16 v21, v1

    move-object/from16 v25, v4

    move-object v3, v5

    move-wide v12, v6

    move-object/from16 v23, v28

    const-wide/16 v17, 0x0

    :goto_8
    move-object/from16 v1, v21

    :goto_9
    invoke-virtual {v1}, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->isComplete()Z

    move-result v2

    if-eqz v2, :cond_d

    move-object/from16 v1, v23

    goto :goto_b

    :cond_d
    invoke-virtual {v1}, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->needBlockRetry()Z

    move-result v2

    if-eqz v2, :cond_e

    invoke-virtual/range {v25 .. v25}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v2

    if-lez v2, :cond_e

    const-string v26, ""

    const-string v2, "KssUploader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "upload needBlockRetry: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->stat:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v5, v3

    move-wide v6, v12

    move-wide/from16 v12, v17

    move-object/from16 v1, v23

    move-object/from16 v4, v25

    goto/16 :goto_4

    :cond_e
    new-instance v2, Lcn/kuaipan/android/exception/ServerMsgException;

    const/16 v3, 0xc8

    iget-object v1, v1, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->stat:Ljava/lang/String;

    invoke-direct {v2, v3, v1}, Lcn/kuaipan/android/exception/ServerMsgException;-><init>(ILjava/lang/String;)V

    const-string v1, "KssUploader"

    const-string v3, "Exception in uploadBlock"

    invoke-static {v1, v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual/range {p4 .. p4}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->markBroken()V

    invoke-direct/range {p0 .. p1}, Lcn/kuaipan/android/kss/upload/KssUploader;->deleteUploadInfo(I)V

    throw v2
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :catchall_0
    move-exception v0

    goto :goto_e

    :catch_1
    move-exception v0

    goto :goto_a

    :catchall_1
    move-exception v0

    move-object/from16 v23, v28

    goto :goto_e

    :catch_2
    move-exception v0

    move-object/from16 v23, v28

    goto :goto_a

    :catchall_2
    move-exception v0

    move-object/from16 v23, v2

    goto :goto_e

    :catch_3
    move-exception v0

    move-object/from16 v23, v2

    :goto_a
    move-object/from16 v14, v23

    goto :goto_c

    :cond_f
    :goto_b
    :try_start_7
    invoke-virtual {v1}, Lcn/kuaipan/android/utils/RandomFileInputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_4

    :catch_4
    return-void

    :catchall_3
    move-exception v0

    move-object/from16 v23, v1

    goto :goto_e

    :catch_5
    move-exception v0

    move-object v14, v1

    :goto_c
    const/4 v1, 0x0

    goto :goto_d

    :catchall_4
    move-exception v0

    const/16 v23, 0x0

    goto :goto_e

    :catch_6
    move-exception v0

    const/4 v1, 0x0

    const/4 v14, 0x0

    :goto_d
    :try_start_8
    invoke-static {v0, v1}, Lcn/kuaipan/android/exception/KscException;->newException(Ljava/lang/Throwable;Ljava/lang/String;)Lcn/kuaipan/android/exception/KscException;

    move-result-object v0

    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    :catchall_5
    move-exception v0

    move-object/from16 v23, v14

    :goto_e
    :try_start_9
    invoke-virtual/range {v23 .. v23}, Lcn/kuaipan/android/utils/RandomFileInputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_7

    :catch_7
    throw v0
.end method

.method private uploadBlock(ILjava/io/File;Lcn/kuaipan/android/kss/FileTranceListener;Lcn/kuaipan/android/kss/upload/KssUploadInfo;ZI)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcn/kuaipan/android/exception/KscException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    if-eqz p4, :cond_3

    invoke-virtual {p4}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->getFileInfo()Lcn/kuaipan/android/kss/upload/UploadFileInfo;

    move-result-object p5

    invoke-static {p2, p5, p6}, Lcn/kuaipan/android/kss/upload/KssUploader;->verifyBlock(Ljava/io/File;Lcn/kuaipan/android/kss/upload/UploadFileInfo;I)V

    invoke-virtual {p4}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->getRequestResult()Lcn/kuaipan/android/kss/IKssUploadRequestResult;

    move-result-object p5

    invoke-interface {p5, p6}, Lcn/kuaipan/android/kss/IKssUploadRequestResult;->getBlock(I)Lcn/kuaipan/android/kss/IKssUploadRequestResult$Block;

    move-result-object p5

    if-eqz p5, :cond_2

    invoke-virtual {p5}, Lcn/kuaipan/android/kss/IKssUploadRequestResult$Block;->isComplete()Z

    move-result p5

    if-eqz p5, :cond_0

    if-eqz p3, :cond_1

    add-int/lit8 p6, p6, 0x1

    int-to-long p4, p6

    const-wide/32 v0, 0x400000

    mul-long p4, p4, v0

    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide p1

    invoke-static {p4, p5, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    invoke-virtual {p3, p1, p2}, Lcn/kuaipan/android/kss/FileTranceListener;->setSendPos(J)V

    goto :goto_0

    :cond_0
    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p6

    invoke-direct/range {v0 .. v5}, Lcn/kuaipan/android/kss/upload/KssUploader;->uploadBlock(ILjava/io/File;Lcn/kuaipan/android/kss/FileTranceListener;Lcn/kuaipan/android/kss/upload/KssUploadInfo;I)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    new-instance p1, Lcn/kuaipan/android/exception/KscRuntimeException;

    const p2, 0x7a128

    const-string p3, "Block should not be null"

    invoke-direct {p1, p2, p3}, Lcn/kuaipan/android/exception/KscRuntimeException;-><init>(ILjava/lang/String;)V

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The KssUploadInfo can not be empty."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private uploadChunk(Lcn/kuaipan/android/utils/RandomFileInputStream;Lcn/kuaipan/android/kss/RC4Encoder;Lcn/kuaipan/android/http/IKscTransferListener;Lcn/kuaipan/android/kss/upload/KssUploadInfo;ILcn/kuaipan/android/kss/upload/UploadChunkInfo;)Lcn/kuaipan/android/kss/upload/UploadChunkInfo;
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcn/kuaipan/android/exception/KscException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    move-object/from16 v9, p1

    move/from16 v10, p5

    move-object/from16 v11, p6

    invoke-virtual/range {p4 .. p4}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->getRequestResult()Lcn/kuaipan/android/kss/IKssUploadRequestResult;

    move-result-object v12

    invoke-interface {v12}, Lcn/kuaipan/android/kss/IKssUploadRequestResult;->getNodeUrls()[Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_4

    array-length v0, v13

    if-lez v0, :cond_4

    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object v15, v1

    const/4 v14, 0x0

    :goto_0
    array-length v0, v13

    if-ge v14, v0, :cond_3

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_2

    const-wide/32 v0, 0x400000

    int-to-long v2, v10

    mul-long v2, v2, v0

    :try_start_0
    iget-wide v0, v11, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->next_pos:J

    const/4 v4, 0x0

    add-long/2addr v2, v0

    invoke-virtual {v9, v2, v3}, Lcn/kuaipan/android/utils/RandomFileInputStream;->moveToPos(J)V

    const/high16 v0, 0x400000

    invoke-virtual {v9, v0}, Lcn/kuaipan/android/utils/RandomFileInputStream;->mark(I)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v1, v13, v14

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/upload_block_chunk"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "chunk_pos"

    iget-wide v2, v11, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->next_pos:J

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    iget-object v1, v11, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->upload_id:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "upload_id"

    iget-object v2, v11, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->upload_id:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_1

    :cond_0
    const-string v1, "file_meta"

    invoke-interface {v12}, Lcn/kuaipan/android/kss/IKssUploadRequestResult;->getFileMeta()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v1, "block_meta"

    invoke-interface {v12, v10}, Lcn/kuaipan/android/kss/IKssUploadRequestResult;->getBlock(I)Lcn/kuaipan/android/kss/IKssUploadRequestResult$Block;

    move-result-object v2

    iget-object v2, v2, Lcn/kuaipan/android/kss/IKssUploadRequestResult$Block;->meta:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :goto_1
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    iget-wide v3, v11, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->next_pos:J

    move-object/from16 v1, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    invoke-direct/range {v1 .. v8}, Lcn/kuaipan/android/kss/upload/KssUploader;->_uploadChunk(Landroid/net/Uri;JLcn/kuaipan/android/utils/RandomFileInputStream;Lcn/kuaipan/android/kss/RC4Encoder;Lcn/kuaipan/android/http/IKscTransferListener;Lcn/kuaipan/android/kss/upload/KssUploadInfo;)Lcn/kuaipan/android/kss/upload/UploadChunkInfo;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    :try_start_1
    iget-object v0, v1, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->expect_info:Lcn/kuaipan/android/kss/upload/ServerExpect;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object/from16 v2, p4

    :try_start_2
    iput-object v0, v2, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->mExpectInfo:Lcn/kuaipan/android/kss/upload/ServerExpect;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-object v15, v1

    goto :goto_4

    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    move-object/from16 v2, p4

    :goto_2
    move-object v15, v1

    goto :goto_3

    :catch_2
    move-exception v0

    move-object/from16 v2, p4

    :goto_3
    invoke-static {v0}, Lcn/kuaipan/android/exception/ErrorHelper;->handleInterruptException(Ljava/lang/Throwable;)V

    array-length v1, v13

    add-int/lit8 v1, v1, -0x1

    if-ge v14, v1, :cond_1

    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_0

    :cond_1
    const-string v1, "Failed when upload a kss chunk."

    invoke-static {v0, v1}, Lcn/kuaipan/android/exception/KscException;->newException(Ljava/lang/Throwable;Ljava/lang/String;)Lcn/kuaipan/android/exception/KscException;

    move-result-object v0

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    :cond_3
    :goto_4
    return-object v15

    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No available urls."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static verifyBlock(Ljava/io/File;Lcn/kuaipan/android/kss/upload/UploadFileInfo;I)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcn/kuaipan/android/exception/KscException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    invoke-virtual {p1, p2}, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->getBlockInfo(I)Lcn/kuaipan/android/kss/upload/UploadFileInfo$BlockInfo;

    move-result-object p1

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v0

    int-to-long v2, p2

    const-wide/32 v4, 0x400000

    mul-long v2, v2, v4

    sub-long/2addr v0, v2

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int p2, v0

    iget v0, p1, Lcn/kuaipan/android/kss/upload/UploadFileInfo$BlockInfo;->size:I

    const v1, 0x6263a

    if-ne p2, v0, :cond_2

    const/4 v0, 0x0

    :try_start_0
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual {v4, v2, v3}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v5

    cmp-long p0, v5, v2

    if-nez p0, :cond_1

    invoke-static {v4, p2}, Lcn/kuaipan/android/utils/Encode;->SHA1Encode(Ljava/io/InputStream;I)Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Lcn/kuaipan/android/kss/upload/UploadFileInfo$BlockInfo;->sha1:Ljava/lang/String;

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz p0, :cond_0

    :try_start_2
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    return-void

    :cond_0
    :try_start_3
    new-instance p0, Lcn/kuaipan/android/exception/KscException;

    const-string p1, "Block has changed."

    invoke-direct {p0, v1, p1}, Lcn/kuaipan/android/exception/KscException;-><init>(ILjava/lang/String;)V

    throw p0

    :cond_1
    new-instance p0, Lcn/kuaipan/android/exception/KscException;

    const-string p1, "File size has changed."

    invoke-direct {p0, v1, p1}, Lcn/kuaipan/android/exception/KscException;-><init>(ILjava/lang/String;)V

    throw p0
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catch_1
    move-exception p0

    goto :goto_0

    :catchall_0
    move-exception p0

    move-object v4, v0

    goto :goto_1

    :catch_2
    move-exception p0

    move-object v4, v0

    :goto_0
    :try_start_4
    invoke-static {p0, v0}, Lcn/kuaipan/android/exception/KscException;->newException(Ljava/lang/Throwable;Ljava/lang/String;)Lcn/kuaipan/android/exception/KscException;

    move-result-object p0

    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception p0

    :goto_1
    :try_start_5
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_3

    :catch_3
    throw p0

    :cond_2
    new-instance p0, Lcn/kuaipan/android/exception/KscException;

    const-string p1, "Block size has changed."

    invoke-direct {p0, v1, p1}, Lcn/kuaipan/android/exception/KscException;-><init>(ILjava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public upload(Ljava/io/File;Lcn/kuaipan/android/http/IKscTransferListener;ILcn/kuaipan/android/kss/upload/KssUploadInfo;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcn/kuaipan/android/exception/KscException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    if-eqz p2, :cond_0

    new-instance v0, Lcn/kuaipan/android/kss/FileTranceListener;

    const/4 v1, 0x1

    invoke-direct {v0, p2, v1}, Lcn/kuaipan/android/kss/FileTranceListener;-><init>(Lcn/kuaipan/android/http/IKscTransferListener;Z)V

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v1

    invoke-interface {p2, v1, v2}, Lcn/kuaipan/android/http/IKscTransferListener;->setSendTotal(J)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/4 p2, 0x0

    :cond_1
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "KssUploader"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "upload blockIndex: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v6, 0x1

    move-object v1, p0

    move v2, p3

    move-object v3, p1

    move-object v4, v0

    move-object v5, p4

    move v7, p2

    invoke-direct/range {v1 .. v7}, Lcn/kuaipan/android/kss/upload/KssUploader;->uploadBlock(ILjava/io/File;Lcn/kuaipan/android/kss/FileTranceListener;Lcn/kuaipan/android/kss/upload/KssUploadInfo;ZI)V

    add-int/lit8 p2, p2, 0x1

    invoke-virtual {p4}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->isCompleted()Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    :cond_2
    new-instance p1, Ljava/lang/InterruptedException;

    invoke-direct {p1}, Ljava/lang/InterruptedException;-><init>()V

    throw p1
.end method
