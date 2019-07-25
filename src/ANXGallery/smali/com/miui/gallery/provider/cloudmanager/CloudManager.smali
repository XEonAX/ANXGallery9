.class public Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.super Ljava/lang/Object;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$Rename;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesById;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesByPath;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$RenameAlbum;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$CreateAlbum;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupCopy;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMedia;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$MoveByUri;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$BaseCopyOrMoveByUri;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$CheckPostProcessing;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;,
        Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;
    }
.end annotation


# static fields
.field private static final METHODS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final PRIVATE_COPYABLE_PROJECTION:[Ljava/lang/String;

.field static final PROJECTION:[Ljava/lang/String;

.field private static final PUBLIC_COPYABLE_PROJECTION:[Ljava/lang/String;

.field private static final QUERY_BY_PATH_PROJECTION:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 61

    const-string v0, "_id"

    const-string v1, "sha1"

    const-string v2, "size"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->QUERY_BY_PATH_PROJECTION:[Ljava/lang/String;

    const-string v1, "_id"

    const-string v2, "groupId"

    const-string v3, "localFlag"

    const-string v4, "localGroupId"

    const-string v5, "serverId"

    const-string v6, "serverType"

    const-string v7, "fileName"

    const-string v8, "localFile"

    const-string v9, "thumbnailFile"

    const-string v10, "sha1"

    const-string v11, "ubiSubImageCount"

    const-string v12, "secretKey"

    const-string v13, "microthumbfile"

    const-string v14, "albumId"

    const-string v15, "description"

    const-string v16, "size"

    const-string v17, "dateModified"

    const-string v18, "mimeType"

    const-string v19, "title"

    const-string v20, "description"

    const-string v21, "dateTaken"

    const-string v22, "duration"

    const-string v23, "serverTag"

    const-string v24, "serverStatus"

    const-string v25, "downloadFile"

    const-string v26, "sortBy"

    const-string v27, "localImageId"

    const-string v28, "downloadFileStatus"

    const-string v29, "downloadFileTime"

    const-string v30, "mixedDateTime"

    const-string v31, "exifImageWidth"

    const-string v32, "exifImageLength"

    const-string v33, "exifOrientation"

    const-string v34, "exifGPSLatitude"

    const-string v35, "exifGPSLongitude"

    const-string v36, "exifMake"

    const-string v37, "exifModel"

    const-string v38, "exifFlash"

    const-string v39, "exifGPSLatitudeRef"

    const-string v40, "exifGPSLongitudeRef"

    const-string v41, "exifExposureTime"

    const-string v42, "exifFNumber"

    const-string v43, "exifISOSpeedRatings"

    const-string v44, "exifGPSAltitude"

    const-string v45, "exifGPSAltitudeRef"

    const-string v46, "exifGPSTimeStamp"

    const-string v47, "exifGPSDateStamp"

    const-string v48, "exifWhiteBalance"

    const-string v49, "exifFocalLength"

    const-string v50, "exifGPSProcessingMethod"

    const-string v51, "exifDateTime"

    const-string v52, "creatorId"

    const-string v53, "ubiFocusIndex"

    const-string v54, "ubiSubIndex"

    const-string v55, "editedColumns"

    const-string v56, "fromLocalGroupId"

    const-string v57, "location"

    const-string v58, "extraGPS"

    const-string v59, "address"

    const-string v60, "specialTypeFlags"

    filled-new-array/range {v1 .. v60}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    const-string v0, "thumbnailFile"

    const-string v1, "downloadFile"

    const-string v2, "localFile"

    const-string v3, "microthumbfile"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PRIVATE_COPYABLE_PROJECTION:[Ljava/lang/String;

    const-string v1, "fileName"

    const-string v2, "dateTaken"

    const-string v3, "dateModified"

    const-string v4, "description"

    const-string v5, "serverType"

    const-string v6, "size"

    const-string v7, "mimeType"

    const-string v8, "title"

    const-string v9, "sha1"

    const-string v10, "duration"

    const-string v11, "appKey"

    const-string v12, "babyInfoJson"

    const-string v13, "mixedDateTime"

    const-string v14, "location"

    const-string v15, "extraGPS"

    const-string v16, "address"

    const-string v17, "exifImageWidth"

    const-string v18, "exifImageLength"

    const-string v19, "exifOrientation"

    const-string v20, "exifGPSLatitude"

    const-string v21, "exifGPSLongitude"

    const-string v22, "exifMake"

    const-string v23, "exifModel"

    const-string v24, "exifFlash"

    const-string v25, "exifGPSLatitudeRef"

    const-string v26, "exifGPSLongitudeRef"

    const-string v27, "exifExposureTime"

    const-string v28, "exifFNumber"

    const-string v29, "exifISOSpeedRatings"

    const-string v30, "exifGPSAltitude"

    const-string v31, "exifGPSAltitudeRef"

    const-string v32, "exifGPSTimeStamp"

    const-string v33, "exifGPSDateStamp"

    const-string v34, "exifWhiteBalance"

    const-string v35, "exifFocalLength"

    const-string v36, "exifGPSProcessingMethod"

    const-string v37, "exifDateTime"

    const-string v38, "ubiSubImageCount"

    const-string v39, "ubiFocusIndex"

    const-string v40, "ubiSubIndex"

    const-string v41, "specialTypeFlags"

    filled-new-array/range {v1 .. v41}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PUBLIC_COPYABLE_PROJECTION:[Ljava/lang/String;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->METHODS:Ljava/util/Set;

    sget-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->METHODS:Ljava/util/Set;

    const-string v1, "create_album"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->METHODS:Ljava/util/Set;

    const-string v1, "add_to_album"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->METHODS:Ljava/util/Set;

    const-string v1, "delete"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->METHODS:Ljava/util/Set;

    const-string v1, "set_album_attributes"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->METHODS:Ljava/util/Set;

    const-string v1, "force_top"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->METHODS:Ljava/util/Set;

    const-string v1, "unforce_top"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->METHODS:Ljava/util/Set;

    const-string v1, "add_remove_secret"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->METHODS:Ljava/util/Set;

    const-string v1, "rename_album"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->METHODS:Ljava/util/Set;

    const-string v1, "delete_album"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->METHODS:Ljava/util/Set;

    const-string v1, "add_remove_favorite"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->METHODS:Ljava/util/Set;

    const-string v1, "rename"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method static synthetic access$000(J)Z
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->isSystemAlbum(J)Z

    move-result p0

    return p0
.end method

.method static synthetic access$100(Landroid/content/ContentValues;)Landroid/content/ContentValues;
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->desensitization(Landroid/content/ContentValues;)Landroid/content/ContentValues;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PUBLIC_COPYABLE_PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300([Ljava/lang/String;Landroid/database/Cursor;)Landroid/content/ContentValues;
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->copyOf([Ljava/lang/String;Landroid/database/Cursor;)Landroid/content/ContentValues;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PRIVATE_COPYABLE_PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JI)[J
    .locals 0

    invoke-static/range {p0 .. p5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->delete(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JI)[J

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JILjava/util/ArrayList;I)[J
    .locals 0

    invoke-static/range {p0 .. p7}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->delete(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JILjava/util/ArrayList;I)[J

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JLjava/util/ArrayList;I)[J
    .locals 0

    invoke-static/range {p0 .. p6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->cloudDelete(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JLjava/util/ArrayList;I)[J

    move-result-object p0

    return-object p0
.end method

.method private static addRemoveFavoritesById(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JI)J
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;JI)J"
        }
    .end annotation

    :try_start_0
    new-instance v6, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesById;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p3

    move v3, p6

    move-wide v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesById;-><init>(Landroid/content/Context;Ljava/util/ArrayList;IJ)V

    invoke-virtual {v6, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesById;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p0

    :catch_0
    const-string p0, "CloudManager"

    const-string p1, "Add or remove favorites by id with error: %s"

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-wide/16 p0, -0x64

    return-wide p0
.end method

.method private static addRemoveFavoritesByPath(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;Ljava/lang/String;I)J
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/lang/String;",
            "I)J"
        }
    .end annotation

    :try_start_0
    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesByPath;

    invoke-direct {v0, p0, p3, p5, p4}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesByPath;-><init>(Landroid/content/Context;Ljava/util/ArrayList;ILjava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesByPath;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p0

    :catch_0
    const-string p0, "CloudManager"

    const-string p1, "Add or remove favorites by path with error: %s"

    invoke-static {p0, p1, p4}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-wide/16 p0, -0x64

    return-wide p0
.end method

.method private static addRemoveFavoritesSha1(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;Ljava/lang/String;I)J
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/lang/String;",
            "I)J"
        }
    .end annotation

    :try_start_0
    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;

    invoke-direct {v0, p0, p3, p5, p4}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;-><init>(Landroid/content/Context;Ljava/util/ArrayList;ILjava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p0

    :catch_0
    const-string p0, "CloudManager"

    const-string p1, "Add or remove favorites by sha1 with error: %s"

    invoke-static {p0, p1, p4}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-wide/16 p0, -0x64

    return-wide p0
.end method

.method private static addToSecret(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;J)J
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;J)J"
        }
    .end annotation

    :try_start_0
    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;

    invoke-direct {v0, p0, p3, p4, p5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;-><init>(Landroid/content/Context;Ljava/util/ArrayList;J)V

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p0

    :catch_0
    move-exception p0

    const-string p1, "CloudManager"

    const-string p2, "add to secret error %d, %s"

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-static {p1, p2, p3, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const-wide/16 p0, -0x64

    return-wide p0
.end method

.method private static addToSecret(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;Landroid/net/Uri;)J
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;",
            "Landroid/net/Uri;",
            ")J"
        }
    .end annotation

    :try_start_0
    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;

    invoke-direct {v0, p0, p3, p4}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Landroid/net/Uri;)V

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p0

    :catch_0
    const-string p0, "CloudManager"

    const-string p1, "add to secret error %s"

    invoke-static {p0, p1, p4}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-wide/16 p0, -0x64

    return-wide p0
.end method

.method public static call(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 25

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object/from16 v11, p2

    move-object/from16 v0, p3

    move-object/from16 v6, p4

    move-object/from16 v12, p5

    new-instance v13, Landroid/os/Bundle;

    invoke-direct {v13}, Landroid/os/Bundle;-><init>()V

    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "add_to_album"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, -0x1

    const-wide/16 v3, -0x1

    const/4 v15, 0x0

    const/4 v8, 0x1

    if-eqz v1, :cond_d

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/miui/gallery/util/Numbers;->parse(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v16

    const-string v0, "extra_src_type"

    invoke-virtual {v12, v0, v15}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    const-string v1, "extra_type"

    invoke-virtual {v12, v1, v15}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v7

    if-ne v0, v8, :cond_5

    const-string v0, "extra_src_uris"

    invoke-virtual {v12, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-static/range {v16 .. v17}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->isVirtualAlbum(J)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_2

    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v6, v1, [J

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v18

    const/16 v19, 0x0

    :goto_0
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v20, v0

    check-cast v20, Landroid/net/Uri;

    if-nez v7, :cond_1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v14

    move-wide/from16 v4, v16

    move-object v15, v6

    move-object/from16 v6, v20

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->copyByUri(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JLandroid/net/Uri;)J

    move-result-wide v0

    aput-wide v0, v15, v19

    goto :goto_1

    :cond_1
    move-object v15, v6

    if-ne v7, v8, :cond_2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v14

    move-wide/from16 v4, v16

    move-object/from16 v6, v20

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->moveByUri(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JLandroid/net/Uri;)J

    move-result-wide v0

    aput-wide v0, v15, v19

    :cond_2
    :goto_1
    add-int/lit8 v19, v19, 0x1

    move-object v6, v15

    const/4 v15, 0x0

    goto :goto_0

    :cond_3
    move-object v15, v6

    const-string v0, "ids"

    invoke-virtual {v13, v0, v15}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    goto/16 :goto_6

    :cond_4
    :goto_2
    const-string v1, "CloudManager"

    const-string v2, "error, albumId is %s, uris is %s"

    invoke-static {v1, v2, v6, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v13

    :cond_5
    if-nez v0, :cond_c

    const-string v0, "extra_dup_type"

    invoke-virtual {v12, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v15

    const-string v0, "extra_src_media_ids"

    invoke-virtual {v12, v0}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v4

    if-eqz v4, :cond_b

    if-eqz v7, :cond_6

    if-ne v7, v8, :cond_b

    :cond_6
    invoke-static/range {v16 .. v17}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->isVirtualAlbum(J)Z

    move-result v0

    if-eqz v0, :cond_7

    goto/16 :goto_5

    :cond_7
    array-length v0, v4

    new-array v6, v0, [J

    array-length v5, v4

    const/4 v3, 0x0

    const/16 v18, 0x0

    :goto_3
    if-ge v3, v5, :cond_a

    aget-wide v19, v4, v3

    if-nez v7, :cond_8

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v21, v3

    move-object v3, v14

    move-object v9, v4

    move/from16 v22, v5

    move-wide/from16 v4, v16

    move-object v11, v6

    move v10, v7

    move-wide/from16 v6, v19

    const/4 v12, 0x1

    move v8, v15

    invoke-static/range {v0 .. v8}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->copy(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JJI)J

    move-result-wide v0

    aput-wide v0, v11, v18

    goto :goto_4

    :cond_8
    move/from16 v21, v3

    move-object v9, v4

    move/from16 v22, v5

    move-object v11, v6

    move v10, v7

    const/4 v12, 0x1

    if-ne v10, v12, :cond_9

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v14

    move-wide/from16 v4, v16

    move-wide/from16 v6, v19

    move v8, v15

    invoke-static/range {v0 .. v8}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->move(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JJI)J

    move-result-wide v0

    aput-wide v0, v11, v18

    :cond_9
    :goto_4
    add-int/lit8 v18, v18, 0x1

    add-int/lit8 v3, v21, 0x1

    move-object v4, v9

    move v7, v10

    move-object v6, v11

    move/from16 v5, v22

    const/4 v8, 0x1

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object/from16 v11, p2

    move-object/from16 v12, p5

    goto :goto_3

    :cond_a
    move-object v11, v6

    const/4 v12, 0x1

    const-string v0, "ids"

    invoke-virtual {v13, v0, v11}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    goto :goto_7

    :cond_b
    :goto_5
    move-object v9, v4

    const-string v0, "CloudManager"

    const-string v1, "error, albumId is %s, mediaIds is %s"

    invoke-static {v0, v1, v6, v9}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v13

    :cond_c
    :goto_6
    const/4 v12, 0x1

    :goto_7
    move-object/from16 v8, p0

    move-object/from16 v9, p5

    goto/16 :goto_15

    :cond_d
    const/4 v12, 0x1

    const-string v1, "delete_album"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    const-string v0, "extra_delete_options"

    const/4 v1, 0x0

    move-object/from16 v9, p5

    invoke-virtual {v9, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    const-string v0, "extra_delete_reason"

    const/16 v1, 0x15

    invoke-virtual {v9, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v7

    const-string v0, "extra_album_ids"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v14

    move-object v6, v8

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->deleteAlbum(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JILjava/util/ArrayList;I)[J

    const-string v0, "ids"

    invoke-static {v8}, Lcom/miui/gallery/util/MiscUtil;->ListToArray(Ljava/util/List;)[J

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    :goto_8
    move-object/from16 v8, p0

    goto/16 :goto_15

    :cond_e
    move-object/from16 v9, p5

    const-string v1, "delete"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v5, 0x2

    const/4 v7, 0x0

    if-eqz v1, :cond_13

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    const-string v0, "delete_by"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    const-string v1, "extra_delete_options"

    const/4 v3, 0x0

    invoke-virtual {v9, v1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v6

    const-string v1, "extra_delete_reason"

    const/16 v3, 0x18

    invoke-virtual {v9, v1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v8

    if-nez v0, :cond_f

    const-string v0, "extra_dup_type"

    invoke-virtual {v9, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    const-string v0, "extra_ids"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v14

    move-object v7, v10

    invoke-static/range {v0 .. v8}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->deleteById(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JIILjava/util/ArrayList;I)[J

    move-result-object v7

    const-string v0, "ids"

    invoke-static {v10}, Lcom/miui/gallery/util/MiscUtil;->ListToArray(Ljava/util/List;)[J

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    goto :goto_9

    :cond_f
    if-ne v0, v12, :cond_10

    const-string v0, "extra_paths"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v14

    move v5, v6

    move-object v6, v10

    move v7, v8

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->deleteByPath(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[Ljava/lang/String;ILjava/util/ArrayList;I)[J

    move-result-object v7

    const-string v0, "ids"

    invoke-static {v10}, Lcom/miui/gallery/util/MiscUtil;->ListToArray(Ljava/util/List;)[J

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    goto :goto_9

    :cond_10
    if-ne v0, v5, :cond_11

    const-string v0, "extra_sha1s"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    const-string v0, "extra_keep_dup"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v14

    move v6, v8

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->deleteBySha1(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[Ljava/lang/String;ZI)[J

    move-result-object v7

    goto :goto_9

    :cond_11
    const/4 v1, 0x3

    if-ne v0, v1, :cond_12

    const-string v0, "extra_paths"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v14

    move-object v5, v10

    move v6, v8

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->deleteCloudByPath(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[Ljava/lang/String;Ljava/util/ArrayList;I)[J

    move-result-object v7

    const-string v0, "ids"

    invoke-static {v10}, Lcom/miui/gallery/util/MiscUtil;->ListToArray(Ljava/util/List;)[J

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    :cond_12
    :goto_9
    const-string v0, "count"

    invoke-static {v7}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->getValidCount([J)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v13, v0, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto/16 :goto_8

    :cond_13
    const-string v1, "create_album"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-wide/16 v10, -0x65

    if-eqz v1, :cond_15

    move-object/from16 v2, p2

    move-object/from16 v8, p0

    move-object/from16 v15, p1

    invoke-static {v8, v15, v2, v14, v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->createAlbum(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_14

    invoke-virtual {v13, v0}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    goto/16 :goto_15

    :cond_14
    const-string v0, "id"

    invoke-virtual {v13, v0, v10, v11}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto/16 :goto_15

    :cond_15
    move-object/from16 v2, p2

    move-object/from16 v8, p0

    move-object/from16 v15, p1

    const-string v1, "rename_album"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-wide/16 v16, 0x0

    if-eqz v1, :cond_17

    const-string v0, "album_id"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v14

    move-object/from16 v6, p4

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->renameAlbum(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JLjava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_16

    invoke-virtual {v13, v0}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    const-string v1, "id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    cmp-long v2, v0, v16

    if-lez v2, :cond_2a

    const-string v0, "should_request_sync"

    invoke-virtual {v13, v0, v12}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_15

    :cond_16
    const-string v0, "id"

    invoke-virtual {v13, v0, v10, v11}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto/16 :goto_15

    :cond_17
    const-string v1, "set_album_attributes"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    const-string v0, "album_id"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v7

    const-string v0, "attributes_bit"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    const-string v0, "set"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    const-string v0, "manual"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object v2, v7

    move-wide v3, v10

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->setAlbumAttributes(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;[JJZZ)V

    array-length v0, v7

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_2a

    aget-wide v2, v7, v1

    invoke-static {v2, v3}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result v2

    if-nez v2, :cond_19

    invoke-static {}, Lcom/miui/gallery/provider/AlbumManager;->getAlbumSyncAttributes()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_2a

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    const-wide/16 v0, 0x1

    cmp-long v2, v10, v0

    if-nez v2, :cond_18

    const-string v0, "should_request_sync"

    const-string v1, "set"

    invoke-virtual {v9, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v13, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_15

    :cond_18
    const-string v0, "should_request_sync"

    invoke-virtual {v13, v0, v12}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_15

    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1a
    const-string v1, "force_top"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    const-string v0, "album_id"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v0

    invoke-static {v8, v15, v2, v0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->forceTop(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;[J)V

    goto/16 :goto_15

    :cond_1b
    const-string v1, "unforce_top"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    const-string v0, "album_id"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v0

    invoke-static {v8, v15, v2, v0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->unforceTop(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;[J)V

    goto/16 :goto_15

    :cond_1c
    const-string v1, "add_remove_secret"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_25

    const-string v0, "operation_type"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v12, :cond_23

    const-string v0, "extra_src_media_ids"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v6

    if-nez v6, :cond_1e

    const-string v0, "extra_src_uris"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_20

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [J

    const/4 v3, 0x0

    :goto_b
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_1d

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/Uri;

    invoke-static {v8, v15, v2, v14, v4}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->addToSecret(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;Landroid/net/Uri;)J

    move-result-wide v4

    aput-wide v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    :cond_1d
    const-string v0, "ids"

    invoke-virtual {v13, v0, v1}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    move-object v6, v1

    goto :goto_d

    :cond_1e
    const/4 v7, 0x0

    :goto_c
    array-length v0, v6

    if-ge v7, v0, :cond_1f

    aget-wide v4, v6, v7

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v14

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->addToSecret(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;J)J

    move-result-wide v0

    aput-wide v0, v6, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_c

    :cond_1f
    const-string v0, "ids"

    invoke-virtual {v13, v0, v6}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    :cond_20
    :goto_d
    array-length v0, v6

    const/4 v1, 0x0

    :goto_e
    if-ge v1, v0, :cond_22

    aget-wide v2, v6, v1

    cmp-long v4, v2, v16

    if-lez v4, :cond_21

    const/4 v0, 0x1

    goto :goto_f

    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    :cond_22
    const/4 v0, 0x0

    :goto_f
    const-string v1, "should_request_sync"

    invoke-virtual {v13, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_15

    :cond_23
    if-ne v0, v5, :cond_2a

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/miui/gallery/util/Numbers;->parse(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    const-string v0, "extra_src_media_ids"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v6

    if-eqz v6, :cond_2a

    const/4 v7, 0x0

    :goto_10
    array-length v0, v6

    if-ge v7, v0, :cond_24

    aget-wide v16, v6, v7

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v14

    move-wide v4, v10

    move-object v12, v6

    move/from16 v18, v7

    move-wide/from16 v6, v16

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->removeFromSecret(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JJ)J

    move-result-wide v0

    aput-wide v0, v12, v18

    add-int/lit8 v7, v18, 0x1

    move-object v6, v12

    const/4 v12, 0x1

    goto :goto_10

    :cond_24
    move-object v12, v6

    const-string v0, "ids"

    invoke-virtual {v13, v0, v12}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    goto/16 :goto_15

    :cond_25
    const-string v1, "add_remove_favorite"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_28

    const-string v0, "add_remove_by"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    const-string v1, "operation_type"

    invoke-virtual {v9, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v10

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_14

    :pswitch_0
    const-string v0, "extra_src_paths"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_26

    array-length v0, v6

    new-array v7, v0, [J

    const/4 v11, 0x0

    :goto_11
    array-length v0, v6

    if-ge v11, v0, :cond_26

    aget-object v4, v6, v11

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v14

    move v5, v10

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->addRemoveFavoritesByPath(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;Ljava/lang/String;I)J

    move-result-wide v0

    aput-wide v0, v7, v11

    add-int/lit8 v11, v11, 0x1

    goto :goto_11

    :pswitch_1
    const-string v0, "extra_src_sha1"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_27

    array-length v0, v6

    new-array v7, v0, [J

    const/4 v11, 0x0

    :goto_12
    array-length v0, v6

    if-ge v11, v0, :cond_27

    aget-object v4, v6, v11

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v14

    move v5, v10

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->addRemoveFavoritesSha1(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;Ljava/lang/String;I)J

    move-result-wide v0

    aput-wide v0, v7, v11

    add-int/lit8 v11, v11, 0x1

    goto :goto_12

    :cond_26
    :pswitch_2
    const-string v0, "extra_src_media_ids"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v11

    if-eqz v11, :cond_27

    array-length v0, v11

    new-array v7, v0, [J

    const/4 v12, 0x0

    :goto_13
    array-length v0, v11

    if-ge v12, v0, :cond_27

    aget-wide v4, v11, v12

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v14

    move v6, v10

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->addRemoveFavoritesById(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JI)J

    move-result-wide v0

    aput-wide v0, v7, v12

    add-int/lit8 v12, v12, 0x1

    goto :goto_13

    :cond_27
    :goto_14
    const-string v0, "ids"

    invoke-virtual {v13, v0, v7}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    goto :goto_15

    :cond_28
    const-string v1, "rename"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    const-string v0, "src_cloud_id"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v14

    move-wide/from16 v23, v4

    move-object/from16 v6, p4

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->rename(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JLjava/lang/String;)J

    move-result-wide v0

    cmp-long v2, v0, v16

    if-lez v2, :cond_29

    const-string v0, "id"

    move-wide/from16 v1, v23

    invoke-virtual {v13, v0, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto :goto_15

    :cond_29
    const-string v0, "id"

    invoke-virtual {v13, v0, v10, v11}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    :cond_2a
    :goto_15
    invoke-virtual {v14}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2d

    if-eqz v9, :cond_2b

    const-string v0, "should_operate_sync"

    const/4 v12, 0x0

    invoke-virtual {v9, v0, v12}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2c

    const/4 v12, 0x1

    goto :goto_16

    :cond_2b
    const/4 v12, 0x0

    :cond_2c
    :goto_16
    invoke-static {v8, v12, v14}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->startUpdater(Landroid/content/Context;ZLjava/util/ArrayList;)V

    :cond_2d
    return-object v13

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static canHandle(Ljava/lang/String;)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->METHODS:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static cloudDelete(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JLjava/util/ArrayList;I)[J
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;[J",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;I)[J"
        }
    .end annotation

    new-instance v6, Lcom/miui/gallery/provider/cloudmanager/DeleteOwner;

    const/4 v4, 0x1

    move-object v0, v6

    move-object v1, p0

    move-object v2, p3

    move-object v3, p4

    move v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/provider/cloudmanager/DeleteOwner;-><init>(Landroid/content/Context;Ljava/util/ArrayList;[JZI)V

    invoke-virtual {v6, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/DeleteOwner;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)[J

    move-result-object p0

    if-eqz p5, :cond_0

    invoke-virtual {p5, p3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_0
    return-object p0
.end method

.method private static copy(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JJI)J
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;JJI)J"
        }
    .end annotation

    move-object v0, p1

    move-object v1, p2

    const/4 v2, 0x2

    :try_start_0
    new-array v2, v2, [J

    const/4 v3, 0x0

    aput-wide p4, v2, v3

    const/4 v3, 0x1

    aput-wide p6, v2, v3

    invoke-static {v2}, Lcom/miui/gallery/util/Numbers;->ensurePositive([J)V

    const/4 v2, -0x1

    move/from16 v3, p8

    if-eq v3, v2, :cond_0

    new-instance v2, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupCopy;

    move-object v4, v2

    move-object v5, p0

    move-object v6, p3

    move-wide/from16 v7, p4

    move-wide/from16 v9, p6

    move/from16 v11, p8

    invoke-direct/range {v4 .. v11}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupCopy;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JJI)V

    invoke-virtual {v2, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupCopy;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v0

    return-wide v0

    :cond_0
    new-instance v2, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;

    move-object v4, v2

    move-object v5, p0

    move-object v6, p3

    move-wide/from16 v7, p6

    move-wide/from16 v9, p4

    invoke-direct/range {v4 .. v10}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JJ)V

    invoke-virtual {v2, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    move-exception v0

    const-string v1, "CloudManager"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    const-wide/16 v0, -0x64

    return-wide v0
.end method

.method private static copyByUri(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JLandroid/net/Uri;)J
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;J",
            "Landroid/net/Uri;",
            ")J"
        }
    .end annotation

    :try_start_0
    new-instance v6, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p3

    move-object v3, p6

    move-wide v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Landroid/net/Uri;J)V

    invoke-virtual {v6, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p0

    :catch_0
    const-wide/16 p0, -0x64

    return-wide p0
.end method

.method private static copyOf([Ljava/lang/String;Landroid/database/Cursor;)Landroid/content/ContentValues;
    .locals 5

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    new-instance p0, Landroid/content/ContentValues;

    invoke-direct {p0}, Landroid/content/ContentValues;-><init>()V

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->getColumnCount()I

    move-result v2

    if-ge v1, v2, :cond_4

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    goto/16 :goto_1

    :cond_0
    const-string v3, "babyInfoJson"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "CloudManager"

    const-string v4, "catch column(%s), remove local_flag "

    invoke-static {v3, v4, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :try_start_0
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "localFlag"

    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "localFlag"

    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    :cond_1
    const-string v2, "babyInfoJson"

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    :cond_2
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getType(I)I

    move-result v3

    packed-switch v3, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    goto :goto_1

    :pswitch_1
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :pswitch_2
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    goto :goto_1

    :pswitch_3
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_1

    :pswitch_4
    invoke-virtual {p0, v2}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    :cond_3
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_4
    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static createAlbum(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Landroid/os/Bundle;"
        }
    .end annotation

    new-instance v0, Landroid/os/Bundle;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/os/Bundle;-><init>(I)V

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-wide/16 p0, -0x64

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CreateAlbum;

    invoke-direct {v1, p0, p3, p4}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CreateAlbum;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)V

    invoke-virtual {v1, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CreateAlbum;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide p2

    const-wide/16 v2, -0x67

    cmp-long p0, p2, v2

    if-eqz p0, :cond_1

    const-wide/16 v2, -0x69

    cmp-long p0, p2, v2

    if-nez p0, :cond_2

    :cond_1
    invoke-virtual {v1, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CreateAlbum;->getConflictAlbumId(Landroid/database/sqlite/SQLiteDatabase;)J

    move-result-wide p0

    const-wide/16 v1, 0x0

    cmp-long p4, p0, v1

    if-ltz p4, :cond_2

    const-string p4, "conflict_album_id"

    invoke-virtual {v0, p4, p0, p1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    :cond_2
    move-wide p0, p2

    :goto_0
    const-string p2, "id"

    invoke-virtual {v0, p2, p0, p1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    return-object v0
.end method

.method static createDeleteRecord(ILandroid/database/Cursor;Ljava/lang/String;)Lcom/miui/gallery/util/deleterecorder/DeleteRecord;
    .locals 2

    if-eqz p1, :cond_1

    const/4 v0, 0x7

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v0, 0x8

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    new-instance p1, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    invoke-direct {p1, p0, v0, p2}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    return-object p1

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private static delete(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JI)[J
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;[JI)[J"
        }
    .end annotation

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v7, p5

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->delete(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JILjava/util/ArrayList;I)[J

    move-result-object p0

    return-object p0
.end method

.method private static delete(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JILjava/util/ArrayList;I)[J
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;[JI",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;I)[J"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    move-object/from16 v10, p6

    const/4 v2, 0x1

    move/from16 v3, p5

    if-ne v3, v2, :cond_2

    const-string v3, "deleteLocal{%s}"

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->getId()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    const-string v3, "count{%s}"

    new-array v2, v2, [Ljava/lang/Object;

    array-length v4, v9

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v6

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v11, v2}, Lcom/miui/gallery/util/logger/TimingTracing;->beginTracing(Ljava/lang/String;Ljava/lang/String;)V

    array-length v2, v9

    new-array v12, v2, [J

    const/4 v13, 0x0

    :goto_0
    array-length v2, v9

    if-ge v13, v2, :cond_1

    new-instance v14, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;

    aget-wide v5, v9, v13

    move-object v2, v14

    move-object v3, p0

    move-object/from16 v4, p3

    move/from16 v7, p7

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JI)V

    invoke-virtual {v14, v0, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v2

    aput-wide v2, v12, v13

    aget-wide v2, v12, v13

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_0

    if-eqz v10, :cond_0

    aget-wide v2, v9, v13

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    invoke-static {v11, v0}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    return-object v12

    :cond_2
    new-instance v2, Lcom/miui/gallery/provider/cloudmanager/Delete;

    move-object v3, p0

    move/from16 v4, p7

    invoke-direct {v2, p0, v8, v9, v4}, Lcom/miui/gallery/provider/cloudmanager/Delete;-><init>(Landroid/content/Context;Ljava/util/ArrayList;[JI)V

    invoke-virtual {v2, v0, v1}, Lcom/miui/gallery/provider/cloudmanager/Delete;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)[J

    move-result-object v0

    if-eqz v10, :cond_3

    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_3
    return-object v0
.end method

.method private static deleteAlbum(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JILjava/util/ArrayList;I)[J
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;[JI",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;I)[J"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    const/4 v3, 0x0

    const/4 v4, 0x1

    :try_start_0
    invoke-static/range {p4 .. p4}, Lcom/miui/gallery/util/Numbers;->ensurePositive([J)V

    array-length v5, v2

    new-array v5, v5, [J

    const/4 v6, 0x0

    :goto_0
    array-length v7, v2

    if-ge v6, v7, :cond_2

    move/from16 v7, p5

    if-ne v7, v4, :cond_0

    new-instance v14, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;

    aget-wide v11, v2, v6

    move-object v8, v14

    move-object/from16 v9, p0

    move-object/from16 v10, p3

    move/from16 v13, p7

    invoke-direct/range {v8 .. v13}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JI)V

    invoke-virtual {v14, v0, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v8

    aput-wide v8, v5, v6

    goto :goto_1

    :cond_0
    new-instance v8, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;

    aget-wide v13, v2, v6

    move-object v10, v8

    move-object/from16 v11, p0

    move-object/from16 v12, p3

    move/from16 v15, p7

    invoke-direct/range {v10 .. v15}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JI)V

    invoke-virtual {v8, v0, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v8

    aput-wide v8, v5, v6

    :goto_1
    aget-wide v8, v5, v6

    const-wide/16 v10, 0x0

    cmp-long v12, v8, v10

    if-lez v12, :cond_1

    aget-wide v8, v2, v6

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    move-object/from16 v9, p6

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :cond_1
    move-object/from16 v9, p6

    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_2
    return-object v5

    :catch_0
    move-exception v0

    const-string v1, "CloudManager"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-array v0, v4, [J

    const-wide/16 v1, -0x64

    aput-wide v1, v0, v3

    return-object v0
.end method

.method private static deleteById(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JIILjava/util/ArrayList;I)[J
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;[JII",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;I)[J"
        }
    .end annotation

    :try_start_0
    invoke-static {p4}, Lcom/miui/gallery/util/Numbers;->ensurePositive([J)V

    const/4 v0, -0x1

    move v1, p5

    if-eq v1, v0, :cond_0

    invoke-static/range {p0 .. p8}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->dupDelete(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JIILjava/util/ArrayList;I)[J

    move-result-object v0

    return-object v0

    :cond_0
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p6

    move-object v6, p7

    move/from16 v7, p8

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->delete(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JILjava/util/ArrayList;I)[J

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "CloudManager"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x1

    new-array v0, v0, [J

    const/4 v1, 0x0

    const-wide/16 v2, -0x64

    aput-wide v2, v0, v1

    return-object v0
.end method

.method private static deleteByPath(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[Ljava/lang/String;ILjava/util/ArrayList;I)[J
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;[",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;I)[J"
        }
    .end annotation

    move-object/from16 v0, p4

    const/4 v1, 0x0

    :try_start_0
    array-length v2, v0

    new-array v2, v2, [J

    const/4 v3, 0x0

    :goto_0
    array-length v4, v0

    if-ge v3, v4, :cond_0

    new-instance v4, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;

    aget-object v8, v0, v3

    move-object v5, v4

    move-object v6, p0

    move-object v7, p3

    move/from16 v9, p5

    move-object/from16 v10, p6

    move/from16 v11, p7

    invoke-direct/range {v5 .. v11}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;ILjava/util/ArrayList;I)V

    move-object v5, p1

    move-object v6, p2

    invoke-virtual {v4, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v7

    aput-wide v7, v2, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-object v2

    :catch_0
    move-exception v0

    const-string v2, "CloudManager"

    invoke-static {v2, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x1

    new-array v0, v0, [J

    const-wide/16 v2, -0x64

    aput-wide v2, v0, v1

    return-object v0
.end method

.method private static deleteBySha1(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[Ljava/lang/String;ZI)[J
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;[",
            "Ljava/lang/String;",
            "ZI)[J"
        }
    .end annotation

    move-object v0, p4

    const/4 v1, 0x0

    :try_start_0
    array-length v2, v0

    new-array v2, v2, [J

    const/4 v3, 0x0

    :goto_0
    array-length v4, v0

    if-ge v3, v4, :cond_0

    new-instance v4, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;

    aget-object v8, v0, v3

    move-object v5, v4

    move-object v6, p0

    move-object v7, p3

    move/from16 v9, p5

    move/from16 v10, p6

    invoke-direct/range {v5 .. v10}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;ZI)V

    move-object v5, p1

    move-object v6, p2

    invoke-virtual {v4, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v7

    aput-wide v7, v2, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-object v2

    :catch_0
    move-exception v0

    const-string v2, "CloudManager"

    invoke-static {v2, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x1

    new-array v0, v0, [J

    const-wide/16 v2, -0x64

    aput-wide v2, v0, v1

    return-object v0
.end method

.method private static deleteCloudByPath(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[Ljava/lang/String;Ljava/util/ArrayList;I)[J
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;[",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;I)[J"
        }
    .end annotation

    move-object v0, p4

    const/4 v1, 0x0

    :try_start_0
    array-length v2, v0

    new-array v2, v2, [J

    const/4 v3, 0x0

    :goto_0
    array-length v4, v0

    if-ge v3, v4, :cond_0

    new-instance v4, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;

    aget-object v8, v0, v3

    move-object v5, v4

    move-object v6, p0

    move-object v7, p3

    move-object/from16 v9, p5

    move/from16 v10, p6

    invoke-direct/range {v5 .. v10}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;I)V

    move-object v5, p1

    move-object v6, p2

    invoke-virtual {v4, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v7

    aput-wide v7, v2, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-object v2

    :catch_0
    move-exception v0

    const-string v2, "CloudManager"

    invoke-static {v2, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x1

    new-array v0, v0, [J

    const-wide/16 v2, -0x64

    aput-wide v2, v0, v1

    return-object v0
.end method

.method private static desensitization(Landroid/content/ContentValues;)Landroid/content/ContentValues;
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0, p0}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    const-string p0, "address"

    invoke-virtual {v0, p0}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    const-string p0, "exifGPSLatitude"

    invoke-virtual {v0, p0}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    const-string p0, "exifGPSLongitude"

    invoke-virtual {v0, p0}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    const-string p0, "extraGPS"

    invoke-virtual {v0, p0}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    const-string p0, "location"

    invoke-virtual {v0, p0}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    return-object v0
.end method

.method private static dupDelete(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JIILjava/util/ArrayList;I)[J
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;[JII",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;I)[J"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v5, p4

    move-object/from16 v8, p7

    const/4 v2, 0x1

    move/from16 v3, p6

    if-ne v3, v2, :cond_2

    const-string v3, "dupDeleteLocal{%s}"

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "count{%s}"

    new-array v2, v2, [Ljava/lang/Object;

    array-length v6, v5

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v2, v7

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/miui/gallery/util/logger/TimingTracing;->beginTracing(Ljava/lang/String;Ljava/lang/String;)V

    array-length v2, v5

    new-array v2, v2, [J

    :goto_0
    array-length v4, v5

    if-ge v7, v4, :cond_1

    new-instance v4, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;

    aget-wide v12, v5, v7

    move-object v9, v4

    move-object/from16 v10, p0

    move-object/from16 v11, p3

    move/from16 v14, p5

    move/from16 v15, p8

    invoke-direct/range {v9 .. v15}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JII)V

    invoke-virtual {v4, v0, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v9

    aput-wide v9, v2, v7

    aget-wide v9, v2, v7

    const-wide/16 v11, 0x0

    cmp-long v4, v9, v11

    if-lez v4, :cond_0

    if-eqz v8, :cond_0

    aget-wide v9, v5, v7

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    invoke-static {v3, v0}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    return-object v2

    :cond_2
    new-instance v9, Lcom/miui/gallery/provider/cloudmanager/DupDelete;

    move-object v2, v9

    move-object/from16 v3, p0

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p8

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/provider/cloudmanager/DupDelete;-><init>(Landroid/content/Context;Ljava/util/ArrayList;[JII)V

    invoke-virtual {v9, v0, v1}, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)[J

    move-result-object v0

    if-eqz v8, :cond_3

    move-object/from16 v1, p3

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_3
    return-object v0
.end method

.method private static forceTop(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;JLcom/miui/gallery/provider/cache/MediaManager;Z)V
    .locals 17

    move-object/from16 v0, p1

    move-wide/from16 v1, p2

    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-wide/32 v4, 0x7ffffffa

    const-wide/32 v6, 0x7ffffffc

    const-wide/32 v8, 0x7ffffffd

    const-wide/32 v10, 0x7ffffffe

    const-wide/32 v12, 0x7fffffff

    if-eqz p5, :cond_2

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Album;->getNextForceTopTime()J

    move-result-wide v14

    cmp-long v16, v1, v12

    if-eqz v16, :cond_1

    cmp-long v12, v1, v10

    if-eqz v12, :cond_1

    cmp-long v10, v1, v8

    if-eqz v10, :cond_1

    cmp-long v8, v1, v6

    if-eqz v8, :cond_1

    cmp-long v6, v1, v4

    if-nez v6, :cond_0

    goto :goto_0

    :cond_0
    const-string v4, "sortBy"

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_2

    :cond_1
    :goto_0
    invoke-static {v1, v2, v14, v15}, Lcom/miui/gallery/preference/GalleryPreferences$Album;->setVirtualAlbumSortBy(JJ)V

    return-void

    :cond_2
    cmp-long v14, v1, v12

    if-nez v14, :cond_3

    const-wide/16 v3, -0x3e6

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/preference/GalleryPreferences$Album;->setVirtualAlbumSortBy(JJ)V

    return-void

    :cond_3
    cmp-long v12, v1, v10

    if-nez v12, :cond_4

    const-wide/16 v3, -0x3e5

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/preference/GalleryPreferences$Album;->setVirtualAlbumSortBy(JJ)V

    return-void

    :cond_4
    cmp-long v10, v1, v8

    if-nez v10, :cond_5

    const-wide/16 v3, -0x3e2

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/preference/GalleryPreferences$Album;->setVirtualAlbumSortBy(JJ)V

    return-void

    :cond_5
    cmp-long v8, v1, v6

    if-nez v8, :cond_6

    const-wide/16 v3, -0x3e9

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/preference/GalleryPreferences$Album;->setVirtualAlbumSortBy(JJ)V

    return-void

    :cond_6
    cmp-long v6, v1, v4

    if-nez v6, :cond_7

    const-wide/16 v3, -0x3e8

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/preference/GalleryPreferences$Album;->setVirtualAlbumSortBy(JJ)V

    return-void

    :cond_7
    const-wide/16 v4, 0x1

    cmp-long v6, v1, v4

    const-wide/16 v4, 0x0

    if-nez v6, :cond_8

    const-wide/16 v6, -0x3e7

    goto :goto_1

    :cond_8
    const-wide/16 v6, 0x2

    cmp-long v8, v1, v6

    if-nez v8, :cond_9

    const-wide/16 v6, -0x3e3

    goto :goto_1

    :cond_9
    move-wide v6, v4

    :goto_1
    cmp-long v8, v6, v4

    if-nez v8, :cond_a

    const-string v4, "sortBy"

    invoke-virtual {v3, v4}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    goto :goto_2

    :cond_a
    const-string v4, "sortBy"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :goto_2
    invoke-static/range {p2 .. p3}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v4, :cond_b

    invoke-static/range {p2 .. p3}, Lcom/miui/gallery/provider/ShareAlbumManager;->getOriginalAlbumId(J)J

    move-result-wide v1

    const-string v4, "shareAlbum"

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "%s = ?"

    new-array v9, v6, [Ljava/lang/Object;

    const-string v10, "_id"

    aput-object v10, v9, v5

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    new-array v6, v6, [Ljava/lang/String;

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v6, v5

    invoke-virtual {v0, v4, v3, v7, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_3

    :cond_b
    const-string v4, "cloud"

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "%s = ?"

    new-array v9, v6, [Ljava/lang/Object;

    const-string v10, "_id"

    aput-object v10, v9, v5

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    new-array v6, v6, [Ljava/lang/String;

    invoke-static/range {p2 .. p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v6, v5

    invoke-virtual {v0, v4, v3, v7, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :goto_3
    return-void
.end method

.method private static forceTop(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;[J)V
    .locals 7

    array-length v0, p3

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_0

    aget-wide v3, p3, v0

    const/4 v6, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v5, p2

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->forceTop(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;JLcom/miui/gallery/provider/cache/MediaManager;Z)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method static genRelativePath(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 0

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getShareFolderRelativePathInCloud()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-static {p0}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getFolderRelativePathInCloud(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static varargs getValidCount([J)I
    .locals 9

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    array-length v1, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-wide v4, p0, v2

    const-wide/16 v6, 0x0

    cmp-long v8, v4, v6

    if-lez v8, :cond_0

    const/4 v4, 0x1

    goto :goto_1

    :cond_0
    const/4 v4, 0x0

    :goto_1
    add-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    move v0, v3

    :cond_2
    return v0
.end method

.method private static isSystemAlbum(J)Z
    .locals 3

    const-wide/16 v0, 0x1

    cmp-long v2, p0, v0

    if-eqz v2, :cond_1

    const-wide/16 v0, 0x2

    cmp-long v2, p0, v0

    if-eqz v2, :cond_1

    const-wide/16 v0, 0x4

    cmp-long v2, p0, v0

    if-eqz v2, :cond_1

    const-wide/16 v0, 0x3

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

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

.method private static isVirtualAlbum(J)Z
    .locals 7

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->ALL_VIRTUAL_ALBUM_IDS:[I

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget v4, v0, v3

    int-to-long v4, v4

    cmp-long v6, p0, v4

    if-nez v6, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method private static move(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JJI)J
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;JJI)J"
        }
    .end annotation

    move-object v0, p1

    move-object v1, p2

    const/4 v2, 0x2

    :try_start_0
    new-array v2, v2, [J

    const/4 v3, 0x0

    aput-wide p4, v2, v3

    const/4 v3, 0x1

    aput-wide p6, v2, v3

    invoke-static {v2}, Lcom/miui/gallery/util/Numbers;->ensurePositive([J)V

    const/4 v2, -0x1

    move/from16 v3, p8

    if-eq v3, v2, :cond_0

    new-instance v2, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;

    move-object v4, v2

    move-object v5, p0

    move-object v6, p3

    move-wide/from16 v7, p4

    move-wide/from16 v9, p6

    move/from16 v11, p8

    invoke-direct/range {v4 .. v11}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JJI)V

    invoke-virtual {v2, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v0

    return-wide v0

    :cond_0
    new-instance v2, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;

    move-object v4, v2

    move-object v5, p0

    move-object v6, p3

    move-wide/from16 v7, p6

    move-wide/from16 v9, p4

    invoke-direct/range {v4 .. v10}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JJ)V

    invoke-virtual {v2, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    const-wide/16 v0, -0x64

    return-wide v0
.end method

.method private static moveByUri(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JLandroid/net/Uri;)J
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;J",
            "Landroid/net/Uri;",
            ")J"
        }
    .end annotation

    :try_start_0
    new-instance v6, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MoveByUri;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p3

    move-object v3, p6

    move-wide v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MoveByUri;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Landroid/net/Uri;J)V

    invoke-virtual {v6, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MoveByUri;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p0

    :catch_0
    const-wide/16 p0, -0x64

    return-wide p0
.end method

.method public static queryCloudItemByFilePath(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 13

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_5

    invoke-static {p2}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v0, :cond_4

    :try_start_0
    invoke-static {p2}, Lcom/miui/gallery/util/ExifUtil;->getUserCommentData(Ljava/lang/String;)Lcom/miui/gallery/util/ExifUtil$UserCommentData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/util/ExifUtil$UserCommentData;->getSha1()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    invoke-static {p2}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string p0, "CloudManager"

    const-string p1, "Could\'t get album path for %s"

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1

    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v6, "cloud"

    sget-object v7, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->QUERY_BY_PATH_PROJECTION:[Ljava/lang/String;

    const-string v8, "fileName LIKE ? AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND localGroupId IN (SELECT _id FROM cloud WHERE localFile LIKE ?)"

    new-array v9, v3, [Ljava/lang/String;

    invoke-static {p2}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    aput-object p2, v9, v2

    aput-object p0, v9, v4

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v5, p1

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0

    :cond_2
    new-instance p2, Landroid/os/Bundle;

    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    const-string v1, "is_thumbnail"

    invoke-virtual {p2, v1, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v6, "cloud"

    sget-object v7, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->QUERY_BY_PATH_PROJECTION:[Ljava/lang/String;

    const-string v8, "sha1=? AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND localGroupId IN (SELECT _id FROM cloud WHERE localFile LIKE ?)"

    new-array v9, v3, [Ljava/lang/String;

    aput-object v0, v9, v2

    aput-object p0, v9, v4

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v5, p1

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    instance-of p1, p0, Landroid/database/AbstractCursor;

    if-eqz p1, :cond_3

    move-object p1, p0

    check-cast p1, Landroid/database/AbstractCursor;

    invoke-virtual {p1, p2}, Landroid/database/AbstractCursor;->setExtras(Landroid/os/Bundle;)V

    :cond_3
    return-object p0

    :catch_0
    move-exception p0

    const-string p1, "CloudManager"

    const-string p2, "exif exifSha1 read fail %s"

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1

    :cond_4
    const-string p0, "cloud"

    sget-object v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->QUERY_BY_PATH_PROJECTION:[Ljava/lang/String;

    const-string v5, "(localFile LIKE ? or thumbnailFile LIKE ?) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    new-array v6, v3, [Ljava/lang/String;

    aput-object p2, v6, v2

    aput-object p2, v6, v4

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v2, p1

    move-object v3, p0

    move-object v4, v0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0

    :cond_5
    return-object v1
.end method

.method private static removeFromSecret(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JJ)J
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;JJ)J"
        }
    .end annotation

    :try_start_0
    new-instance v7, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p3

    move-wide v3, p6

    move-wide v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JJ)V

    invoke-virtual {v7, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p0

    :catch_0
    const-string p0, "CloudManager"

    const-string p1, "remove from secret error %d"

    invoke-static {p6, p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-wide/16 p0, -0x64

    return-wide p0
.end method

.method private static rename(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JLjava/lang/String;)J
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;J",
            "Ljava/lang/String;",
            ")J"
        }
    .end annotation

    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-wide/16 v1, -0x64

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Rename;

    move-object v3, v0

    move-object v4, p0

    move-object v5, p3

    move-wide v6, p4

    move-object v8, p6

    invoke-direct/range {v3 .. v8}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Rename;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JLjava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Rename;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-wide v1, p0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "CloudManager"

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-wide v1
.end method

.method private static renameAlbum(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;JLjava/lang/String;)Landroid/os/Bundle;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;J",
            "Ljava/lang/String;",
            ")",
            "Landroid/os/Bundle;"
        }
    .end annotation

    move-object v0, p1

    new-instance v1, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Landroid/os/Bundle;-><init>(I)V

    invoke-static/range {p6 .. p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const-wide/16 v3, -0x64

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x1

    :try_start_0
    new-array v2, v2, [J

    const/4 v5, 0x0

    aput-wide p4, v2, v5

    invoke-static {v2}, Lcom/miui/gallery/util/Numbers;->ensurePositive([J)V

    new-instance v2, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RenameAlbum;

    move-object v6, v2

    move-object v7, p0

    move-object v8, p3

    move-wide/from16 v9, p4

    move-object/from16 v11, p6

    invoke-direct/range {v6 .. v11}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RenameAlbum;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JLjava/lang/String;)V

    move-object v5, p2

    invoke-virtual {v2, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RenameAlbum;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v5

    const-wide/16 v7, -0x67

    cmp-long v9, v5, v7

    if-eqz v9, :cond_1

    const-wide/16 v7, -0x69

    cmp-long v9, v5, v7

    if-nez v9, :cond_2

    :cond_1
    invoke-virtual {v2, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RenameAlbum;->getConflictAlbumId(Landroid/database/sqlite/SQLiteDatabase;)J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v0, v7, v9

    if-ltz v0, :cond_2

    const-string v0, "conflict_album_id"

    invoke-virtual {v1, v0, v7, v8}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    move-wide v3, v5

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v2, "CloudManager"

    invoke-static {v2, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    const-string v0, "id"

    invoke-virtual {v1, v0, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    return-object v1
.end method

.method private static setAlbumAttributes(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;[JJZZ)V
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static/range {p3 .. p6}, Lcom/miui/gallery/provider/AlbumManager;->packageAttributeBit(JZZ)J

    move-result-wide v2

    const/4 v4, 0x1

    move-wide/from16 v12, p3

    invoke-static {v12, v13, v4, v4}, Lcom/miui/gallery/provider/AlbumManager;->packageAttributeBit(JZZ)J

    move-result-wide v14

    array-length v11, v1

    const/16 v16, 0x0

    const/4 v10, 0x0

    :goto_0
    if-ge v10, v11, :cond_2

    aget-wide v6, v1, v10

    invoke-static {v6, v7}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result v5

    const/16 v17, 0x3

    const/16 v18, 0x2

    const/4 v8, 0x7

    const/16 v19, 0x6

    if-eqz v5, :cond_0

    invoke-static {v6, v7}, Lcom/miui/gallery/provider/ShareAlbumManager;->getOriginalAlbumId(J)J

    move-result-wide v5

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "UPDATE %s SET %s = (%s & ~%d) | %d WHERE %s = %s"

    new-array v8, v8, [Ljava/lang/Object;

    const-string v20, "shareAlbum"

    aput-object v20, v8, v16

    const-string v20, "attributes"

    aput-object v20, v8, v4

    const-string v20, "attributes"

    aput-object v20, v8, v18

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v8, v17

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    const/16 v18, 0x4

    aput-object v17, v8, v18

    const-string v17, "_id"

    const/16 v18, 0x5

    aput-object v17, v8, v18

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v8, v19

    invoke-static {v7, v9, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    move v4, v10

    move/from16 v17, v11

    const/16 v21, 0x1

    goto/16 :goto_1

    :cond_0
    const-string v5, ""

    invoke-static {}, Lcom/miui/gallery/provider/AlbumManager;->getAlbumSyncAttributes()Ljava/util/List;

    move-result-object v9

    invoke-static {v9}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v20

    if-eqz v20, :cond_1

    invoke-static/range {p3 .. p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v9, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-static/range {v19 .. v19}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->transformToEditedColumnsElement(I)Ljava/lang/String;

    move-result-object v5

    :cond_1
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "UPDATE %s SET %s = (%s & ~%d) | %d, %s=coalesce(replace(%s, \'%s\', \'\') || \'%s\', \'%s\') WHERE %s IN (%s)"

    const/16 v4, 0xc

    new-array v4, v4, [Ljava/lang/Object;

    const-string v20, "cloud"

    aput-object v20, v4, v16

    const-string v20, "attributes"

    const/16 v21, 0x1

    aput-object v20, v4, v21

    const-string v20, "attributes"

    aput-object v20, v4, v18

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v4, v17

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    const/16 v18, 0x4

    aput-object v17, v4, v18

    const-string v17, "editedColumns"

    const/16 v18, 0x5

    aput-object v17, v4, v18

    const-string v17, "editedColumns"

    aput-object v17, v4, v19

    const/16 v17, 0x7

    aput-object v5, v4, v17

    const/16 v17, 0x8

    aput-object v5, v4, v17

    const/16 v17, 0x9

    aput-object v5, v4, v17

    const/16 v5, 0xa

    const-string v17, "_id"

    aput-object v17, v4, v5

    const/16 v5, 0xb

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v17

    aput-object v17, v4, v5

    invoke-static {v8, v9, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    move-object/from16 v5, p1

    move-wide/from16 v8, p3

    move v4, v10

    move/from16 v10, p5

    move/from16 v17, v11

    move/from16 v11, p6

    invoke-virtual/range {v5 .. v11}, Lcom/miui/gallery/provider/cache/MediaManager;->updateAttributes(JJZZ)V

    :goto_1
    add-int/lit8 v10, v4, 0x1

    move/from16 v11, v17

    const/4 v4, 0x1

    goto/16 :goto_0

    :cond_2
    return-void
.end method

.method private static startUpdater(Landroid/content/Context;ZLjava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Z",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->execute(Landroid/content/Context;ZLjava/util/List;)V

    return-void
.end method

.method private static unforceTop(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;[J)V
    .locals 7

    array-length v0, p3

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_0

    aget-wide v3, p3, v0

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v5, p2

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->forceTop(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;JLcom/miui/gallery/provider/cache/MediaManager;Z)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    return-void
.end method
