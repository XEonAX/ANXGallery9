.class public Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;
.super Ljava/lang/Object;
.source "KssMasterRef.java"

# interfaces
.implements Lcn/kuaipan/android/kss/KssDef;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/opensdk/file/sdk/KssMasterRef$KscTransferListener;
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private final mDownloader:Lcn/kuaipan/android/kss/download/KssDownloader;

.field private final mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

.field private final mUploader:Lcn/kuaipan/android/kss/upload/KssUploader;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "KssMasterRef"

    iput-object v0, p0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->TAG:Ljava/lang/String;

    new-instance v0, Lcom/xiaomi/opensdk/file/sdk/FileDataFactory;

    invoke-direct {v0}, Lcom/xiaomi/opensdk/file/sdk/FileDataFactory;-><init>()V

    new-instance v1, Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-direct {v1, p1, v0}, Lcn/kuaipan/android/kss/upload/UploadTaskStore;-><init>(Landroid/content/Context;Lcn/kuaipan/android/kss/IDataFactory;)V

    iput-object v1, p0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    new-instance v0, Lcn/kuaipan/android/http/KscHttpTransmitter;

    invoke-direct {v0, p1}, Lcn/kuaipan/android/http/KscHttpTransmitter;-><init>(Landroid/content/Context;)V

    invoke-static {p1}, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->getUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x4

    invoke-virtual {v0, v1, p1}, Lcn/kuaipan/android/http/KscHttpTransmitter;->setUserAgent(ILjava/lang/String;)V

    new-instance p1, Lcn/kuaipan/android/kss/upload/KssUploader;

    iget-object v1, p0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-direct {p1, v0, v1}, Lcn/kuaipan/android/kss/upload/KssUploader;-><init>(Lcn/kuaipan/android/http/KscHttpTransmitter;Lcn/kuaipan/android/kss/upload/UploadTaskStore;)V

    iput-object p1, p0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->mUploader:Lcn/kuaipan/android/kss/upload/KssUploader;

    new-instance p1, Lcn/kuaipan/android/kss/download/KssDownloader;

    invoke-direct {p1, v0}, Lcn/kuaipan/android/kss/download/KssDownloader;-><init>(Lcn/kuaipan/android/http/KscHttpTransmitter;)V

    iput-object p1, p0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->mDownloader:Lcn/kuaipan/android/kss/download/KssDownloader;

    return-void
.end method

