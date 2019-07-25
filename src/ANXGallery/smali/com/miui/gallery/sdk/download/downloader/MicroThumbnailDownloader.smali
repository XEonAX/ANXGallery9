.class public Lcom/miui/gallery/sdk/download/downloader/MicroThumbnailDownloader;
.super Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;
.source "MicroThumbnailDownloader.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;-><init>()V

    return-void
.end method


# virtual methods
.method protected checkAndReturnValidPath(Lcom/miui/gallery/sdk/download/assist/RequestItem;)Ljava/lang/String;
    .locals 2

    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v0, v1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->checkAndReturnValidFilePathForType(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string p1, "MicroThumbnailDownloader"

    const-string v1, "already exist micro thumbnail file"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_0
    iget-object v0, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v0, v1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->checkAndReturnValidFilePathForType(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string p1, "MicroThumbnailDownloader"

    const-string v1, "already exist thumbnail file"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_1
    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {p1, v0}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->checkAndReturnValidOriginalFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "MicroThumbnailDownloader"

    const-string v1, "already exist original file"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic download(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/sdk/download/downloader/AbsThumbnailDownloader;->download(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;)V

    return-void
.end method

.method protected getRequestHeight()I
    .locals 1

    const/16 v0, 0xfa

    return v0
.end method

.method protected getRequestWidth()I
    .locals 1

    const/16 v0, 0xfa

    return v0
.end method

.method protected getTag()Ljava/lang/String;
    .locals 1

    const-string v0, "MicroThumbnailDownloader"

    return-object v0
.end method

.method protected updateDataBase(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;)Z
    .locals 3

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iget-object p2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getDateModified()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/io/File;->setLastModified(J)Z

    iget-object p2, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x1

    invoke-static {p2, v0, p1, v1}, Lcom/miui/gallery/cloud/CloudUtils;->updateMicroThumbPath(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method
