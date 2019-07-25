.class public Lcom/miui/gallery/sdk/download/downloader/ThumbnailDownloader;
.super Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;
.source "ThumbnailDownloader.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;-><init>()V

    return-void
.end method


# virtual methods
.method protected checkAndReturnValidPath(Lcom/miui/gallery/sdk/download/assist/RequestItem;)Ljava/lang/String;
    .locals 6

    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v0, v1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->checkAndReturnValidFilePathForType(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "ThumbnailDownloader"

    const-string v2, "already exist thumbnail file"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v0, v1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->checkAndReturnValidOriginalFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "ThumbnailDownloader"

    const-string v2, "already exist original file"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isManual()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getSyncStrategy()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isFrontForManualDownload()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 v1, 0x1

    :goto_2
    if-eqz v1, :cond_3

    iget-object v1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getMixedDateTime()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_4

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getMixedDateTime()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/FileUtils;->setLastModified(Ljava/lang/String;J)Z

    goto :goto_3

    :cond_3
    const-string v1, "ThumbnailDownloader"

    const-string v2, "front for manual downloading %s"

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_4
    :goto_3
    return-object v0
.end method

.method public bridge synthetic download(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->download(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;)V

    return-void
.end method

.method protected getRequestHeight()I
    .locals 1

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getScreenHeight()I

    move-result v0

    return v0
.end method

.method protected getRequestWidth()I
    .locals 1

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getScreenWidth()I

    move-result v0

    return v0
.end method

.method protected getTag()Ljava/lang/String;
    .locals 1

    const-string v0, "ThumbnailDownloader"

    return-object v0
.end method

.method protected handleDownloadTempFile(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;)Z
    .locals 1

    new-instance v0, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-direct {v0, p1}, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;-><init>(Lcom/miui/gallery/data/DBImage;)V

    invoke-virtual {v0, p2}, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->write(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method protected updateDataBase(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;)Z
    .locals 4

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iget-object p2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getDateModified()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/io/File;->setLastModified(J)Z

    new-instance p2, Landroid/content/ContentValues;

    invoke-direct {p2}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "thumbnailFile"

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "localFile"

    sget-object v2, Lcom/miui/gallery/provider/InternalContract$Cloud;->INVALID_FILE_PATH_NULL_MARK:Ljava/lang/String;

    invoke-virtual {p2, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, p2, v2}, Lcom/miui/gallery/cloud/CloudUtils;->updateToLocalDB(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;)I

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p2, v1, v3, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result p2

    const/4 v1, 0x1

    if-nez p2, :cond_0

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isSubUbiFocus()Z

    move-result p1

    if-nez p1, :cond_0

    new-array p1, v1, [Ljava/io/File;

    aput-object v0, p1, v2

    invoke-static {v1, p1}, Lcom/miui/gallery/util/MediaFileUtils;->triggerMediaScan(Z[Ljava/io/File;)V

    :cond_0
    return v1
.end method