.method private deleteUploadInfo(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-virtual {v0, p1}, Lcn/kuaipan/android/kss/upload/UploadTaskStore;->removeUploadInfo(I)V

    return-void
.end method

.method private static getUploadHash(Ljava/io/File;Ljava/lang/String;Lcn/kuaipan/android/kss/upload/UploadFileInfo;)I
    .locals 1

    if-nez p2, :cond_0

    const-string p2, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->getSha1()Ljava/lang/String;

    move-result-object p2

    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ":"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ":"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method

.method private getUploadInfo(Lcn/kuaipan/android/kss/upload/UploadFileInfo;Lcom/xiaomi/opensdk/file/model/UploadContext;I)Lcn/kuaipan/android/kss/upload/KssUploadInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcn/kuaipan/android/exception/KscException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-virtual {v0, p3}, Lcn/kuaipan/android/kss/upload/UploadTaskStore;->getUploadInfo(I)Lcn/kuaipan/android/kss/upload/KssUploadInfo;

    move-result-object v0

    :goto_0
    if-nez v0, :cond_3

    invoke-virtual {p2}, Lcom/xiaomi/opensdk/file/model/UploadContext;->getUploadParam()Lcom/xiaomi/opensdk/file/model/UploadParameter;

    move-result-object v0

    if-eqz v0, :cond_2

    :try_start_0
    invoke-virtual {v0}, Lcom/xiaomi/opensdk/file/model/UploadParameter;->toJsonObject()Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v1}, Lcom/xiaomi/opensdk/file/utils/FileSDKUtils;->contentKssJsonToMap(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    new-instance v2, Lcom/xiaomi/opensdk/file/sdk/FileUploadRequestResult;

    invoke-direct {v2, v1}, Lcom/xiaomi/opensdk/file/sdk/FileUploadRequestResult;-><init>(Ljava/util/Map;)V

    new-instance v1, Lcn/kuaipan/android/kss/upload/KssUploadInfo;

    invoke-direct {v1, p1, v2}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;-><init>(Lcn/kuaipan/android/kss/upload/UploadFileInfo;Lcn/kuaipan/android/kss/IKssUploadRequestResult;)V

    invoke-virtual {v0}, Lcom/xiaomi/opensdk/file/model/UploadParameter;->getUploadId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->setUploadId(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-virtual {p1, p3, v1}, Lcn/kuaipan/android/kss/upload/UploadTaskStore;->putUploadInfo(ILcn/kuaipan/android/kss/upload/KssUploadInfo;)V

    :cond_1
    move-object v0, v1

    goto :goto_1

    :catch_0
    move-exception p1

    const-string p2, "getUploadInfo failed"

    invoke-static {p1, p2}, Lcn/kuaipan/android/exception/KscException;->newException(Ljava/lang/Throwable;Ljava/lang/String;)Lcn/kuaipan/android/exception/KscException;

    move-result-object p1

    throw p1

    :cond_2
    new-instance p1, Lcn/kuaipan/android/exception/KscRuntimeException;

    const p2, 0x7a123

    const-string p3, "uploadParam null"

    invoke-direct {p1, p2, p3}, Lcn/kuaipan/android/exception/KscRuntimeException;-><init>(ILjava/lang/String;)V

    throw p1

    :cond_3
    :goto_1
    invoke-virtual {p2}, Lcom/xiaomi/opensdk/file/model/UploadContext;->getMaxChunkSize()J

    move-result-wide p1

    invoke-virtual {v0, p1, p2}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->setMaxChunkSize(J)V

    const-string p1, "KssMasterRef"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "KssUploadInfo Return:"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->getUploadId()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method private static getUserAgent(Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    const-string v0, "KssRC4/1.0 %s/%s S3SDK/%s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {p0}, Lcn/kuaipan/android/utils/ContextUtils;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    const/4 v2, 0x1

    aput-object p0, v1, v2

    const-string p0, "0.9.0a"

    const/4 v2, 0x2

    aput-object p0, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public download(Ljava/io/File;Lcom/xiaomi/opensdk/file/model/DownloadParameter;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcn/kuaipan/android/exception/KscException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    if-eqz p1, :cond_2

    new-instance v0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef$KscTransferListener;

    invoke-direct {v0, p0, p3}, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef$KscTransferListener;-><init>(Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V

    :try_start_0
    invoke-virtual {p2}, Lcom/xiaomi/opensdk/file/model/DownloadParameter;->toJsonObject()Lorg/json/JSONObject;

    move-result-object p2

    invoke-static {p2}, Lcom/xiaomi/opensdk/file/utils/FileSDKUtils;->contentKssJsonToMap(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object p2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    new-instance p3, Lcom/xiaomi/opensdk/file/sdk/FileDownloadRequestResult;

    invoke-direct {p3, p2}, Lcom/xiaomi/opensdk/file/sdk/FileDownloadRequestResult;-><init>(Ljava/util/Map;)V

    invoke-interface {p3}, Lcn/kuaipan/android/kss/IKssDownloadRequestResult;->getStatus()I

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p3}, Lcn/kuaipan/android/kss/IKssDownloadRequestResult;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_0

    new-instance p1, Lcn/kuaipan/android/exception/KscException;

    const p2, 0x7acd8

    const-string p3, "Unknow error when requestDownload."

    invoke-direct {p1, p2, p3}, Lcn/kuaipan/android/exception/KscException;-><init>(ILjava/lang/String;)V

    throw p1

    :cond_0
    new-instance p2, Lcn/kuaipan/android/exception/ServerMsgException;

    const/16 p3, 0xc8

    const-string p4, "Failed on requestDownload"

    invoke-direct {p2, p3, p1, p4}, Lcn/kuaipan/android/exception/ServerMsgException;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    throw p2

    :cond_1
    iget-object p2, p0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->mDownloader:Lcn/kuaipan/android/kss/download/KssDownloader;

    invoke-virtual {p2, p1, p4, v0, p3}, Lcn/kuaipan/android/kss/download/KssDownloader;->download(Ljava/io/File;ZLcn/kuaipan/android/http/IKscTransferListener;Lcn/kuaipan/android/kss/IKssDownloadRequestResult;)V

    return-void

    :catch_0
    move-exception p1

    const-string p2, "download failed"

    invoke-static {p1, p2}, Lcn/kuaipan/android/exception/KscException;->newException(Ljava/lang/Throwable;Ljava/lang/String;)Lcn/kuaipan/android/exception/KscException;

    move-result-object p1

    throw p1

    :cond_2
    new-instance p1, Lcn/kuaipan/android/exception/KscRuntimeException;

    const p2, 0x7a123

    const-string p3, "Save path can\'t be null."

    invoke-direct {p1, p2, p3}, Lcn/kuaipan/android/exception/KscRuntimeException;-><init>(ILjava/lang/String;)V

    throw p1
.end method

.method public hasStoredUploadInfo(I)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->mTaskStore:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-virtual {v0, p1}, Lcn/kuaipan/android/kss/upload/UploadTaskStore;->getUploadInfo(I)Lcn/kuaipan/android/kss/upload/KssUploadInfo;

    move-result-object p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    :goto_1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1
.end method

.method public upload(Lcom/xiaomi/opensdk/file/model/UploadContext;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcn/kuaipan/android/exception/KscException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/xiaomi/opensdk/file/model/UploadContext;->getLocalFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_6

    new-instance v1, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef$KscTransferListener;

    invoke-virtual {p1}, Lcom/xiaomi/opensdk/file/model/UploadContext;->getListener()Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef$KscTransferListener;-><init>(Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V

    invoke-static {v0}, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->getFileInfo(Ljava/io/File;)Lcn/kuaipan/android/kss/upload/UploadFileInfo;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3, v2}, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->getUploadHash(Ljava/io/File;Ljava/lang/String;Lcn/kuaipan/android/kss/upload/UploadFileInfo;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->hasStoredUploadInfo(I)Z

    move-result v4

    const/4 v5, 0x1

    if-nez v4, :cond_0

    invoke-virtual {p1}, Lcom/xiaomi/opensdk/file/model/UploadContext;->getUploadParam()Lcom/xiaomi/opensdk/file/model/UploadParameter;

    move-result-object v4

    if-nez v4, :cond_0

    invoke-virtual {p1, v5}, Lcom/xiaomi/opensdk/file/model/UploadContext;->setNeedRequestUpload(Z)V

    invoke-virtual {v2}, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->getKssString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/xiaomi/opensdk/file/model/UploadContext;->setKssString(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->getSha1()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/xiaomi/opensdk/file/model/UploadContext;->setSha1(Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v4, 0x0

    move-object v6, v4

    :goto_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v7

    if-nez v7, :cond_5

    if-nez v6, :cond_1

    invoke-direct {p0, v2, p1, v3}, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->getUploadInfo(Lcn/kuaipan/android/kss/upload/UploadFileInfo;Lcom/xiaomi/opensdk/file/model/UploadContext;I)Lcn/kuaipan/android/kss/upload/KssUploadInfo;

    move-result-object v6

    :cond_1
    if-nez v6, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef$KscTransferListener;->setSendTotal(J)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef$KscTransferListener;->setSendPos(J)V

    goto :goto_1

    :cond_2
    invoke-virtual {v6}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->isBroken()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual {p1, v5}, Lcom/xiaomi/opensdk/file/model/UploadContext;->setNeedRequestUpload(Z)V

    invoke-virtual {p1, v4}, Lcom/xiaomi/opensdk/file/model/UploadContext;->setUploadParam(Lcom/xiaomi/opensdk/file/model/UploadParameter;)V

    return-void

    :cond_3
    invoke-virtual {v6}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->isCompleted()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef$KscTransferListener;->setSendTotal(J)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef$KscTransferListener;->setSendPos(J)V

    invoke-direct {p0, v3}, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->deleteUploadInfo(I)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/xiaomi/opensdk/file/model/UploadContext;->setNeedRequestUpload(Z)V

    invoke-virtual {v6}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->getCommitString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/xiaomi/opensdk/file/model/UploadContext;->setCommitString(Ljava/lang/String;)V

    invoke-virtual {v6}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->getUploadId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/xiaomi/opensdk/file/model/UploadContext;->setUploadId(Ljava/lang/String;)V

    invoke-virtual {v6}, Lcn/kuaipan/android/kss/upload/KssUploadInfo;->getFileInfo()Lcn/kuaipan/android/kss/upload/UploadFileInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->getSha1()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/xiaomi/opensdk/file/model/UploadContext;->setSha1(Ljava/lang/String;)V

    :goto_1
    return-void

    :cond_4
    iget-object v7, p0, Lcom/xiaomi/opensdk/file/sdk/KssMasterRef;->mUploader:Lcn/kuaipan/android/kss/upload/KssUploader;

    invoke-virtual {v7, v0, v1, v3, v6}, Lcn/kuaipan/android/kss/upload/KssUploader;->upload(Ljava/io/File;Lcn/kuaipan/android/http/IKscTransferListener;ILcn/kuaipan/android/kss/upload/KssUploadInfo;)V

    goto :goto_0

    :cond_5
    new-instance p1, Ljava/lang/InterruptedException;

    invoke-direct {p1}, Ljava/lang/InterruptedException;-><init>()V

    throw p1

    :cond_6
    new-instance p1, Lcn/kuaipan/android/exception/KscRuntimeException;

    const v1, 0x7a123

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " is not a exist file."

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v1, v0}, Lcn/kuaipan/android/exception/KscRuntimeException;-><init>(ILjava/lang/String;)V

    throw p1
.end method
