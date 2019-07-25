.class public Lcom/miui/gallery/scanner/SaveToCloudUtil;
.super Ljava/lang/Object;
.source "SaveToCloudUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;,
        Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;,
        Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;,
        Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;
    }
.end annotation


# static fields
.field private static final CLOUD_PROJECTION:[Ljava/lang/String;

.field private static final ENSURE_INFO_PROJECTION_IMAGE:[Ljava/lang/String;

.field private static final ENSURE_INFO_PROJECTION_VIDEO:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    const-string v0, "_id"

    const-string v1, "size"

    const-string v2, "fileName"

    const-string v3, "serverStatus"

    const-string v4, "localFlag"

    const-string v5, "sha1"

    const-string v6, "localFile"

    const-string v7, "thumbnailFile"

    const-string v8, "serverId"

    const-string v9, "dateTaken"

    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/scanner/SaveToCloudUtil;->CLOUD_PROJECTION:[Ljava/lang/String;

    const-string v0, "latitude"

    const-string v1, "longitude"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/scanner/SaveToCloudUtil;->ENSURE_INFO_PROJECTION_IMAGE:[Ljava/lang/String;

    const-string v0, "latitude"

    const-string v1, "longitude"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/scanner/SaveToCloudUtil;->ENSURE_INFO_PROJECTION_VIDEO:[Ljava/lang/String;

    return-void
.end method

.method static synthetic access$300(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->requestThumbnail(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Landroid/database/Cursor;)Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->toCloudEntry(Landroid/database/Cursor;)Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;

    move-result-object p0

    return-object p0
.end method

.method private static checkFileSize(Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;)I
    .locals 4

    iget-wide v0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSize:J

    iget-object p0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mMimeType:Ljava/lang/String;

    invoke-static {p0}, Lcom/miui/gallery/cloud/CloudUtils;->getMinFileSizeLimit(Ljava/lang/String;)J

    move-result-wide v2

    cmp-long p0, v0, v2

    if-gtz p0, :cond_0

    const/4 p0, -0x6

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static ensureLocation(Landroid/content/Context;Ljava/lang/String;ZLandroid/content/ContentValues;)V
    .locals 8

    if-eqz p2, :cond_0

    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    :goto_0
    move-object v2, v0

    goto :goto_1

    :cond_0
    sget-object v0, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_0

    :goto_1
    if-eqz p2, :cond_1

    sget-object p2, Lcom/miui/gallery/scanner/SaveToCloudUtil;->ENSURE_INFO_PROJECTION_IMAGE:[Ljava/lang/String;

    :goto_2
    move-object v3, p2

    goto :goto_3

    :cond_1
    sget-object p2, Lcom/miui/gallery/scanner/SaveToCloudUtil;->ENSURE_INFO_PROJECTION_VIDEO:[Ljava/lang/String;

    goto :goto_2

    :goto_3
    new-instance v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$2;

    invoke-direct {v7, p3}, Lcom/miui/gallery/scanner/SaveToCloudUtil$2;-><init>(Landroid/content/ContentValues;)V

    const-string v4, "_data=?"

    const/4 p2, 0x1

    new-array v5, p2, [Ljava/lang/String;

    const/4 p2, 0x0

    aput-object p1, v5, p2

    const/4 v6, 0x0

    move-object v1, p0

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    return-void
.end method

.method private static findEntry(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;J)Ljava/util/ArrayList;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "J)",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance()Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/scanner/SaveToCloudUtil$4;

    invoke-direct {v2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$4;-><init>()V

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x4

    if-eqz v1, :cond_0

    invoke-static/range {p5 .. p6}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->getReadTableName(J)Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lcom/miui/gallery/scanner/SaveToCloudUtil;->CLOUD_PROJECTION:[Ljava/lang/String;

    const-string v10, "localGroupId=? AND (UPPER(title) = UPPER(?) OR size = ? OR sha1 = ?) AND (serverType=1 OR serverType=2) AND (serverStatus is null OR serverStatus=\'custom\' OR serverStatus=\'temp\')"

    new-array v7, v7, [Ljava/lang/String;

    invoke-static/range {p5 .. p6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v7, v6

    aput-object p1, v7, v5

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v7, v4

    aput-object p4, v7, v3

    const/4 v0, 0x0

    move-object p0, v1

    move-object p1, v8

    move-object p2, v9

    move-object p3, v10

    move-object/from16 p4, v7

    move-object/from16 p5, v0

    move-object/from16 p6, v2

    invoke-static/range {p0 .. p6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    return-object v0

    :cond_0
    invoke-static/range {p5 .. p6}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->getReadUri(J)Landroid/net/Uri;

    move-result-object v1

    sget-object v8, Lcom/miui/gallery/scanner/SaveToCloudUtil;->CLOUD_PROJECTION:[Ljava/lang/String;

    const-string v9, "localGroupId=? AND (UPPER(title) = UPPER(?) OR size = ? OR sha1 = ?) AND (serverType=1 OR serverType=2) AND (serverStatus is null OR serverStatus=\'custom\' OR serverStatus=\'temp\')"

    new-array v7, v7, [Ljava/lang/String;

    invoke-static/range {p5 .. p6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v7, v6

    aput-object p1, v7, v5

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v7, v4

    aput-object p4, v7, v3

    const/4 v0, 0x0

    move-object p1, v1

    move-object p2, v8

    move-object p3, v9

    move-object/from16 p4, v7

    move-object/from16 p5, v0

    move-object/from16 p6, v2

    invoke-static/range {p0 .. p6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    return-object v0
.end method

.method private static findEntry(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;J)Ljava/util/ArrayList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J)",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance()Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    new-instance v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$3;

    invoke-direct {v8}, Lcom/miui/gallery/scanner/SaveToCloudUtil$3;-><init>()V

    const/4 v0, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x4

    if-eqz v1, :cond_0

    invoke-static {p3, p4}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->getReadTableName(J)Ljava/lang/String;

    move-result-object p0

    sget-object v6, Lcom/miui/gallery/scanner/SaveToCloudUtil;->CLOUD_PROJECTION:[Ljava/lang/String;

    const-string v7, "localGroupId=? AND (UPPER(title) = UPPER(?) OR UPPER(localFile) = UPPER(?) OR UPPER(thumbnailFile) = UPPER(?)) AND (serverType=1 OR serverType=2) AND (serverStatus is null OR serverStatus=\'custom\' OR serverStatus=\'temp\')"

    new-array v5, v5, [Ljava/lang/String;

    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p3

    aput-object p3, v5, v4

    aput-object p1, v5, v3

    aput-object p2, v5, v2

    aput-object p2, v5, v0

    const/4 p1, 0x0

    move-object v2, p0

    move-object v3, v6

    move-object v4, v7

    move-object v6, p1

    move-object v7, v8

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;

    return-object p0

    :cond_0
    invoke-static {p3, p4}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->getReadUri(J)Landroid/net/Uri;

    move-result-object v1

    sget-object v6, Lcom/miui/gallery/scanner/SaveToCloudUtil;->CLOUD_PROJECTION:[Ljava/lang/String;

    const-string v7, "localGroupId=? AND (UPPER(title) = UPPER(?) OR UPPER(localFile) = UPPER(?) OR UPPER(thumbnailFile) = UPPER(?)) AND (serverType=1 OR serverType=2) AND (serverStatus is null OR serverStatus=\'custom\' OR serverStatus=\'temp\')"

    new-array v9, v5, [Ljava/lang/String;

    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p3

    aput-object p3, v9, v4

    aput-object p1, v9, v3

    aput-object p2, v9, v2

    aput-object p2, v9, v0

    const/4 p1, 0x0

    move-object v2, p0

    move-object v3, v1

    move-object v4, v6

    move-object v5, v7

    move-object v6, v9

    move-object v7, p1

    invoke-static/range {v2 .. v8}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;

    return-object p0
.end method

.method private static genUpdateValues(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;)Landroid/content/ContentValues;
    .locals 4

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "size"

    iget-wide v2, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSize:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "dateModified"

    iget-wide v2, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mLastModify:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "sha1"

    iget-object v2, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSha1:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mMimeType:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileMimeUtil;->isImageFromMimeType(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p0, "serverType"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object p0, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    iget-wide v1, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mLastModify:J

    invoke-static {p0, v0, v1, v2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->putValuesForImage(Ljava/lang/String;Landroid/content/ContentValues;J)V

    goto :goto_0

    :cond_0
    iget-object v1, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mMimeType:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "serverType"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v1, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    iget-wide v2, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSize:J

    invoke-static {p0, v1, v2, v3, v0}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->putValuesForVideo(Landroid/content/Context;Ljava/lang/String;JLandroid/content/ContentValues;)V

    :cond_1
    :goto_0
    return-object v0
.end method

.method public static getDateTaken(Landroid/support/media/ExifInterface;J)J
    .locals 5

    invoke-static {p0}, Lcom/miui/gallery/util/ExifUtil;->getDateTime(Landroid/support/media/ExifInterface;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/util/ExifUtil;->getGpsDateTime(Landroid/support/media/ExifInterface;)J

    move-result-wide v0

    :cond_0
    cmp-long p0, v0, v2

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    move-wide p1, v0

    :goto_0
    return-wide p1
.end method

.method private static getReadTableName(J)Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result p0

    if-eqz p0, :cond_0

    const-string p0, "shareImage"

    return-object p0

    :cond_0
    const-string p0, "cloud"

    return-object p0
.end method

.method private static getReadUri(J)Landroid/net/Uri;
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/miui/gallery/provider/GalleryContract$ShareImage;->SHARE_URI:Landroid/net/Uri;

    return-object p0

    :cond_0
    sget-object p0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    return-object p0
.end method

.method private static getUbiSubUri(J)Landroid/net/Uri;
    .locals 1

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result p0

    const/4 p1, 0x0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "URI_PARAM_REQUEST_SYNC"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_0
    sget-object p0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->OWNER_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "URI_PARAM_REQUEST_SYNC"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method private static getWriteUri(Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)Landroid/net/Uri;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getAlbumId()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lcom/miui/gallery/provider/GalleryContract$ShareImage;->SHARE_URI:Landroid/net/Uri;

    return-object p0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->isBulkNotify()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->isValidSyncValue()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$CloudWriteBulkNotify;->CLOUD_WRITE_BULK_NOTIFY_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "URI_PARAM_REQUEST_SYNC"

    invoke-virtual {p0}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->isAlbumSyncable()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_1
    sget-object p0, Lcom/miui/gallery/provider/GalleryContract$CloudWriteBulkNotify;->CLOUD_WRITE_BULK_NOTIFY_URI:Landroid/net/Uri;

    return-object p0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->isValidSyncValue()Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "URI_PARAM_REQUEST_SYNC"

    invoke-virtual {p0}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->isAlbumSyncable()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_3
    sget-object p0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    return-object p0
.end method

.method private static insert(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)J
    .locals 3

    const-string v0, "SaveToCloudUtil"

    const-string v1, "insert %s"

    iget-object v2, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mUbiEntry:Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;

    if-eqz v0, :cond_0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->insertUbi(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)J

    move-result-wide p0

    return-wide p0

    :cond_0
    invoke-static {p0, p1, p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->insertImmediately(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)J

    move-result-wide p0

    return-wide p0
.end method

.method private static insert(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;Lcom/miui/gallery/scanner/MediaBulkInserter;)J
    .locals 3

    const-string v0, "SaveToCloudUtil"

    const-string v1, "bulk insert %s"

    iget-object v2, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mUbiEntry:Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;

    if-eqz v0, :cond_0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->insertUbi(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)J

    move-result-wide p0

    return-wide p0

    :cond_0
    if-eqz p3, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getAlbumId()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getAlbumId()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getLocalFlag()I

    move-result p2

    invoke-static {p0, p1, v0, v1, p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->toValues(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;JI)Landroid/content/ContentValues;

    move-result-object p1

    invoke-static {p0, p3, p1}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->insertMedia(Landroid/content/Context;Lcom/miui/gallery/scanner/MediaBulkInserter;Landroid/content/ContentValues;)V

    const-wide/16 p0, -0x4

    return-wide p0

    :cond_1
    invoke-static {p0, p1, p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->insertImmediately(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)J

    move-result-wide p0

    return-wide p0
.end method

.method private static insertImmediately(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)J
    .locals 11

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getAlbumId()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getAlbumId()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareAlbumManager;->getOriginalAlbumId(J)J

    move-result-wide v0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getAlbumId()J

    move-result-wide v0

    :goto_0
    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getLocalFlag()I

    move-result v2

    invoke-static {p0, p1, v0, v1, v2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->toValues(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;JI)Landroid/content/ContentValues;

    move-result-object v0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    invoke-static {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->getWriteUri(Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->insertMedia(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_1

    const-wide/16 p0, -0x1

    return-wide p0

    :cond_1
    invoke-static {v0}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v8

    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getAlbumId()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    new-instance v10, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;

    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getAlbumId()J

    move-result-wide v1

    iget-object v5, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    iget-wide v6, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mLastModify:J

    move-object v0, v10

    move-wide v3, v8

    invoke-direct/range {v0 .. v7}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;-><init>(JJLjava/lang/String;J)V

    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->isInternalScanRequest()Z

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_2

    new-array p1, v1, [Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;

    aput-object v10, p1, v0

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->insertToRecentUnchecked(Landroid/content/Context;[Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;)V

    goto :goto_1

    :cond_2
    new-array p1, v1, [Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;

    aput-object v10, p1, v0

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->insertToRecent(Landroid/content/Context;[Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;)V

    :cond_3
    :goto_1
    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getAlbumId()J

    move-result-wide p0

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result p0

    if-eqz p0, :cond_4

    invoke-static {v8, v9}, Lcom/miui/gallery/provider/ShareMediaManager;->convertToMediaId(J)J

    move-result-wide v8

    :cond_4
    return-wide v8
.end method

.method private static insertMedia(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/SafeDBUtil;->safeInsert(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->requestThumbnail(Landroid/content/Context;Landroid/content/ContentValues;)V

    return-object p1
.end method

.method private static insertMedia(Landroid/content/Context;Lcom/miui/gallery/scanner/MediaBulkInserter;Landroid/content/ContentValues;)V
    .locals 0

    invoke-virtual {p1, p0, p2}, Lcom/miui/gallery/scanner/MediaBulkInserter;->insert(Landroid/content/Context;Landroid/content/ContentValues;)V

    invoke-static {p0, p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->requestThumbnail(Landroid/content/Context;Landroid/content/ContentValues;)V

    return-void
.end method

.method private static insertUbi(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)J
    .locals 9

    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getAlbumId()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getLocalFlag()I

    move-result v2

    invoke-static {p0, p1, v0, v1, v2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->toValues(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;JI)Landroid/content/ContentValues;

    move-result-object v0

    iget-object v1, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mUbiEntry:Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;

    iget-object v1, v1, Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;->mSubFiles:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const-string v2, "ubiSubImageCount"

    add-int/lit8 v3, v1, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v2, "ubiFocusIndex"

    iget-object v3, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mUbiEntry:Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;

    iget v3, v3, Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;->mOuterIndexForCloud:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v2, "ubiSubIndex"

    iget-object v3, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mUbiEntry:Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;

    iget v3, v3, Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;->mMainIndexForCloud:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-static {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->getWriteUri(Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {p0, v2, v0}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->insertMedia(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_0

    const-wide/16 p0, -0x1

    return-wide p0

    :cond_0
    invoke-static {v0}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v2

    iget-object v0, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mUbiEntry:Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;

    iget-object v0, v0, Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;->mSubFiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/data/LocalUbifocus$SubFile;

    new-instance v5, Ljava/io/File;

    invoke-virtual {v4}, Lcom/miui/gallery/data/LocalUbifocus$SubFile;->getFilePath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_1

    goto/16 :goto_3

    :cond_1
    iget v6, v4, Lcom/miui/gallery/data/LocalUbifocus$SubFile;->mIndex:I

    invoke-static {}, Lcom/miui/gallery/data/LocalUbifocus;->getMainFileIndex()I

    move-result v7

    if-ne v6, v7, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v4}, Lcom/miui/gallery/data/LocalUbifocus$SubFile;->getFilePath()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    iget-object v6, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v6}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    iget-object v6, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    invoke-static {v6}, Lcom/miui/gallery/util/FileUtils;->getFileTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mTitle:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    iput-wide v6, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mLastModify:J

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v5

    iput-wide v5, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSize:J

    iget-object v5, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    invoke-static {v5}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->needCheckExifSha1(Ljava/lang/String;)Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_3

    :try_start_0
    iget-object v5, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v5}, Lcom/miui/gallery/util/ExifUtil;->getUserCommentData(Ljava/lang/String;)Lcom/miui/gallery/util/ExifUtil$UserCommentData;

    move-result-object v5

    if-eqz v5, :cond_3

    invoke-virtual {v5}, Lcom/miui/gallery/util/ExifUtil$UserCommentData;->getSha1()Ljava/lang/String;

    move-result-object v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v5

    const-string v7, "SaveToCloudUtil"

    invoke-static {v7, v5}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3
    move-object v5, v6

    :goto_1
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_4

    const/4 v5, 0x0

    iput-boolean v5, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mIsExifSha1:Z

    iget-object v5, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v5}, Lcom/miui/gallery/util/FileUtils;->getSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_2

    :cond_4
    const/4 v7, 0x1

    iput-boolean v7, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mIsExifSha1:Z

    :goto_2
    iput-object v5, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSha1:Ljava/lang/String;

    iput-object v6, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mUbiEntry:Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;

    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getAlbumId()J

    move-result-wide v5

    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getLocalFlag()I

    move-result v7

    invoke-static {p0, p1, v5, v6, v7}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->toValues(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;JI)Landroid/content/ContentValues;

    move-result-object v5

    iget v4, v4, Lcom/miui/gallery/data/LocalUbifocus$SubFile;->mIndex:I

    invoke-static {v4, v1}, Lcom/miui/gallery/data/UbiIndexMapper;->localToCloud(II)I

    move-result v4

    int-to-long v6, v4

    const-string v4, "ubiLocalId"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v5, v4, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v4, "ubiSubIndex"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v5, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    invoke-virtual {p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getAlbumId()J

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->getUbiSubUri(J)Landroid/net/Uri;

    move-result-object v4

    invoke-static {p0, v4, v5}, Lcom/miui/gallery/util/SafeDBUtil;->safeInsert(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    goto/16 :goto_0

    :cond_5
    :goto_3
    return-wide v2
.end method

.method private static maybeThumbnail(Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;)Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->needCheckExifSha1(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSize:J

    const-wide/32 v2, 0x100000

    cmp-long p0, v0, v2

    if-gez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static needCheckExifSha1(Ljava/lang/String;)Z
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, ".jpg"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static parseSaveToCloud(Ljava/io/File;)Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;
    .locals 3

    const/4 v0, 0x0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;

    invoke-direct {v2, v0}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;-><init>(Lcom/miui/gallery/scanner/SaveToCloudUtil$1;)V

    iput-object v1, v2, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    iget-object v0, v2, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    iget-object v0, v2, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->getFileTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mTitle:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v0

    iput-wide v0, v2, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSize:J

    iget-object v0, v2, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mMimeType:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    iput-wide v0, v2, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mLastModify:J

    return-object v2

    :cond_1
    :goto_0
    return-object v0
.end method

.method private static prepareInsert(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;Lcom/miui/gallery/provider/ContentProviderBatchOperator;)I
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v8, p1

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->checkFileSize(Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;)I

    move-result v1

    if-eqz v1, :cond_0

    return v1

    :cond_0
    iget-object v9, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->needCheckExifSha1(Ljava/lang/String;)Z

    move-result v1

    const/4 v10, 0x0

    const/4 v11, -0x1

    if-eqz v1, :cond_2

    :try_start_0
    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/ExifUtil;->getUserCommentData(Ljava/lang/String;)Lcom/miui/gallery/util/ExifUtil$UserCommentData;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/miui/gallery/util/ExifUtil$UserCommentData;->getSha1()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_1
    move-object v1, v10

    :goto_0
    move-object v12, v1

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "SaveToCloudUtil"

    const-string v2, "exif exifSha1 read fail %s"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v11

    :cond_2
    move-object v12, v10

    :goto_1
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    iput-boolean v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mIsExifSha1:Z

    iget-boolean v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mIsExifSha1:Z

    const-wide/16 v13, 0x0

    const/4 v15, -0x2

    const-wide/16 v16, 0x3e8

    if-eqz v1, :cond_f

    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mTitle:Ljava/lang/String;

    iget-wide v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSize:J

    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getAlbumId()J

    move-result-wide v6

    move-object/from16 v1, p0

    move-object v5, v12

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->findEntry(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;J)Ljava/util/ArrayList;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_e

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;

    iget-object v2, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mSha1:Ljava/lang/String;

    invoke-static {v12, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v1, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mLocalPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mThumbnailPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "thumbnailFile"

    iget-object v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mID:J

    move-object/from16 v1, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->update(Landroid/content/Context;Landroid/content/ContentValues;JLcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;Lcom/miui/gallery/provider/ContentProviderBatchOperator;)V

    :cond_4
    return v15

    :cond_5
    iget-object v2, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mName:Ljava/lang/String;

    invoke-static {v2}, Lcom/miui/gallery/util/FileUtils;->getFileTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mTitle:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    iget-object v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mTitle:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c

    :cond_6
    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    invoke-static {v2}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mName:Ljava/lang/String;

    invoke-static {v3}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_a

    iget-wide v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSize:J

    iget-wide v4, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mSize:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_8

    iget-object v1, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mThumbnailPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_7

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "thumbnailFile"

    iget-object v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mID:J

    move-object/from16 v1, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->update(Landroid/content/Context;Landroid/content/ContentValues;JLcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;Lcom/miui/gallery/provider/ContentProviderBatchOperator;)V

    :cond_7
    return v15

    :cond_8
    iget-wide v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSize:J

    iget-wide v4, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mSize:J

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/16 v4, 0x400

    cmp-long v6, v2, v4

    if-gez v6, :cond_c

    sget-object v2, Lcom/miui/gallery/util/ExifUtil;->sMediaExifCreator:Lcom/miui/gallery/util/ExifUtil$ExifCreator;

    iget-object v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-interface {v2, v3}, Lcom/miui/gallery/util/ExifUtil$ExifCreator;->create(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/ExifInterface;

    invoke-static {v2}, Lcom/miui/gallery/util/ExifUtil;->getDateTime(Landroid/media/ExifInterface;)J

    move-result-wide v2

    cmp-long v4, v2, v13

    if-lez v4, :cond_c

    div-long v2, v2, v16

    iget-wide v4, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mDateTaken:J

    div-long v4, v4, v16

    cmp-long v6, v2, v4

    if-nez v6, :cond_c

    iget-object v1, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mThumbnailPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_9

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "thumbnailFile"

    iget-object v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mID:J

    move-object/from16 v1, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->update(Landroid/content/Context;Landroid/content/ContentValues;JLcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;Lcom/miui/gallery/provider/ContentProviderBatchOperator;)V

    :cond_9
    const-string v0, "thumbnail_size_similar"

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    iget-object v2, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mName:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->statFuzzyMatch(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return v15

    :cond_a
    sget-object v2, Lcom/miui/gallery/util/ExifUtil;->sMediaExifCreator:Lcom/miui/gallery/util/ExifUtil$ExifCreator;

    iget-object v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-interface {v2, v3}, Lcom/miui/gallery/util/ExifUtil$ExifCreator;->create(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/ExifInterface;

    invoke-static {v2}, Lcom/miui/gallery/util/ExifUtil;->getDateTime(Landroid/media/ExifInterface;)J

    move-result-wide v2

    cmp-long v4, v2, v13

    if-lez v4, :cond_c

    div-long v2, v2, v16

    iget-wide v4, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mDateTaken:J

    div-long v4, v4, v16

    cmp-long v6, v2, v4

    if-nez v6, :cond_c

    iget-object v1, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mThumbnailPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_b

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "thumbnailFile"

    iget-object v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mID:J

    move-object/from16 v1, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->update(Landroid/content/Context;Landroid/content/ContentValues;JLcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;Lcom/miui/gallery/provider/ContentProviderBatchOperator;)V

    :cond_b
    const-string v0, "thumbnail_date_taken"

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    iget-object v2, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mName:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->statFuzzyMatch(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return v15

    :cond_c
    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    iget-object v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    move-object v10, v7

    goto/16 :goto_2

    :cond_d
    iput-object v12, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSha1:Ljava/lang/String;

    if-eqz v10, :cond_26

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v1

    const-string v2, "albumPath"

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "sha1"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v10, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mSha1:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "media_scanner"

    const-string v2, "scanner_rename_conflict_thumbnail"

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v9}, Lcom/miui/gallery/cloud/CloudUtils;->renameForPhotoConflict(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->getFileTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mTitle:Ljava/lang/String;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    iput-wide v0, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mLastModify:J

    goto/16 :goto_6

    :cond_e
    iput-object v12, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSha1:Ljava/lang/String;

    goto/16 :goto_6

    :catch_1
    move-exception v0

    const-string v1, "SaveToCloudUtil"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v11

    :cond_f
    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/data/LocalUbifocus;->isUbifocusImage(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v2

    iget-object v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v3, v2}, Lcom/miui/gallery/data/LocalUbifocus;->getUbifocusSubFiles(Ljava/lang/String;Ljava/util/List;)I

    move-result v3

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_11

    invoke-static {}, Lcom/miui/gallery/data/LocalUbifocus;->getMainFileIndex()I

    move-result v4

    if-eq v3, v4, :cond_10

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/data/LocalUbifocus$SubFile;

    invoke-virtual {v1}, Lcom/miui/gallery/data/LocalUbifocus$SubFile;->getFilePath()Ljava/lang/String;

    move-result-object v1

    :cond_10
    if-eq v3, v11, :cond_11

    if-eq v4, v11, :cond_11

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v3, v5}, Lcom/miui/gallery/data/UbiIndexMapper;->localToCloud(II)I

    move-result v3

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v4, v5}, Lcom/miui/gallery/data/UbiIndexMapper;->localToCloud(II)I

    move-result v4

    goto :goto_3

    :cond_11
    const/4 v3, -0x1

    const/4 v4, -0x1

    :goto_3
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_12

    return v11

    :cond_12
    iput-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    if-eq v3, v11, :cond_13

    if-eq v4, v11, :cond_13

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_13

    new-instance v1, Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;

    invoke-direct {v1, v10}, Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;-><init>(Lcom/miui/gallery/scanner/SaveToCloudUtil$1;)V

    iput-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mUbiEntry:Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mUbiEntry:Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;

    iput v3, v1, Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;->mOuterIndexForCloud:I

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mUbiEntry:Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;

    iput v4, v1, Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;->mMainIndexForCloud:I

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mUbiEntry:Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;

    iput-object v2, v1, Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;->mSubFiles:Ljava/util/List;

    :cond_13
    :try_start_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mTitle:Ljava/lang/String;

    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getAlbumId()J

    move-result-wide v3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->findEntry(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;J)Ljava/util/ArrayList;

    move-result-object v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_14
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;

    iget-wide v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSize:J

    iget-wide v4, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mSize:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_19

    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    iget-object v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_18

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    iget-object v1, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mSha1:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_15

    const-string v1, "SaveToCloudUtil"

    const-string v3, "file %s sha1 is null, update sha1"

    iget-object v4, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v1, v3, v4}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->getSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSha1:Ljava/lang/String;

    const-string v1, "sha1"

    iget-object v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSha1:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_15
    iget-object v1, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mLocalPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_16

    const-string v1, "localFile"

    iget-object v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_16
    invoke-virtual {v2}, Landroid/content/ContentValues;->size()I

    move-result v1

    if-lez v1, :cond_17

    iget-wide v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mID:J

    move-object/from16 v1, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->update(Landroid/content/Context;Landroid/content/ContentValues;JLcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;Lcom/miui/gallery/provider/ContentProviderBatchOperator;)V

    :cond_17
    return v15

    :cond_18
    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    iget-object v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mLocalPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1d

    const-string v0, "origin_size_path"

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    iget-object v2, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mName:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->statFuzzyMatch(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return v15

    :cond_19
    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSha1:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1a

    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v2}, Lcom/miui/gallery/util/FileUtils;->getSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSha1:Ljava/lang/String;

    :cond_1a
    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSha1:Ljava/lang/String;

    iget-object v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mSha1:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1c

    iget-object v1, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mLocalPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-static/range {p0 .. p1}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->genUpdateValues(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;)Landroid/content/ContentValues;

    move-result-object v2

    const-string v1, "localFile"

    iget-object v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mID:J

    move-object/from16 v1, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->update(Landroid/content/Context;Landroid/content/ContentValues;JLcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;Lcom/miui/gallery/provider/ContentProviderBatchOperator;)V

    :cond_1b
    return v15

    :cond_1c
    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    iget-object v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mLocalPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-static {v7}, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->access$200(Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;)Z

    move-result v2

    if-nez v2, :cond_1d

    const-string v1, "SaveToCloudUtil"

    const-string v2, "file changed before sync: %s"

    iget-object v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "SaveToCloudUtil"

    const-string v2, "original file: sha1 [%s] size [%d]"

    iget-object v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mSha1:Ljava/lang/String;

    iget-wide v4, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mSize:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static/range {p0 .. p1}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->genUpdateValues(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;)Landroid/content/ContentValues;

    move-result-object v2

    const-string v1, "SaveToCloudUtil"

    const-string v3, "updated values: sha1 [%s] size [%d]"

    iget-object v4, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSha1:Ljava/lang/String;

    iget-wide v5, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSize:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v1, v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-wide v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mID:J

    move-object/from16 v1, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->update(Landroid/content/Context;Landroid/content/ContentValues;JLcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;Lcom/miui/gallery/provider/ContentProviderBatchOperator;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "path"

    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "size_old_new"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mSize:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSize:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "media_scanner"

    const-string v2, "file_content_changed"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const/4 v0, -0x7

    return v0

    :cond_1d
    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->maybeThumbnail(Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;)Z

    move-result v2

    if-eqz v2, :cond_1f

    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    iget-object v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mThumbnailPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1e

    const-string v0, "origin_thumbnail_path"

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    iget-object v2, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mName:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->statFuzzyMatch(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return v15

    :cond_1e
    sget-object v2, Lcom/miui/gallery/util/ExifUtil;->sMediaExifCreator:Lcom/miui/gallery/util/ExifUtil$ExifCreator;

    iget-object v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-interface {v2, v3}, Lcom/miui/gallery/util/ExifUtil$ExifCreator;->create(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/ExifInterface;

    invoke-static {v2}, Lcom/miui/gallery/util/ExifUtil;->getDateTime(Landroid/media/ExifInterface;)J

    move-result-wide v2

    cmp-long v4, v2, v13

    if-lez v4, :cond_1f

    div-long v2, v2, v16

    iget-wide v4, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mDateTaken:J

    div-long v4, v4, v16

    cmp-long v6, v2, v4

    if-nez v6, :cond_1f

    const-string v0, "origin_datetaken"

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    iget-object v2, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mName:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->statFuzzyMatch(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return v15

    :cond_1f
    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    iget-object v3, v7, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_14

    move-object v10, v7

    goto/16 :goto_4

    :cond_20
    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSha1:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_21

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->getSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSha1:Ljava/lang/String;

    :cond_21
    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->isInternalScanRequest()Z

    move-result v1

    if-nez v1, :cond_23

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getStreamFileStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy$StreamFileStrategy;

    move-result-object v3

    if-eqz v3, :cond_22

    invoke-virtual {v3, v2}, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy$StreamFileStrategy;->isStreamFolder(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_22

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    div-long v4, v4, v16

    mul-long v4, v4, v16

    iget-wide v6, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mLastModify:J

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    invoke-virtual {v3}, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy$StreamFileStrategy;->getDelayMilliseconds()J

    move-result-wide v6

    cmp-long v1, v4, v6

    if-gez v1, :cond_23

    const-string v0, "SaveToCloudUtil"

    const-string v1, "scanning stream folder %s"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v11

    :cond_22
    iget-wide v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mLastModify:J

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v5

    sub-long/2addr v3, v5

    cmp-long v1, v3, v16

    if-lez v1, :cond_23

    const-string v1, "SaveToCloudUtil"

    const-string v3, "maybe a stream folder %s"

    invoke-static {v1, v3, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v3, "folder"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "media_scanner"

    const-string v3, "scanner_stream_file"

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_23
    if-eqz v10, :cond_25

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v1

    const-string v2, "albumPath"

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "sha1"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v10, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mSha1:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSha1:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "media_scanner"

    const-string v2, "scanner_rename_conflict_origin"

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v9}, Lcom/miui/gallery/cloud/CloudUtils;->renameForPhotoConflict(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mUbiEntry:Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;

    if-eqz v1, :cond_24

    invoke-static {v0}, Lcom/miui/gallery/data/LocalUbifocus;->getUbifocusSubFiles(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/data/LocalUbifocus;->getMainFileIndex()I

    move-result v1

    if-eqz v0, :cond_25

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, v1, :cond_25

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/data/LocalUbifocus$SubFile;

    invoke-virtual {v1}, Lcom/miui/gallery/data/LocalUbifocus$SubFile;->getFilePath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    new-instance v1, Ljava/io/File;

    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v2}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    iget-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    invoke-static {v2}, Lcom/miui/gallery/util/FileUtils;->getFileTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mTitle:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v1

    iput-wide v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mLastModify:J

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mUbiEntry:Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;

    iput-object v0, v1, Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;->mSubFiles:Ljava/util/List;

    goto :goto_5

    :cond_24
    iput-object v0, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    iget-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->getFileTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mTitle:Ljava/lang/String;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    iput-wide v0, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mLastModify:J

    :cond_25
    :goto_5
    iget-wide v0, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mLastModify:J

    cmp-long v2, v0, v13

    if-lez v2, :cond_26

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mLastModify:J

    sub-long/2addr v0, v2

    div-long v0, v0, v16

    const-wide/16 v2, 0x3c

    cmp-long v4, v0, v2

    if-gez v4, :cond_26

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "Sync"

    const-string v2, "sync_photo_insert_in_one_minute"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_26
    :goto_6
    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->isSaveToSecretAlbum()Z

    move-result v0

    if-eqz v0, :cond_27

    iget-object v0, v8, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mUbiEntry:Lcom/miui/gallery/scanner/SaveToCloudUtil$UbifocusEntry;

    if-nez v0, :cond_27

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->tryEncryptFilePathForSecret(Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;)V

    :cond_27
    const/4 v0, 0x0

    return v0

    :catch_2
    move-exception v0

    const-string v1, "SaveToCloudUtil"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v11
.end method

.method private static putExifIntToContentValues(Landroid/support/media/ExifInterface;Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p2, p3, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "SaveToCloudUtil"

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private static putValuesForImage(Ljava/lang/String;Landroid/content/ContentValues;J)V
    .locals 6

    :try_start_0
    invoke-static {p0}, Lcom/miui/gallery/util/FileMimeUtil;->hasExif(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    new-instance v0, Landroid/support/media/ExifInterface;

    invoke-direct {v0, p0}, Landroid/support/media/ExifInterface;-><init>(Ljava/lang/String;)V

    const-string v2, "ImageWidth"

    invoke-virtual {v0, v2, v1}, Landroid/support/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v2

    const-string v3, "ImageLength"

    invoke-virtual {v0, v3, v1}, Landroid/support/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v3

    if-lez v2, :cond_0

    if-gtz v3, :cond_1

    :cond_0
    invoke-static {p0}, Lmiui/graphics/BitmapFactory;->getBitmapSize(Ljava/lang/String;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v2

    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v2, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    move v5, v3

    move v3, v2

    move v2, v5

    :cond_1
    const-string v4, "exifImageWidth"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v2, "exifImageLength"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v2, "exifOrientation"

    const-string v3, "Orientation"

    invoke-virtual {v0, v3, v1}, Landroid/support/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "exifGPSLatitude"

    const-string v2, "GPSLatitude"

    invoke-virtual {v0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "exifGPSLongitude"

    const-string v2, "GPSLongitude"

    invoke-virtual {v0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "exifMake"

    const-string v2, "Make"

    invoke-virtual {v0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "exifModel"

    const-string v2, "Model"

    invoke-virtual {v0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Flash"

    const-string v2, "exifFlash"

    invoke-static {v0, v1, p1, v2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->putExifIntToContentValues(Landroid/support/media/ExifInterface;Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;)V

    const-string v1, "exifGPSLatitudeRef"

    const-string v2, "GPSLatitudeRef"

    invoke-virtual {v0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "exifGPSLongitudeRef"

    const-string v2, "GPSLongitudeRef"

    invoke-virtual {v0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "exifExposureTime"

    const-string v2, "ExposureTime"

    invoke-virtual {v0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "exifFNumber"

    const-string v2, "FNumber"

    invoke-virtual {v0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "exifISOSpeedRatings"

    const-string v2, "ISOSpeedRatings"

    invoke-virtual {v0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "exifGPSAltitude"

    const-string v2, "GPSAltitude"

    invoke-virtual {v0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "GPSAltitudeRef"

    const-string v2, "exifGPSAltitudeRef"

    invoke-static {v0, v1, p1, v2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->putExifIntToContentValues(Landroid/support/media/ExifInterface;Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;)V

    const-string v1, "exifGPSTimeStamp"

    const-string v2, "GPSTimeStamp"

    invoke-virtual {v0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "exifGPSDateStamp"

    const-string v2, "GPSDateStamp"

    invoke-virtual {v0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "WhiteBalance"

    const-string v2, "exifWhiteBalance"

    invoke-static {v0, v1, p1, v2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->putExifIntToContentValues(Landroid/support/media/ExifInterface;Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;)V

    const-string v1, "exifFocalLength"

    const-string v2, "FocalLength"

    invoke-virtual {v0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "exifGPSProcessingMethod"

    const-string v2, "GPSProcessingMethod"

    invoke-virtual {v0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "exifDateTime"

    const-string v2, "DateTime"

    invoke-virtual {v0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, p2, p3}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->getDateTaken(Landroid/support/media/ExifInterface;J)J

    move-result-wide p2

    const-string v0, "dateTaken"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "mixedDateTime"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    invoke-static {p0}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->parseFlagsForImage(Ljava/lang/String;)J

    move-result-wide p2

    const-string v0, "specialTypeFlags"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    invoke-static {p2, p3}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->sendNewPhotoStatic(J)V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$SampleStatistic;->hasUploadUserInfo()Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-nez p1, :cond_3

    :try_start_1
    invoke-static {p0}, Lcom/miui/gallery/util/ExifUtil;->getXiaomiComment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "sensor_type"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p2, "front"

    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_3

    const-string p0, "imeimd5"

    invoke-static {}, Lmiui/telephony/TelephonyHelper;->getInstance()Lmiui/telephony/TelephonyHelper;

    move-result-object p2

    invoke-virtual {p2}, Lmiui/telephony/TelephonyHelper;->getDeviceId()Ljava/lang/String;

    move-result-object p2

    const-string p3, "UTF-8"

    invoke-virtual {p2, p3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/util/Encode;->MD5Encode([B)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "user_info"

    const-string p2, "self_shoot"

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/util/GalleryStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$SampleStatistic;->setUploadedUserInfo(Z)V

    const-string p1, "SaveToCloudUtil"

    const-string p2, "upload xiaomi comment %s"

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_0

    :catch_0
    move-exception p0

    :try_start_2
    const-string p1, "SaveToCloudUtil"

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :goto_0
    :try_start_3
    throw p0

    :cond_2
    invoke-static {p0}, Lmiui/graphics/BitmapFactory;->getBitmapSize(Ljava/lang/String;)Landroid/graphics/BitmapFactory$Options;

    move-result-object p0

    iget v0, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget p0, p0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    const-string v2, "exifImageWidth"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "exifImageLength"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p0, "exifOrientation"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p0, "dateTaken"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p0, "mixedDateTime"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p1, p0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    const-string p1, "SaveToCloudUtil"

    const-string p2, "media scanner exif error %s"

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3
    :goto_1
    return-void
.end method

.method private static putValuesForVideo(Landroid/content/Context;Ljava/lang/String;JLandroid/content/ContentValues;)V
    .locals 11

    :try_start_0
    invoke-static {p1}, Lcom/miui/gallery/util/VideoAttrsReader;->read(Ljava/lang/String;)Lcom/miui/gallery/util/VideoAttrsReader;

    move-result-object v0

    const-string v1, "title"

    invoke-virtual {v0}, Lcom/miui/gallery/util/VideoAttrsReader;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p4, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/miui/gallery/util/VideoAttrsReader;->getDuration()J

    move-result-wide v1

    const-wide/16 v3, 0x3e8

    div-long v6, v1, v3

    const-string v1, "duration"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p4, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "exifImageWidth"

    invoke-virtual {v0}, Lcom/miui/gallery/util/VideoAttrsReader;->getVideoWidth()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p4, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "exifImageLength"

    invoke-virtual {v0}, Lcom/miui/gallery/util/VideoAttrsReader;->getVideoHeight()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p4, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {v0}, Lcom/miui/gallery/util/VideoAttrsReader;->getDateTaken()J

    move-result-wide v0

    const-string v2, "dateTaken"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p4, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v2, "mixedDateTime"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p4, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p4}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->ensureLocation(Landroid/content/Context;Ljava/lang/String;ZLandroid/content/ContentValues;)V

    const-string v0, "specialTypeFlags"

    invoke-static {p1}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->parseFlagsForVideo(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p4, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    move-object v5, p0

    move-object v8, p1

    move-wide v9, p2

    invoke-static/range {v5 .. v10}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->statVideoInfo(Landroid/content/Context;JLjava/lang/String;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "SaveToCloudUtil"

    const-string p2, "media scanner exif video error %s"

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method private static requestSync(Landroid/content/Context;)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object v1, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    const-wide/16 v1, 0x21

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setDelayUpload(Z)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    return-void
.end method

.method private static requestThumbnail(Landroid/content/Context;Landroid/content/ContentValues;)V
    .locals 2

    const-string v0, "serverType"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "localFile"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/scanner/SaveToCloudUtil$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/scanner/SaveToCloudUtil$1;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method private static requestThumbnail(Landroid/content/Context;Ljava/lang/String;)V
    .locals 12

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p1}, Lcom/miui/gallery/util/MediaStoreUtils;->getMediaStoreId(Ljava/lang/String;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_2

    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object v4, Landroid/provider/MediaStore$Video$Thumbnails;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_0

    :cond_0
    sget-object v4, Landroid/provider/MediaStore$Images$Thumbnails;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    :goto_0
    invoke-virtual {v4}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v4

    const-string v5, "blocking"

    const-string v6, "1"

    invoke-virtual {v4, v5, v6}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    const-string v5, "orig_id"

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v6

    const-string v4, "_data"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    move-object v7, v4

    if-eqz p1, :cond_1

    const-string p1, "video_id=?"

    :goto_1
    move-object v8, p1

    goto :goto_2

    :cond_1
    const-string p1, "image_id=?"

    goto :goto_1

    :goto_2
    const/4 p1, 0x1

    new-array v9, p1, [Ljava/lang/String;

    const/4 p1, 0x0

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v9, p1

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v5, p0

    invoke-static/range {v5 .. v11}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    :cond_2
    const-string p0, "SaveToCloudUtil"

    const-string p1, "request thumbnail cost %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public static saveToCloudDB(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)J
    .locals 3

    if-nez p1, :cond_0

    const-wide/16 p0, -0x3

    return-wide p0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getSaveFile()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->parseSaveToCloud(Ljava/io/File;)Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;

    move-result-object v0

    if-nez v0, :cond_1

    const-wide/16 p0, -0x1

    return-wide p0

    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    const/4 v1, 0x0

    invoke-static {p0, v0, p1, v1}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->prepareInsert(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;Lcom/miui/gallery/provider/ContentProviderBatchOperator;)I

    move-result v1

    const/4 v2, -0x7

    if-ne v2, v1, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->isAlbumSyncable()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {p0}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->requestSync(Landroid/content/Context;)V

    :cond_2
    if-nez v1, :cond_3

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->insert(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)J

    move-result-wide p0

    goto :goto_0

    :cond_3
    int-to-long p0, v1

    :goto_0
    return-wide p0
.end method

.method public static saveToCloudDB(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;Lcom/miui/gallery/scanner/MediaBulkInserter;Lcom/miui/gallery/provider/ContentProviderBatchOperator;)J
    .locals 2

    if-nez p1, :cond_0

    const-wide/16 p0, -0x3

    return-wide p0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->getSaveFile()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->parseSaveToCloud(Ljava/io/File;)Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;

    move-result-object v0

    if-nez v0, :cond_1

    const-wide/16 p0, -0x1

    return-wide p0

    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    invoke-static {p0, v0, p1, p3}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->prepareInsert(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;Lcom/miui/gallery/provider/ContentProviderBatchOperator;)I

    move-result p3

    if-nez p2, :cond_2

    const/4 v1, -0x7

    if-ne v1, p3, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->isAlbumSyncable()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {p0}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->requestSync(Landroid/content/Context;)V

    :cond_2
    if-nez p3, :cond_3

    invoke-static {p0, v0, p1, p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->insert(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;Lcom/miui/gallery/scanner/MediaBulkInserter;)J

    move-result-wide p0

    goto :goto_0

    :cond_3
    int-to-long p0, p3

    :goto_0
    return-wide p0
.end method

.method private static statFuzzyMatch(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    const-string v0, "scanner_fuzzy_match_%s"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v2, "name_pair"

    const-string v4, "%s_%s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v3

    aput-object p2, v5, v1

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "media_scanner"

    invoke-static {p1, p0, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private static statVideoInfo(Landroid/content/Context;JLjava/lang/String;J)V
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "duration"

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "path"

    invoke-static {p0, p3}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "size"

    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string p2, "%.1fM"

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/Object;

    const/4 v1, 0x0

    long-to-float p4, p4

    const p5, 0x49742400    # 1000000.0f

    div-float/2addr p4, p5

    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p4

    aput-object p4, p3, v1

    invoke-static {p1, p2, p3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "media_scanner"

    const-string p1, "video_duration"

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    return-void
.end method

.method private static toCloudEntry(Landroid/database/Cursor;)Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;
    .locals 3

    new-instance v0, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;-><init>(Lcom/miui/gallery/scanner/SaveToCloudUtil$1;)V

    const/4 v1, 0x0

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, v0, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mID:J

    const/4 v1, 0x1

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, v0, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mSize:J

    const/4 v1, 0x2

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mName:Ljava/lang/String;

    const/4 v1, 0x3

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mServerStatus:Ljava/lang/String;

    const/4 v1, 0x4

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mLocalFlag:I

    const/4 v1, 0x5

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mSha1:Ljava/lang/String;

    const/4 v1, 0x6

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mLocalPath:Ljava/lang/String;

    const/4 v1, 0x7

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mThumbnailPath:Ljava/lang/String;

    const/16 v1, 0x8

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mServerId:Ljava/lang/String;

    const/16 v1, 0x9

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, v0, Lcom/miui/gallery/scanner/SaveToCloudUtil$CloudEntry;->mDateTaken:J

    return-object v0
.end method

.method private static toValues(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;JI)Landroid/content/ContentValues;
    .locals 4

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "size"

    iget-wide v2, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSize:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "dateModified"

    iget-wide v2, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mLastModify:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "mimeType"

    iget-object v2, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mMimeType:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "title"

    iget-object v2, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "fileName"

    iget-object v2, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "localFlag"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {v0, v1, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-boolean p4, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mIsExifSha1:Z

    if-eqz p4, :cond_0

    const-string p4, "thumbnailFile"

    iget-object v1, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-virtual {v0, p4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p4, "localFile"

    iget-object v1, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-virtual {v0, p4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p4, "localFile"

    iget-object v1, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-virtual {v0, p4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const-string p4, "sha1"

    iget-object v1, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSha1:Ljava/lang/String;

    invoke-virtual {v0, p4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p4, "localGroupId"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {v0, p4, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-object p2, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mMimeType:Ljava/lang/String;

    invoke-static {p2}, Lcom/miui/gallery/util/FileMimeUtil;->isImageFromMimeType(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    const-string p0, "serverType"

    const/4 p2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v0, p0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object p0, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    iget-wide p2, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mLastModify:J

    invoke-static {p0, v0, p2, p3}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->putValuesForImage(Ljava/lang/String;Landroid/content/ContentValues;J)V

    goto :goto_1

    :cond_1
    iget-object p2, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mMimeType:Ljava/lang/String;

    invoke-static {p2}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_2

    const-string p2, "serverType"

    const/4 p3, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {v0, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object p2, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    iget-wide p3, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mSize:J

    invoke-static {p0, p2, p3, p4, v0}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->putValuesForVideo(Landroid/content/Context;Ljava/lang/String;JLandroid/content/ContentValues;)V

    :cond_2
    :goto_1
    invoke-static {}, Lcom/miui/gallery/data/LocationManager;->getInstance()Lcom/miui/gallery/data/LocationManager;

    move-result-object p0

    iget-object p1, p1, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/data/LocationManager;->appendExtraGpsInfo(Ljava/lang/String;Landroid/content/ContentValues;)V

    return-object v0
.end method

.method private static tryEncryptFilePathForSecret(Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mMimeType:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->encodeFileName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mName:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    new-instance v2, Ljava/io/File;

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v2}, Lcom/miui/gallery/util/FileUtils;->move(Ljava/io/File;Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mPath:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveToCloud;->mLastModify:J

    :cond_0
    return-void
.end method

.method private static update(Landroid/content/Context;Landroid/content/ContentValues;JLcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;Lcom/miui/gallery/provider/ContentProviderBatchOperator;)V
    .locals 3

    invoke-static {p4}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->getWriteUri(Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)Landroid/net/Uri;

    move-result-object p4

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p5, :cond_0

    invoke-static {p4}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object p4

    const-string v2, "_id=?"

    new-array v1, v1, [Ljava/lang/String;

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    aput-object p2, v1, v0

    invoke-virtual {p4, v2, v1}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object p1

    invoke-virtual {p5, p0, p1}, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->add(Landroid/content/Context;Landroid/content/ContentProviderOperation;)V

    goto :goto_0

    :cond_0
    const-string p5, "_id=?"

    new-array v1, v1, [Ljava/lang/String;

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    aput-object p2, v1, v0

    invoke-static {p0, p4, p1, p5, v1}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :goto_0
    return-void
.end method
