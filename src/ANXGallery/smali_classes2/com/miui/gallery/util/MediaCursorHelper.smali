.class public Lcom/miui/gallery/util/MediaCursorHelper;
.super Ljava/lang/Object;
.source "MediaCursorHelper.java"


# static fields
.field public static final PROJECTION:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 25

    const-string v0, "_id"

    const-string v1, "microthumbfile"

    const-string v2, "thumbnailFile"

    const-string v3, "localFile"

    const-string v4, "mimeType"

    const-string v5, "alias_create_time"

    const-string v6, "location"

    const-string v7, "size"

    const-string v8, "exifImageWidth"

    const-string v9, "exifImageLength"

    const-string v10, "duration"

    const-string v11, "exifGPSLatitude"

    const-string v12, "exifGPSLatitudeRef"

    const-string v13, "exifGPSLongitude"

    const-string v14, "exifGPSLongitudeRef"

    const-string v15, "alias_sync_state"

    const-string v16, "localGroupId"

    const-string v17, "secretKey"

    const-string v18, "sha1"

    const-string v19, "creatorId"

    const-string v20, "alias_is_favorite"

    const-string v21, "serverId"

    const-string v22, "exifOrientation"

    const-string v23, "title"

    const-string v24, "burst_group_id"

    filled-new-array/range {v0 .. v24}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/MediaCursorHelper;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public static getAlbumId(Landroid/database/Cursor;)J
    .locals 2

    const/16 v0, 0x10

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getCreateTime(Landroid/database/Cursor;)J
    .locals 2

    const/4 v0, 0x5

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getCreator(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x13

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getDuration(Landroid/database/Cursor;)I
    .locals 1

    const/16 v0, 0xa

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    return p0
.end method

.method public static getFilePath(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x3

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getHeight(Landroid/database/Cursor;)I
    .locals 1

    const/16 v0, 0x9

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    return p0
.end method

.method public static getLatitude(Landroid/database/Cursor;)D
    .locals 2

    const/16 v0, 0xb

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const/16 v1, 0xc

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/miui/gallery/data/LocationUtil;->convertRationalLatLonToDouble(Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public static getLocation(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x6

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getLongitude(Landroid/database/Cursor;)D
    .locals 2

    const/16 v0, 0xd

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const/16 v1, 0xe

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/miui/gallery/data/LocationUtil;->convertRationalLatLonToDouble(Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public static getMediaId(Landroid/database/Cursor;)J
    .locals 2

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getMicroThumbnailPath(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getMimeType(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x4

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getOrientation(Landroid/database/Cursor;)I
    .locals 1

    const/16 v0, 0x16

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    return p0
.end method

.method public static getSecretKey(Landroid/database/Cursor;)[B
    .locals 1

    const/16 v0, 0x11

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object p0

    return-object p0
.end method

.method public static getServerId(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x15

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getSha1(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x12

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getSize(Landroid/database/Cursor;)J
    .locals 2

    const/4 v0, 0x7

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getSyncState(Landroid/database/Cursor;)I
    .locals 1

    const/16 v0, 0xf

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    return p0
.end method

.method public static getThumbnailPath(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x2

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getTitle(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x17

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getWidth(Landroid/database/Cursor;)I
    .locals 1

    const/16 v0, 0x8

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    return p0
.end method

.method public static isFavorite(Landroid/database/Cursor;)I
    .locals 1

    const/16 v0, 0x14

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    return p0
.end method

.method public static isSynced(Landroid/database/Cursor;)Z
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/util/MediaCursorHelper;->getSyncState(Landroid/database/Cursor;)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
