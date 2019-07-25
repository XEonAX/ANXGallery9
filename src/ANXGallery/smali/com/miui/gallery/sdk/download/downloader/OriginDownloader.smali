.class public Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;
.super Ljava/lang/Object;
.source "OriginDownloader.java"

# interfaces
.implements Lcom/miui/gallery/sdk/download/downloader/IDownloader;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private checkConditionPermitted(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Z
    .locals 2

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->checkCondition(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isStatusOk()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p1, v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->callbackError(Lcom/miui/gallery/sdk/download/assist/DownloadItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method private static checkDBImageValid(Lcom/miui/gallery/sdk/download/assist/RequestItem;)Z
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-static {v0}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->canDownloadStatus(Lcom/miui/gallery/data/DBImage;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    return v2

    :cond_0
    const/4 v1, 0x0

    const/4 v3, 0x0

    if-nez v0, :cond_1

    new-instance v0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v2, Lcom/miui/gallery/error/core/ErrorCode;->PARAMS_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v4, "item null"

    invoke-direct {v0, v2, v4, v3}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {p0, v0, v3}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v4, p0, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v4}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadTempFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isNotSyncedStatus(Lcom/miui/gallery/data/DBImage;)Z

    move-result v5

    const/4 v6, 0x2

    if-eqz v5, :cond_2

    new-instance v5, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v7, Lcom/miui/gallery/error/core/ErrorCode;->NOT_SYNCED:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v8, "item invalid server[%s], local[%s]"

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getServerStatus()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v6, v1

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v8, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v7, v0, v3}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {p0, v5, v4}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    new-instance v5, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v7, Lcom/miui/gallery/error/core/ErrorCode;->PARAMS_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v8, "item invalid server[%s], local[%s]"

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getServerStatus()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v6, v1

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v8, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v7, v0, v3}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {p0, v5, v4}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;Ljava/lang/String;)V

    :goto_0
    return v1
.end method

.method private static createListener(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/miui/gallery/sdk/download/assist/RequestItem;)Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader$1;

    invoke-direct {v0, p1, p0}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader$1;-><init>(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lcom/miui/gallery/cloud/RequestCloudItem;)V

    return-object v0
.end method

