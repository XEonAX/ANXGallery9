.class abstract Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;
.super Ljava/lang/Object;
.source "AbsThumbnailDownloader.java"

# interfaces
.implements Lcom/miui/gallery/sdk/download/downloader/IDownloader;


# static fields
.field private static final MAX_TRY_COUNT:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getSyncStrategy()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->getMaxDownloadTimes()I

    move-result v0

    sput v0, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->MAX_TRY_COUNT:I

    return-void
.end method

.method constructor <init>()V
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

.method private checkItemValid(Lcom/miui/gallery/sdk/download/assist/RequestItem;)Z
    .locals 9

    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

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

    const-string v4, "dbImage null"

    invoke-direct {v0, v2, v4, v3}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, p1, v3, v0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    goto :goto_0

    :cond_1
    invoke-static {v0}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isNotSyncedStatus(Lcom/miui/gallery/data/DBImage;)Z

    move-result v4

    const/4 v5, 0x2

    if-eqz v4, :cond_2

    new-instance v4, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v6, Lcom/miui/gallery/error/core/ErrorCode;->NOT_SYNCED:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v7, "item invalid server[%s], local[%s]"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getServerStatus()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v1

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v2

    invoke-static {v7, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v6, v0, v3}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, p1, v3, v4}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    goto :goto_0

    :cond_2
    new-instance v4, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v6, Lcom/miui/gallery/error/core/ErrorCode;->PARAMS_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v7, "item invalid server[%s], local[%s]"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getServerStatus()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v1

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v2

    invoke-static {v7, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v6, v0, v3}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, p1, v3, v4}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    :goto_0
    return v1
.end method

