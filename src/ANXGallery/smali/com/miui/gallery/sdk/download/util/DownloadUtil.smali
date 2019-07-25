.class public Lcom/miui/gallery/sdk/download/util/DownloadUtil;
.super Ljava/lang/Object;
.source "DownloadUtil.java"


# static fields
.field private static final DOWNLOAD_FILE_PRIORITY:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->DOWNLOAD_FILE_PRIORITY:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x9
        0xa
        0xb
    .end array-data
.end method

.method public static canDownloadStatus(Lcom/miui/gallery/data/DBImage;)Z
    .locals 2

    if-eqz p0, :cond_0

    const-string v0, "custom"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerStatus()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static checkAndReturnValidFilePathForType(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 2

    if-eqz p0, :cond_4

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isMicro(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->checkAndReturnValidMicroFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isThumbnail(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->checkAndReturnValidThumbnailFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->checkAndReturnValidOriginalFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "bad checktype, checktype="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static checkAndReturnValidMicroFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getMicroThumbnailFile()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getMicroThumbnailFile()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/StorageUtils;->getMicroThumbnailDirectories(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadFileName(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getFilePathForRead([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getMicroThumbnailFile()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v0, "microthumbfile"

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->updateImageColumnValue(Lcom/miui/gallery/data/DBImage;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/data/DBImage;->setMicroThumbFile(Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v1, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    :cond_1
    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    move-object p1, v1

    :goto_1
    return-object p1

    :cond_3
    return-object v1
.end method

.method public static checkAndReturnValidOriginalFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getDownloadFolderRelativePath(Lcom/miui/gallery/data/DBImage;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadFileName(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getFilePathForRead(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-static {p1, p0}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isOriginalFileValid(Ljava/lang/String;Lcom/miui/gallery/data/DBImage;)Z

    move-result v0

    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v0, "localFile"

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->updateImageColumnValue(Lcom/miui/gallery/data/DBImage;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/data/DBImage;->setLocalFile(Ljava/lang/String;)V

    :cond_2
    if-eqz v0, :cond_3

    goto :goto_1

    :cond_3
    move-object p1, v1

    :goto_1
    return-object p1

    :cond_4
    return-object v1
.end method

.method public static checkAndReturnValidThumbnailFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getThumbnailFile()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getThumbnailFile()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getDownloadFolderRelativePath(Lcom/miui/gallery/data/DBImage;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadFileName(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getFilePathForRead(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-static {p1, p0}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isThumbnailFileValid(Ljava/lang/String;Lcom/miui/gallery/data/DBImage;)Z

    move-result v0

    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getThumbnailFile()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v0, "thumbnailFile"

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->updateImageColumnValue(Lcom/miui/gallery/data/DBImage;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/data/DBImage;->setThumbnailFile(Ljava/lang/String;)V

    :cond_2
    if-eqz v0, :cond_3

    goto :goto_1

    :cond_3
    move-object p1, v1

    :goto_1
    return-object p1

    :cond_4
    return-object v1
.end method

.method public static checkCondition(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    new-instance p0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->NO_CTA_PERMISSION:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v2, "no cta permission"

    invoke-direct {p0, v0, v2, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object p0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance p0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->NO_NETWORK:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v2, "no network"

    invoke-direct {p0, v0, v2, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object p0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isRequireWLAN()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance p0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->NO_WIFI_CONNECTED:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v2, "no wifi"

    invoke-direct {p0, v0, v2, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object p0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isRequirePower()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getPowerCanSync()Z

    move-result v0

    if-nez v0, :cond_3

    new-instance p0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->POWER_LOW:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v2, "power low"

    invoke-direct {p0, v0, v2, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object p0

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isRequireCharging()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getIsPlugged()Z

    move-result v0

    if-nez v0, :cond_4

    new-instance p0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->NO_CHARGING:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v2, "not charging"

    invoke-direct {p0, v0, v2, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object p0

    :cond_4
    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->isRequireDeviceStorage()Z

    move-result p0

    if-eqz p0, :cond_5

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->isDeviceStorageLow()Z

    move-result p0

    if-eqz p0, :cond_5

    new-instance p0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->STORAGE_LOW:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v2, "storage low"

    invoke-direct {p0, v0, v2, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object p0

    :cond_5
    return-object v1
.end method

.method public static ensureDownloadFolder(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/error/core/ErrorCode;
    .locals 1

    if-eqz p0, :cond_3

    if-nez p1, :cond_0

    goto :goto_2

    :cond_0
    invoke-static {p0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadFolderPath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isMicro(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    if-nez p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p0, 0x1

    :goto_1
    invoke-static {v0, p0}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->ensureFolder(Ljava/lang/String;Z)Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object p0

    return-object p0

    :cond_3
    :goto_2
    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->UNKNOWN:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0
.end method

.method public static ensureDownloadTempFolder(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/error/core/ErrorCode;
    .locals 0

    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadTempFolderPath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x1

    invoke-static {p0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->ensureFolder(Ljava/lang/String;Z)Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->UNKNOWN:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0
.end method

.method private static ensureFolder(Ljava/lang/String;Z)Lcom/miui/gallery/error/core/ErrorCode;
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->UNKNOWN:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0

    :cond_0
    invoke-static {p0, p1}, Lcom/miui/gallery/util/FileUtils;->createFolder(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_1

    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->NO_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0

    :cond_1
    invoke-static {p0}, Lcom/miui/gallery/util/StorageUtils;->isInPrimaryStorage(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->PRIMARY_STORAGE_WRITE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0

    :cond_2
    invoke-static {p0}, Lcom/miui/gallery/util/StorageUtils;->isInSecondaryStorage(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->SECONDARY_STORAGE_WRITE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0

    :cond_3
    const-string p1, "DownloadUtil"

    const-string v0, "Failed to create folder under unknown volume %s"

    invoke-static {p1, v0, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object p0, Lcom/miui/gallery/error/core/ErrorCode;->UNKNOWN:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p0
.end method

.method public static generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 1

    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "type"

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/DownloadType;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getDownloadFileName(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 2

    if-eqz p0, :cond_7

    if-nez p1, :cond_0

    goto :goto_3

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isMicro(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSha1ThumbnailSA()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSha1Thumbnail()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0

    :cond_2
    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isThumbnail(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSha1ThumbnailSA()Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_3
    invoke-static {p0}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getThumbnailDownloadFileNameNotSecret(Lcom/miui/gallery/data/DBImage;)Ljava/lang/String;

    move-result-object p0

    :goto_1
    return-object p0

    :cond_4
    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->isSecretItem()Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getEncodedFileName()Ljava/lang/String;

    move-result-object p0

    goto :goto_2

    :cond_5
    invoke-static {p0}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getOriginDownloadFileNameNotSecret(Lcom/miui/gallery/data/DBImage;)Ljava/lang/String;

    move-result-object p0

    :goto_2
    return-object p0

    :cond_6
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "bad checktype, checktype="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_7
    :goto_3
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getDownloadFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 6

    if-eqz p0, :cond_5

    if-nez p1, :cond_0

    goto/16 :goto_0

    :cond_0
    invoke-static {p0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadFileName(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->isUbiFocus()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->isSubUbiFocus()Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSubUbiIndex()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSubUbiImageCount()I

    move-result v3

    add-int/2addr v3, v2

    invoke-static {v1, v3}, Lcom/miui/gallery/data/UbiIndexMapper;->cloudToLocal(II)I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSubUbiImageCount()I

    move-result v3

    add-int/2addr v3, v2

    invoke-static {v0, v1, v3}, Lcom/miui/gallery/data/LocalUbifocus;->createInnerFileName(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    :cond_2
    invoke-static {p0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadFolderPath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/miui/gallery/util/FileUtils;->concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isThumbnail(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v3

    if-eqz v3, :cond_4

    :cond_3
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-static {v1, p0}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isOriginalFileValid(Ljava/lang/String;Lcom/miui/gallery/data/DBImage;)Z

    move-result v3

    if-nez v3, :cond_4

    invoke-static {v1, p0}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isThumbnailFileValid(Ljava/lang/String;Lcom/miui/gallery/data/DBImage;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string v1, "%s_%s.%s"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->getFileNameWithoutExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v2

    const/4 v2, 0x2

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->getExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v2

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->getDownloadFolderPath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/FileUtils;->concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string p1, "DownloadUtil"

    const-string v2, "There exist a file with same name that doesn\'t belong to image [%s], so we rename current to %s"

    invoke-static {p1, v2, p0, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_4
    return-object v1

    :cond_5
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getDownloadFolderPath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    if-eqz p0, :cond_4

    if-nez p1, :cond_0

    goto :goto_1

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isMicro(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getPriorMicroThumbnailDirectory()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isThumbnail(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    return-object v0

    :cond_3
    :goto_0
    invoke-static {p0}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getDownloadFolderPath(Lcom/miui/gallery/data/DBImage;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_4
    :goto_1
    return-object v0
.end method

.method public static getDownloadTempFilePath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    if-eqz p0, :cond_4

    if-nez p1, :cond_0

    goto/16 :goto_0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isMicro(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getMicroThumbnailTempDirectory()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".temp"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/miui/gallery/util/FileUtils;->concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isThumbnail(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getThumbnailTempDirectory()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/miui/gallery/util/FileUtils;->concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getOriginTempDirectory()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/miui/gallery/util/FileUtils;->concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    return-object v0

    :cond_4
    :goto_0
    return-object v0
.end method

.method public static getDownloadTempFolderPath(Lcom/miui/gallery/data/DBImage;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    if-eqz p0, :cond_4

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isMicro(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getMicroThumbnailTempDirectory()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isThumbnail(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getThumbnailTempDirectory()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    invoke-static {p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p0

    if-eqz p0, :cond_3

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getOriginTempDirectory()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    return-object v0

    :cond_4
    :goto_0
    return-object v0
.end method

.method public static isMicro(Lcom/miui/gallery/sdk/download/DownloadType;)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public static isNotSyncedStatus(Lcom/miui/gallery/data/DBImage;)Z
    .locals 2

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v0

    const/16 v1, 0xb

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result p0

    const/4 v0, -0x1

    if-eq p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public static isOriginalFileValid(Ljava/lang/String;Lcom/miui/gallery/data/DBImage;)Z
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->isOriginalFileValid(Ljava/lang/String;Lcom/miui/gallery/data/DBImage;Z)Z

    move-result p0

    return p0
.end method

.method public static isOriginalFileValid(Ljava/lang/String;Lcom/miui/gallery/data/DBImage;Z)Z
    .locals 11

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string p0, "DownloadUtil"

    const-string p2, "Empty original file path for %s"

    invoke-static {p0, p2, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v1

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v2

    if-nez v2, :cond_1

    goto/16 :goto_2

    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSize()J

    move-result-wide v4

    cmp-long v6, v2, v4

    const/4 v4, 0x4

    const/4 v5, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x1

    if-gez v6, :cond_3

    const-string v0, "DownloadUtil"

    const-string v6, "File [%s] size [%d] is smaller than expected [%d] for image %s"

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    aput-object p0, v4, v8

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSize()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    aput-object p0, v4, v7

    aput-object p1, v4, v5

    invoke-static {v0, v6, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p2, :cond_2

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string p2, "Params"

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "ServerId:%s, expectedSize:%d, realSize:%d"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getServerId()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSize()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    aput-object p1, v5, v8

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    aput-object p1, v5, v7

    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "file_download_%s"

    new-array p2, v8, [Ljava/lang/Object;

    const-string v0, "origin"

    aput-object v0, p2, v1

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "file_download_wrong_size"

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_2
    return v1

    :cond_3
    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->getSha1(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    goto :goto_0

    :cond_4
    return v8

    :cond_5
    :goto_0
    const-string v2, "DownloadUtil"

    const-string v3, "File [%s]\'s sha1 [%s] is different from [%s], %s"

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v1

    if-nez v0, :cond_6

    const-string p0, "null"

    goto :goto_1

    :cond_6
    move-object p0, v0

    :goto_1
    aput-object p0, v4, v8

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v7

    aput-object p1, v4, v5

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p2, :cond_7

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string p2, "Params"

    const-string v2, "ServerId:%s, expectedSha1:%s, realSha1:%s"

    new-array v3, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getServerId()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v3, v8

    aput-object v0, v3, v7

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "file_download_%s"

    new-array p2, v8, [Ljava/lang/Object;

    const-string v0, "origin"

    aput-object v0, p2, v1

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "file_download_wrong_sha1"

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_7
    return v1

    :cond_8
    :goto_2
    const-string p2, "DownloadUtil"

    const-string v0, "File [%s] doesn\'t exist or is not a file %s"

    invoke-static {p2, v0, p0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return v1
.end method

.method public static isThumbnail(Lcom/miui/gallery/sdk/download/DownloadType;)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public static isThumbnailFileValid(Ljava/lang/String;Lcom/miui/gallery/data/DBImage;)Z
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0}, Lcom/miui/gallery/util/ExifUtil;->getUserCommentSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    return p0
.end method

.method public static persistDownloadStatus(Lcom/miui/gallery/data/DBImage;I)V
    .locals 10

    const-string v0, "DownloadUtil"

    const-string v1, "persistDownloadStatus id %s, status %d"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v3, "downloadFileTime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "(%s) AND (%s is null OR %s=%d)"

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    const-string v8, "_id=?"

    aput-object v8, v7, v0

    const-string v8, "downloadFileStatus"

    aput-object v8, v7, v1

    const/4 v8, 0x2

    const-string v9, "downloadFileStatus"

    aput-object v9, v7, v8

    const/4 v8, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    new-array v6, v1, [Ljava/lang/String;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v0

    invoke-static {v3, v4, v2, v5, v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_0
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v3, "downloadFileStatus"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v2, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v3

    const-string v4, "_id=?"

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p0

    aput-object p0, v1, v0

    invoke-static {p1, v3, v2, v4, v1}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method public static persistDownloadStatus(Lcom/miui/gallery/sdk/download/assist/RequestItem;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getStatus()I

    move-result v0

    iget-object p0, p0, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    if-nez p0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/4 v1, 0x3

    goto :goto_0

    :pswitch_1
    const/4 v1, 0x2

    goto :goto_0

    :pswitch_2
    const/4 v1, 0x1

    :goto_0
    :pswitch_3
    invoke-static {p0, v1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->persistDownloadStatus(Lcom/miui/gallery/data/DBImage;I)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static resumeInterrupted()I
    .locals 15

    sget-object v0, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->DOWNLOAD_FILE_PRIORITY:[I

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget v4, v0, v3

    invoke-static {v4}, Lcom/miui/gallery/cloud/SyncConditionManager;->check(I)I

    move-result v4

    if-eqz v4, :cond_0

    return v2

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x2

    new-array v1, v0, [Landroid/net/Uri;

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    aput-object v3, v1, v2

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$ShareImage;->SHARE_URI:Landroid/net/Uri;

    const/4 v4, 0x1

    aput-object v3, v1, v4

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const-string v5, "_id"

    const-string v6, "serverType"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    array-length v6, v1

    const/4 v14, 0x0

    :goto_1
    if-ge v14, v6, :cond_3

    aget-object v8, v1, v14

    sget-object v7, Lcom/miui/gallery/provider/GalleryContract$ShareImage;->SHARE_URI:Landroid/net/Uri;

    if-ne v8, v7, :cond_2

    const/4 v7, 0x1

    goto :goto_2

    :cond_2
    const/4 v7, 0x0

    :goto_2
    new-instance v13, Lcom/miui/gallery/sdk/download/util/DownloadUtil$1;

    invoke-direct {v13, v7, v3}, Lcom/miui/gallery/sdk/download/util/DownloadUtil$1;-><init>(ZLjava/util/List;)V

    const-string v10, "(downloadFileStatus=? OR downloadFileStatus=?) AND (localFlag = 0 AND serverStatus = \'custom\')"

    new-array v11, v0, [Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v11, v2

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v11, v4

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v7

    const-string v12, "downloadFileTime DESC"

    move-object v9, v5

    invoke-static/range {v7 .. v13}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    :cond_3
    new-instance v0, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;-><init>()V

    invoke-virtual {v0, v4}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setRequireWLAN(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->build()Lcom/miui/gallery/sdk/download/DownloadOptions;

    move-result-object v0

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    const-string v4, "DownloadUtil"

    const-string v5, "resume item %s"

    invoke-static {v4, v5, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/sdk/download/ImageDownloader;->getInstance()Lcom/miui/gallery/sdk/download/ImageDownloader;

    move-result-object v4

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getUri()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v2

    invoke-virtual {v4, v5, v2, v0}, Lcom/miui/gallery/sdk/download/ImageDownloader;->load(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/DownloadOptions;)V

    goto :goto_3

    :cond_4
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public static statDownloadError(Lcom/miui/gallery/sdk/download/assist/RequestItem;Ljava/lang/String;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "status"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "media_type"

    iget-object v2, p0, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result v2

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->serverType2Text(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "download_type"

    iget-object p0, p0, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p0

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/DownloadType;->name()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "url"

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-string p0, "code"

    invoke-virtual {p2}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->getCode()Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "desc"

    invoke-virtual {p2}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->getDesc()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    if-eqz p0, :cond_1

    const-string p0, "throwable"

    invoke-virtual {p2}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p0

    if-eqz p0, :cond_1

    const-string p1, "netInfo"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    const-string p0, "file_download"

    const-string p1, "file_download_status_v2"

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static statDownloadRetryTimes(Lcom/miui/gallery/sdk/download/assist/RequestItem;II)V
    .locals 2

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string v0, "download_type"

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/DownloadType;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "media_type"

    iget-object p0, p0, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result p0

    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->serverType2Text(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p2, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string v0, "net_type"

    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p2, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-string p0, "times"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "file_download"

    const-string p1, "file_download_retry_times_v2"

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static statDownloadSuccess(Lcom/miui/gallery/sdk/download/assist/RequestItem;JJ)V
    .locals 7

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "status"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "download_type"

    iget-object v3, p0, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDownloadItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v3}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/sdk/download/DownloadType;->name()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "size"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%.2f"

    new-array v5, v2, [Ljava/lang/Object;

    long-to-float p3, p3

    const/high16 p4, 0x3f800000    # 1.0f

    mul-float p3, p3, p4

    const/high16 v6, 0x44800000    # 1024.0f

    div-float/2addr p3, v6

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    const/4 v6, 0x0

    aput-object p3, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "media_type"

    iget-object p0, p0, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result p0

    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->serverType2Text(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "costs"

    sget-object p3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%.2f"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, p1

    long-to-float p1, v3

    mul-float p1, p1, p4

    const/high16 p2, 0x447a0000    # 1000.0f

    div-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aput-object p1, v2, v6

    invoke-static {p3, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string p1, "net_type"

    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-string p0, "file_download"

    const-string p1, "file_download_status_v2"

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private static updateImageColumnValue(Lcom/miui/gallery/data/DBImage;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, v0, p0}, Lcom/miui/gallery/cloud/CloudUtils;->updateToLocalDB(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;)I

    move-result p0

    const/4 p1, 0x1

    if-lt p0, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
