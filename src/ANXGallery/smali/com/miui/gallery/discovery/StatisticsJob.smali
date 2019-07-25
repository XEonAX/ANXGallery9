.class public Lcom/miui/gallery/discovery/StatisticsJob;
.super Lcom/miui/gallery/discovery/AbstractJob;
.source "StatisticsJob.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/discovery/AbstractJob;-><init>()V

    return-void
.end method

.method private formatProportion(F)J
    .locals 2

    const/high16 v0, 0x42c80000    # 100.0f

    mul-float p1, p1, v0

    float-to-long v0, p1

    return-wide v0
.end method

.method private formatSize(J)Ljava/lang/String;
    .locals 3

    const-wide/32 v0, 0x1dcd6500

    div-long/2addr p1, v0

    long-to-float p1, p1

    const/high16 p2, 0x3f800000    # 1.0f

    mul-float p1, p1, p2

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p1, p2

    sget-object p2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v0, "%.1fG"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {p2, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private isEverSynced()Z
    .locals 3

    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance()Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "SELECT COUNT(*)  FROM cloud WHERE serverType IN (1,2) AND (localFlag = 0 AND serverStatus = \'custom\')"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/discovery/StatisticsJob;->safeQueryCount(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private queryAlbumAttributes(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)I
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SELECT attributes FROM cloud WHERE (serverType=0) AND localFile LIKE \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\'"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p1, p2, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return p2

    :catchall_0
    move-exception p2

    goto :goto_2

    :catch_0
    move-exception p2

    move-object v0, p1

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return p2

    :cond_1
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_1

    :catchall_1
    move-exception p2

    move-object p1, v0

    goto :goto_2

    :catch_1
    move-exception p2

    :goto_0
    :try_start_2
    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    :goto_1
    const/4 p1, -0x1

    return p1

    :goto_2
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p2
.end method

.method private queryAlbumCountOfCloudBackup(Landroid/database/sqlite/SQLiteDatabase;)I
    .locals 2

    const-string v0, "SELECT COUNT(*) FROM cloud WHERE (serverType=0) AND (attributes & 1 != 0) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->safeQueryCount(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private queryAlbumCountOfOtherShare(Landroid/database/sqlite/SQLiteDatabase;)I
    .locals 2

    const-string v0, "SELECT COUNT(*)FROM shareAlbum WHERE serverId IS NOT NULL"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->safeQueryCount(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private queryAlbumCountOfOwnerCreate(Landroid/database/sqlite/SQLiteDatabase;)I
    .locals 2

    const-string v0, "SELECT COUNT(*) FROM cloud WHERE (serverType=0) AND localFile like \'%MIUI/Gallery/cloud/owner%\' AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->safeQueryCount(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private queryAlbumCountShowInAlbumPage(Landroid/database/sqlite/SQLiteDatabase;)I
    .locals 2

    const-string v0, "SELECT COUNT(*) FROM cloud WHERE (serverType=0) AND (attributes & 64 <> 0) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->safeQueryCount(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private queryAlbumCountShowInOtherAlbum(Landroid/database/sqlite/SQLiteDatabase;)I
    .locals 2

    const-string v0, "SELECT COUNT(*) FROM cloud WHERE (serverType=0) AND (attributes & 64 != 0) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->safeQueryCount(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private queryMediaCountByAlbumLocalFile(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Z)I
    .locals 2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SELECT COUNT(*) FROM cloud WHERE localGroupId = (SELECT _id FROM cloud WHERE LOWER(localFile) = ? LIMIT 1) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p3, :cond_1

    const-string p3, " AND serverType=2"

    goto :goto_0

    :cond_1
    const-string p3, ""

    :goto_0
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p2

    aput-object p2, v0, v1

    invoke-direct {p0, p1, p3, v0}, Lcom/miui/gallery/discovery/StatisticsJob;->safeQueryCount(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private queryMediaCountOfAllAlbums(Landroid/database/sqlite/SQLiteDatabase;Z)I
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SELECT COUNT(*)  FROM cloud WHERE serverType IN (1,2) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p2, :cond_0

    const-string p2, ""

    goto :goto_0

    :cond_0
    const-string p2, " AND attributes&16=0"

    :goto_0
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/discovery/StatisticsJob;->safeQueryCount(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private queryMediaCountOfFavoritesAlbum(Landroid/database/sqlite/SQLiteDatabase;)I
    .locals 2

    const-string v0, "SELECT COUNT(*) FROM extended_cloud WHERE (isFavorite NOT NULL AND isFavorite > 0) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->safeQueryCount(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private queryMediaSpace(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J
    .locals 3

    const-string v0, "SELECT SUM(size) FROM cloud WHERE serverType IN (1,2) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND (localGroupId NOT IN (SELECT _id FROM cloud WHERE (serverType=0) AND attributes&64!=0))"

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " AND ("

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_0
    const/4 p2, 0x0

    :try_start_0
    invoke-virtual {p1, v0, p2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_1

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p2

    if-eqz p2, :cond_1

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-wide v0

    :catch_0
    move-exception p2

    goto :goto_0

    :cond_1
    if-eqz p1, :cond_2

    const-wide/16 v0, 0x0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-wide v0

    :catchall_0
    move-exception p1

    move-object v2, p2

    move-object p2, p1

    move-object p1, v2

    goto :goto_1

    :catch_1
    move-exception p1

    move-object v2, p2

    move-object p2, p1

    move-object p1, v2

    :goto_0
    :try_start_2
    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_2
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    const-wide/16 p1, -0x1

    return-wide p1

    :catchall_1
    move-exception p2

    :goto_1
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p2
.end method

.method private querySpecialMediaCountOfSortByModifyAlbum(Landroid/database/sqlite/SQLiteDatabase;)I
    .locals 3

    invoke-static {}, Lcom/miui/gallery/provider/MediaSortDateHelper;->getSortDateProvider()Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;->MODIFY_TIME:Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;

    invoke-interface {v0, v1}, Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;->getAlbumPathsBySortDate(Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SELECT COUNT(*) FROM cloud WHERE serverType IN (1,2) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND STRFTIME(\'%Y%m%d\',dateModified/1000, \'unixepoch\', \'localtime\')>STRFTIME(\'%Y%m%d\', CASE WHEN mixedDateTime NOT NULL THEN mixedDateTime ELSE dateTaken END /1000, \'unixepoch\', \'localtime\') AND localGroupId IN (   SELECT _id   FROM cloud   WHERE (serverType=0)   AND (attributes & 4 != 0)   AND "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/miui/gallery/provider/InternalContract$Cloud;->ALIAS_NON_SYSTEM_ALBUM:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "   AND "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "localFile"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " COLLATE NOCASE IN (\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\', \'"

    invoke-static {v2, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\')"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->safeQueryCount(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private queryVideoCountOfAll(Landroid/database/sqlite/SQLiteDatabase;)I
    .locals 2

    const-string v0, "SELECT COUNT(*)  FROM cloud WHERE serverType = 2 AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND attributes&16=0"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->safeQueryCount(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private recordAlbumsAndImagesCount()V
    .locals 17

    move-object/from16 v0, p0

    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance()Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/discovery/StatisticsJob;->queryMediaCountOfAllAlbums(Landroid/database/sqlite/SQLiteDatabase;Z)I

    move-result v3

    invoke-direct {v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->queryVideoCountOfAll(Landroid/database/sqlite/SQLiteDatabase;)I

    move-result v4

    const-string v5, "DCIM/Camera"

    invoke-direct {v0, v1, v5, v2}, Lcom/miui/gallery/discovery/StatisticsJob;->queryMediaCountByAlbumLocalFile(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Z)I

    move-result v5

    const-string v6, "DCIM/Camera"

    const/4 v7, 0x1

    invoke-direct {v0, v1, v6, v7}, Lcom/miui/gallery/discovery/StatisticsJob;->queryMediaCountByAlbumLocalFile(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Z)I

    move-result v6

    const-string v7, "DCIM/Screenshots"

    invoke-direct {v0, v1, v7, v2}, Lcom/miui/gallery/discovery/StatisticsJob;->queryMediaCountByAlbumLocalFile(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Z)I

    move-result v7

    const-string v8, "Download"

    invoke-direct {v0, v1, v8, v2}, Lcom/miui/gallery/discovery/StatisticsJob;->queryMediaCountByAlbumLocalFile(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Z)I

    move-result v2

    invoke-direct {v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->queryAlbumCountOfCloudBackup(Landroid/database/sqlite/SQLiteDatabase;)I

    move-result v8

    invoke-direct {v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->queryAlbumCountOfOwnerCreate(Landroid/database/sqlite/SQLiteDatabase;)I

    move-result v9

    invoke-direct {v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->queryAlbumCountOfOtherShare(Landroid/database/sqlite/SQLiteDatabase;)I

    move-result v10

    invoke-direct {v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->queryAlbumCountShowInAlbumPage(Landroid/database/sqlite/SQLiteDatabase;)I

    move-result v11

    invoke-direct {v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->queryAlbumCountShowInOtherAlbum(Landroid/database/sqlite/SQLiteDatabase;)I

    move-result v12

    invoke-direct {v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->queryMediaCountOfFavoritesAlbum(Landroid/database/sqlite/SQLiteDatabase;)I

    move-result v13

    invoke-direct {v0, v1}, Lcom/miui/gallery/discovery/StatisticsJob;->querySpecialMediaCountOfSortByModifyAlbum(Landroid/database/sqlite/SQLiteDatabase;)I

    move-result v1

    const/4 v14, -0x1

    if-eq v3, v14, :cond_0

    const-string v15, "albums_and_images_count"

    const-string v14, "image_count_of_all_albums"

    move/from16 v16, v1

    int-to-long v0, v3

    invoke-static {v15, v14, v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    goto :goto_0

    :cond_0
    move/from16 v16, v1

    :goto_0
    const/4 v0, -0x1

    if-eq v4, v0, :cond_1

    const-string v1, "albums_and_images_count"

    const-string v3, "video_count_of_all_albums"

    int-to-long v14, v4

    invoke-static {v1, v3, v14, v15}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_1
    if-eq v5, v0, :cond_2

    const-string v1, "albums_and_images_count"

    const-string v3, "image_count_of_camera_album"

    int-to-long v4, v5

    invoke-static {v1, v3, v4, v5}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_2
    if-eq v6, v0, :cond_3

    const-string v1, "albums_and_images_count"

    const-string v3, "video_count_of_camera_album"

    int-to-long v4, v6

    invoke-static {v1, v3, v4, v5}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_3
    if-eq v7, v0, :cond_4

    const-string v1, "albums_and_images_count"

    const-string v3, "image_count_of_screenshot_album"

    int-to-long v4, v7

    invoke-static {v1, v3, v4, v5}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_4
    if-eq v2, v0, :cond_5

    const-string v1, "albums_and_images_count"

    const-string v3, "image_count_of_download_album"

    int-to-long v4, v2

    invoke-static {v1, v3, v4, v5}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_5
    if-eq v8, v0, :cond_6

    const-string v1, "albums_and_images_count"

    const-string v2, "album_count_of_cloud_backup"

    int-to-long v3, v8

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_6
    if-eq v9, v0, :cond_7

    const-string v1, "albums_and_images_count"

    const-string v2, "album_count_of_owner_create"

    int-to-long v3, v9

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_7
    if-eq v10, v0, :cond_8

    const-string v1, "albums_and_images_count"

    const-string v2, "album_count_of_other_share"

    int-to-long v3, v10

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_8
    if-eq v11, v0, :cond_9

    const-string v1, "albums_and_images_count"

    const-string v2, "album_count_show_in_album_page"

    int-to-long v3, v11

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_9
    if-eq v12, v0, :cond_a

    const-string v1, "albums_and_images_count"

    const-string v2, "album_count_show_in_other_album"

    int-to-long v3, v12

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_a
    if-eq v13, v0, :cond_b

    const-string v1, "albums_and_images_count"

    const-string v2, "image_count_of_favorites_album"

    int-to-long v3, v13

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_b
    move/from16 v1, v16

    if-eq v1, v0, :cond_c

    const-string v0, "albums_and_images_count"

    const-string v2, "special_image_count_of_sort_by_modify_and_show_in_home_album"

    int-to-long v3, v1

    invoke-static {v0, v2, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_c
    return-void
.end method

.method private recordGallerySettings()V
    .locals 12

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const-string v3, "settings"

    const-string v4, "has_xiaomi_account"

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v2, :cond_2

    const-string v2, "com.miui.gallery.cloud.provider"

    invoke-static {v0, v2}, Landroid/content/ContentResolver;->getSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result v0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;->isOnlyShowLocalPhoto()Z

    move-result v2

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isAIAlbumEnabled()Z

    move-result v3

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isFaceAlbumEnabled()Z

    move-result v4

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getBackupOnlyInWifi()Z

    move-result v5

    invoke-static {v1}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isLocalSearchOpen(Z)Z

    move-result v1

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isCloudControlSearchBarOpen()Z

    move-result v6

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isCloudControlSearchAIAlbumOpen()Z

    move-result v7

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->isAutoDownload()Z

    move-result v8

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v9

    const-string v10, "settings"

    const-string v11, "is_cloud_backup_on_c"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    invoke-static {v10, v11, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "settings"

    const-string v10, "is_local_mode_on_c"

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v10, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "settings"

    const-string v2, "is_face_album_on_c"

    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v2, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "settings"

    const-string v2, "is_backup_only_wifi_on_c"

    invoke-static {v5}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v2, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "settings"

    const-string v2, "is_ai_album_on_c"

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "settings"

    const-string v2, "is_search_ai_album_enabled_c"

    invoke-static {v7}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "settings"

    const-string v2, "is_search_bar_enabled_c"

    invoke-static {v6}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v7, :cond_1

    const-string v0, "settings"

    const-string v2, "is_search_user_switch_on_c"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const-string v0, "settings"

    const-string v1, "auto_download_on_c"

    invoke-static {v8}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v8, :cond_2

    const-string v0, "settings"

    const-string v1, "download_type_c"

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method private recordMediasSpace()V
    .locals 17

    move-object/from16 v0, p0

    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance()Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/discovery/StatisticsJob;->queryMediaSpace(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v6, v2, v4

    if-nez v6, :cond_0

    return-void

    :cond_0
    const-string v6, "medias_space"

    const-string v7, "medias_space_of_all"

    invoke-direct {v0, v2, v3}, Lcom/miui/gallery/discovery/StatisticsJob;->formatSize(J)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, "localGroupId IN (SELECT _id FROM cloud WHERE localFile LIKE \'%s\')"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "serverType=1 AND "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v9, 0x1

    new-array v10, v9, [Ljava/lang/Object;

    const-string v11, "DCIM/Camera"

    const/4 v12, 0x0

    aput-object v11, v10, v12

    invoke-static {v8, v6, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v1, v7}, Lcom/miui/gallery/discovery/StatisticsJob;->queryMediaSpace(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J

    move-result-wide v7

    cmp-long v10, v7, v4

    const/high16 v11, 0x3f800000    # 1.0f

    if-eqz v10, :cond_1

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v13, "medias_space_ratio_of_album_%s"

    new-array v14, v9, [Ljava/lang/Object;

    const-string v15, "Camera-Image"

    aput-object v15, v14, v12

    invoke-static {v10, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    const-string v13, "medias_space"

    long-to-float v7, v7

    mul-float v7, v7, v11

    long-to-float v8, v2

    div-float/2addr v7, v8

    invoke-direct {v0, v7}, Lcom/miui/gallery/discovery/StatisticsJob;->formatProportion(F)J

    move-result-wide v7

    invoke-static {v13, v10, v7, v8}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "serverType=2 AND "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-array v10, v9, [Ljava/lang/Object;

    const-string v13, "DCIM/Camera"

    aput-object v13, v10, v12

    invoke-static {v8, v6, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v1, v7}, Lcom/miui/gallery/discovery/StatisticsJob;->queryMediaSpace(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J

    move-result-wide v7

    cmp-long v10, v7, v4

    if-eqz v10, :cond_2

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v13, "medias_space_ratio_of_album_%s"

    new-array v14, v9, [Ljava/lang/Object;

    const-string v15, "Camera-Video"

    aput-object v15, v14, v12

    invoke-static {v10, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    const-string v13, "medias_space"

    long-to-float v7, v7

    mul-float v7, v7, v11

    long-to-float v8, v2

    div-float/2addr v7, v8

    invoke-direct {v0, v7}, Lcom/miui/gallery/discovery/StatisticsJob;->formatProportion(F)J

    move-result-wide v7

    invoke-static {v13, v10, v7, v8}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_2
    const-string v7, "serverType=2"

    invoke-direct {v0, v1, v7}, Lcom/miui/gallery/discovery/StatisticsJob;->queryMediaSpace(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J

    move-result-wide v7

    cmp-long v10, v7, v4

    if-eqz v10, :cond_3

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v13, "medias_space_ratio_of_album_%s"

    new-array v14, v9, [Ljava/lang/Object;

    const-string v15, "Video"

    aput-object v15, v14, v12

    invoke-static {v10, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    const-string v13, "medias_space"

    long-to-float v7, v7

    mul-float v7, v7, v11

    long-to-float v8, v2

    div-float/2addr v7, v8

    invoke-direct {v0, v7}, Lcom/miui/gallery/discovery/StatisticsJob;->formatProportion(F)J

    move-result-wide v7

    invoke-static {v13, v10, v7, v8}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_3
    const-string v7, "tencent/micromsg/weixin"

    invoke-direct {v0, v1, v7}, Lcom/miui/gallery/discovery/StatisticsJob;->queryAlbumAttributes(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)I

    move-result v8

    const/4 v10, -0x1

    if-eq v8, v10, :cond_4

    int-to-long v13, v8

    const-wide/16 v15, 0x40

    and-long/2addr v13, v15

    const-wide/16 v15, 0x0

    cmp-long v8, v13, v15

    if-nez v8, :cond_4

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-array v10, v9, [Ljava/lang/Object;

    aput-object v7, v10, v12

    invoke-static {v8, v6, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v1, v6}, Lcom/miui/gallery/discovery/StatisticsJob;->queryMediaSpace(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J

    move-result-wide v6

    cmp-long v1, v6, v4

    if-eqz v1, :cond_4

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "medias_space_ratio_of_album_%s"

    new-array v5, v9, [Ljava/lang/Object;

    const-string v8, "weixin"

    aput-object v8, v5, v12

    invoke-static {v1, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "medias_space"

    long-to-float v5, v6

    mul-float v5, v5, v11

    long-to-float v2, v2

    div-float/2addr v5, v2

    invoke-direct {v0, v5}, Lcom/miui/gallery/discovery/StatisticsJob;->formatProportion(F)J

    move-result-wide v2

    invoke-static {v4, v1, v2, v3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_4
    return-void
.end method

.method private recordOtherProperties()V
    .locals 5

    const-string v0, "Sync"

    const-string v1, "sync_auto_downloaded_property"

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->isEverAutoDownloaded()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/StorageUtils;->hasExternalSDCard(Landroid/content/Context;)Z

    move-result v1

    const-string v2, "storage"

    const-string v3, "storage_has_external_sd_card"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isDeviceSupportStoryFunction()Z

    move-result v2

    if-eqz v1, :cond_0

    const-string v1, "storage"

    const-string v3, "storage_is_external_sd_card_prior_storage"

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->isExternalSDCardPriorStorage()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getSecondaryStoragePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/StorageUtils;->canWrite(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    const-string v1, "storage"

    const-string v3, "storage_can_write_external_sd_card"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v3, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz v2, :cond_1

    const-string v0, "assistant"

    const-string v1, "assistant_card_function_status"

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method private recordPeopleProperties()V
    .locals 5

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->myself:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v1}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/FaceManager;->queryPeopleIdOfRelation(Landroid/content/Context;I)Ljava/util/List;

    move-result-object v0

    const-string v1, "people"

    const-string v2, "people_count_under_myself"

    if-nez v0, :cond_0

    const-wide/16 v3, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    int-to-long v3, v0

    :goto_0
    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method

.method private recordSyncState()V
    .locals 11

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v0

    const-string v1, "sync_state_analysis"

    const-string v2, "login_account"

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v0, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    invoke-static {v5}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v2, v5}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/high16 v1, 0x42c80000    # 100.0f

    const-wide/16 v5, 0x0

    if-eqz v0, :cond_2

    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v2

    const-string v7, "com.miui.gallery.cloud.provider"

    invoke-static {v0, v7}, Landroid/content/ContentResolver;->getSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result v0

    const-string v7, "sync_state_analysis"

    const-string v8, "master_sync"

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v2, :cond_1

    const-string v2, "sync_state_analysis"

    const-string v7, "gallery_sync"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v8

    invoke-static {v2, v7, v8}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    if-nez v0, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/discovery/StatisticsJob;->isEverSynced()Z

    move-result v3

    const-string v0, "sync_state_analysis"

    const-string v2, "sync_off_ever_synced"

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v2, v7}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getCloudSpaceInfo(Landroid/content/Context;)Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;->getTotal()J

    move-result-wide v7

    cmp-long v2, v7, v5

    if-lez v2, :cond_3

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil$CloudSpaceInfo;->getUsed()J

    move-result-wide v9

    sub-long v9, v7, v9

    long-to-float v0, v9

    mul-float v0, v0, v1

    long-to-float v2, v7

    div-float/2addr v0, v2

    float-to-int v0, v0

    const-string v2, "sync_state_analysis"

    const-string v7, "sync_off_cloud_space_state"

    int-to-long v8, v0

    invoke-static {v2, v7, v8, v9}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    :cond_3
    :goto_1
    if-nez v3, :cond_4

    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance()Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v2, "DCIM/Camera"

    invoke-direct {p0, v0, v2, v4}, Lcom/miui/gallery/discovery/StatisticsJob;->queryMediaCountByAlbumLocalFile(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Z)I

    move-result v0

    const-string v2, "sync_state_analysis"

    const-string v3, "sync_off_media_count"

    int-to-long v7, v0

    invoke-static {v2, v3, v7, v8}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getPrimaryStoragePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/StorageUtils;->getTotalBytes(Ljava/lang/String;)J

    move-result-wide v2

    cmp-long v4, v2, v5

    if-lez v4, :cond_4

    invoke-static {v0}, Lcom/miui/gallery/util/StorageUtils;->getAvailableBytes(Ljava/lang/String;)J

    move-result-wide v4

    long-to-float v0, v4

    mul-float v0, v0, v1

    long-to-float v1, v2

    div-float/2addr v0, v1

    float-to-int v0, v0

    const-string v1, "sync_state_analysis"

    const-string v2, "sync_off_local_space_state"

    int-to-long v3, v0

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_4
    return-void
.end method

.method private safeQueryCount(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p1, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return p2

    :catchall_0
    move-exception p2

    goto :goto_2

    :catch_0
    move-exception p2

    move-object v0, p1

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return p2

    :cond_1
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_1

    :catchall_1
    move-exception p2

    move-object p1, v0

    goto :goto_2

    :catch_1
    move-exception p2

    :goto_0
    :try_start_2
    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    :goto_1
    const/4 p1, -0x1

    return p1

    :goto_2
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p2
.end method


# virtual methods
.method public execJob()Ljava/lang/Object;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/discovery/StatisticsJob;->recordGallerySettings()V

    invoke-direct {p0}, Lcom/miui/gallery/discovery/StatisticsJob;->recordAlbumsAndImagesCount()V

    invoke-virtual {p0}, Lcom/miui/gallery/discovery/StatisticsJob;->recordMediaTypes()V

    invoke-direct {p0}, Lcom/miui/gallery/discovery/StatisticsJob;->recordMediasSpace()V

    invoke-direct {p0}, Lcom/miui/gallery/discovery/StatisticsJob;->recordSyncState()V

    invoke-direct {p0}, Lcom/miui/gallery/discovery/StatisticsJob;->recordOtherProperties()V

    invoke-direct {p0}, Lcom/miui/gallery/discovery/StatisticsJob;->recordPeopleProperties()V

    const/4 v0, 0x0

    return-object v0
.end method

.method public getJobInfo(Landroid/content/Context;Landroid/content/ComponentName;)Landroid/app/job/JobInfo;
    .locals 2

    new-instance p1, Landroid/app/job/JobInfo$Builder;

    iget v0, p0, Lcom/miui/gallery/discovery/StatisticsJob;->mJobId:I

    invoke-direct {p1, v0, p2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    const/4 p2, 0x2

    invoke-virtual {p1, p2}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    const-wide/32 v0, 0x240c8400

    invoke-virtual {p1, v0, v1}, Landroid/app/job/JobInfo$Builder;->setPeriodic(J)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/app/job/JobInfo$Builder;->setRequiresDeviceIdle(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/app/job/JobInfo$Builder;->setRequiresCharging(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p1

    return-object p1
.end method

.method public recordMediaTypes()V
    .locals 5

    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance()Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "SELECT mimeType, COUNT(*)  FROM cloud WHERE serverType IN (1,2) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND attributes&16=0 GROUP BY mimeType"

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_1

    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const-string v1, "media_type_count"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "media_count_of_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    int-to-long v3, v3

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v1, :cond_0

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_3

    :catch_0
    move-exception v1

    move-object v2, v0

    goto :goto_1

    :cond_1
    :goto_0
    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_2

    :catchall_1
    move-exception v1

    move-object v0, v2

    goto :goto_3

    :catch_1
    move-exception v1

    :goto_1
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    :goto_2
    return-void

    :goto_3
    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw v1
.end method