.method private static classifyRequest(Ljava/util/List;)Ljava/util/HashMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/sdk/download/assist/RequestItem;",
            ">;)",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/sdk/download/assist/RequestItem;",
            ">;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    iget-object v2, v1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->isShareItem()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, v1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->getGroupId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_0
    const-string v2, "owner"

    :goto_1
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-nez v3, :cond_1

    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private decreaseConnTimeout(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 3

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$FileDownload;->getConnTimeout(Lcom/miui/gallery/sdk/download/DownloadType;)I

    move-result v0

    add-int/lit16 v0, v0, -0x3e8

    invoke-static {p1, v0}, Lcom/miui/gallery/preference/GalleryPreferences$FileDownload;->setConnTimeout(Lcom/miui/gallery/sdk/download/DownloadType;I)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v1

    const-string v2, "decrease conn timeout %d, type %s"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/DownloadType;->name()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, v2, v0, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private deleteTempFile(Lcom/miui/gallery/sdk/download/assist/RequestItem;)V
    .locals 3

    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadTempFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/util/MediaFileUtils$FileType;->TEMP:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method private downloadData(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    new-instance v0, Ljava/io/File;

    iget-object v1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadTempFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/DocumentProviderUtils;->needUseDocumentProvider(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/miui/gallery/util/DocumentProviderUtils;->getDocumentFile(Landroid/content/Context;Ljava/io/File;)Landroid/support/v4/provider/DocumentFile;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_6
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object p1

    :cond_0
    :try_start_1
    invoke-virtual {v1}, Landroid/support/v4/provider/DocumentFile;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "w"

    invoke-virtual {v2, v1, v3}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v1
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_8
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v4, v2

    move-object v2, v1

    move-object v1, v4

    goto :goto_0

    :catchall_0
    move-exception p2

    move-object v2, v1

    goto/16 :goto_4

    :catch_0
    move-exception p2

    move-object v2, v1

    move-object v1, p1

    goto :goto_1

    :catch_1
    move-exception p2

    move-object v2, v1

    move-object v1, p1

    goto :goto_2

    :catch_2
    move-exception p2

    move-object v2, v1

    move-object v1, p1

    goto :goto_3

    :cond_1
    :try_start_3
    new-instance v1, Ljava/io/FileOutputStream;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_8
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_7
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_6
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-object v2, p1

    :goto_0
    :try_start_4
    const-string v3, "UTF-8"

    invoke-virtual {p2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p2

    const/4 v3, 0x2

    invoke-static {p2, v3}, Landroid/util/Base64;->decode([BI)[B

    move-result-object p2

    invoke-virtual {v1, p2}, Ljava/io/OutputStream;->write([B)V
    :try_end_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :catch_3
    move-exception p2

    goto :goto_1

    :catch_4
    move-exception p2

    goto :goto_2

    :catch_5
    move-exception p2

    goto :goto_3

    :catchall_1
    move-exception p2

    move-object v2, p1

    goto :goto_4

    :catch_6
    move-exception p2

    move-object v1, p1

    move-object v2, v1

    :goto_1
    :try_start_5
    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v3, "download data error."

    invoke-static {v0, v3, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object p1

    :catch_7
    move-exception p2

    move-object v1, p1

    move-object v2, v1

    :goto_2
    :try_start_6
    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v3, "download data error."

    invoke-static {v0, v3, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object p1

    :catch_8
    move-exception p2

    move-object v1, p1

    move-object v2, v1

    :goto_3
    :try_start_7
    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v3, "download data error."

    invoke-static {v0, v3, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object p1

    :catchall_2
    move-exception p2

    move-object p1, v1

    :goto_4
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p2
.end method

.method private downloadFile(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 24

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    new-instance v4, Ljava/io/File;

    iget-object v0, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    iget-object v5, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v5}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadTempFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_0
    if-eqz v0, :cond_14

    sget v0, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->MAX_TRY_COUNT:I

    if-ge v8, v0, :cond_14

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    const/16 v16, 0x2

    :try_start_0
    sget-object v0, Lcom/miui/gallery/cloud/NetworkUtils$RequestType;->GET:Lcom/miui/gallery/cloud/NetworkUtils$RequestType;

    invoke-static {v3, v0}, Lcom/miui/gallery/cloud/NetworkUtils;->getHttpConn(Ljava/lang/String;Lcom/miui/gallery/cloud/NetworkUtils$RequestType;)Ljava/net/HttpURLConnection;

    move-result-object v15
    :try_end_0
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_0 .. :try_end_0} :catch_27
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_26
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_25
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    :try_start_1
    iget-object v0, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$FileDownload;->getConnTimeout(Lcom/miui/gallery/sdk/download/DownloadType;)I

    move-result v0

    iget-object v12, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v12}, Lcom/miui/gallery/data/DBImage;->isVideoType()Z

    move-result v12
    :try_end_1
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_1 .. :try_end_1} :catch_24
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_23
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_22
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    if-eqz v12, :cond_0

    mul-int/lit8 v0, v0, 0x2

    :try_start_2
    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$FileDownload;->clampConnTimeout(I)I

    move-result v0
    :try_end_2
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    goto :goto_7

    :catch_0
    move-exception v0

    move-object/from16 v21, v4

    move/from16 v18, v8

    :goto_1
    move-wide/from16 v22, v13

    move-object v5, v15

    :goto_2
    const/4 v7, 0x0

    goto/16 :goto_22

    :catch_1
    move-exception v0

    move-object/from16 v21, v4

    move/from16 v18, v8

    :goto_3
    move-wide/from16 v22, v13

    move-object v5, v15

    :goto_4
    const/4 v7, 0x0

    goto/16 :goto_24

    :catch_2
    move-exception v0

    move-object/from16 v21, v4

    move/from16 v18, v8

    :goto_5
    move-wide/from16 v22, v13

    move-object v5, v15

    :goto_6
    const/4 v7, 0x0

    goto/16 :goto_25

    :cond_0
    :goto_7
    :try_start_3
    invoke-virtual {v15, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v15, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->connect()V

    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v12

    const/16 v0, 0xc8

    if-lt v12, v0, :cond_2

    const/16 v0, 0x12c

    if-lt v12, v0, :cond_1

    goto :goto_8

    :cond_1
    move/from16 v18, v8

    goto/16 :goto_d

    :cond_2
    :goto_8
    invoke-static {v12}, Lcom/miui/gallery/cloud/CheckResult;->checkKSSThumbnailResult(I)Lcom/miui/gallery/cloud/base/GallerySyncCode;

    move-result-object v0

    sget-object v5, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;
    :try_end_3
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_3 .. :try_end_3} :catch_24
    .catch Ljava/net/SocketTimeoutException; {:try_start_3 .. :try_end_3} :catch_23
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_22
    .catchall {:try_start_3 .. :try_end_3} :catchall_5

    if-ne v0, v5, :cond_4

    :try_start_4
    iget-object v0, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/preference/ThumbnailPreference;->putThumbnailKey(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v5, "thumbnail can\'t be download forever, just add sha1 to preference %d, %s"

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v7, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v7}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v5, v6, v7}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v5, "statusCode"

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "downloadType"

    iget-object v6, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v6}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "Sync"

    const-string v6, "sync_thumbnail_build_error"

    invoke-static {v5, v6, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    new-instance v0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v5, Lcom/miui/gallery/error/core/ErrorCode;->THUMBNAIL_BUILD_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v6, "thumbnail can\'t build: %s"

    const/4 v7, 0x1

    new-array v12, v7, [Ljava/lang/Object;

    iget-object v7, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v7}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v7

    const/16 v17, 0x0

    aput-object v7, v12, v17

    invoke-static {v6, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6
    :try_end_4
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_5

    const/4 v7, 0x0

    :try_start_5
    invoke-direct {v0, v5, v6, v7}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/net/SocketTimeoutException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    :try_start_6
    invoke-direct {v1, v2, v3, v0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    :try_end_6
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    invoke-static {v11}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v9}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v10}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    if-eqz v15, :cond_3

    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v3, "download %s, origin file %s, cost %d, success %s"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    iget-object v2, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x1

    aput-object v2, v5, v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v13

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v5, v16

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v4, 0x3

    aput-object v2, v5, v4

    :goto_9
    invoke-static {v0, v3, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v2, 0x0

    return-object v2

    :catch_3
    move-exception v0

    move-object/from16 v21, v4

    move/from16 v18, v8

    goto/16 :goto_a

    :catch_4
    move-exception v0

    move-object/from16 v21, v4

    move/from16 v18, v8

    goto/16 :goto_b

    :catch_5
    move-exception v0

    move-object/from16 v21, v4

    move/from16 v18, v8

    goto/16 :goto_c

    :cond_4
    :try_start_7
    invoke-static {v12}, Lcom/miui/gallery/cloud/CheckResult;->isNotRetryCode(I)Z

    move-result v0
    :try_end_7
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_7 .. :try_end_7} :catch_24
    .catch Ljava/net/SocketTimeoutException; {:try_start_7 .. :try_end_7} :catch_23
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_22
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    if-eqz v0, :cond_1

    :try_start_8
    new-instance v0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v5, Lcom/miui/gallery/error/core/ErrorCode;->SERVER_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v6, "server ret: %s"
    :try_end_8
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_8 .. :try_end_8} :catch_b
    .catch Ljava/net/SocketTimeoutException; {:try_start_8 .. :try_end_8} :catch_a
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_9
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    move/from16 v18, v8

    const/4 v7, 0x1

    :try_start_9
    new-array v8, v7, [Ljava/lang/Object;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v12, 0x0

    aput-object v7, v8, v12

    invoke-static {v6, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6
    :try_end_9
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_9 .. :try_end_9} :catch_e
    .catch Ljava/net/SocketTimeoutException; {:try_start_9 .. :try_end_9} :catch_d
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_c
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    const/4 v7, 0x0

    :try_start_a
    invoke-direct {v0, v5, v6, v7}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_a
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_a .. :try_end_a} :catch_8
    .catch Ljava/net/SocketTimeoutException; {:try_start_a .. :try_end_a} :catch_7
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_6
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    :try_start_b
    invoke-direct {v1, v2, v3, v0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    :try_end_b
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_b .. :try_end_b} :catch_e
    .catch Ljava/net/SocketTimeoutException; {:try_start_b .. :try_end_b} :catch_d
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_c
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    invoke-static {v11}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v9}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v10}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    if-eqz v15, :cond_5

    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v3, "download %s, origin file %s, cost %d, success %s"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    iget-object v2, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x1

    aput-object v2, v5, v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v13

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v5, v16

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v4, 0x3

    aput-object v2, v5, v4

    goto :goto_9

    :catch_6
    move-exception v0

    move-object/from16 v21, v4

    :goto_a
    move-wide/from16 v22, v13

    goto/16 :goto_1b

    :catch_7
    move-exception v0

    move-object/from16 v21, v4

    :goto_b
    move-wide/from16 v22, v13

    goto/16 :goto_1e

    :catch_8
    move-exception v0

    move-object/from16 v21, v4

    :goto_c
    move-wide/from16 v22, v13

    goto/16 :goto_21

    :catch_9
    move-exception v0

    move/from16 v18, v8

    goto :goto_e

    :catch_a
    move-exception v0

    move/from16 v18, v8

    goto :goto_f

    :catch_b
    move-exception v0

    move/from16 v18, v8

    goto :goto_10

    :goto_d
    :try_start_c
    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v0
    :try_end_c
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_c .. :try_end_c} :catch_21
    .catch Ljava/net/SocketTimeoutException; {:try_start_c .. :try_end_c} :catch_20
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_1f
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    int-to-long v5, v0

    const-wide/16 v7, 0x0

    cmp-long v0, v5, v7

    if-gtz v0, :cond_6

    :try_start_d
    iget-object v0, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getSize()J

    move-result-wide v5
    :try_end_d
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_d .. :try_end_d} :catch_e
    .catch Ljava/net/SocketTimeoutException; {:try_start_d .. :try_end_d} :catch_d
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_c
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    goto :goto_11

    :catch_c
    move-exception v0

    :goto_e
    move-object/from16 v21, v4

    goto/16 :goto_1

    :catch_d
    move-exception v0

    :goto_f
    move-object/from16 v21, v4

    goto/16 :goto_3

    :catch_e
    move-exception v0

    :goto_10
    move-object/from16 v21, v4

    goto/16 :goto_5

    :cond_6
    :goto_11
    :try_start_e
    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7
    :try_end_e
    .catch Ljava/io/FileNotFoundException; {:try_start_e .. :try_end_e} :catch_1b
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_e .. :try_end_e} :catch_e
    .catch Ljava/net/SocketTimeoutException; {:try_start_e .. :try_end_e} :catch_d
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_e} :catch_c
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    :try_start_f
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/DocumentProviderUtils;->needUseDocumentProvider(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v4}, Lcom/miui/gallery/util/DocumentProviderUtils;->getDocumentFile(Landroid/content/Context;Ljava/io/File;)Landroid/support/v4/provider/DocumentFile;

    move-result-object v0
    :try_end_f
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_f .. :try_end_f} :catch_1a
    .catch Ljava/net/SocketTimeoutException; {:try_start_f .. :try_end_f} :catch_19
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_f} :catch_18
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    if-nez v0, :cond_8

    invoke-static {v7}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v9}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v10}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    if-eqz v15, :cond_7

    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_7
    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v3, "download %s, origin file %s, cost %d, success %s"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    iget-object v2, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x1

    aput-object v2, v5, v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v13

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v5, v16

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v4, 0x3

    aput-object v2, v5, v4

    goto/16 :goto_9

    :cond_8
    :try_start_10
    invoke-virtual {v0}, Landroid/support/v4/provider/DocumentFile;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v11, "w"

    invoke-virtual {v8, v0, v11}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v8
    :try_end_10
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_10 .. :try_end_10} :catch_1a
    .catch Ljava/net/SocketTimeoutException; {:try_start_10 .. :try_end_10} :catch_19
    .catch Ljava/lang/Throwable; {:try_start_10 .. :try_end_10} :catch_18
    .catchall {:try_start_10 .. :try_end_10} :catchall_3

    :try_start_11
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-virtual {v8}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v10

    invoke-direct {v0, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_11
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_11 .. :try_end_11} :catch_11
    .catch Ljava/net/SocketTimeoutException; {:try_start_11 .. :try_end_11} :catch_10
    .catch Ljava/lang/Throwable; {:try_start_11 .. :try_end_11} :catch_f
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    move-object v9, v0

    move-object v10, v8

    const/4 v8, 0x0

    goto :goto_12

    :catchall_0
    move-exception v0

    move-object/from16 v21, v4

    move-object v11, v7

    move-object v10, v8

    goto/16 :goto_18

    :catch_f
    move-exception v0

    move-object/from16 v21, v4

    move-object v11, v7

    move-object v10, v8

    goto/16 :goto_1

    :catch_10
    move-exception v0

    move-object/from16 v21, v4

    move-object v11, v7

    move-object v10, v8

    goto/16 :goto_3

    :catch_11
    move-exception v0

    move-object/from16 v21, v4

    move-object v11, v7

    move-object v10, v8

    goto/16 :goto_5

    :cond_9
    :try_start_12
    new-instance v0, Ljava/io/FileOutputStream;

    const/4 v8, 0x0

    invoke-direct {v0, v4, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    move-object v9, v0

    :goto_12
    const/16 v0, 0x2000

    new-array v11, v0, [B

    const-wide/16 v19, 0x0

    :goto_13
    invoke-virtual {v7, v11, v8, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v12
    :try_end_12
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_12 .. :try_end_12} :catch_1a
    .catch Ljava/net/SocketTimeoutException; {:try_start_12 .. :try_end_12} :catch_19
    .catch Ljava/lang/Throwable; {:try_start_12 .. :try_end_12} :catch_18
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    if-ltz v12, :cond_a

    :try_start_13
    invoke-virtual {v9, v11, v8, v12}, Ljava/io/OutputStream;->write([BII)V

    int-to-long v0, v12

    add-long v0, v19, v0

    iget-object v8, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-static {v8, v0, v1, v5, v6}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->callbackProgress(Lcom/miui/gallery/sdk/download/assist/DownloadItem;JJ)V
    :try_end_13
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_13 .. :try_end_13} :catch_14
    .catch Ljava/net/SocketTimeoutException; {:try_start_13 .. :try_end_13} :catch_13
    .catch Ljava/lang/Throwable; {:try_start_13 .. :try_end_13} :catch_12
    .catchall {:try_start_13 .. :try_end_13} :catchall_1

    move-wide/from16 v19, v0

    const/16 v0, 0x2000

    move-object/from16 v1, p0

    const/4 v8, 0x0

    goto :goto_13

    :catchall_1
    move-exception v0

    move-object/from16 v21, v4

    move-object v11, v7

    move-wide/from16 v22, v13

    move-object/from16 v1, p0

    goto/16 :goto_28

    :catch_12
    move-exception v0

    move-object/from16 v21, v4

    move-object v11, v7

    move-wide/from16 v22, v13

    move-object v5, v15

    move-object/from16 v1, p0

    goto/16 :goto_2

    :catch_13
    move-exception v0

    move-object/from16 v21, v4

    move-object v11, v7

    move-wide/from16 v22, v13

    move-object v5, v15

    move-object/from16 v1, p0

    goto/16 :goto_4

    :catch_14
    move-exception v0

    move-object/from16 v21, v4

    move-object v11, v7

    move-wide/from16 v22, v13

    move-object v5, v15

    move-object/from16 v1, p0

    goto/16 :goto_6

    :cond_a
    :try_start_14
    invoke-virtual {v9}, Ljava/io/OutputStream;->flush()V

    iget-object v0, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0
    :try_end_14
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_14 .. :try_end_14} :catch_17
    .catch Ljava/net/SocketTimeoutException; {:try_start_14 .. :try_end_14} :catch_16
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_14} :catch_15
    .catchall {:try_start_14 .. :try_end_14} :catchall_2

    move-object/from16 v1, p0

    :try_start_15
    invoke-direct {v1, v0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->decreaseConnTimeout(Lcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-static {v2, v13, v14, v5, v6}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->statDownloadSuccess(Lcom/miui/gallery/sdk/download/assist/RequestItem;JJ)V
    :try_end_15
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_15 .. :try_end_15} :catch_1a
    .catch Ljava/net/SocketTimeoutException; {:try_start_15 .. :try_end_15} :catch_19
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_15} :catch_18
    .catchall {:try_start_15 .. :try_end_15} :catchall_3

    invoke-static {v7}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v9}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v10}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    if-eqz v15, :cond_b

    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_b
    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v3, "download %s, origin file %s, cost %d, success %s"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    iget-object v6, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v6}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v5, v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v13

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v16

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    const/4 v7, 0x3

    aput-object v6, v5, v7

    invoke-static {v0, v3, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    add-int/lit8 v8, v18, 0x1

    move-object/from16 v21, v4

    goto/16 :goto_29

    :catchall_2
    move-exception v0

    move-object/from16 v1, p0

    goto :goto_14

    :catch_15
    move-exception v0

    move-object/from16 v1, p0

    goto :goto_15

    :catch_16
    move-exception v0

    move-object/from16 v1, p0

    goto :goto_16

    :catch_17
    move-exception v0

    move-object/from16 v1, p0

    goto :goto_17

    :catchall_3
    move-exception v0

    :goto_14
    move-object/from16 v21, v4

    move-object v11, v7

    goto/16 :goto_18

    :catch_18
    move-exception v0

    :goto_15
    move-object/from16 v21, v4

    move-object v11, v7

    goto/16 :goto_1

    :catch_19
    move-exception v0

    :goto_16
    move-object/from16 v21, v4

    move-object v11, v7

    goto/16 :goto_3

    :catch_1a
    move-exception v0

    :goto_17
    move-object/from16 v21, v4

    move-object v11, v7

    goto/16 :goto_5

    :catch_1b
    move-exception v0

    move-object v5, v0

    :try_start_16
    iget-object v0, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/preference/ThumbnailPreference;->putThumbnailKey(Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v6, Lcom/miui/gallery/error/core/ErrorCode;->THUMBNAIL_BUILD_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "thumbnail build error, ret %s"
    :try_end_16
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_16 .. :try_end_16} :catch_21
    .catch Ljava/net/SocketTimeoutException; {:try_start_16 .. :try_end_16} :catch_20
    .catch Ljava/lang/Throwable; {:try_start_16 .. :try_end_16} :catch_1f
    .catchall {:try_start_16 .. :try_end_16} :catchall_5

    move-object/from16 v21, v4

    move-wide/from16 v22, v13

    const/4 v4, 0x1

    :try_start_17
    new-array v13, v4, [Ljava/lang/Object;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v12, 0x0

    aput-object v4, v13, v12

    invoke-static {v7, v8, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v6, v4, v5}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {v1, v2, v3, v0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    :try_end_17
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_17 .. :try_end_17} :catch_1e
    .catch Ljava/net/SocketTimeoutException; {:try_start_17 .. :try_end_17} :catch_1d
    .catch Ljava/lang/Throwable; {:try_start_17 .. :try_end_17} :catch_1c
    .catchall {:try_start_17 .. :try_end_17} :catchall_4

    invoke-static {v11}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v9}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v10}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    if-eqz v15, :cond_c

    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_c
    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v3, "download %s, origin file %s, cost %d, success %s"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    iget-object v2, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x1

    aput-object v2, v4, v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long v5, v5, v22

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v4, v16

    invoke-virtual/range {v21 .. v21}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v5, 0x3

    aput-object v2, v4, v5

    invoke-static {v0, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v7, 0x0

    return-object v7

    :catchall_4
    move-exception v0

    goto/16 :goto_28

    :catch_1c
    move-exception v0

    goto :goto_1a

    :catch_1d
    move-exception v0

    goto :goto_1d

    :catch_1e
    move-exception v0

    goto :goto_20

    :catch_1f
    move-exception v0

    move-object/from16 v21, v4

    goto :goto_19

    :catch_20
    move-exception v0

    move-object/from16 v21, v4

    goto :goto_1c

    :catch_21
    move-exception v0

    move-object/from16 v21, v4

    goto :goto_1f

    :catchall_5
    move-exception v0

    move-object/from16 v21, v4

    :goto_18
    move-wide/from16 v22, v13

    goto/16 :goto_28

    :catch_22
    move-exception v0

    move-object/from16 v21, v4

    move/from16 v18, v8

    :goto_19
    move-wide/from16 v22, v13

    :goto_1a
    const/4 v7, 0x0

    :goto_1b
    move-object v5, v15

    goto :goto_22

    :catch_23
    move-exception v0

    move-object/from16 v21, v4

    move/from16 v18, v8

    :goto_1c
    move-wide/from16 v22, v13

    :goto_1d
    const/4 v7, 0x0

    :goto_1e
    move-object v5, v15

    goto/16 :goto_24

    :catch_24
    move-exception v0

    move-object/from16 v21, v4

    move/from16 v18, v8

    :goto_1f
    move-wide/from16 v22, v13

    :goto_20
    const/4 v7, 0x0

    :goto_21
    move-object v5, v15

    goto/16 :goto_25

    :catchall_6
    move-exception v0

    move-object/from16 v21, v4

    move-wide/from16 v22, v13

    move-object v15, v12

    goto/16 :goto_28

    :catch_25
    move-exception v0

    move-object/from16 v21, v4

    move/from16 v18, v8

    move-wide/from16 v22, v13

    const/4 v7, 0x0

    move-object v5, v12

    :goto_22
    :try_start_18
    iget-object v4, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-direct {v1, v4}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->checkConditionPermitted(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Z

    move-result v4

    if-eqz v4, :cond_d

    new-instance v4, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    invoke-virtual/range {v21 .. v21}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/miui/gallery/error/util/ErrorParseUtil;->parseError(Ljava/lang/Throwable;Ljava/lang/String;)Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v6, v8, v0}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {v1, v2, v3, v4}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    goto :goto_23

    :cond_d
    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct/range {p0 .. p1}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->deleteTempFile(Lcom/miui/gallery/sdk/download/assist/RequestItem;)V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_7

    :goto_23
    invoke-static {v11}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v9}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v10}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    if-eqz v5, :cond_e

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    move-object v5, v7

    :cond_e
    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v4, "download %s, origin file %s, cost %d, success %s"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v8, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    const/4 v12, 0x0

    aput-object v8, v6, v12

    iget-object v8, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v8}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v8

    const/4 v12, 0x1

    aput-object v8, v6, v12

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    sub-long v12, v12, v22

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v16

    invoke-virtual/range {v21 .. v21}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v8

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    const/4 v12, 0x3

    aput-object v8, v6, v12

    invoke-static {v0, v4, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    add-int/lit8 v8, v18, 0x1

    move-object v12, v5

    const/4 v0, 0x0

    goto/16 :goto_27

    :catch_26
    move-exception v0

    move-object/from16 v21, v4

    move/from16 v18, v8

    move-wide/from16 v22, v13

    const/4 v7, 0x0

    move-object v5, v12

    :goto_24
    :try_start_19
    iget-object v4, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v4}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->increaseConnTimeout(Lcom/miui/gallery/sdk/download/DownloadType;)V

    add-int/lit8 v8, v18, 0x1

    sget v4, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->MAX_TRY_COUNT:I

    if-lt v8, v4, :cond_f

    new-instance v4, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v6, Lcom/miui/gallery/error/core/ErrorCode;->SOCKET_TIMEOUT:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v12, "socket timeout: %s"

    const/4 v13, 0x1

    new-array v14, v13, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v3, v14, v13

    invoke-static {v12, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v4, v6, v12, v0}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {v1, v2, v3, v4}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_7

    :cond_f
    invoke-static {v11}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v9}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v10}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    if-eqz v5, :cond_10

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    move-object v5, v7

    :cond_10
    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v4, "download %s, origin file %s, cost %d, success %s"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v12, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    const/4 v13, 0x0

    aput-object v12, v6, v13

    iget-object v12, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v12}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    aput-object v12, v6, v13

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    sub-long v12, v12, v22

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v6, v16

    invoke-virtual/range {v21 .. v21}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v12

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    const/4 v13, 0x3

    aput-object v12, v6, v13

    goto :goto_26

    :catch_27
    move-exception v0

    move-object/from16 v21, v4

    move/from16 v18, v8

    move-wide/from16 v22, v13

    const/4 v7, 0x0

    move-object v5, v12

    :goto_25
    :try_start_1a
    iget-object v4, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v4}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->increaseConnTimeout(Lcom/miui/gallery/sdk/download/DownloadType;)V

    add-int/lit8 v8, v18, 0x1

    sget v4, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->MAX_TRY_COUNT:I

    if-lt v8, v4, :cond_11

    new-instance v4, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v6, Lcom/miui/gallery/error/core/ErrorCode;->CONNECT_TIMEOUT:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v12, "connect timeout: %s"

    const/4 v13, 0x1

    new-array v14, v13, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v3, v14, v13

    invoke-static {v12, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v4, v6, v12, v0}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {v1, v2, v3, v4}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_7

    :cond_11
    invoke-static {v11}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v9}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v10}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    if-eqz v5, :cond_12

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    move-object v5, v7

    :cond_12
    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v4, "download %s, origin file %s, cost %d, success %s"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v12, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    const/4 v13, 0x0

    aput-object v12, v6, v13

    iget-object v12, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v12}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    aput-object v12, v6, v13

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    sub-long v12, v12, v22

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v6, v16

    invoke-virtual/range {v21 .. v21}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v12

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    const/4 v13, 0x3

    aput-object v12, v6, v13

    :goto_26
    invoke-static {v0, v4, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    move-object v12, v5

    const/4 v0, 0x1

    :goto_27
    move-object/from16 v4, v21

    goto/16 :goto_0

    :catchall_7
    move-exception v0

    move-object v15, v5

    :goto_28
    invoke-static {v11}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v9}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {v10}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    if-eqz v15, :cond_13

    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_13
    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    iget-object v2, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x1

    aput-object v2, v4, v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long v5, v5, v22

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v4, v16

    invoke-virtual/range {v21 .. v21}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v5, 0x3

    aput-object v2, v4, v5

    const-string v2, "download %s, origin file %s, cost %d, success %s"

    invoke-static {v3, v2, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    throw v0

    :cond_14
    move-object/from16 v21, v4

    move/from16 v18, v8

    move/from16 v8, v18

    :goto_29
    sget v0, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->MAX_TRY_COUNT:I

    invoke-static {v2, v8, v0}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->statDownloadRetryTimes(Lcom/miui/gallery/sdk/download/assist/RequestItem;II)V

    invoke-virtual/range {v21 .. v21}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private downloadInternal(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/accounts/Account;",
            "Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/sdk/download/assist/RequestItem;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->requestUrls(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;)Lorg/json/JSONObject;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0, p3, p1}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->doFileDownload(Ljava/util/List;Lorg/json/JSONObject;)V

    return-void
.end method

.method private fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v1, "download fail %s"

    invoke-static {v0, v1, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    invoke-direct {p0, p1}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->deleteTempFile(Lcom/miui/gallery/sdk/download/assist/RequestItem;)V

    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isStatusOk()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-static {v0, p3}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->callbackError(Lcom/miui/gallery/sdk/download/assist/DownloadItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    :cond_2
    invoke-static {p1, p2, p3}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->statDownloadError(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    return-void
.end method

.method private getRequestUrl(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isShareItem()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$ShareMedia;->getRequestThumbnailUrl()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$OwnerMedia;->getRequestThumbnailUrl()Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method private increaseConnTimeout(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 3

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$FileDownload;->getConnTimeout(Lcom/miui/gallery/sdk/download/DownloadType;)I

    move-result v0

    add-int/lit16 v0, v0, 0xbb8

    invoke-static {p1, v0}, Lcom/miui/gallery/preference/GalleryPreferences$FileDownload;->setConnTimeout(Lcom/miui/gallery/sdk/download/DownloadType;I)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v1

    const-string v2, "increase conn timeout %d, type %s"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/DownloadType;->name()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, v2, v0, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private isValidUrl(Landroid/net/Uri;)Z
    .locals 1

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p1

    const-string v0, "http"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "https"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private onPostDownload(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;)V
    .locals 8

    invoke-static {p2}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->handleDownloadTempFile(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    iget-object p2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/preference/ThumbnailPreference;->putThumbnailKey(Ljava/lang/String;)V

    new-instance p2, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->WRITE_EXIF_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v2, "write exif error"

    invoke-direct {p2, v0, v2, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, p1, v1, p2}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    return-void

    :cond_1
    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    iget-object v2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->ensureDownloadFolder(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object v0

    sget-object v2, Lcom/miui/gallery/error/core/ErrorCode;->NO_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eq v0, v2, :cond_2

    new-instance p2, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "error create folder: %s"

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v6, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    iget-object v7, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v7}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadFolderPath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v4

    invoke-static {v2, v5, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p2, v0, v2, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, p1, v1, p2}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    return-void

    :cond_2
    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object p2

    const-string v0, "downloading for image[%s] is cancelled"

    iget-object v1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-static {p2, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->deleteTempFile(Lcom/miui/gallery/sdk/download/assist/RequestItem;)V

    return-void

    :cond_3
    new-instance v0, Ljava/io/File;

    iget-object v2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    iget-object v5, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v5}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iget-object v2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    iget-object v5, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v5}, Lcom/miui/gallery/data/DBImage;->getSecretKey()[B

    move-result-object v5

    invoke-static {p2, v2, v5}, Lcom/miui/gallery/util/CryptoUtil;->encryptFile(Ljava/lang/String;Ljava/lang/String;[B)Z

    move-result v2

    sget-object v5, Lcom/miui/gallery/util/MediaFileUtils$FileType;->TEMP:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v6, v3, [Ljava/lang/String;

    aput-object p2, v6, v4

    invoke-static {v5, v6}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    if-nez v2, :cond_5

    new-instance p2, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->FILE_OPERATE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v2, "encrypt error"

    invoke-direct {p2, v0, v2, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, p1, v1, p2}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    return-void

    :cond_4
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v0}, Lcom/miui/gallery/util/FileUtils;->move(Ljava/io/File;Ljava/io/File;)Z

    move-result p2

    if-nez p2, :cond_5

    new-instance p2, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->FILE_OPERATE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v2, "rename error"

    invoke-direct {p2, v0, v2, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, p1, v1, p2}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    return-void

    :cond_5
    iget-object p2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUriAdapter()Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

    move-result-object p2

    iget-object v2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-interface {p2, v2}, Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;->getDBItemForUri(Landroid/net/Uri;)Lcom/miui/gallery/data/DBImage;

    move-result-object p2

    new-instance v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    iget-object v5, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-direct {v2, v5, p2}, Lcom/miui/gallery/sdk/download/assist/RequestItem;-><init>(Lcom/miui/gallery/sdk/download/assist/DownloadItem;Lcom/miui/gallery/data/DBImage;)V

    invoke-direct {p0, v2}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->checkItemValid(Lcom/miui/gallery/sdk/download/assist/RequestItem;)Z

    move-result v5

    if-nez v5, :cond_6

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object p1

    const-string v1, "DBImage [%s] is invalid after download file for uri [%s] finished"

    iget-object v2, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-static {p1, v1, p2, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object p1, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array p2, v3, [Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p2, v4

    invoke-static {p1, p2}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    return-void

    :cond_6
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->updateDataBase(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;)Z

    iget-object p2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    const/4 v2, 0x3

    invoke-virtual {p2, v4, v2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->compareAnsSetStatus(II)Z

    move-result p2

    if-eqz p2, :cond_8

    iget-object p2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    new-instance v2, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    iget-object v3, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v3}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result v3

    if-eqz v3, :cond_7

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSecretKey()[B

    move-result-object v1

    :cond_7
    invoke-direct {v2, v0, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;-><init>(Ljava/lang/String;[B)V

    invoke-static {p2, v2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->callbackSuccess(Lcom/miui/gallery/sdk/download/assist/DownloadItem;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V

    :cond_8
    return-void
.end method

.method private requestUrls(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;)Lorg/json/JSONObject;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/accounts/Account;",
            "Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/sdk/download/assist/RequestItem;",
            ">;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_0

    const-string v3, ","

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    iget-object v2, v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->getRequestId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    iget-object v3, p1, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getRequestUrl(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Lorg/apache/http/message/BasicNameValuePair;

    const-string v4, "width"

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getRequestWidth()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v4, v6}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, Lorg/apache/http/message/BasicNameValuePair;

    const-string v4, "height"

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getRequestHeight()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v4, v6}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, Lorg/apache/http/message/BasicNameValuePair;

    const-string v4, "ids"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v4, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "priority"

    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    iget-object v4, v4, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v4}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miui/gallery/sdk/download/DownloadType;->isBackground()Z

    move-result v4

    if-eqz v4, :cond_2

    const-string v4, "low"

    goto :goto_1

    :cond_2
    const-string v4, "high"

    :goto_1
    invoke-direct {v0, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v0, 0x1

    const/4 v3, 0x0

    move-object v4, v2

    move-object v6, p1

    move-object v7, p2

    :try_start_0
    invoke-static/range {v4 .. v9}, Lcom/miui/gallery/cloud/CloudUtils;->getFromXiaomi(Ljava/lang/String;Ljava/util/List;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;IZ)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_6

    const-string p2, "code"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result p2

    if-nez p2, :cond_5

    const-string p2, "data"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_3

    const-string p2, "content"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_9
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Lcom/miui/gallery/cloud/GalleryMiCloudServerException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :cond_3
    move-object p1, v3

    :goto_2
    if-nez p1, :cond_4

    :try_start_1
    new-instance p2, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v4, Lcom/miui/gallery/error/core/ErrorCode;->SERVER_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v5, "data empty"

    invoke-direct {p2, v4, v5, v3}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lcom/miui/gallery/cloud/GalleryMiCloudServerException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_4

    :catch_0
    move-exception p2

    move-object v10, p2

    move-object p2, p1

    move-object p1, v10

    goto/16 :goto_6

    :catch_1
    move-exception p2

    move-object v10, p2

    move-object p2, p1

    move-object p1, v10

    goto/16 :goto_8

    :catch_2
    move-exception p2

    move-object v10, p2

    move-object p2, p1

    move-object p1, v10

    goto/16 :goto_a

    :catch_3
    move-exception p2

    move-object v10, p2

    move-object p2, p1

    move-object p1, v10

    goto/16 :goto_c

    :catch_4
    move-exception p2

    move-object v10, p2

    move-object p2, p1

    move-object p1, v10

    goto/16 :goto_e

    :cond_4
    move-object p2, v3

    goto :goto_4

    :cond_5
    :try_start_2
    const-string p2, "description"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v4, Lcom/miui/gallery/error/core/ErrorCode;->SERVER_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p2, v4, p1, v3}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    :cond_6
    new-instance p2, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object p1, Lcom/miui/gallery/error/core/ErrorCode;->SERVER_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v4, "data empty"

    invoke-direct {p2, p1, v4, v3}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_9
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_2 .. :try_end_2} :catch_8
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_7
    .catch Lcom/miui/gallery/cloud/GalleryMiCloudServerException; {:try_start_2 .. :try_end_2} :catch_6
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_3
    move-object p1, v3

    :goto_4
    if-eqz p2, :cond_7

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_5
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    invoke-direct {p0, v0, v3, p2}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    goto :goto_5

    :cond_7
    move-object p2, p1

    goto/16 :goto_10

    :catchall_0
    move-exception p1

    goto/16 :goto_11

    :catch_5
    move-exception p1

    move-object p2, v3

    :goto_6
    :try_start_3
    new-instance v0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    invoke-static {p1, v3}, Lcom/miui/gallery/error/util/ErrorParseUtil;->parseError(Ljava/lang/Throwable;Ljava/lang/String;)Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_7
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    invoke-direct {p0, p3, v3, v0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    goto :goto_7

    :catch_6
    move-exception p1

    move-object p2, v3

    :goto_8
    :try_start_4
    new-instance v0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    invoke-static {p1, v3}, Lcom/miui/gallery/error/util/ErrorParseUtil;->parseError(Ljava/lang/Throwable;Ljava/lang/String;)Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/GalleryMiCloudServerException;->getCloudServerException()Ljava/lang/Exception;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/GalleryMiCloudServerException;->getCloudServerException()Ljava/lang/Exception;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_9
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    invoke-direct {p0, p3, v3, v0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    goto :goto_9

    :catch_7
    move-exception p1

    move-object p2, v3

    :goto_a
    :try_start_5
    new-instance v4, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v5, Lcom/miui/gallery/error/core/ErrorCode;->SOCKET_TIMEOUT:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v6, "connect timeout: %s"

    new-array v0, v0, [Ljava/lang/Object;

    aput-object v2, v0, v1

    invoke-static {v6, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v5, v0, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    invoke-direct {p0, p3, v3, v4}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    goto :goto_b

    :catch_8
    move-exception p1

    move-object p2, v3

    :goto_c
    :try_start_6
    new-instance v4, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v5, Lcom/miui/gallery/error/core/ErrorCode;->CONNECT_TIMEOUT:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v6, "connect timeout: %s"

    new-array v0, v0, [Ljava/lang/Object;

    aput-object v2, v0, v1

    invoke-static {v6, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v5, v0, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    invoke-direct {p0, p3, v3, v4}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    goto :goto_d

    :catch_9
    move-exception p1

    move-object p2, v3

    :goto_e
    :try_start_7
    new-instance v0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v1, Lcom/miui/gallery/error/core/ErrorCode;->DATA_PARSE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v2, "parse data error"

    invoke-direct {v0, v1, v2, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    invoke-direct {p0, p3, v3, v0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    goto :goto_f

    :cond_8
    :goto_10
    return-object p2

    :goto_11
    throw p1
.end method


# virtual methods
.method protected abstract checkAndReturnValidPath(Lcom/miui/gallery/sdk/download/assist/RequestItem;)Ljava/lang/String;
.end method

.method protected doFileDownload(Ljava/util/List;Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/sdk/download/assist/RequestItem;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    iget-object v1, v0, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->downloadFileItem(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lorg/json/JSONObject;)Z

    goto :goto_0

    :cond_0
    return-void
.end method

.method public download(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;)V
    .locals 9
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

    if-eqz p3, :cond_8

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_8

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_0
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-direct {p0, v1}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->checkConditionPermitted(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Download condition not ok type %s"

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUriAdapter()Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

    move-result-object v2

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;->getDBItemForUri(Landroid/net/Uri;)Lcom/miui/gallery/data/DBImage;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    invoke-direct {v3, v1, v2}, Lcom/miui/gallery/sdk/download/assist/RequestItem;-><init>(Lcom/miui/gallery/sdk/download/assist/DownloadItem;Lcom/miui/gallery/data/DBImage;)V

    invoke-virtual {p0, v3}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->checkAndReturnValidPath(Lcom/miui/gallery/sdk/download/assist/RequestItem;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-eqz v4, :cond_3

    iget-object v1, v3, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/preference/ThumbnailPreference;->containsThumbnailKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v1

    const-string v2, "build error sha1 %s"

    iget-object v4, v3, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v4}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v2, v4}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v1, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v2, Lcom/miui/gallery/error/core/ErrorCode;->THUMBNAIL_BUILD_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v4, "thumbnail can\'t build: %s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    iget-object v8, v3, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v8}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v5

    invoke-static {v4, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v4, v6}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v3, v6, v1}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    goto :goto_0

    :cond_2
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    const/4 v4, 0x3

    invoke-virtual {v1, v5, v4}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->compareAnsSetStatus(II)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v3, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    new-instance v4, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    iget-object v5, v3, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v5}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result v5

    if-eqz v5, :cond_4

    iget-object v3, v3, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v3}, Lcom/miui/gallery/data/DBImage;->getSecretKey()[B

    move-result-object v6

    :cond_4
    invoke-direct {v4, v2, v6}, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;-><init>(Ljava/lang/String;[B)V

    invoke-static {v1, v4}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->callbackSuccess(Lcom/miui/gallery/sdk/download/assist/DownloadItem;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V

    goto/16 :goto_0

    :cond_5
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p3

    if-lez p3, :cond_8

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_6
    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/sdk/download/assist/RequestItem;

    invoke-direct {p0, v1}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->checkItemValid(Lcom/miui/gallery/sdk/download/assist/RequestItem;)Z

    move-result v1

    if-nez v1, :cond_6

    invoke-interface {p3}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    :cond_7
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p3

    if-lez p3, :cond_8

    invoke-static {v0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->classifyRequest(Ljava/util/List;)Ljava/util/HashMap;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_2
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-direct {p0, p1, p2, v1}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->downloadInternal(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;)V

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v1

    const-string v2, "download batch %s"

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2

    :cond_8
    return-void
.end method

.method downloadFileItem(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lorg/json/JSONObject;)Z
    .locals 9

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v1, "download id %s"

    iget-object v2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object p1

    const-string p2, "for download interrupt %s"

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v1

    :cond_0
    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isStatusOk()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object p2

    const-string v0, "item %s status %s"

    iget-object v2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getKey()Ljava/lang/String;

    move-result-object v2

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getStatus()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2, v0, v2, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return v1

    :cond_1
    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getRequestId()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez p2, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object p2

    const-string v4, "id: %s not found in content json"

    invoke-static {p2, v4, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/preference/ThumbnailPreference;->putThumbnailKey(Ljava/lang/String;)V

    new-instance p2, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->THUMBNAIL_BUILD_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "request url for %s error"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v6, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v6}, Lcom/miui/gallery/data/DBImage;->getServerId()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v1

    invoke-static {v4, v5, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p2, v0, v2, v3}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, p1, v3, p2}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    return v1

    :cond_2
    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUriLock()Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->isLocked()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->shouldWaitUriLock()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object v4

    const-string v5, "%s wait lock"

    iget-object v6, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-static {v4, v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object p2

    const-string v0, "%s is locked, skip download"

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v1

    :cond_4
    :goto_0
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->checkAndReturnValidPath(Lcom/miui/gallery/sdk/download/assist/RequestItem;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_7

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->getTag()Ljava/lang/String;

    move-result-object p2

    const-string v5, "no need download file: %s, thumb: %s"

    iget-object v6, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v6}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v7}, Lcom/miui/gallery/data/DBImage;->getThumbnailFile()Ljava/lang/String;

    move-result-object v7

    invoke-static {p2, v5, v6, v7}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    const/4 v5, 0x3

    invoke-virtual {p2, v1, v5}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->compareAnsSetStatus(II)Z

    move-result p2

    if-eqz p2, :cond_6

    iget-object p2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    new-instance v1, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    iget-object v5, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v5}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result v5

    if-eqz v5, :cond_5

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSecretKey()[B

    move-result-object v3

    :cond_5
    invoke-direct {v1, v4, v3}, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;-><init>(Ljava/lang/String;[B)V

    invoke-static {p2, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->callbackSuccess(Lcom/miui/gallery/sdk/download/assist/DownloadItem;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_6
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return v2

    :cond_7
    :try_start_1
    const-string v4, "isUrl"

    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v4

    const-string v5, "data"

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iget-object v5, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    iget-object v6, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v6}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->ensureDownloadTempFolder(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object v5

    sget-object v6, Lcom/miui/gallery/error/core/ErrorCode;->NO_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    if-eq v5, v6, :cond_8

    new-instance p2, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "error create folder: %s"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v7, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    iget-object v8, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v8}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadTempFolderPath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v1

    invoke-static {v4, v6, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p2, v5, v2, v3}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, p1, v3, p2}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return v1

    :cond_8
    if-eqz v4, :cond_a

    :try_start_2
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->isValidUrl(Landroid/net/Uri;)Z

    move-result v4

    if-nez v4, :cond_9

    iget-object v4, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v4}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/preference/ThumbnailPreference;->putThumbnailKey(Ljava/lang/String;)V

    new-instance v4, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v5, Lcom/miui/gallery/error/core/ErrorCode;->THUMBNAIL_BUILD_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "invalid url %s for %s"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    aput-object p2, v8, v1

    iget-object p2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getServerId()Ljava/lang/String;

    move-result-object p2

    aput-object p2, v8, v2

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {v4, v5, p2, v3}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, p1, v3, v4}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->fireFailEvent(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return v1

    :cond_9
    :try_start_3
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->downloadFile(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    :cond_a
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->downloadData(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :goto_1
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->onPostDownload(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return v2

    :catchall_0
    move-exception p1

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw p1
.end method

.method protected abstract getRequestHeight()I
.end method

.method protected abstract getRequestWidth()I
.end method

.method protected abstract getTag()Ljava/lang/String;
.end method

.method protected handleDownloadTempFile(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method protected shouldWaitUriLock()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected abstract updateDataBase(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;)Z
.end method
