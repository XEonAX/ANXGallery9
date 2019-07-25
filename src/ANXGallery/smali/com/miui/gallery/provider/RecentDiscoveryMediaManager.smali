.class public Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;
.super Ljava/lang/Object;
.source "RecentDiscoveryMediaManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;,
        Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;
    }
.end annotation


# static fields
.field private static final ALIAS_MICRO_VALID:Ljava/lang/String;

.field private static final ALIAS_THUMBNAIL_VALID:Ljava/lang/String;

.field private static final COVER_ALIAS_DISPLAYABLE:Ljava/lang/String;

.field private static final SQL_ALBUM_COVER:Ljava/lang/String;

.field private static final SQL_INCLUDE_LOCAL:Ljava/lang/String;

.field private static sRecentDiscoveryMediaMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "_id"

    const-string v2, "mediaId"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "sha1"

    const-string v2, "sha1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "localGroupId"

    const-string v2, "localGroupId"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "microthumbfile"

    const-string v2, "microthumbfile"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "thumbnailFile"

    const-string v2, "thumbnailFile"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "localFile"

    const-string v2, "localFile"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "serverType"

    const-string v2, "serverType"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "title"

    const-string v2, "title"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "duration"

    const-string v2, "duration"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "description"

    const-string v2, "description"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "size"

    const-string v2, "size"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "mimeType"

    const-string v2, "mimeType"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "location"

    const-string v2, "location"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "exifGPSLatitude"

    const-string v2, "exifGPSLatitude"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "exifGPSLatitudeRef"

    const-string v2, "exifGPSLatitudeRef"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "exifGPSLongitude"

    const-string v2, "exifGPSLongitude"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "exifGPSLongitudeRef"

    const-string v2, "exifGPSLongitudeRef"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "alias_micro_thumbnail"

    sget-object v2, Lcom/miui/gallery/provider/InternalContract$RecentDiscoveredMedia;->ALIAS_MICRO_THUMBNAIL:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "alias_create_time"

    const-string v2, " CASE WHEN mixedDateTime NOT NULL THEN mixedDateTime ELSE dateTaken END "

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "alias_create_date"

    const-string v2, "STRFTIME(\'%Y%m%d\', CASE WHEN mixedDateTime NOT NULL THEN mixedDateTime ELSE dateTaken END /1000, \'unixepoch\', \'localtime\')"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "alias_sync_state"

    const-string v2, " CASE WHEN localFlag = 0  THEN 0 WHEN localFlag IN (5, 6, 9) THEN 1 ELSE 3 END "

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "secretKey"

    const-string v2, "secretKey"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "exifImageWidth"

    const-string v2, "exifImageWidth"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "exifImageLength"

    const-string v2, "exifImageLength"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "serverId"

    const-string v2, "serverId"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "serverTag"

    const-string v2, "serverTag"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "creatorId"

    const-string v2, "creatorId"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "dateAdded"

    const-string v2, "dateAdded"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "alias_julianday"

    const-string v2, "CAST(JULIANDAY(dateModified/1000, \'unixepoch\', \'localtime\', \'start of day\') AS int)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "dateModified"

    const-string v2, "dateModified"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "babyInfoJson"

    const-string v2, "babyInfoJson"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "alias_clear_thumbnail"

    sget-object v2, Lcom/miui/gallery/provider/InternalContract$RecentDiscoveredMedia;->ALIAS_CLEAR_THUMBNAIL:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "alias_is_favorite"

    const-string v2, "isFavorite"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "specialTypeFlags"

    const-string v2, "specialTypeFlags"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "alias_sort_time"

    const-string v2, "dateModified"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "exifOrientation"

    const-string v2, "exifOrientation"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    const-string v1, "burst_group_id"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/provider/InternalContract$Cloud;->ALIAS_LOCAL_MEDIA:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->SQL_INCLUDE_LOCAL:Ljava/lang/String;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "(%s NOT NULL and %s != \'\')"

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Object;

    const-string v4, "microthumbfile"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "microthumbfile"

    const/4 v6, 0x1

    aput-object v4, v3, v6

    invoke-static {v0, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->ALIAS_MICRO_VALID:Ljava/lang/String;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "(%s NOT NULL and %s != \'\')"

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "thumbnailFile"

    aput-object v3, v2, v5

    const-string v3, "thumbnailFile"

    aput-object v3, v2, v6

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->ALIAS_THUMBNAIL_VALID:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " CASE WHEN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->ALIAS_MICRO_VALID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " THEN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "microthumbfile"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "WHEN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->ALIAS_THUMBNAIL_VALID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " THEN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "thumbnailFile"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "ELSE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "localFile"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "END "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->COVER_ALIAS_DISPLAYABLE:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_id AS cover_id, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->COVER_ALIAS_DISPLAYABLE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AS "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "cover_path"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "sha1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AS "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "cover_sha1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "alias_sync_state"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AS "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "cover_sync_state"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "size"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AS "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "cover_size"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->SQL_ALBUM_COVER:Ljava/lang/String;

    return-void
.end method

.method private static addOneRowToMatrixCursor(Landroid/database/Cursor;Landroid/database/MatrixCursor;[Ljava/lang/String;)V
    .locals 4

    array-length p2, p2

    new-array v0, p2, [Ljava/lang/Object;

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p2, :cond_0

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getType(I)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v2

    aput-object v2, v0, v1

    goto :goto_1

    :pswitch_1
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    goto :goto_1

    :pswitch_2
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v0, v1

    goto :goto_1

    :pswitch_3
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v0, v1

    goto :goto_1

    :pswitch_4
    const/4 v2, 0x0

    aput-object v2, v0, v1

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1, v0}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static cleanupInvalidRecords()V
    .locals 4

    const-string v0, "DELETE FROM recentDiscoveredMedia WHERE mediaId IN  (SELECT mediaId FROM (SELECT mediaId, cloud._id AS _id, localFlag, serverStatus FROM (recentDiscoveredMedia LEFT OUTER JOIN cloud ON cloud._id = mediaId)) WHERE (localFlag IN (11, -1, 2) OR (localFlag=0 AND serverStatus<>\'custom\')) OR (_id IS NULL))"

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance()Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "RecentDiscoveryMediaManager"

    const-string v2, "Something wrong happened when cleanup recent table: %s"

    invoke-virtual {v0}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/database/SQLException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private static varargs doInsertToRecent(Landroid/content/Context;Z[Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;)V
    .locals 11

    if-eqz p0, :cond_d

    if-eqz p2, :cond_d

    array-length v0, p2

    if-gtz v0, :cond_0

    goto/16 :goto_5

    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    array-length v1, p2

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_4

    aget-object v4, p2, v3

    invoke-static {v4}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;->access$000(Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;)J

    move-result-wide v5

    const-wide/16 v7, -0x3e8

    cmp-long v9, v5, v7

    if-nez v9, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v4}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;->getThumbPath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    const-string p0, "RecentDiscoveryMediaManager"

    const-string p1, "Could\'t get album path for %s"

    invoke-virtual {v4}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;->getThumbPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_2
    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    if-nez v6, :cond_3

    new-instance v6, Ljava/util/LinkedList;

    invoke-direct {v6}, Ljava/util/LinkedList;-><init>()V

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_5
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    const-string v4, "DCIM/Camera"

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz p1, :cond_7

    if-nez v4, :cond_6

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->isAlbumInWhiteList(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    goto :goto_3

    :cond_6
    if-nez v4, :cond_5

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->recordNotInWhiteListAlbum(Ljava/lang/String;)V

    goto :goto_2

    :cond_7
    :goto_3
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-static {v3}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {p2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x3

    if-ge v4, v5, :cond_5

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;

    invoke-static {v4}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;->access$000(Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;)J

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->isMediaCanShowInMessage(J)Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;

    invoke-virtual {v4}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;->getDateModified()J

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/miui/gallery/util/GalleryDateUtils;->daysBeforeToday(J)J

    move-result-wide v6

    const-wide/16 v8, 0x1e

    cmp-long v10, v6, v8

    if-gez v10, :cond_8

    invoke-virtual {v4}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;->getThumbPath()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-lt v4, v5, :cond_8

    goto/16 :goto_2

    :cond_9
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    if-nez p1, :cond_a

    return-void

    :cond_a
    new-array v0, p1, [Landroid/content/ContentValues;

    const/4 v3, 0x0

    :goto_4
    if-ge v3, p1, :cond_b

    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    const-string v5, "mediaId"

    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;

    invoke-virtual {v6}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;->getMediaId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v5, "dateAdded"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v5, "source"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    aput-object v4, v0, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_b
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$RecentDiscoveredMedia;->URI:Landroid/net/Uri;

    invoke-virtual {p1, p2, v0}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_c

    invoke-static {}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->getInstance()Lcom/miui/gallery/discovery/DiscoveryMessageManager;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentSaveParams;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {p2, v0, v1}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentSaveParams;-><init>(ILjava/util/List;)V

    const/4 v0, 0x1

    invoke-virtual {p1, p0, v0, p2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->saveMessage(Landroid/content/Context;ILjava/lang/Object;)V

    :cond_c
    return-void

    :cond_d
    :goto_5
    return-void
.end method

.method private static generateAlbumCover(Landroid/database/sqlite/SQLiteDatabase;IZ)Landroid/os/Bundle;
    .locals 8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SELECT "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->SQL_ALBUM_COVER:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " FROM "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->getRecentDiscoveryTable(Z)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " ORDER BY "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "dateModified"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " DESC "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p0, p2, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p0, :cond_2

    :try_start_0
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    const-string v0, "cover_id"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    const-string v1, "cover_path"

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    const-string v2, "cover_sha1"

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    const-string v3, "cover_sync_state"

    invoke-interface {p0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    const-string v4, "cover_size"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_1

    new-instance v5, Lcom/miui/gallery/model/BaseAlbumCover;

    invoke-direct {v5}, Lcom/miui/gallery/model/BaseAlbumCover;-><init>()V

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    iput-wide v6, v5, Lcom/miui/gallery/model/BaseAlbumCover;->coverId:J

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/miui/gallery/model/BaseAlbumCover;->coverPath:Ljava/lang/String;

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/miui/gallery/model/BaseAlbumCover;->coverSha1:Ljava/lang/String;

    invoke-interface {p0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    iput v6, v5, Lcom/miui/gallery/model/BaseAlbumCover;->coverSyncState:I

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    iput-wide v6, v5, Lcom/miui/gallery/model/BaseAlbumCover;->coverSize:J

    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lt v5, p1, :cond_0

    :cond_1
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v0, "album_covers"

    invoke-virtual {p1, v0, p2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string p2, "album_photo_count"

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    invoke-virtual {p1, p2, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    throw p1

    :cond_2
    return-object v0
.end method

.method private static getAlbumId(Landroid/database/Cursor;)J
    .locals 2

    const-string v0, "localGroupId"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method private static getDateModified(Landroid/database/Cursor;)J
    .locals 2

    const-string v0, "dateModified"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method private static getDateModified(Landroid/database/Cursor;I)J
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->moveCursorToPosition(Landroid/database/Cursor;I)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "dateModified"

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p1

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide p0

    return-wide p0

    :cond_0
    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method private static getDaysWithinSelection(I)Ljava/lang/String;
    .locals 4

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, " AND ( CASE WHEN DATE(dateModified/1000, \'unixepoch\', \'localtime\') == DATE(\'now\', \'localtime\') THEN 0 ELSE CAST(JULIANDAY(\'now\', \'localtime\', \'start of day\') - JULIANDAY(dateModified/1000, \'unixepoch\', \'localtime\') AS int) + 1 END < %d)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getExcludeBabyAlbumSelection()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->isInLocalMode()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "AND (localGroupId in (SELECT _id FROM cloud WHERE serverType=0 AND babyInfoJson IS NULL )) "

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method private static getExcludeHiddenAlbumSelection()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->isInShowHiddenMode()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    const-string v0, " AND (localGroupId in (SELECT _id FROM cloud WHERE serverType=0 AND attributes&16=0)) "

    :goto_0
    return-object v0
.end method

.method private static getIncludeLocalSelection()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->isInLocalMode()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->SQL_INCLUDE_LOCAL:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method private static getJulianday(Landroid/database/Cursor;)I
    .locals 1

    const-string v0, "alias_julianday"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    return p0
.end method

.method private static getNotInHiddenAlbumSelection(J)Ljava/lang/String;
    .locals 4

    invoke-static {}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->isInShowHiddenMode()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, " AND (%s in (SELECT _id FROM cloud WHERE serverType=0 AND attributes&16=0))"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    aput-object p0, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const-string p0, ""

    return-object p0
.end method

.method private static getNotSecretSelection(J)Ljava/lang/String;
    .locals 3

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "(%s !=-1000)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const/4 p1, 0x0

    aput-object p0, v2, p1

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getRecentDiscoveryTable(Z)Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->sRecentDiscoveryMediaMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, ","

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " AS "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "(SELECT "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v0, " FROM ("

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "recentDiscoveredMedia"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " JOIN "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "extended_cloud"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " ON "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "extended_cloud"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "."

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "_id"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " = "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "mediaId"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " WHERE "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " AND "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "(localGroupId!=-1000)"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->getExcludeHiddenAlbumSelection()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->getIncludeLocalSelection()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->getExcludeBabyAlbumSelection()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x1e

    invoke-static {v0}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->getDaysWithinSelection(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p0, :cond_2

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, " GROUP BY "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "sha1"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_2
    const-string p0, ""

    :goto_1
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static insertItemToGroupList(JIJILjava/util/ArrayList;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JIJI",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;",
            ">;)V"
        }
    .end annotation

    move-wide v1, p0

    move/from16 v6, p5

    move-object/from16 v7, p6

    invoke-static/range {p6 .. p6}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual/range {p6 .. p6}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v3, 0x1

    sub-int/2addr v0, v3

    :goto_0
    if-ltz v0, :cond_4

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;

    iget-wide v9, v8, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->endDate:J

    sub-long/2addr v9, v1

    const-wide/32 v11, 0x2bf20

    cmp-long v13, v9, v11

    if-lez v13, :cond_2

    if-eqz v3, :cond_0

    iget-wide v9, v8, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->albumId:J

    cmp-long v0, p3, v9

    if-nez v0, :cond_0

    iget v0, v8, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->julianday:I

    move/from16 v3, p2

    if-ne v3, v0, :cond_1

    invoke-static {p0, p1, v6, v8}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->mergeItemToGroup(JILcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;)V

    goto :goto_1

    :cond_0
    move/from16 v3, p2

    :cond_1
    new-instance v8, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;

    move-object v0, v8

    move-wide v1, p0

    move/from16 v3, p2

    move-wide/from16 v4, p3

    move/from16 v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;-><init>(JIJI)V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    return-void

    :cond_2
    move/from16 v3, p2

    iget-wide v9, v8, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->albumId:J

    cmp-long v11, p3, v9

    if-nez v11, :cond_3

    invoke-static {p0, p1, v6, v8}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->mergeItemToGroup(JILcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;)V

    return-void

    :cond_3
    const/4 v8, 0x0

    add-int/lit8 v0, v0, -0x1

    const/4 v3, 0x0

    goto :goto_0

    :cond_4
    move/from16 v3, p2

    new-instance v8, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;

    move-object v0, v8

    move-wide v1, p0

    move-wide/from16 v4, p3

    move/from16 v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;-><init>(JIJI)V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_5
    move/from16 v3, p2

    if-nez v7, :cond_6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v7, v0

    :cond_6
    new-instance v8, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;

    move-object v0, v8

    move-wide v1, p0

    move/from16 v3, p2

    move-wide/from16 v4, p3

    move/from16 v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;-><init>(JIJI)V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_2
    return-void
.end method

.method public static varargs insertToRecent(Landroid/content/Context;[Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;)V
    .locals 1

    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->doInsertToRecent(Landroid/content/Context;Z[Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;)V

    return-void
.end method

.method public static varargs insertToRecentUnchecked(Landroid/content/Context;[Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->doInsertToRecent(Landroid/content/Context;Z[Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;)V

    return-void
.end method

.method private static isAlbumInWhiteList(Ljava/lang/String;)Z
    .locals 3

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getAlbumsInWhiteList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v2

    :cond_1
    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getAlbumWhiteListPatterns()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_2

    return v2

    :cond_3
    const/4 p0, 0x0

    return p0
.end method

.method private static isInLocalMode()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;->isOnlyShowLocalPhoto()Z

    move-result v0

    return v0
.end method

.method private static isInShowHiddenMode()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$HiddenAlbum;->isShowHiddenAlbum()Z

    move-result v0

    return v0
.end method

.method private static isMediaCanShowInMessage(J)Z
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SELECT "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->getNotSecretSelection(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->getNotInHiddenAlbumSelection(J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance()Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    const/4 p1, 0x0

    if-eqz p0, :cond_2

    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return p1

    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :catchall_0
    move-exception p1

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    throw p1

    :cond_2
    :goto_0
    return p1
.end method

.method private static mergeItemToGroup(JILcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;)V
    .locals 0

    iput-wide p0, p3, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->endDate:J

    iget-object p0, p3, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->cursorPosList:Ljava/util/List;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private static moveCursorToPosition(Landroid/database/Cursor;I)Z
    .locals 1

    if-eqz p0, :cond_0

    invoke-interface {p0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/database/Cursor;
    .locals 8

    if-eqz p7, :cond_4

    if-eqz p1, :cond_3

    new-instance p5, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p5, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const-string v0, "localGroupId"

    invoke-virtual {p5, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const-string v0, "localGroupId"

    invoke-virtual {p5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v3, "dateModified"

    invoke-virtual {p5, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v0, "dateModified"

    invoke-virtual {p5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x1

    :cond_1
    const-string v3, "alias_julianday"

    invoke-virtual {p5, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v0, "alias_julianday"

    invoke-virtual {p5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x1

    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {p5}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Ljava/lang/String;

    :goto_1
    invoke-virtual {p5}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_3

    invoke-virtual {p5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    aput-object v0, p1, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    const-string p5, "dateModified DESC "

    :cond_4
    move-object v7, p5

    invoke-static {p6}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->getRecentDiscoveryTable(Z)Ljava/lang/String;

    move-result-object v1

    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p0, :cond_5

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result p2

    if-lez p2, :cond_5

    if-eqz p7, :cond_5

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->resortAndGenerateHeaders(Landroid/database/Cursor;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    const-string p4, "RecentDiscoveryMediaManager"

    const-string p5, "resortAndGenerateHeaders cost %d ms."

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p6

    const/4 v0, 0x0

    sub-long/2addr p6, p2

    invoke-static {p6, p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p4, p5, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object p1

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_1
    const-string p2, "RecentDiscoveryMediaManager"

    const-string p3, "resortAndGenerateHeaders failed."

    invoke-static {p2, p3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 p1, 0x0

    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object p1

    :goto_2
    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p1

    :cond_5
    return-object p0
.end method

.method public static queryAlbumCover(Landroid/database/sqlite/SQLiteDatabase;IZ)Landroid/database/Cursor;
    .locals 1

    new-instance v0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$1;

    invoke-direct {v0}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$1;-><init>()V

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->generateAlbumCover(Landroid/database/sqlite/SQLiteDatabase;IZ)Landroid/os/Bundle;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/database/AbstractCursor;->setExtras(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private static recordNotInWhiteListAlbum(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "album_relative_path"

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "media_scanner"

    const-string v1, "scanner_directory_not_in_white_list"

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private static resortAndGenerateHeaders(Landroid/database/Cursor;[Ljava/lang/String;)Landroid/database/Cursor;
    .locals 10

    if-eqz p0, :cond_5

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_5

    const-string v0, "dateModified"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_5

    const-string v0, "alias_julianday"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    if-eq v0, v1, :cond_5

    const-string v0, "localGroupId"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v1, :cond_0

    goto/16 :goto_2

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p0}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->getDateModified(Landroid/database/Cursor;)J

    move-result-wide v2

    invoke-static {p0}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->getAlbumId(Landroid/database/Cursor;)J

    move-result-wide v5

    invoke-static {p0}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->getJulianday(Landroid/database/Cursor;)I

    move-result v4

    invoke-interface {p0}, Landroid/database/Cursor;->getPosition()I

    move-result v7

    move-object v8, v0

    invoke-static/range {v2 .. v8}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->insertItemToGroupList(JIJILjava/util/ArrayList;)V

    goto :goto_0

    :cond_1
    new-instance v1, Landroid/database/MatrixCursor;

    invoke-direct {v1, p1}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v5, 0x0

    const/4 v6, 0x0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;

    iget-object v8, v7, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->cursorPosList:Ljava/util/List;

    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-static {p0, v8}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->getDateModified(Landroid/database/Cursor;I)J

    move-result-wide v8

    invoke-static {v8, v9, v5}, Lmiui/date/DateUtils;->formatRelativeTime(JZ)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v8, v7, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->cursorPosList:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v8, v7, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->cursorPosList:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/2addr v6, v8

    iget-object v7, v7, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->cursorPosList:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_3
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-static {p0, v8}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->moveCursorToPosition(Landroid/database/Cursor;I)Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-static {p0, v1, p1}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->addOneRowToMatrixCursor(Landroid/database/Cursor;Landroid/database/MatrixCursor;[Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    new-instance p0, Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    const-string p1, "extra_timeline_item_count_in_group"

    invoke-virtual {p0, p1, v2}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string p1, "extra_timeline_group_start_pos"

    invoke-virtual {p0, p1, v3}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string p1, "extra_timeline_group_time_labels"

    invoke-virtual {p0, p1, v4}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    invoke-virtual {v1, p0}, Landroid/database/MatrixCursor;->setExtras(Landroid/os/Bundle;)V

    return-object v1

    :cond_5
    :goto_2
    const/4 p0, 0x0

    return-object p0
.end method
