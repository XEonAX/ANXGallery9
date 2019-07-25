.class public Lcom/miui/gallery/util/PhotoOperationsUtil;
.super Ljava/lang/Object;
.source "PhotoOperationsUtil.java"


# direct methods
.method public static getImageSupportedOperations(Ljava/lang/String;Ljava/lang/String;DD)I
    .locals 3

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/WallpaperUtils;->supported(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x56042c

    goto :goto_0

    :cond_0
    const v1, 0x56040c

    :goto_0
    sget-boolean v2, Lcom/miui/os/Rom;->IS_INTERNATIONAL:Z

    if-nez v2, :cond_1

    sget-boolean v2, Lcom/miui/os/Rom;->IS_MIUI:Z

    if-eqz v2, :cond_1

    or-int/lit16 v1, v1, 0x800

    :cond_1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-static {v0, p0}, Lcom/miui/gallery/util/StorageUtils;->isInExternalStorage(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    or-int/lit8 v1, v1, 0x1

    const-string v2, "image/gif"

    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-static {v0, p0}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/cloud/DownloadPathHelper;->isShareFolderRelativePath(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_2

    or-int/lit16 v1, v1, 0x200

    :cond_2
    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->isGifFromMimeType(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    and-int/lit8 p0, v1, -0x21

    and-int/lit16 v1, p0, -0x801

    :cond_3
    invoke-static {p1}, Lcom/miui/gallery/util/BitmapUtils;->isSupportedByRegionDecoder(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4

    or-int/lit8 v1, v1, 0x40

    :cond_4
    invoke-static {p1}, Lcom/miui/gallery/util/BitmapUtils;->isRotationSupported(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_5

    or-int/lit8 v1, v1, 0x2

    :cond_5
    invoke-static {p2, p3, p4, p5}, Lcom/miui/gallery/data/LocationUtil;->isValidateCoordinate(DD)Z

    move-result p0

    if-eqz p0, :cond_6

    or-int/lit8 v1, v1, 0x10

    :cond_6
    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->isSecretAlbumFeatureOpen()Z

    move-result p0

    if-eqz p0, :cond_7

    const/high16 p0, 0x800000

    or-int/2addr v1, p0

    :cond_7
    return v1
.end method

.method public static getVideoSupportedOperations(Ljava/lang/String;)I
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/VideoWallpaperUtils;->isSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x101484

    goto :goto_0

    :cond_0
    const v0, 0x100484

    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p0}, Lcom/miui/gallery/util/StorageUtils;->isInExternalStorage(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    or-int/lit8 p0, v0, 0x1

    or-int/lit16 v0, p0, 0x200

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->isSecretAlbumFeatureOpen()Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-static {}, Lcom/miui/gallery/Config$SecretAlbumConfig;->isVideoSupported()Z

    move-result p0

    if-eqz p0, :cond_1

    const/high16 p0, 0x800000

    or-int/2addr v0, p0

    :cond_1
    return v0
.end method

.method public static isSupportedOptions(II)Z
    .locals 0

    and-int/2addr p0, p1

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