.method private doPostOriginDownloadWork(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/lang/String;J)Z
    .locals 6

    iget-object v0, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    const/4 v1, 0x1

    invoke-static {p3, v0, v1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isOriginalFileValid(Ljava/lang/String;Lcom/miui/gallery/data/DBImage;Z)Z

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-nez v0, :cond_0

    const-string p2, "OriginalFileDownloader"

    const-string p4, "Downloaded original file [%s] is invalid"

    invoke-static {p2, p4, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p2, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object p4, Lcom/miui/gallery/error/core/ErrorCode;->SERVER_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const-string p5, "Downloaded original file [%s] is invalid"

    new-array v0, v1, [Ljava/lang/Object;

    aput-object p3, v0, v3

    invoke-static {p5, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p5

    invoke-direct {p2, p4, p5, v2}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;Ljava/lang/String;)V

    return v3

    :cond_0
    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getSize()J

    move-result-wide v4

    invoke-static {p1, p4, p5, v4, v5}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->statDownloadSuccess(Lcom/miui/gallery/sdk/download/assist/RequestItem;JJ)V

    iget-object p4, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    iget-object p5, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {p5}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p5

    invoke-static {p4, p5}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->ensureDownloadFolder(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object p4

    sget-object p5, Lcom/miui/gallery/error/core/ErrorCode;->NO_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    if-eq p4, p5, :cond_1

    iget-object p2, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    iget-object p5, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {p5}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p5

    invoke-static {p2, p5}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadFolderPath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p2

    const-string p5, "OriginalFileDownloader"

    const-string v0, "Cannot create folder [%s] to download"

    invoke-static {p5, v0, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p5, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    const-string v0, "Cannot create folder [%s] to download"

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p5, p4, p2, v2}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {p1, p5, p3}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;Ljava/lang/String;)V

    return v3

    :cond_1
    iget-object p2, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    iget-object p4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {p4}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p4

    invoke-static {p2, p4}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-eqz p4, :cond_2

    const-string p2, "OriginalFileDownloader"

    const-string p4, "Cannot find valid download path for image [%s]"

    iget-object p5, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-static {p2, p4, p5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p2, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object p4, Lcom/miui/gallery/error/core/ErrorCode;->UNKNOWN:Lcom/miui/gallery/error/core/ErrorCode;

    const-string p5, "Cannot find valid download path for image [%s]"

    new-array v0, v1, [Ljava/lang/Object;

    iget-object v1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    aput-object v1, v0, v3

    invoke-static {p5, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p5

    invoke-direct {p2, p4, p5, v2}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;Ljava/lang/String;)V

    return v3

    :cond_2
    iget-object p4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p4}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result p4

    if-nez p4, :cond_3

    new-instance p4, Ljava/io/File;

    invoke-direct {p4, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance p5, Ljava/io/File;

    invoke-direct {p5, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p4, p5}, Lcom/miui/gallery/util/FileUtils;->move(Ljava/io/File;Ljava/io/File;)Z

    move-result p4

    goto :goto_0

    :cond_3
    iget-object p4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p4}, Lcom/miui/gallery/data/DBImage;->isVideoType()Z

    move-result p4

    iget-object p5, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p5}, Lcom/miui/gallery/data/DBImage;->getSecretKey()[B

    move-result-object p5

    invoke-static {p3, p2, p4, p5}, Lcom/miui/gallery/util/SecretAlbumCryptoUtils;->encrypt(Ljava/lang/String;Ljava/lang/String;Z[B)Z

    move-result p4

    sget-object p5, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v0, v1, [Ljava/lang/String;

    aput-object p3, v0, v3

    invoke-static {p5, v0}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    :goto_0
    if-nez p4, :cond_4

    const-string p4, "OriginalFileDownloader"

    const-string p5, "Move or encrypt failed for image [%s]"

    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-static {p4, p5, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object p4, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array p5, v1, [Ljava/lang/String;

    aput-object p2, p5, v3

    invoke-static {p4, p5}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    new-instance p2, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object p4, Lcom/miui/gallery/error/core/ErrorCode;->FILE_OPERATE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const-string p5, "Move or encrypt failed for image [%s]"

    new-array v0, v1, [Ljava/lang/Object;

    iget-object v1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    aput-object v1, v0, v3

    invoke-static {p5, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p5

    invoke-direct {p2, p4, p5, v2}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;Ljava/lang/String;)V

    return v3

    :cond_4
    iget-object p3, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isCancelled()Z

    move-result p3

    if-eqz p3, :cond_5

    const-string p3, "OriginalFileDownloader"

    const-string p4, "downloading for image[%s] is cancelled"

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-static {p3, p4, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object p1, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array p3, v1, [Ljava/lang/String;

    aput-object p2, p3, v3

    invoke-static {p1, p3}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    return v3

    :cond_5
    iget-object p3, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isManual()Z

    move-result p3

    if-eqz p3, :cond_7

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getSyncStrategy()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    move-result-object p3

    invoke-virtual {p3}, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isFrontForManualDownload()Z

    move-result p3

    if-nez p3, :cond_6

    goto :goto_1

    :cond_6
    const/4 p3, 0x0

    goto :goto_2

    :cond_7
    :goto_1
    const/4 p3, 0x1

    :goto_2
    if-eqz p3, :cond_8

    iget-object p3, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p3}, Lcom/miui/gallery/data/DBImage;->getMixedDateTime()J

    move-result-wide p3

    const-wide/16 v4, 0x0

    cmp-long p5, p3, v4

    if-lez p5, :cond_9

    iget-object p3, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p3}, Lcom/miui/gallery/data/DBImage;->getMixedDateTime()J

    move-result-wide p3

    invoke-static {p2, p3, p4}, Lcom/miui/gallery/util/FileUtils;->setLastModified(Ljava/lang/String;J)Z

    move-result p3

    if-nez p3, :cond_9

    const-string p3, "OriginalFileDownloader"

    const-string p4, "set last modified error"

    invoke-static {p3, p4}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_8
    const-string p3, "OriginalFileDownloader"

    const-string p4, "front for manual downloading %s"

    iget-object p5, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p5}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object p5

    invoke-static {p3, p4, p5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_9
    :goto_3
    iget-object p3, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUriAdapter()Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

    move-result-object p3

    iget-object p4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {p4}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object p4

    invoke-interface {p3, p4}, Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;->getDBItemForUri(Landroid/net/Uri;)Lcom/miui/gallery/data/DBImage;

    move-result-object p3

    new-instance p4, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    iget-object p5, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-direct {p4, p5, p3}, Lcom/miui/gallery/sdk/download/assist/RequestItem;-><init>(Lcom/miui/gallery/sdk/download/assist/DownloadItem;Lcom/miui/gallery/data/DBImage;)V

    invoke-static {p4}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->checkDBImageValid(Lcom/miui/gallery/sdk/download/assist/RequestItem;)Z

    move-result p4

    if-nez p4, :cond_a

    const-string p4, "OriginalFileDownloader"

    const-string p5, "DBImage [%s] is invalid after download file for uri [%s] finished"

    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-static {p4, p5, p3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object p3, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array p4, v1, [Ljava/lang/String;

    aput-object p2, p4, v3

    invoke-static {p3, p4}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-static {p1, v3}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->persistDownloadStatus(Lcom/miui/gallery/data/DBImage;I)V

    return v3

    :cond_a
    new-instance p3, Landroid/content/ContentValues;

    invoke-direct {p3}, Landroid/content/ContentValues;-><init>()V

    iget-object p4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p4}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result p4

    if-nez p4, :cond_c

    iget-object p4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    sget-object p5, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {p4, p5}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->checkAndReturnValidFilePathForType(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p5

    if-nez p5, :cond_b

    invoke-virtual {p4, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p5

    if-nez p5, :cond_b

    const-string p5, "OriginalFileDownloader"

    const-string v0, "Delete thumbnail [%s] of image [%s], because we already have original file"

    iget-object v4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-static {p5, v0, p4, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object p5, Lcom/miui/gallery/util/MediaFileUtils$FileType;->THUMBNAIL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v0, v1, [Ljava/lang/String;

    aput-object p4, v0, v3

    invoke-static {p5, v0}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    :cond_b
    iget-object p4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p4}, Lcom/miui/gallery/data/DBImage;->getThumbnailFile()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_c

    const-string p4, "OriginalFileDownloader"

    const-string p5, "Delete thumbnail record [%s] of image [%s], because we already have original file"

    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getThumbnailFile()Ljava/lang/String;

    move-result-object v0

    iget-object v4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-static {p4, p5, v0, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p4, v2}, Lcom/miui/gallery/data/DBImage;->setThumbnailFile(Ljava/lang/String;)V

    const-string p4, "thumbnailFile"

    invoke-virtual {p3, p4}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    :cond_c
    iget-object p4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p4, p2}, Lcom/miui/gallery/data/DBImage;->setLocalFile(Ljava/lang/String;)V

    const-string p4, "localFile"

    invoke-virtual {p3, p4, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p4}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result p4

    if-nez p4, :cond_e

    iget-object p4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p4}, Lcom/miui/gallery/data/DBImage;->isImageType()Z

    move-result p4

    if-eqz p4, :cond_d

    const-string p4, "specialTypeFlags"

    invoke-static {p2}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->parseFlagsForImage(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p5

    invoke-virtual {p3, p4, p5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_4

    :cond_d
    iget-object p4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p4}, Lcom/miui/gallery/data/DBImage;->isVideoType()Z

    move-result p4

    if-eqz p4, :cond_e

    const-string p4, "specialTypeFlags"

    invoke-static {p2}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->parseFlagsForVideo(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p5

    invoke-virtual {p3, p4, p5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :cond_e
    :goto_4
    iget-object p4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p4}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object p4

    iget-object p5, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {p5}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isManual()Z

    move-result p5

    if-eqz p5, :cond_f

    invoke-virtual {p4}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p4

    const-string p5, "requireNotifyUri"

    const-string v0, "true"

    invoke-virtual {p4, p5, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p4

    invoke-virtual {p4}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p4

    :cond_f
    iget-object p5, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p5}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p5

    invoke-static {p4, p3, p5}, Lcom/miui/gallery/cloud/CloudUtils;->updateToLocalDB(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;)I

    move-result p3

    if-gtz p3, :cond_10

    const-string p3, "OriginalFileDownloader"

    const-string p4, "Update database failed after download original file for image [%s]"

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-static {p3, p4, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object p1, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array p3, v1, [Ljava/lang/String;

    aput-object p2, p3, v3

    invoke-static {p1, p3}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    return v3

    :cond_10
    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result p1

    if-nez p1, :cond_11

    new-array p1, v1, [Ljava/io/File;

    new-instance p3, Ljava/io/File;

    invoke-direct {p3, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    aput-object p3, p1, v3

    invoke-static {v1, p1}, Lcom/miui/gallery/util/MediaFileUtils;->triggerMediaScan(Z[Ljava/io/File;)V

    :cond_11
    return v1
.end method

.method private static fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;Ljava/lang/String;)V
    .locals 3

    const-string v0, "OriginalFileDownloader"

    const-string v1, "download fail %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, "OriginalFileDownloader"

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    sget-object v0, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    iget-object p2, p0, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isStatusOk()Z

    move-result p2

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-static {p2, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->callbackError(Lcom/miui/gallery/sdk/download/assist/DownloadItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    :cond_1
    const/4 p2, 0x0

    invoke-static {p0, p2, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->statDownloadError(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    return-void
.end method

.method private static packageDownloadedItem(Lcom/miui/gallery/data/DBImage;)Lcom/miui/gallery/sdk/download/assist/DownloadedItem;
    .locals 3

    new-instance v0, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSecretKeyNoGenerate()[B

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    invoke-direct {v0, v1, p0}, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;-><init>(Ljava/lang/String;[B)V

    return-object v0
.end method


# virtual methods
.method public download(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/accounts/Account;",
            "Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/sdk/download/assist/DownloadItem;",
            ">;)V"
        }
    .end annotation

    move-object v7, p0

    move-object/from16 v0, p3

    if-eqz v0, :cond_12

    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v1

    if-gtz v1, :cond_0

    goto/16 :goto_8

    :cond_0
    const-string v1, "OriginalFileDownloader"

    const-string v2, "Start downloading items [%s] total count %d"

    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v2, v0, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->checkConditionPermitted(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "OriginalFileDownloader"

    const-string v2, "Download condition not ok type %s"

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUriLock()Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantLock;->isLocked()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "OriginalFileDownloader"

    const-string v2, "%s wait lock"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_0
    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUriAdapter()Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

    move-result-object v1

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;->getDBItemForUri(Landroid/net/Uri;)Lcom/miui/gallery/data/DBImage;

    move-result-object v1

    const-string v2, "OriginalFileDownloader"

    const-string v3, "Start downloading origin file for uri [%s] size [%d]"

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object v4

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getSize()J

    move-result-wide v5

    goto :goto_1

    :cond_3
    const-wide/16 v5, -0x1

    :goto_1
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    invoke-direct {v10, v0, v1}, Lcom/miui/gallery/sdk/download/assist/RequestItem;-><init>(Lcom/miui/gallery/sdk/download/assist/DownloadItem;Lcom/miui/gallery/data/DBImage;)V

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->checkAndReturnValidFilePathForType(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v11, 0x3

    const/4 v12, 0x0

    if-nez v3, :cond_5

    iget-object v3, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v3}, Lcom/miui/gallery/data/DBImage;->getMixedDateTime()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v13, v3, v5

    if-lez v13, :cond_4

    iget-object v3, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v3}, Lcom/miui/gallery/data/DBImage;->getMixedDateTime()J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/FileUtils;->setLastModified(Ljava/lang/String;J)Z

    :cond_4
    const-string v2, "OriginalFileDownloader"

    const-string v3, "Original file for id %s already exist, no need to download again"

    iget-object v4, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v4}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v12, v11}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->compareAnsSetStatus(II)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-static {v10}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->persistDownloadStatus(Lcom/miui/gallery/sdk/download/assist/RequestItem;)V

    invoke-static {v1}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->packageDownloadedItem(Lcom/miui/gallery/data/DBImage;)Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->callbackSuccess(Lcom/miui/gallery/sdk/download/assist/DownloadItem;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V

    goto :goto_2

    :cond_5
    invoke-static {v10}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->checkDBImageValid(Lcom/miui/gallery/sdk/download/assist/RequestItem;)Z

    move-result v2

    if-nez v2, :cond_7

    const-string v2, "OriginalFileDownloader"

    const-string v3, "Invalid dbImage [%s] for download uri [%s]!"

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-static {v2, v3, v1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :cond_6
    :goto_2
    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto/16 :goto_0

    :cond_7
    :try_start_1
    new-instance v3, Lcom/miui/gallery/cloud/RequestCloudItem;

    iget-object v1, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/DownloadType;->getPriority()I

    move-result v1

    iget-object v2, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-direct {v3, v1, v2}, Lcom/miui/gallery/cloud/RequestCloudItem;-><init>(ILcom/miui/gallery/data/DBImage;)V

    iget-object v1, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isStatusOk()Z

    move-result v1

    if-nez v1, :cond_8

    const-string v0, "OriginalFileDownloader"

    const-string v1, "Item %s status %s"

    iget-object v2, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getKey()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v3}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getStatus()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_2

    :cond_8
    iget-object v1, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isManual()Z

    move-result v1

    if-eqz v1, :cond_9

    iget-object v1, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->persistDownloadStatus(Lcom/miui/gallery/data/DBImage;I)V

    :cond_9
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v1

    if-eqz v1, :cond_a

    const-string v0, "OriginalFileDownloader"

    const-string v1, "Origin download thread is interrupted!"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void

    :cond_a
    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/4 v1, 0x0

    :try_start_3
    iget-object v2, v3, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->ensureDownloadTempFolder(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object v2

    sget-object v4, Lcom/miui/gallery/error/core/ErrorCode;->NO_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    if-eq v2, v4, :cond_b

    const-string v4, "OriginalFileDownloader"

    const-string v5, "Failed to create temp download folder [%s] for image [%s]"

    iget-object v3, v3, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadTempFolderPath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v5, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    const-string v3, "Failed to create temp download folder"

    invoke-direct {v0, v2, v3, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {v10, v0, v1}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    iget-object v0, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isManual()Z

    move-result v0

    if-eqz v0, :cond_6

    :goto_3
    invoke-static {v10}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->persistDownloadStatus(Lcom/miui/gallery/sdk/download/assist/RequestItem;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto/16 :goto_2

    :cond_b
    :try_start_5
    iget-object v2, v3, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadTempFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v13
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    iget-object v0, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isShareItem()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-static {v3, v10}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->createListener(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/miui/gallery/sdk/download/assist/RequestItem;)Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;

    move-result-object v0

    invoke-static {v3, v13, v0}, Lcom/miui/gallery/cloud/GalleryKssManager;->doSharerDownload(Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/lang/String;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V

    goto :goto_4

    :cond_c
    invoke-static {v3, v10}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->createListener(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/miui/gallery/sdk/download/assist/RequestItem;)Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;

    move-result-object v0

    invoke-static {v3, v13, v0}, Lcom/miui/gallery/cloud/GalleryKssManager;->doOwnerDownload(Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/lang/String;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V

    :goto_4
    const-string v0, "OriginalFileDownloader"

    const-string v1, "Done downloading temp file [%s] for image [%s]"

    iget-object v2, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-static {v0, v1, v13, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v1, p0

    move-object v2, v10

    move-object v4, v13

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->doPostOriginDownloadWork(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/lang/String;J)Z

    move-result v0

    if-eqz v0, :cond_e

    iget-object v0, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v0, v12, v11}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->compareAnsSetStatus(II)Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    iget-object v1, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-static {v1}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->packageDownloadedItem(Lcom/miui/gallery/data/DBImage;)Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->callbackSuccess(Lcom/miui/gallery/sdk/download/assist/DownloadItem;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V

    :cond_d
    const-string v0, "OriginalFileDownloader"

    const-string v1, "Successfully complete origin download work for image [%s]!"

    iget-object v2, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_5

    :cond_e
    const-string v0, "OriginalFileDownloader"

    const-string v1, "Error occurred when doing post origin download work for image [%s]!"

    iget-object v2, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :goto_5
    :try_start_7
    iget-object v0, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isManual()Z

    move-result v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    if-eqz v0, :cond_6

    goto :goto_3

    :catch_0
    move-exception v0

    goto :goto_6

    :catchall_0
    move-exception v0

    goto :goto_7

    :catch_1
    move-exception v0

    move-object v13, v1

    :goto_6
    :try_start_8
    iget-object v1, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-direct {p0, v1}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->checkConditionPermitted(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Z

    move-result v1

    if-eqz v1, :cond_f

    new-instance v1, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    invoke-static {v0, v13}, Lcom/miui/gallery/error/util/ErrorParseUtil;->parseError(Ljava/lang/Throwable;Ljava/lang/String;)Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {v10, v1, v13}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    :cond_f
    :try_start_9
    iget-object v0, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isManual()Z

    move-result v0

    if-eqz v0, :cond_6

    goto/16 :goto_3

    :goto_7
    iget-object v1, v10, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isManual()Z

    move-result v1

    if-eqz v1, :cond_10

    invoke-static {v10}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->persistDownloadStatus(Lcom/miui/gallery/sdk/download/assist/RequestItem;)V

    :cond_10
    throw v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    :catchall_1
    move-exception v0

    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0

    :cond_11
    return-void

    :cond_12
    :goto_8
    return-void
.end method
