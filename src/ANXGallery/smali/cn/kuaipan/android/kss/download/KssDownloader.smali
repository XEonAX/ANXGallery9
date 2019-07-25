.class public Lcn/kuaipan/android/kss/download/KssDownloader;
.super Ljava/lang/Object;
.source "KssDownloader.java"

# interfaces
.implements Lcn/kuaipan/android/kss/KssDef;


# instance fields
.field private final mTransmitter:Lcn/kuaipan/android/http/KscHttpTransmitter;


# direct methods
.method public constructor <init>(Lcn/kuaipan/android/http/KscHttpTransmitter;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/kuaipan/android/kss/download/KssDownloader;->mTransmitter:Lcn/kuaipan/android/http/KscHttpTransmitter;

    return-void
.end method

.method private download(Lcn/kuaipan/android/kss/IKssDownloadRequestResult;Lcn/kuaipan/android/kss/download/KssAccessor;Lcn/kuaipan/android/kss/download/LoadMap;Ljava/util/concurrent/atomic/AtomicInteger;)V
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/security/InvalidKeyException;,
            Lcn/kuaipan/android/exception/KscException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual/range {p3 .. p3}, Lcn/kuaipan/android/kss/download/LoadMap;->obtainRecorder()Lcn/kuaipan/android/kss/download/LoadRecorder;

    move-result-object v0

    move-object v4, v0

    :goto_0
    if-eqz v4, :cond_e

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_d

    invoke-virtual {v4}, Lcn/kuaipan/android/kss/download/LoadRecorder;->getSpace()Lcn/kuaipan/android/kss/download/LoadMap$Space;

    move-result-object v0

    invoke-virtual {v0}, Lcn/kuaipan/android/kss/download/LoadMap$Space;->getStart()J

    move-result-wide v5

    move-object/from16 v7, p1

    invoke-interface {v7, v5, v6}, Lcn/kuaipan/android/kss/IKssDownloadRequestResult;->getBlockUrls(J)[Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v5, v6}, Lcn/kuaipan/android/kss/download/LoadMap;->getBlockStart(J)J

    move-result-wide v9

    sub-long/2addr v5, v9

    if-eqz v8, :cond_c

    array-length v0, v8

    if-lez v0, :cond_c

    new-instance v9, Lcn/kuaipan/android/kss/RC4Encoder;

    invoke-interface/range {p1 .. p1}, Lcn/kuaipan/android/kss/IKssDownloadRequestResult;->getSecureKey()[B

    move-result-object v0

    invoke-direct {v9, v0}, Lcn/kuaipan/android/kss/RC4Encoder;-><init>([B)V

    const/4 v0, 0x0

    const/4 v10, 0x0

    :goto_1
    array-length v0, v8

    if-ge v10, v0, :cond_a

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_9

    const/4 v12, 0x0

    :try_start_0
    invoke-virtual {v9}, Lcn/kuaipan/android/kss/RC4Encoder;->init()V

    aget-object v14, v8, v10

    new-instance v15, Lcn/kuaipan/android/http/KscHttpRequest;

    sget-object v0, Lcn/kuaipan/android/http/KscHttpRequest$HttpMethod;->GET:Lcn/kuaipan/android/http/KscHttpRequest$HttpMethod;

    invoke-direct {v15, v0, v14, v9, v12}, Lcn/kuaipan/android/http/KscHttpRequest;-><init>(Lcn/kuaipan/android/http/KscHttpRequest$HttpMethod;Ljava/lang/String;Lcn/kuaipan/android/http/IKscDecoder;Lcn/kuaipan/android/http/IKscTransferListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    const-wide/16 v16, 0x0

    cmp-long v0, v5, v16

    if-lez v0, :cond_0

    :try_start_1
    invoke-virtual {v15}, Lcn/kuaipan/android/http/KscHttpRequest;->getRequest()Lorg/apache/http/client/methods/HttpUriRequest;

    move-result-object v0

    const-string v13, "Range"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "bytes="

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v11, "-"

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v0, v13, v11}, Lorg/apache/http/client/methods/HttpUriRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_4

    :catchall_0
    move-exception v0

    :goto_2
    const/4 v12, 0x0

    goto/16 :goto_b

    :catch_0
    move-exception v0

    move-object/from16 v11, p4

    :goto_3
    const/4 v12, 0x0

    goto/16 :goto_8

    :cond_0
    :goto_4
    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    iget-object v0, v1, Lcn/kuaipan/android/kss/download/KssDownloader;->mTransmitter:Lcn/kuaipan/android/http/KscHttpTransmitter;

    const/4 v13, 0x4

    invoke-virtual {v0, v15, v13}, Lcn/kuaipan/android/http/KscHttpTransmitter;->execute(Lcn/kuaipan/android/http/KscHttpRequest;I)Lcn/kuaipan/android/http/KscHttpResponse;

    move-result-object v13
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    :try_start_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    const/4 v0, 0x0

    sub-long v11, v18, v11

    invoke-virtual {v13}, Lcn/kuaipan/android/http/KscHttpResponse;->getResponse()Lorg/apache/http/HttpResponse;

    move-result-object v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    if-eqz v0, :cond_1

    :try_start_4
    invoke-virtual {v13}, Lcn/kuaipan/android/http/KscHttpResponse;->getResponse()Lorg/apache/http/HttpResponse;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v16
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_5

    :catchall_1
    move-exception v0

    move-object v12, v13

    goto/16 :goto_b

    :catch_1
    move-exception v0

    move-object/from16 v11, p4

    move-object v12, v13

    goto/16 :goto_8

    :cond_1
    :goto_5
    move-wide/from16 v17, v16

    :try_start_5
    invoke-virtual {v13}, Lcn/kuaipan/android/http/KscHttpResponse;->getStatusCode()I

    move-result v19

    const-string v0, ""

    invoke-virtual {v13}, Lcn/kuaipan/android/http/KscHttpResponse;->getError()Ljava/lang/Throwable;

    move-result-object v16
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    if-eqz v16, :cond_2

    :try_start_6
    invoke-virtual {v13}, Lcn/kuaipan/android/http/KscHttpResponse;->getError()Ljava/lang/Throwable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :cond_2
    move-object/from16 v20, v0

    :try_start_7
    invoke-static {}, Lcom/xiaomi/micloudsdk/stat/MiCloudStatManager;->getInstance()Lcom/xiaomi/micloudsdk/stat/MiCloudStatManager;

    move-result-object v0
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    move-object/from16 v21, v13

    move-object v13, v0

    move-object/from16 v22, v15

    move-wide v15, v11

    :try_start_8
    invoke-virtual/range {v13 .. v20}, Lcom/xiaomi/micloudsdk/stat/MiCloudStatManager;->addHttpEvent(Ljava/lang/String;JJILjava/lang/String;)V

    invoke-static/range {v21 .. v21}, Lcn/kuaipan/android/exception/ErrorHelper;->throwError(Lcn/kuaipan/android/http/KscHttpResponse;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    move-object/from16 v11, p4

    move-object/from16 v12, v21

    :try_start_9
    invoke-direct {v1, v12, v2, v4, v11}, Lcn/kuaipan/android/kss/download/KssDownloader;->save(Lcn/kuaipan/android/http/KscHttpResponse;Lcn/kuaipan/android/kss/download/KssAccessor;Lcn/kuaipan/android/kss/download/LoadRecorder;Ljava/util/concurrent/atomic/AtomicInteger;)V

    const/4 v13, 0x1

    invoke-virtual {v3, v2, v13}, Lcn/kuaipan/android/kss/download/LoadMap;->verify(Lcn/kuaipan/android/kss/download/KssAccessor;Z)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    invoke-direct {v1, v12}, Lcn/kuaipan/android/kss/download/KssDownloader;->releaseResponse(Lcn/kuaipan/android/http/KscHttpResponse;)V

    if-eqz v4, :cond_b

    invoke-virtual {v4}, Lcn/kuaipan/android/kss/download/LoadRecorder;->recycle()V

    goto/16 :goto_d

    :catchall_2
    move-exception v0

    goto :goto_6

    :catch_2
    move-exception v0

    goto :goto_7

    :catchall_3
    move-exception v0

    move-object/from16 v12, v21

    :goto_6
    move-object/from16 v15, v22

    goto :goto_b

    :catch_3
    move-exception v0

    move-object/from16 v11, p4

    move-object/from16 v12, v21

    :goto_7
    move-object/from16 v15, v22

    goto :goto_8

    :catchall_4
    move-exception v0

    move-object v12, v13

    move-object/from16 v22, v15

    goto :goto_b

    :catch_4
    move-exception v0

    move-object/from16 v11, p4

    move-object v12, v13

    move-object/from16 v22, v15

    goto :goto_8

    :catchall_5
    move-exception v0

    move-object/from16 v22, v15

    goto/16 :goto_2

    :catch_5
    move-exception v0

    move-object/from16 v11, p4

    move-object/from16 v22, v15

    goto/16 :goto_3

    :catchall_6
    move-exception v0

    const/4 v12, 0x0

    const/4 v15, 0x0

    goto :goto_b

    :catch_6
    move-exception v0

    move-object/from16 v11, p4

    const/4 v12, 0x0

    const/4 v15, 0x0

    :goto_8
    :try_start_a
    invoke-static {v0}, Lcn/kuaipan/android/exception/ErrorHelper;->handleInterruptException(Ljava/lang/Throwable;)V

    array-length v13, v8

    const/4 v14, 0x1

    sub-int/2addr v13, v14

    if-lt v10, v13, :cond_4

    if-nez v12, :cond_3

    const-string v2, "No response."

    goto :goto_9

    :cond_3
    invoke-virtual {v12}, Lcn/kuaipan/android/http/KscHttpResponse;->dump()Ljava/lang/String;

    move-result-object v2

    :goto_9
    invoke-static {v0, v2}, Lcn/kuaipan/android/exception/KscException;->newException(Ljava/lang/Throwable;Ljava/lang/String;)Lcn/kuaipan/android/exception/KscException;

    move-result-object v0

    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_7

    :cond_4
    if-eqz v15, :cond_5

    invoke-virtual {v15}, Lcn/kuaipan/android/http/KscHttpRequest;->getRequest()Lorg/apache/http/client/methods/HttpUriRequest;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/client/methods/HttpUriRequest;->abort()V

    goto :goto_a

    :cond_5
    invoke-direct {v1, v12}, Lcn/kuaipan/android/kss/download/KssDownloader;->releaseResponse(Lcn/kuaipan/android/http/KscHttpResponse;)V

    :goto_a
    if-eqz v4, :cond_6

    invoke-virtual {v4}, Lcn/kuaipan/android/kss/download/LoadRecorder;->recycle()V

    :cond_6
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_1

    :catchall_7
    move-exception v0

    :goto_b
    if-eqz v15, :cond_7

    invoke-virtual {v15}, Lcn/kuaipan/android/http/KscHttpRequest;->getRequest()Lorg/apache/http/client/methods/HttpUriRequest;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/client/methods/HttpUriRequest;->abort()V

    goto :goto_c

    :cond_7
    invoke-direct {v1, v12}, Lcn/kuaipan/android/kss/download/KssDownloader;->releaseResponse(Lcn/kuaipan/android/http/KscHttpResponse;)V

    :goto_c
    if-eqz v4, :cond_8

    invoke-virtual {v4}, Lcn/kuaipan/android/kss/download/LoadRecorder;->recycle()V

    :cond_8
    throw v0

    :cond_9
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    :cond_a
    move-object/from16 v11, p4

    :cond_b
    :goto_d
    invoke-virtual/range {p3 .. p3}, Lcn/kuaipan/android/kss/download/LoadMap;->obtainRecorder()Lcn/kuaipan/android/kss/download/LoadRecorder;

    move-result-object v4

    goto/16 :goto_0

    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "No available urls to download."

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    :cond_e
    return-void
.end method

.method private releaseResponse(Lcn/kuaipan/android/http/KscHttpResponse;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    if-eqz p1, :cond_1

    :try_start_0
    invoke-virtual {p1}, Lcn/kuaipan/android/http/KscHttpResponse;->release()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-static {p1}, Lcn/kuaipan/android/exception/ErrorHelper;->isInterrupted(Ljava/lang/Throwable;)Ljava/lang/InterruptedException;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    throw p1

    :cond_1
    :goto_0
    return-void
.end method

.method private save(Lcn/kuaipan/android/http/KscHttpResponse;Lcn/kuaipan/android/kss/download/KssAccessor;Lcn/kuaipan/android/kss/download/LoadRecorder;Ljava/util/concurrent/atomic/AtomicInteger;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x3

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p1}, Lcn/kuaipan/android/http/KscHttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v2

    if-eqz v2, :cond_3

    const/16 p1, 0x2000

    new-array p1, p1, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/4 v3, 0x0

    :cond_0
    :try_start_1
    invoke-virtual {v2, p1}, Ljava/io/InputStream;->read([B)I

    move-result v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-ltz v4, :cond_1

    const/4 v3, 0x1

    if-lez v4, :cond_0

    :try_start_2
    invoke-virtual {p2, p1, v1, v4, p3}, Lcn/kuaipan/android/kss/download/KssAccessor;->write([BIILcn/kuaipan/android/kss/download/LoadRecorder;)I

    move-result v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-ge v5, v4, :cond_0

    goto :goto_0

    :catchall_0
    move-exception p1

    const/4 v1, 0x1

    goto :goto_1

    :cond_1
    :goto_0
    if-eqz v3, :cond_2

    invoke-virtual {p4, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    :cond_2
    return-void

    :catchall_1
    move-exception p1

    move v1, v3

    goto :goto_1

    :cond_3
    :try_start_3
    new-instance p2, Lcn/kuaipan/android/exception/KscRuntimeException;

    const p3, 0x7a128

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Not meet exception, but no response.\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcn/kuaipan/android/http/KscHttpResponse;->dump()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p3, p1}, Lcn/kuaipan/android/exception/KscRuntimeException;-><init>(ILjava/lang/String;)V

    throw p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :catchall_2
    move-exception p1

    :goto_1
    if-eqz v1, :cond_4

    invoke-virtual {p4, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    :cond_4
    throw p1
.end method


# virtual methods
.method public download(Ljava/io/File;ZLcn/kuaipan/android/http/IKscTransferListener;Lcn/kuaipan/android/kss/IKssDownloadRequestResult;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcn/kuaipan/android/exception/KscException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_0
    invoke-interface {p4}, Lcn/kuaipan/android/kss/IKssDownloadRequestResult;->getTotalSize()J

    move-result-wide v2

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result p2

    if-nez p2, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v4

    cmp-long p2, v4, v2

    if-lez p2, :cond_3

    :cond_0
    invoke-static {p1}, Lcn/kuaipan/android/utils/FileUtils;->deletes(Ljava/io/File;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    new-instance p2, Ljava/lang/SecurityException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed delete target file. Can\'t download to dest path: "

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_2
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p2

    invoke-virtual {p2}, Ljava/io/File;->mkdirs()Z

    :cond_3
    :goto_0
    new-instance p2, Lcn/kuaipan/android/kss/download/LoadMap;

    invoke-direct {p2, p4, p3}, Lcn/kuaipan/android/kss/download/LoadMap;-><init>(Lcn/kuaipan/android/kss/IKssDownloadRequestResult;Lcn/kuaipan/android/http/IKscTransferListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    :try_start_1
    invoke-static {p1}, Lcn/kuaipan/android/kss/download/KInfo;->getInfoFile(Ljava/io/File;)Ljava/io/File;

    move-result-object p3

    new-instance v2, Lcn/kuaipan/android/kss/download/KInfo;

    invoke-direct {v2, p3}, Lcn/kuaipan/android/kss/download/KInfo;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    :try_start_2
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result p3

    if-eqz p3, :cond_4

    invoke-virtual {v2}, Lcn/kuaipan/android/kss/download/KInfo;->load()V

    invoke-virtual {v2}, Lcn/kuaipan/android/kss/download/KInfo;->getHash()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p4}, Lcn/kuaipan/android/kss/IKssDownloadRequestResult;->getHash()Ljava/lang/String;

    move-result-object v3

    invoke-static {p3, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_4

    invoke-virtual {v2, p2}, Lcn/kuaipan/android/kss/download/KInfo;->loadToMap(Lcn/kuaipan/android/kss/download/LoadMap;)Z

    move-result p3

    goto :goto_1

    :cond_4
    const/4 p3, 0x0

    :goto_1
    if-nez p3, :cond_5

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p3

    if-eqz p3, :cond_5

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-virtual {p2, v3, v4}, Lcn/kuaipan/android/kss/download/LoadMap;->initSize(J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :cond_5
    :try_start_3
    new-instance p3, Lcn/kuaipan/android/kss/download/KssAccessor;

    invoke-direct {p3, p1}, Lcn/kuaipan/android/kss/download/KssAccessor;-><init>(Ljava/io/File;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :try_start_4
    invoke-virtual {p2, p3, v0}, Lcn/kuaipan/android/kss/download/LoadMap;->verify(Lcn/kuaipan/android/kss/download/KssAccessor;Z)V

    invoke-interface {p4}, Lcn/kuaipan/android/kss/IKssDownloadRequestResult;->getTotalSize()J

    move-result-wide v3

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v5

    cmp-long v1, v5, v3

    if-eqz v1, :cond_6

    invoke-virtual {p3, v3, v4}, Lcn/kuaipan/android/kss/download/KssAccessor;->inflate(J)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :cond_6
    :try_start_5
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v3, 0x3

    invoke-direct {v1, v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    :goto_2
    invoke-virtual {p2}, Lcn/kuaipan/android/kss/download/LoadMap;->isCompleted()Z

    move-result v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-nez v4, :cond_9

    :try_start_6
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    if-nez v0, :cond_8

    :try_start_7
    invoke-direct {p0, p4, p3, p2, v1}, Lcn/kuaipan/android/kss/download/KssDownloader;->download(Lcn/kuaipan/android/kss/IKssDownloadRequestResult;Lcn/kuaipan/android/kss/download/KssAccessor;Lcn/kuaipan/android/kss/download/LoadMap;Ljava/util/concurrent/atomic/AtomicInteger;)V

    invoke-virtual {v1, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V
    :try_end_7
    .catch Ljava/security/InvalidKeyException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Lcn/kuaipan/android/exception/KscException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_3

    :catch_0
    move-exception v0

    :try_start_8
    invoke-static {v0}, Lcn/kuaipan/android/exception/ErrorHelper;->isNetworkException(Ljava/lang/Throwable;)Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v5

    if-ltz v5, :cond_7

    const-wide/16 v5, 0x1388

    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V

    :goto_3
    move v0, v4

    goto :goto_2

    :cond_7
    throw v0

    :catch_1
    move-exception p1

    const-string v0, "Failed when download kss block."

    invoke-static {p1, v0}, Lcn/kuaipan/android/exception/KscException;->newException(Ljava/lang/Throwable;Ljava/lang/String;)Lcn/kuaipan/android/exception/KscException;

    move-result-object p1

    throw p1

    :cond_8
    new-instance p1, Ljava/lang/InterruptedException;

    invoke-direct {p1}, Ljava/lang/InterruptedException;-><init>()V

    throw p1

    :catchall_0
    move-exception p1

    move-object v1, p3

    move v0, v4

    goto :goto_6

    :cond_9
    invoke-interface {p4}, Lcn/kuaipan/android/kss/IKssDownloadRequestResult;->getModifyTime()J

    move-result-wide v0

    const-wide/16 v5, 0x0

    cmp-long v3, v0, v5

    if-lez v3, :cond_a

    invoke-virtual {p1, v0, v1}, Ljava/io/File;->setLastModified(J)Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    :cond_a
    :try_start_9
    invoke-virtual {p3}, Lcn/kuaipan/android/kss/download/KssAccessor;->close()V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_2

    :catch_2
    if-eqz v4, :cond_b

    invoke-virtual {v2}, Lcn/kuaipan/android/kss/download/KInfo;->delete()V

    goto :goto_4

    :cond_b
    invoke-interface {p4}, Lcn/kuaipan/android/kss/IKssDownloadRequestResult;->getHash()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Lcn/kuaipan/android/kss/download/KInfo;->setHash(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Lcn/kuaipan/android/kss/download/KInfo;->setLoadMap(Lcn/kuaipan/android/kss/download/LoadMap;)V

    invoke-virtual {v2}, Lcn/kuaipan/android/kss/download/KInfo;->save()V

    :goto_4
    return-void

    :catchall_1
    move-exception p1

    move-object v1, p3

    goto :goto_6

    :catch_3
    move-exception p1

    move-object v1, p3

    goto :goto_5

    :catch_4
    move-exception p1

    :goto_5
    :try_start_a
    const-string p3, "Local IO error, when prepare kss download."

    invoke-static {p1, p3}, Lcn/kuaipan/android/exception/KscException;->newException(Ljava/lang/Throwable;Ljava/lang/String;)Lcn/kuaipan/android/exception/KscException;

    move-result-object p1

    throw p1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :catchall_2
    move-exception p1

    goto :goto_6

    :catchall_3
    move-exception p1

    move-object v2, v1

    goto :goto_6

    :catchall_4
    move-exception p1

    move-object p2, v1

    move-object v2, p2

    :goto_6
    if-eqz v1, :cond_c

    :try_start_b
    invoke-virtual {v1}, Lcn/kuaipan/android/kss/download/KssAccessor;->close()V
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_5

    :catch_5
    :cond_c
    if-eqz v2, :cond_e

    if-nez v0, :cond_d

    if-eqz p2, :cond_e

    invoke-interface {p4}, Lcn/kuaipan/android/kss/IKssDownloadRequestResult;->getHash()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v2, p3}, Lcn/kuaipan/android/kss/download/KInfo;->setHash(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Lcn/kuaipan/android/kss/download/KInfo;->setLoadMap(Lcn/kuaipan/android/kss/download/LoadMap;)V

    invoke-virtual {v2}, Lcn/kuaipan/android/kss/download/KInfo;->save()V

    goto :goto_7

    :cond_d
    invoke-virtual {v2}, Lcn/kuaipan/android/kss/download/KInfo;->delete()V

    :cond_e
    :goto_7
    throw p1
.end method
