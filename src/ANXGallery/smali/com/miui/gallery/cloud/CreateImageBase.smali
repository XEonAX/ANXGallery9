.class public abstract Lcom/miui/gallery/cloud/CreateImageBase;
.super Ljava/lang/Object;
.source "CreateImageBase.java"

# interfaces
.implements Lcom/miui/gallery/cloud/Operation;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/cloud/Operation<",
        "Lcom/miui/gallery/data/DBImage;",
        ">;"
    }
.end annotation


# instance fields
.field protected mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloud/CreateImageBase;->mContext:Landroid/content/Context;

    return-void
.end method

.method private checkExifAndSha1Valid(Lcom/miui/gallery/data/DBImage;)I
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getDateModified()J

    move-result-wide v0

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSize()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Lcom/miui/gallery/util/ExifUtil;->getUserCommentSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4}, Lcom/miui/gallery/cloud/CloudUtils;->readFileNameFromExif(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    cmp-long v10, v0, v8

    const/4 v0, 0x0

    if-nez v10, :cond_0

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v8

    cmp-long v1, v2, v8

    if-nez v1, :cond_0

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    :cond_1
    new-instance v2, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;

    const-string v8, ""

    const-string v9, ""

    invoke-direct {v2, p1, v8, v9}, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;-><init>(Lcom/miui/gallery/data/DBImage;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Lcom/miui/gallery/cloud/ThumbnailMetaWriter;->write(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {p1, v6, v7}, Lcom/miui/gallery/data/DBImage;->setOriginInfo(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v2, :cond_5

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v7, "model"

    sget-object v8, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-interface {v2, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "version"

    sget-object v8, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    invoke-interface {v2, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "hasSha1InExif"

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    xor-int/2addr v6, v3

    invoke-static {v6}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "micloud_sync"

    const-string v7, "upload_thumbnail"

    invoke-static {v6, v7, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v4}, Lcom/miui/gallery/util/FileUtils;->getSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v6, "sha1"

    invoke-virtual {v1, v6, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    const-string v2, "size"

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v1, v2, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v2, "dateModified"

    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v1, v2, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isVideoType()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-static {v4, v1}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->putValuesForVideo(Ljava/lang/String;Landroid/content/ContentValues;)Z

    move-result v2

    if-nez v2, :cond_4

    const/16 p1, 0xc

    return p1

    :cond_3
    invoke-static {v4, v1}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->putValuesForImage(Ljava/lang/String;Landroid/content/ContentValues;)V

    :cond_4
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v2

    const-string v4, "_id = ? "

    new-array v5, v3, [Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v0

    invoke-static {v2, v1, v4, v5}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1, v3}, Lcom/miui/gallery/cloud/CloudUtils;->getLimitUri(Landroid/net/Uri;I)Landroid/net/Uri;

    move-result-object v4

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getProjectionAll()[Ljava/lang/String;

    move-result-object v5

    const-string v6, "_id = ? "

    new-array v7, v3, [Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/4 v8, 0x0

    new-instance v9, Lcom/miui/gallery/cloud/CreateImageBase$1;

    invoke-direct {v9, p0, p1}, Lcom/miui/gallery/cloud/CreateImageBase$1;-><init>(Lcom/miui/gallery/cloud/CreateImageBase;Lcom/miui/gallery/data/DBImage;)V

    invoke-static/range {v4 .. v9}, Lcom/miui/gallery/util/GalleryUtils;->safeQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$QueryHandler;)Ljava/lang/Object;

    return v0

    :cond_5
    const/16 p1, 0xb

    return p1
.end method

.method private isInvalidData(Lcom/miui/gallery/data/DBImage;)Z
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v1

    const/4 v2, 0x7

    if-eq v1, v2, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_2

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/miui/gallery/cloud/CreateImageBase;->mContext:Landroid/content/Context;

    const-string v3, "_id"

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalGroupId()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/cloud/CloudUtils;->getItem(Landroid/net/Uri;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/cloud/CreateImageBase;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0

    :cond_2
    return v0
.end method

.method private isNormalFlag(I)Z
    .locals 1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private statCannotUpload(Lcom/miui/gallery/data/DBImage;IZ)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "folder"

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "media_type"

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result v2

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->serverType2Text(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "error_code"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "Sync"

    const-string v1, "sync_cannot_upload_v2"

    invoke-static {p2, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    if-eqz p3, :cond_0

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    const-string p2, "localFile"

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "Sync"

    const-string p2, "sync_invalid_data"

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    return-void
.end method

.method private statImageCreate(Lcom/miui/gallery/data/DBImage;Ljava/io/File;J)V
    .locals 10

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isImageType()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "image"

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isVideoType()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "video"

    goto :goto_0

    :cond_1
    const-string v0, "other"

    :goto_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "size"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%.2f"

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Object;

    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v7

    long-to-float v7, v7

    const/high16 v8, 0x3f800000    # 1.0f

    mul-float v7, v7, v8

    const/high16 v9, 0x44800000    # 1024.0f

    div-float/2addr v7, v9

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    const/4 v9, 0x0

    aput-object v7, v6, v9

    invoke-static {v3, v4, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "media_type"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "time_in_seconds"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%.2f"

    new-array v6, v5, [Ljava/lang/Object;

    long-to-float p3, p3

    mul-float p3, p3, v8

    const/high16 p4, 0x447a0000    # 1000.0f

    div-float/2addr p3, p4

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    aput-object p3, v6, v9

    invoke-static {v3, v4, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v1, v2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "Sync"

    const-string p4, "sync_upload_time_one_photo_v2"

    invoke-static {p3, p4, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide v1

    sub-long/2addr p3, v1

    long-to-float p2, p3

    mul-float p2, p2, v8

    const p3, 0x476a6000    # 60000.0f

    div-float/2addr p2, p3

    const-wide p3, 0x7fffffffffffffffL

    :try_start_0
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getAlbumId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-wide p3, v1

    :catch_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "media_type"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-wide/16 v2, 0x3e8

    cmp-long v0, p3, v2

    if-gtz v0, :cond_2

    const-string p3, "album_id"

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getAlbumId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    const-string p1, "timely_in_minutes"

    sget-object p3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string p4, "%.2f"

    new-array v0, v5, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    aput-object p2, v0, v9

    invoke-static {p3, p4, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "Sync"

    const-string p2, "sync_upload_timely_v2"

    invoke-static {p1, p2, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private statRejectUpload(Lcom/miui/gallery/data/DBImage;I)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "folder"

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "error_code"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "Sync"

    const-string p2, "sync_reject_upload"

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private statUploadError(Lcom/miui/gallery/data/DBImage;Ljava/lang/Exception;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "media_type"

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result v2

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->serverType2Text(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "folder"

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "throwable"

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "error"

    invoke-interface {v0, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "Sync"

    const-string p2, "sync_upload_error"

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public checkState(Lcom/miui/gallery/cloud/RequestItemBase;)I
    .locals 0

    invoke-static {p1}, Lcom/miui/gallery/cloud/SyncConditionManager;->checkForItem(Lcom/miui/gallery/cloud/RequestItemBase;)I

    move-result p1

    return p1
.end method

.method protected abstract doUpload(Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/io/File;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/opensdk/exception/RetriableException;,
            Lcom/xiaomi/opensdk/exception/UnretriableException;,
            Lcom/xiaomi/opensdk/exception/AuthenticationException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method

.method public execute(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/lang/String;Lcom/miui/gallery/cloud/RequestItemBase;)Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/accounts/Account;",
            "Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/cloud/RequestItemBase;",
            ")",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult<",
            "Lcom/miui/gallery/data/DBImage;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    new-instance p3, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {p3}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    instance-of v0, p4, Lcom/miui/gallery/cloud/RequestCloudItem;

    if-nez v0, :cond_0

    const-string p1, "CreateImageBase"

    const-string p2, "item is not instanceof RequestCloudItem."

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p3, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-virtual {p0, p4}, Lcom/miui/gallery/cloud/CreateImageBase;->checkState(Lcom/miui/gallery/cloud/RequestItemBase;)I

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "CreateImageBase"

    const-string p2, "condition for create image isn\'t ok."

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->CONDITION_INTERRUPTED:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p3, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1

    :cond_1
    check-cast p4, Lcom/miui/gallery/cloud/RequestCloudItem;

    iget-object v0, p4, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    const-string v1, "CreateImageBase"

    const-string v2, "create image start %s"

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/CreateImageBase;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/miui/gallery/cloud/SyncConditionManager;->checkCloudSpace(Landroid/content/Context;)I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    const-string p1, "CreateImageBase"

    const-string p2, "cloud space is full"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_CONTINUE_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p3, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1

    :cond_2
    invoke-virtual {p0, p4}, Lcom/miui/gallery/cloud/CreateImageBase;->getDBImage(Lcom/miui/gallery/cloud/RequestCloudItem;)Lcom/miui/gallery/data/DBImage;

    move-result-object v1

    if-nez v1, :cond_3

    const-string p1, "CreateImageBase"

    const-string p2, "item not exist %s"

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object p4

    invoke-static {p1, p2, p4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p3, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1

    :cond_3
    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    const-string p1, "CreateImageBase"

    const-string p2, "item has changed old[%s], new[%s]"

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, p2, p4, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p3, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1

    :cond_4
    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v2

    if-nez v2, :cond_5

    const-string p1, "CreateImageBase"

    const-string p2, "item already synced, id[%s], fileName[%s]"

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, p2, p4, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p3, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setData(Ljava/lang/Object;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1

    :cond_5
    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/miui/gallery/cloud/CreateImageBase;->isNormalFlag(I)Z

    move-result v2

    if-nez v2, :cond_6

    const-string p1, "CreateImageBase"

    const-string p2, "item already deleted, id[%s], fileName[%s]"

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, p2, p4, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p3, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1

    :cond_6
    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/cloud/CloudUtils;->canUpload(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_7

    const/4 v5, 0x1

    goto :goto_0

    :cond_7
    const/4 v5, 0x0

    :goto_0
    if-nez v5, :cond_9

    const-string p1, "CreateImageBase"

    const-string p2, "this type of media can\'t upload, id[%s], fileName[%s]"

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, p2, p4, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/cloud/CreateImageBase;->isInvalidData(Lcom/miui/gallery/data/DBImage;)Z

    move-result p1

    if-eqz p1, :cond_8

    const-string p2, "CreateImageBase"

    const-string p4, "dirty data %s"

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, p4, v0}, Lcom/miui/gallery/util/SyncLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v1}, Lcom/miui/gallery/cloud/CloudUtils;->deleteDirty(Lcom/miui/gallery/data/DBImage;)V

    :cond_8
    invoke-direct {p0, v1, v2, p1}, Lcom/miui/gallery/cloud/CreateImageBase;->statCannotUpload(Lcom/miui/gallery/data/DBImage;IZ)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p3, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1

    :cond_9
    invoke-direct {p0, v1}, Lcom/miui/gallery/cloud/CreateImageBase;->checkExifAndSha1Valid(Lcom/miui/gallery/data/DBImage;)I

    move-result v2

    if-nez v2, :cond_a

    const/4 v5, 0x1

    goto :goto_1

    :cond_a
    const/4 v5, 0x0

    :goto_1
    if-nez v5, :cond_b

    const-string p1, "CreateImageBase"

    const-string p2, "reject to upload!!"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v1, v2}, Lcom/miui/gallery/cloud/CreateImageBase;->statRejectUpload(Lcom/miui/gallery/data/DBImage;I)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p3, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1

    :cond_b
    iput-object v1, p4, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_c

    const-string v2, "CreateImageBase"

    const-string v5, "file name changed old[%s], new[%s]"

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v5, v0, v6}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_c
    new-instance v0, Ljava/io/File;

    iget-object v2, p4, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0, p4, v0}, Lcom/miui/gallery/cloud/CreateImageBase;->doUpload(Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/io/File;)V
    :try_end_0
    .catch Lcom/xiaomi/opensdk/exception/UnretriableException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v5

    iget-object v6, p0, Lcom/miui/gallery/cloud/CreateImageBase;->mContext:Landroid/content/Context;

    const-string v7, "_id"

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v6, v7, v8}, Lcom/miui/gallery/cloud/CloudUtils;->getItem(Landroid/net/Uri;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object v5

    if-eqz v5, :cond_f

    invoke-static {}, Lcom/miui/gallery/cloud/control/ServerTagCache;->getInstance()Lcom/miui/gallery/cloud/control/ServerTagCache;

    move-result-object v6

    invoke-virtual {v5}, Lcom/miui/gallery/data/DBImage;->getServerTag()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/miui/gallery/cloud/control/ServerTagCache;->add(Ljava/lang/String;)Z

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getOriginSha1()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_d

    const-string v6, "CreateImageBase"

    const-string v7, "duplication is found by server, file=%s"

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object v6, Lcom/miui/gallery/util/MediaFileUtils$FileType;->ORIGINAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v7, v4, [Ljava/io/File;

    aput-object v0, v7, v3

    invoke-static {v6, v7}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/io/File;)I

    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    const-string v7, "localFile"

    invoke-virtual {v6, v7}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v7, "thumbnailFile"

    invoke-virtual {v6, v7}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "_id = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v6, v8, v2}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_2

    :cond_d
    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_e

    invoke-static {v5, v7, v6, v4}, Lcom/miui/gallery/cloud/CloudUtils;->renameAnItemInLocal(Lcom/miui/gallery/data/DBImage;Ljava/lang/String;Ljava/lang/String;Z)V

    :cond_e
    :goto_2
    invoke-virtual {p3, v5}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setData(Ljava/lang/Object;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    :cond_f
    invoke-static {}, Lcom/miui/gallery/util/deprecated/Storage;->getCloudWaitUploadFilePath()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/miui/gallery/util/deprecated/Storage;->startsWithFilePath([Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/cloud/CloudUtils;->isFileNeedUpload(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_10

    sget-object v2, Lcom/miui/gallery/util/MediaFileUtils$FileType;->ORIGINAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v4, v4, [Ljava/io/File;

    aput-object v0, v4, v3

    invoke-static {v2, v4}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/io/File;)I

    :cond_10
    const-string v2, "CreateImageBase"

    const-string v3, "create image end %s"

    iget-object p4, p4, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p4}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object p4

    invoke-static {v2, v3, p4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, p1

    invoke-direct {p0, v1, v0, v2, v3}, Lcom/miui/gallery/cloud/CreateImageBase;->statImageCreate(Lcom/miui/gallery/data/DBImage;Ljava/io/File;J)V

    invoke-static {}, Lcom/miui/gallery/cloud/control/SyncMonitor;->getInstance()Lcom/miui/gallery/cloud/control/SyncMonitor;

    move-result-object p4

    new-instance v1, Lcom/miui/gallery/cloud/control/UploadInfo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, p1

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide p1

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/miui/gallery/cloud/control/UploadInfo;-><init>(JJ)V

    invoke-virtual {p4, v1}, Lcom/miui/gallery/cloud/control/SyncMonitor;->onUpload(Lcom/miui/gallery/cloud/control/UploadInfo;)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p3, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p1

    goto/16 :goto_5

    :catch_0
    move-exception p1

    :try_start_1
    invoke-virtual {p1}, Lcom/xiaomi/opensdk/exception/UnretriableException;->printStackTrace()V

    iget-object p2, p4, Lcom/miui/gallery/cloud/RequestCloudItem;->result:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-eqz p2, :cond_14

    iget-object p2, p4, Lcom/miui/gallery/cloud/RequestCloudItem;->result:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    iput-object v2, p4, Lcom/miui/gallery/cloud/RequestCloudItem;->result:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const-string v5, "CreateImageBase"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "upload error, result="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/base/GallerySyncCode;->name()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, v1, p1, p2}, Lcom/miui/gallery/cloud/CreateImageBase;->statUploadError(Lcom/miui/gallery/data/DBImage;Ljava/lang/Exception;Ljava/lang/String;)V

    iget-object p2, p4, Lcom/miui/gallery/cloud/RequestCloudItem;->result:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p3, p2}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setException(Ljava/lang/Exception;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object p2

    iget-object p4, p0, Lcom/miui/gallery/cloud/CreateImageBase;->mContext:Landroid/content/Context;

    const-string v5, "_id"

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-static {p2, p4, v5, v6}, Lcom/miui/gallery/cloud/CloudUtils;->getItem(Landroid/net/Uri;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object p2

    if-eqz p2, :cond_13

    invoke-static {}, Lcom/miui/gallery/cloud/control/ServerTagCache;->getInstance()Lcom/miui/gallery/cloud/control/ServerTagCache;

    move-result-object p4

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getServerTag()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p4, v5}, Lcom/miui/gallery/cloud/control/ServerTagCache;->add(Ljava/lang/String;)Z

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getOriginSha1()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_11

    const-string p4, "CreateImageBase"

    const-string v5, "duplication is found by server, file=%s"

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {p4, v5, v6}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object p4, Lcom/miui/gallery/util/MediaFileUtils$FileType;->ORIGINAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v4, v4, [Ljava/io/File;

    aput-object v0, v4, v3

    invoke-static {p4, v4}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/io/File;)I

    new-instance p4, Landroid/content/ContentValues;

    invoke-direct {p4}, Landroid/content/ContentValues;-><init>()V

    const-string v0, "localFile"

    invoke-virtual {p4, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v0, "thumbnailFile"

    invoke-virtual {p4, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_id = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, p4, v1, v2}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_3

    :cond_11
    invoke-static {p4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_12

    invoke-static {p2, v5, p4, v4}, Lcom/miui/gallery/cloud/CloudUtils;->renameAnItemInLocal(Lcom/miui/gallery/data/DBImage;Ljava/lang/String;Ljava/lang/String;Z)V

    :cond_12
    :goto_3
    invoke-virtual {p3, p2}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setData(Ljava/lang/Object;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    :cond_13
    return-object p1

    :cond_14
    :try_start_2
    const-string p2, "CreateImageBase"

    const-string p4, "upload error, no result."

    invoke-static {p2, p4}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "no result"

    invoke-direct {p0, v1, p1, p2}, Lcom/miui/gallery/cloud/CreateImageBase;->statUploadError(Lcom/miui/gallery/data/DBImage;Ljava/lang/Exception;Ljava/lang/String;)V

    sget-object p2, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_CURRENT:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p3, p2}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setException(Ljava/lang/Exception;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object p2

    iget-object p4, p0, Lcom/miui/gallery/cloud/CreateImageBase;->mContext:Landroid/content/Context;

    const-string v5, "_id"

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-static {p2, p4, v5, v6}, Lcom/miui/gallery/cloud/CloudUtils;->getItem(Landroid/net/Uri;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object p2

    if-eqz p2, :cond_17

    invoke-static {}, Lcom/miui/gallery/cloud/control/ServerTagCache;->getInstance()Lcom/miui/gallery/cloud/control/ServerTagCache;

    move-result-object p4

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getServerTag()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p4, v5}, Lcom/miui/gallery/cloud/control/ServerTagCache;->add(Ljava/lang/String;)Z

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getOriginSha1()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_15

    const-string p4, "CreateImageBase"

    const-string v5, "duplication is found by server, file=%s"

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {p4, v5, v6}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object p4, Lcom/miui/gallery/util/MediaFileUtils$FileType;->ORIGINAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v4, v4, [Ljava/io/File;

    aput-object v0, v4, v3

    invoke-static {p4, v4}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/io/File;)I

    new-instance p4, Landroid/content/ContentValues;

    invoke-direct {p4}, Landroid/content/ContentValues;-><init>()V

    const-string v0, "localFile"

    invoke-virtual {p4, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v0, "thumbnailFile"

    invoke-virtual {p4, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_id = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, p4, v1, v2}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_4

    :cond_15
    invoke-static {p4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_16

    invoke-static {p2, v5, p4, v4}, Lcom/miui/gallery/cloud/CloudUtils;->renameAnItemInLocal(Lcom/miui/gallery/data/DBImage;Ljava/lang/String;Ljava/lang/String;Z)V

    :cond_16
    :goto_4
    invoke-virtual {p3, p2}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setData(Ljava/lang/Object;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    :cond_17
    return-object p1

    :goto_5
    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object p2

    iget-object p4, p0, Lcom/miui/gallery/cloud/CreateImageBase;->mContext:Landroid/content/Context;

    const-string v5, "_id"

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-static {p2, p4, v5, v6}, Lcom/miui/gallery/cloud/CloudUtils;->getItem(Landroid/net/Uri;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object p2

    if-eqz p2, :cond_1a

    invoke-static {}, Lcom/miui/gallery/cloud/control/ServerTagCache;->getInstance()Lcom/miui/gallery/cloud/control/ServerTagCache;

    move-result-object p4

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getServerTag()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p4, v5}, Lcom/miui/gallery/cloud/control/ServerTagCache;->add(Ljava/lang/String;)Z

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getOriginSha1()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_18

    invoke-static {p4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_19

    invoke-static {p2, v5, p4, v4}, Lcom/miui/gallery/cloud/CloudUtils;->renameAnItemInLocal(Lcom/miui/gallery/data/DBImage;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_6

    :cond_18
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p4

    const-string v5, "CreateImageBase"

    const-string v6, "duplication is found by server, file=%s"

    invoke-static {v5, v6, p4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object p4, Lcom/miui/gallery/util/MediaFileUtils$FileType;->ORIGINAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v4, v4, [Ljava/io/File;

    aput-object v0, v4, v3

    invoke-static {p4, v4}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/io/File;)I

    new-instance p4, Landroid/content/ContentValues;

    invoke-direct {p4}, Landroid/content/ContentValues;-><init>()V

    const-string v0, "localFile"

    invoke-virtual {p4, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v0, "thumbnailFile"

    invoke-virtual {p4, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_id = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, p4, v1, v2}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_19
    :goto_6
    invoke-virtual {p3, p2}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setData(Ljava/lang/Object;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    :cond_1a
    throw p1
.end method

.method protected abstract getDBImage(Lcom/miui/gallery/cloud/RequestCloudItem;)Lcom/miui/gallery/data/DBImage;
.end method
