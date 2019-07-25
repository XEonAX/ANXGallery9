.class public Lcom/miui/gallery/scanner/MediaScanner;
.super Ljava/lang/Object;
.source "MediaScanner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;,
        Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;,
        Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;,
        Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;
    }
.end annotation


# static fields
.field private static final ALBUM_NAME_CONFLICT_PROJECTION:[Ljava/lang/String;

.field private static final ALBUM_PROJECTION:[Ljava/lang/String;

.field private static final CLEAN_UP_FILE_PATH_PROJECTION:[Ljava/lang/String;

.field private static final POST_SCAN_PROJECTION:[Ljava/lang/String;

.field private static final SPECIAL_TYPE_FLAGS_PROJECTION:[Ljava/lang/String;

.field private static final SPECIAL_TYPE_FLAGS_WHERE:Ljava/lang/String;

.field private static final sLock:Ljava/lang/Object;

.field private static sServerReservedAlbumNamesStrategy:Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;

.field private static sServerUnModifyAlbumsStrategy:Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const-string v0, "_id"

    const-string v1, "serverId"

    const-string v2, "dateModified"

    const-string v3, "localFlag"

    const-string v4, "serverStatus"

    const-string v5, "fileName"

    const-string v6, "attributes"

    const-string v7, "editedColumns"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/scanner/MediaScanner;->ALBUM_PROJECTION:[Ljava/lang/String;

    const-string v0, "count(*)"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/scanner/MediaScanner;->ALBUM_NAME_CONFLICT_PROJECTION:[Ljava/lang/String;

    const-string v1, "_id"

    const-string v2, "sha1"

    const-string v3, "localFile"

    const-string v4, "localFlag"

    const-string v5, "localFile"

    const-string v6, "thumbnailFile"

    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/scanner/MediaScanner;->POST_SCAN_PROJECTION:[Ljava/lang/String;

    const-string v0, "_id"

    const-string v1, "localFile"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/scanner/MediaScanner;->SPECIAL_TYPE_FLAGS_PROJECTION:[Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_id > ? AND serverType = 1 AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/provider/InternalContract$Cloud;->ALIAS_ORIGIN_FILE_VALID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/scanner/MediaScanner;->SPECIAL_TYPE_FLAGS_WHERE:Ljava/lang/String;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/scanner/MediaScanner;->sLock:Ljava/lang/Object;

    const-string v0, "_id"

    const-string v1, "fileName"

    const-string v2, "localFile"

    const-string v3, "thumbnailFile"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/scanner/MediaScanner;->CLEAN_UP_FILE_PATH_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method static synthetic access$100(Landroid/content/Context;Ljava/lang/String;Landroid/content/ContentValues;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/scanner/MediaScanner;->queryAndUpdateAlbum(Landroid/content/Context;Ljava/lang/String;Landroid/content/ContentValues;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Landroid/content/Context;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/scanner/MediaScanner;->updateAlbumDateModified(Landroid/content/Context;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)V

    return-void
.end method

.method static synthetic access$300(Landroid/content/Context;Ljava/lang/String;Landroid/content/ContentValues;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/scanner/MediaScanner;->insertAlbum(Landroid/content/Context;Ljava/lang/String;Landroid/content/ContentValues;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/scanner/MediaScanner;->recordHiddenAlbum(Ljava/lang/String;)V

    return-void
.end method

.method private static checkAlbumNameConflict(Landroid/content/Context;Ljava/lang/String;)I
    .locals 8

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/scanner/MediaScanner;->getServerUnModifyAlbumsStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;->containsName(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x2

    if-eqz v0, :cond_1

    return v2

    :cond_1
    invoke-static {}, Lcom/miui/gallery/scanner/MediaScanner;->getServerReservedAlbumNamesStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;->containsName(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v2

    :cond_2
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v4, Lcom/miui/gallery/scanner/MediaScanner;->ALBUM_NAME_CONFLICT_PROJECTION:[Ljava/lang/String;

    const-string v5, "(serverType=0) AND fileName = ? COLLATE NOCASE AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    new-array v6, v1, [Ljava/lang/String;

    const/4 p0, 0x0

    aput-object p1, v6, p0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p1, :cond_4

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-lez v0, :cond_3

    const/4 p0, 0x3

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return p0

    :cond_3
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return p0

    :cond_4
    :try_start_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "query album cursor null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p0

    move-object v0, p1

    goto :goto_0

    :catchall_1
    move-exception p0

    :goto_0
    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p0
.end method

.method private static checkAndUpdateFileInfo(Landroid/content/Context;Landroid/database/Cursor;JLcom/miui/gallery/provider/ContentProviderBatchOperator;Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/Cursor;",
            "J",
            "Lcom/miui/gallery/provider/ContentProviderBatchOperator;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/util/deleterecorder/DeleteRecord;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const/4 v1, 0x5

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/16 v3, 0xd

    if-nez v2, :cond_0

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "thumbnailFile"

    const-string v4, ""

    invoke-virtual {v0, v2, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    const-string v4, "MediaScanner"

    invoke-direct {v2, v3, v1, v4}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    const/4 v1, 0x4

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "localFile"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    const-string v2, "MediaScanner"

    invoke-direct {v1, v3, p1, v2}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-virtual {v0}, Landroid/content/ContentValues;->size()I

    move-result p1

    if-lez p1, :cond_2

    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$CloudWriteBulkNotify;->CLOUD_WRITE_BULK_NOTIFY_URI:Landroid/net/Uri;

    invoke-static {p1}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object p1

    const-string p5, "_id=?"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    aput-object p2, v1, v2

    invoke-virtual {p1, p5, v1}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object p1

    invoke-virtual {p4, p0, p1}, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->add(Landroid/content/Context;Landroid/content/ContentProviderOperation;)V

    :cond_2
    return-void
.end method

.method private static cleanFile(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "MediaScanner"

    const-string v1, "delete %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v1, "localFile = ? COLLATE NOCASE AND (serverType=1 OR serverType=2) AND (localFlag=7 OR localFlag=8) AND serverStatus IS NULL"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {p0, v0, v1, v2}, Lcom/miui/gallery/util/SafeDBUtil;->safeDelete(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    new-instance p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    const/16 v0, 0xe

    const-string v1, "MediaScanner"

    invoke-direct {p0, v0, p1, v1}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Lcom/miui/gallery/util/deleterecorder/DeleteRecord;)V

    :cond_0
    return-void
.end method

.method public static cleanup(Landroid/content/Context;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;Ljava/util/List;)V
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/miui/gallery/threadpool/ThreadPool$JobContext;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v8, p0

    invoke-static/range {p0 .. p1}, Lcom/miui/gallery/scanner/MediaScanner;->cleanupFilePathForDBFileName(Landroid/content/Context;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    invoke-static/range {p2 .. p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    const/4 v11, 0x1

    const/4 v12, 0x0

    if-eqz v0, :cond_0

    const-string v0, "_id>? AND (serverType=1 OR serverType=2) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND (localGroupId!=-1000)"

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "localGroupId IN (%s)"

    new-array v3, v11, [Ljava/lang/Object;

    const-string v4, ","

    invoke-static {v4}, Lcom/google/common/base/Joiner;->on(Ljava/lang/String;)Lcom/google/common/base/Joiner;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/common/base/Joiner;->skipNulls()Lcom/google/common/base/Joiner;

    move-result-object v4

    move-object/from16 v5, p2

    invoke-virtual {v4, v5}, Lcom/google/common/base/Joiner;->join(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v12

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, "_id>? AND (serverType=1 OR serverType=2) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND (localGroupId!=-1000)"

    :goto_0
    const-string v1, ""

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v13

    new-instance v14, Lcom/miui/gallery/provider/ContentProviderBatchOperator;

    const-string v1, "com.miui.gallery.cloud.provider"

    invoke-direct {v14, v1}, Lcom/miui/gallery/provider/ContentProviderBatchOperator;-><init>(Ljava/lang/String;)V

    new-instance v15, Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v2, "_id"

    invoke-direct {v15, v1, v2}, Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;-><init>(Landroid/net/Uri;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->getEverCleanUnsupportUploadItems()Z

    move-result v16

    const/high16 v7, -0x80000000

    :try_start_0
    new-instance v17, Lcom/miui/gallery/scanner/-$$Lambda$MediaScanner$lTYFIma8jp0gLqMCtqdYMFUh4UI;

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object v3, v15

    move-object/from16 v4, p0

    move/from16 v5, v16

    move-object v6, v14

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/scanner/-$$Lambda$MediaScanner$lTYFIma8jp0gLqMCtqdYMFUh4UI;-><init>(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;Landroid/content/Context;ZLcom/miui/gallery/provider/ContentProviderBatchOperator;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/16 v18, 0x1

    :cond_1
    if-eqz p1, :cond_2

    :try_start_1
    invoke-interface/range {p1 .. p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_2

    return-void

    :catchall_0
    move-exception v0

    goto :goto_3

    :cond_2
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v13, v12

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const/16 v2, 0x3e8

    invoke-static {v1, v2}, Lcom/miui/gallery/util/UriUtil;->appendLimit(Landroid/net/Uri;I)Landroid/net/Uri;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/scanner/MediaScanner;->POST_SCAN_PROJECTION:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/scanner/MediaScanner;->POST_SCAN_PROJECTION:[Ljava/lang/String;

    aget-object v6, v1, v12

    move-object/from16 v1, p0

    move-object v4, v0

    move-object v5, v13

    move-object/from16 v7, v17

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    const v2, 0x7fffffff

    if-nez v1, :cond_3

    const v7, 0x7fffffff

    const/16 v18, 0x0

    goto :goto_1

    :cond_3
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v7, v1

    :goto_1
    if-lt v7, v2, :cond_1

    if-eqz v18, :cond_4

    invoke-virtual {v15, v8}, Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;->flushForResult(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_2

    :cond_4
    const/4 v11, 0x0

    :goto_2
    if-eqz v11, :cond_5

    invoke-virtual {v14, v8}, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->apply(Landroid/content/Context;)V

    if-nez v16, :cond_5

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->setEverCleanUnsupportUploadItems()V

    :cond_5
    invoke-static/range {p0 .. p1}, Lcom/miui/gallery/scanner/MediaScanner;->scannerCorrectLogic(Landroid/content/Context;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V

    invoke-static/range {p0 .. p1}, Lcom/miui/gallery/scanner/MediaScanner;->fillSpecialTypeFlags(Landroid/content/Context;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V

    const-string v0, "MediaScanner"

    const-string v1, "cleanup costs: %d"

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v9

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :catchall_1
    move-exception v0

    const/16 v18, 0x1

    :goto_3
    if-eqz v18, :cond_6

    invoke-virtual {v15, v8}, Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;->flushForResult(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_4

    :cond_6
    const/4 v11, 0x0

    :goto_4
    if-eqz v11, :cond_7

    invoke-virtual {v14, v8}, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->apply(Landroid/content/Context;)V

    if-nez v16, :cond_7

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->setEverCleanUnsupportUploadItems()V

    :cond_7
    throw v0
.end method

.method private static cleanupFilePathForDBFileName(Landroid/content/Context;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V
    .locals 8

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CleanFilePath;->hasCleanFilePath()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v7, Lcom/miui/gallery/scanner/MediaScanner$1;

    invoke-direct {v7, p1}, Lcom/miui/gallery/scanner/MediaScanner$1;-><init>(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v3, Lcom/miui/gallery/scanner/MediaScanner;->CLEAN_UP_FILE_PATH_PROJECTION:[Ljava/lang/String;

    const-string v4, "fileName NOT LIKE \'%_BURST%\' AND ((localFile IS NOT NULL AND localFile LIKE \'%_BURST%\') OR (thumbnailFile IS NOT NULL AND thumbnailFile LIKE \'%_BURST%\')) AND localFlag NOT IN (-1, 2) AND serverStatus = \'custom\'"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    return-void
.end method

.method private static doScanSingleFile(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 8

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/miui/gallery/scanner/MediaScanner;->isScannableDirectory(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->getSupportUploadMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->isImageFromMimeType(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_1
    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/miui/gallery/scanner/MediaScanner;->queryOrInsertAlbum(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    move-result-object v0

    if-nez v0, :cond_2

    return-void

    :cond_2
    new-instance v7, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v1, v7

    move v6, p2

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;-><init>(ZLcom/miui/gallery/scanner/MediaBulkInserter;Lcom/miui/gallery/provider/ContentProviderBatchOperator;ZZ)V

    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p0, p2, v0}, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->scanFile(Landroid/content/Context;Ljava/io/File;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)J

    move-result-wide v0

    invoke-static {p0, p1}, Lcom/miui/gallery/scanner/MediaScanner;->cleanFile(Landroid/content/Context;Ljava/lang/String;)V

    const-wide/16 p0, 0x0

    cmp-long p2, v0, p0

    if-lez p2, :cond_4

    invoke-static {}, Lcom/miui/gallery/data/LocationManager;->getInstance()Lcom/miui/gallery/data/LocationManager;

    move-result-object p0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/data/LocationManager;->loadLocationAsync(J)V

    goto :goto_0

    :cond_3
    invoke-static {p0, p1}, Lcom/miui/gallery/scanner/MediaScanner;->cleanFile(Landroid/content/Context;Ljava/lang/String;)V

    :cond_4
    :goto_0
    return-void
.end method

.method private static fillSpecialTypeFlags(Landroid/content/Context;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V
    .locals 13

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->isEverFillSpecialTypeFlags()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const/4 v2, 0x1

    const-string v3, ""

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    const/high16 v4, -0x80000000

    new-instance v11, Lcom/miui/gallery/scanner/MediaScanner$3;

    invoke-direct {v11, p1, p0}, Lcom/miui/gallery/scanner/MediaScanner$3;-><init>(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;Landroid/content/Context;)V

    :cond_1
    const/4 v12, 0x0

    if-eqz p1, :cond_2

    :try_start_0
    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v5, :cond_2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p0

    sub-long/2addr p0, v0

    const-string v0, "MediaScanner"

    const-string v1, "fill special type flags [%s], costs [%d] ms"

    const-string v2, "failed"

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-static {v0, v1, v2, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception p0

    goto/16 :goto_3

    :catch_0
    move-exception p0

    goto :goto_1

    :cond_2
    :try_start_1
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v12

    sget-object v4, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const/16 v5, 0x3e8

    invoke-static {v4, v5}, Lcom/miui/gallery/util/UriUtil;->appendLimit(Landroid/net/Uri;I)Landroid/net/Uri;

    move-result-object v5

    sget-object v6, Lcom/miui/gallery/scanner/MediaScanner;->SPECIAL_TYPE_FLAGS_PROJECTION:[Ljava/lang/String;

    sget-object v7, Lcom/miui/gallery/scanner/MediaScanner;->SPECIAL_TYPE_FLAGS_WHERE:Ljava/lang/String;

    const-string v9, "_id ASC"

    move-object v4, p0

    move-object v8, v3

    move-object v10, v11

    invoke-static/range {v4 .. v10}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    const v5, 0x7fffffff

    if-nez v4, :cond_3

    const/4 v2, 0x0

    const v4, 0x7fffffff

    goto :goto_0

    :cond_3
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-lt v4, v5, :cond_1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p0

    sub-long/2addr p0, v0

    if-eqz v2, :cond_4

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->setEverFillSpecialTypeFlags()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "cost(ms)"

    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "media_scanner"

    const-string v3, "fill_special_type_flags"

    invoke-static {v1, v3, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_4
    const-string v0, "MediaScanner"

    const-string v1, "fill special type flags [%s], costs [%d] ms"

    if-eqz v2, :cond_5

    const-string v2, "succeed"

    goto :goto_2

    :goto_1
    :try_start_2
    const-string p1, "MediaScanner"

    const-string v2, "Encounter error when fill special type flags: [%s]"

    invoke-static {p1, v2, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p0

    sub-long/2addr p0, v0

    const-string v0, "MediaScanner"

    const-string v1, "fill special type flags [%s], costs [%d] ms"

    :cond_5
    const-string v2, "failed"

    :goto_2
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-static {v0, v1, v2, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :catchall_1
    move-exception p0

    const/4 v2, 0x0

    :goto_3
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    if-eqz v2, :cond_6

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->setEverFillSpecialTypeFlags()V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string v0, "cost(ms)"

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "media_scanner"

    const-string v1, "fill_special_type_flags"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_6
    if-eqz v2, :cond_7

    const-string p1, "succeed"

    goto :goto_4

    :cond_7
    const-string p1, "failed"

    :goto_4
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const-string v1, "MediaScanner"

    const-string v2, "fill special type flags [%s], costs [%d] ms"

    invoke-static {v1, v2, p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    throw p0
.end method

.method private static findAlbumByLocalPath(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;
    .locals 8

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v3, Lcom/miui/gallery/scanner/MediaScanner;->ALBUM_PROJECTION:[Ljava/lang/String;

    const-string v4, "(serverType=0) AND localFile = ? COLLATE NOCASE AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    const/4 p0, 0x1

    new-array v5, p0, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object p1, v5, v7

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p1, :cond_1

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    invoke-direct {v1, v0}, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;-><init>(Lcom/miui/gallery/scanner/MediaScanner$1;)V

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mID:J

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mServerID:Ljava/lang/String;

    const/4 p0, 0x2

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mDateModified:J

    const/4 p0, 0x3

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    iput p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mLocalFlag:I

    const/4 p0, 0x4

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mServerStatus:Ljava/lang/String;

    const/4 p0, 0x5

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAlbumName:Ljava/lang/String;

    const/4 p0, 0x6

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    iput p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAttributes:I

    const/4 p0, 0x7

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mEditedColumns:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v1

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v0

    :cond_1
    :try_start_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "query album cursor null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p0

    goto :goto_0

    :catchall_1
    move-exception p0

    move-object p1, v0

    :goto_0
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p0
.end method

.method private static findAlbumByName(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;
    .locals 8

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v3, Lcom/miui/gallery/scanner/MediaScanner;->ALBUM_PROJECTION:[Ljava/lang/String;

    const-string v4, "(serverType=0) AND fileName = ? COLLATE NOCASE AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    const/4 p0, 0x1

    new-array v5, p0, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object p1, v5, v7

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p1, :cond_1

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    invoke-direct {v1, v0}, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;-><init>(Lcom/miui/gallery/scanner/MediaScanner$1;)V

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mID:J

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mServerID:Ljava/lang/String;

    const/4 p0, 0x2

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mDateModified:J

    const/4 p0, 0x3

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    iput p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mLocalFlag:I

    const/4 p0, 0x4

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mServerStatus:Ljava/lang/String;

    const/4 p0, 0x5

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAlbumName:Ljava/lang/String;

    const/4 p0, 0x6

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    iput p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAttributes:I

    const/4 p0, 0x7

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mEditedColumns:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v1

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v0

    :cond_1
    :try_start_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "query album cursor null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p0

    goto :goto_0

    :catchall_1
    move-exception p0

    move-object p1, v0

    :goto_0
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p0
.end method

.method private static findAlbumByServerId(Landroid/content/Context;J)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;
    .locals 7

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v3, Lcom/miui/gallery/scanner/MediaScanner;->ALBUM_PROJECTION:[Ljava/lang/String;

    const-string v4, "serverId=?"

    const/4 p0, 0x1

    new-array v5, p0, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v5, p2

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p1, :cond_1

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    invoke-direct {v1, v0}, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;-><init>(Lcom/miui/gallery/scanner/MediaScanner$1;)V

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mID:J

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mServerID:Ljava/lang/String;

    const/4 p0, 0x2

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mDateModified:J

    const/4 p0, 0x3

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    iput p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mLocalFlag:I

    const/4 p0, 0x4

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mServerStatus:Ljava/lang/String;

    const/4 p0, 0x5

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAlbumName:Ljava/lang/String;

    const/4 p0, 0x6

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    iput p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAttributes:I

    const/4 p0, 0x7

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mEditedColumns:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v1

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v0

    :cond_1
    :try_start_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p2, "query album cursor null"

    invoke-direct {p0, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p0

    goto :goto_0

    :catchall_1
    move-exception p0

    move-object p1, v0

    :goto_0
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p0
.end method

.method private static generatorValuesForSpecialAlbum(Landroid/content/Context;Ljava/lang/String;)Landroid/content/ContentValues;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getCameraLocalFile()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getCameraRecordValues()Landroid/content/ContentValues;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getScreenshotsLocalFile()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getScreenshotsRecordValues()Landroid/content/ContentValues;

    move-result-object p0

    goto :goto_0

    :cond_1
    const-string v0, "MIUI/Gallery/cloud"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ExtraTextUtils;->startsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    new-instance p1, Landroid/content/ContentValues;

    invoke-direct {p1}, Landroid/content/ContentValues;-><init>()V

    const-wide/16 v0, 0x0

    invoke-static {p0}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_2

    const-wide/16 v0, 0x1

    :cond_2
    const-string p0, "attributes"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    move-object p0, p1

    goto :goto_0

    :cond_3
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method private static getIgnoreAlbumsFromCursor(Landroid/database/Cursor;Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p0, :cond_1

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->clear()V

    :cond_0
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->isInIgnoreList(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private static getServerReservedAlbumNamesStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;
    .locals 2

    sget-object v0, Lcom/miui/gallery/scanner/MediaScanner;->sLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/scanner/MediaScanner;->sServerReservedAlbumNamesStrategy:Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;

    if-nez v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getServerReservedAlbumNamesStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;

    move-result-object v1

    sput-object v1, Lcom/miui/gallery/scanner/MediaScanner;->sServerReservedAlbumNamesStrategy:Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;

    :cond_0
    sget-object v1, Lcom/miui/gallery/scanner/MediaScanner;->sServerReservedAlbumNamesStrategy:Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static getServerUnModifyAlbumsStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;
    .locals 2

    sget-object v0, Lcom/miui/gallery/scanner/MediaScanner;->sLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/scanner/MediaScanner;->sServerUnModifyAlbumsStrategy:Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;

    if-nez v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getServerUnModifyAlbumsStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;

    move-result-object v1

    sput-object v1, Lcom/miui/gallery/scanner/MediaScanner;->sServerUnModifyAlbumsStrategy:Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;

    :cond_0
    sget-object v1, Lcom/miui/gallery/scanner/MediaScanner;->sServerUnModifyAlbumsStrategy:Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static insertAlbum(Landroid/content/Context;Ljava/lang/String;Landroid/content/ContentValues;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;
    .locals 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-static/range {p0 .. p1}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->isOnlyLinkFileFolder(Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    return-object v5

    :cond_0
    invoke-static {v3}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->isInIgnoreList(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    return-object v5

    :cond_1
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    invoke-static {v3}, Lcom/miui/gallery/scanner/MediaScanner;->tryGetSystemAlbumServerId(Ljava/lang/String;)J

    move-result-wide v8

    new-instance v4, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    invoke-direct {v4, v5}, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;-><init>(Lcom/miui/gallery/scanner/MediaScanner$1;)V

    invoke-static {v3}, Lcom/miui/gallery/util/StorageUtils;->ensureCommonRelativePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getAlbumByPath(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;

    move-result-object v10

    const-wide/16 v15, 0x10

    const-wide/16 v17, 0x40

    const/4 v11, 0x1

    const/4 v12, 0x0

    const-wide/16 v21, 0x0

    if-eqz v10, :cond_6

    invoke-virtual {v10}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v23

    if-eqz v23, :cond_6

    invoke-virtual {v10}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getBestName()Ljava/lang/String;

    move-result-object v23

    int-to-long v13, v12

    invoke-virtual {v10}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isAutoUpload()Z

    move-result v26

    if-eqz v26, :cond_2

    const-wide/16 v24, 0x1

    goto :goto_0

    :cond_2
    move-wide/from16 v24, v21

    :goto_0
    or-long v13, v13, v24

    long-to-int v13, v13

    int-to-long v13, v13

    invoke-virtual {v10}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isInWhiteList()Z

    move-result v24

    if-eqz v24, :cond_3

    move-wide/from16 v17, v21

    :cond_3
    or-long v13, v13, v17

    long-to-int v13, v13

    int-to-long v13, v13

    invoke-virtual {v10}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isShowInPhotosTab()Z

    move-result v17

    if-eqz v17, :cond_4

    const-wide/16 v19, 0x4

    goto :goto_1

    :cond_4
    move-wide/from16 v19, v21

    :goto_1
    or-long v13, v13, v19

    long-to-int v13, v13

    int-to-long v13, v13

    invoke-virtual {v10}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v10

    invoke-virtual {v10}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isHide()Z

    move-result v10

    if-eqz v10, :cond_5

    move-wide/from16 v17, v15

    goto :goto_2

    :cond_5
    move-wide/from16 v17, v21

    :goto_2
    or-long v13, v13, v17

    long-to-int v10, v13

    :goto_3
    move v13, v10

    const/4 v10, 0x0

    goto :goto_7

    :cond_6
    invoke-static {v3}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->getAttributesByPath(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v10

    if-eqz v10, :cond_b

    int-to-long v13, v12

    invoke-virtual {v10}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isAutoUpload()Z

    move-result v23

    if-eqz v23, :cond_7

    const-wide/16 v24, 0x1

    goto :goto_4

    :cond_7
    move-wide/from16 v24, v21

    :goto_4
    or-long v13, v13, v24

    long-to-int v13, v13

    int-to-long v13, v13

    invoke-virtual {v10}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isInWhiteList()Z

    move-result v23

    if-eqz v23, :cond_8

    move-wide/from16 v17, v21

    :cond_8
    or-long v13, v13, v17

    long-to-int v13, v13

    int-to-long v13, v13

    invoke-virtual {v10}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isShowInPhotosTab()Z

    move-result v17

    if-eqz v17, :cond_9

    const-wide/16 v19, 0x4

    goto :goto_5

    :cond_9
    move-wide/from16 v19, v21

    :goto_5
    or-long v13, v13, v19

    long-to-int v13, v13

    int-to-long v13, v13

    invoke-virtual {v10}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isHide()Z

    move-result v10

    if-eqz v10, :cond_a

    move-wide/from16 v17, v15

    goto :goto_6

    :cond_a
    move-wide/from16 v17, v21

    :goto_6
    or-long v13, v13, v17

    long-to-int v10, v13

    move-object/from16 v23, v5

    goto :goto_3

    :cond_b
    int-to-long v13, v12

    or-long v13, v13, v17

    long-to-int v10, v13

    move-object/from16 v23, v5

    move v13, v10

    const/4 v10, 0x1

    :goto_7
    if-eqz v10, :cond_c

    invoke-static {v3}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->isInHideList(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_c

    int-to-long v13, v13

    or-long/2addr v13, v15

    long-to-int v13, v13

    :cond_c
    invoke-static/range {v23 .. v23}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_e

    sget-object v10, Lcom/miui/gallery/util/StorageUtils;->KEY_FOR_EMPTY_RELATIVE_PATH:Ljava/lang/String;

    invoke-virtual {v10, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_d

    const-string v23, "sdcard"

    goto :goto_8

    :cond_d
    invoke-static {v3}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    :cond_e
    :goto_8
    if-eqz v2, :cond_10

    const-string v10, "fileName"

    invoke-virtual {v2, v10}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_10

    const-string v10, "fileName"

    invoke-virtual {v2, v10}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v3}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_f

    const-string v10, "fileName"

    invoke-virtual {v2, v10}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    move-object/from16 v23, v10

    :cond_f
    const-string v10, "fileName"

    invoke-virtual {v2, v10}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    :cond_10
    move-object/from16 v10, v23

    cmp-long v14, v8, v21

    if-lez v14, :cond_12

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/scanner/MediaScanner;->getServerUnModifyAlbumsStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;

    move-result-object v14

    invoke-virtual {v14, v8, v9}, Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;->getServerAlbumName(J)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_11

    invoke-static {v0, v8}, Lcom/miui/gallery/scanner/MediaScanner;->findAlbumByName(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    move-result-object v8

    goto :goto_9

    :cond_11
    move-object v8, v5

    :goto_9
    if-eqz v8, :cond_14

    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    const-string v14, "fileName"

    iget-object v15, v8, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAlbumName:Ljava/lang/String;

    invoke-static {v0, v15}, Lcom/miui/gallery/scanner/MediaScanner;->renameAlbum(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v14, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v15, "_id=?"

    new-array v5, v11, [Ljava/lang/String;

    iget-wide v11, v8, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mID:J

    invoke-static {v11, v12}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    const/4 v11, 0x0

    aput-object v8, v5, v11

    invoke-static {v0, v14, v9, v15, v5}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_b

    :catch_0
    move-exception v0

    const-string v1, "MediaScanner"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v1, 0x0

    return-object v1

    :cond_12
    :try_start_1
    invoke-static {v0, v10}, Lcom/miui/gallery/scanner/MediaScanner;->checkAlbumNameConflict(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    if-eqz v5, :cond_13

    const/4 v5, 0x1

    goto :goto_a

    :cond_13
    const/4 v5, 0x0

    :goto_a
    if-eqz v5, :cond_14

    invoke-static {v0, v10}, Lcom/miui/gallery/scanner/MediaScanner;->renameAlbum(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v5, "MediaScanner"

    const-string v8, "album name conflict %s, rename %s"

    invoke-static {v5, v8, v3, v10}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_14

    const/4 v5, 0x0

    return-object v5

    :cond_14
    :goto_b
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    const-string v8, "fileName"

    invoke-virtual {v5, v8, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v8, "dateTaken"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v8, "localFile"

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v8, "serverType"

    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v5, v8, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v8, "localFlag"

    const/4 v9, 0x7

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v8, "attributes"

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-static {v0, v3}, Lcom/miui/gallery/scanner/MediaScanner;->generatorValuesForSpecialAlbum(Landroid/content/Context;Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v8

    if-eqz v8, :cond_15

    invoke-virtual {v5, v8}, Landroid/content/ContentValues;->putAll(Landroid/content/ContentValues;)V

    :cond_15
    if-eqz v2, :cond_16

    invoke-virtual {v5, v2}, Landroid/content/ContentValues;->putAll(Landroid/content/ContentValues;)V

    :cond_16
    invoke-static {v13}, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->isSyncable(I)Z

    move-result v2

    sget-object v8, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-virtual {v8}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v8

    const-string v9, "URI_PARAM_REQUEST_SYNC"

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v9, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-static {v0, v2, v5}, Lcom/miui/gallery/util/SafeDBUtil;->safeInsert(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_17

    const/4 v2, 0x0

    return-object v2

    :cond_17
    invoke-static {v0}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v8

    iput-wide v8, v4, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mID:J

    iget-wide v8, v4, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mID:J

    cmp-long v0, v8, v21

    if-gtz v0, :cond_18

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v0

    const-string v2, "path"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "media_scanner"

    const-string v2, "insert_album_error"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const/4 v1, 0x0

    return-object v1

    :cond_18
    iput-wide v6, v4, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mDateModified:J

    const/4 v0, 0x1

    iput-boolean v0, v4, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->isModified:Z

    iput v13, v4, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAttributes:I

    const/4 v0, 0x0

    iput-boolean v0, v4, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->isOnlyLinkFolder:Z

    invoke-static {v3}, Lcom/miui/gallery/cloud/DownloadPathHelper;->isShareFolderRelativePath(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, v4, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->isShareAlbum:Z

    return-object v4

    :catch_1
    move-exception v0

    move-object v1, v0

    const-string v0, "MediaScanner"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v1, 0x0

    return-object v1
.end method

.method public static isScannableDirectory(Ljava/io/File;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    new-instance v1, Ljava/io/File;

    const-string v2, ".nomedia"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "MediaScanner"

    const-string v2, "Directory [%s] contains .nomedia file, skip scan"

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, v2, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v0

    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->isHidden()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "MediaScanner"

    const-string v2, "Directory [%s] is hidden, skip scan"

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, v2, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v0

    :cond_2
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/miui/gallery/util/StorageUtils;->isInExternalStorage(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "MediaScanner"

    const-string v2, "Directory [%s] is in internal storage, skip scan"

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, v2, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v0

    :cond_3
    const/4 p0, 0x1

    return p0
.end method

.method public static isScannableDirectory(Ljava/lang/String;)Z
    .locals 1

    if-eqz p0, :cond_0

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/miui/gallery/scanner/MediaScanner;->isScannableDirectory(Ljava/io/File;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static synthetic lambda$cleanup$35(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;Landroid/content/Context;ZLcom/miui/gallery/provider/ContentProviderBatchOperator;Landroid/database/Cursor;)Ljava/lang/Integer;
    .locals 10

    const v0, 0x7fffffff

    if-eqz p5, :cond_9

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    invoke-interface {p5}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_7

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    invoke-interface {p0}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    const/4 v1, 0x0

    invoke-interface {p5, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    const/4 v2, 0x3

    invoke-interface {p5, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    const/4 v3, 0x7

    if-eq v2, v3, :cond_2

    const/16 v3, 0x8

    if-ne v2, v3, :cond_1

    goto :goto_1

    :cond_1
    if-nez v2, :cond_6

    int-to-long v3, v9

    move-object v1, p2

    move-object v2, p5

    move-object v5, p4

    move-object v6, v7

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/scanner/MediaScanner;->checkAndUpdateFileInfo(Landroid/content/Context;Landroid/database/Cursor;JLcom/miui/gallery/provider/ContentProviderBatchOperator;Ljava/util/ArrayList;)V

    goto :goto_2

    :cond_2
    :goto_1
    const/4 v2, 0x2

    invoke-interface {p5, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    int-to-long v3, v9

    invoke-virtual {p1, p2, v3, v4}, Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;->deleteForResult(Landroid/content/Context;J)Z

    move-result v1

    if-nez v1, :cond_3

    return-object v0

    :cond_3
    const-string v0, "MediaScanner"

    const-string v1, "delete %s"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    const/16 v1, 0xb

    const-string v5, "MediaScanner"

    invoke-direct {v0, v1, v2, v5}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_4
    if-nez p3, :cond_6

    invoke-static {v2, v1}, Lcom/miui/gallery/cloud/CloudUtils;->canUpload(Ljava/lang/String;Z)I

    move-result v1

    if-eqz v1, :cond_6

    int-to-long v3, v9

    invoke-virtual {p1, p2, v3, v4}, Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;->deleteForResult(Landroid/content/Context;J)Z

    move-result v1

    if-nez v1, :cond_5

    return-object v0

    :cond_5
    const-string v0, "MediaScanner"

    const-string v1, "delete couldn\'t upload items %s"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    const/16 v1, 0xc

    const-string v5, "MediaScanner"

    invoke-direct {v0, v1, v2, v5}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6
    :goto_2
    move v0, v9

    goto/16 :goto_0

    :cond_7
    invoke-static {v7}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p0

    if-eqz p0, :cond_8

    invoke-static {v7}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Ljava/util/Collection;)V

    :cond_8
    invoke-static {v8}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p0

    if-eqz p0, :cond_9

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->getInstance()Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    move-result-object p0

    invoke-virtual {p0, v8}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->onImageBatchDelete(Ljava/util/List;)V

    :cond_9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$refreshIgnoreList$36(Ljava/util/List;Landroid/database/Cursor;)Ljava/util/List;
    .locals 0

    invoke-static {p1, p0}, Lcom/miui/gallery/scanner/MediaScanner;->getIgnoreAlbumsFromCursor(Landroid/database/Cursor;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private static mapAttributeBit(Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;J)J
    .locals 7

    const-wide/16 v0, -0x1

    if-nez p0, :cond_0

    return-wide v0

    :cond_0
    const-wide/16 v2, 0x1

    cmp-long v4, p1, v2

    const-wide/16 v5, 0x0

    if-nez v4, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isAutoUpload()Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    move-wide v2, v5

    :goto_0
    return-wide v2

    :cond_2
    const-wide/16 v2, 0x4

    cmp-long v4, p1, v2

    if-nez v4, :cond_4

    invoke-virtual {p0}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isShowInPhotosTab()Z

    move-result p0

    if-eqz p0, :cond_3

    goto :goto_1

    :cond_3
    move-wide v2, v5

    :goto_1
    return-wide v2

    :cond_4
    const-wide/16 v2, 0x10

    cmp-long v4, p1, v2

    if-nez v4, :cond_6

    invoke-virtual {p0}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isHide()Z

    move-result p0

    if-eqz p0, :cond_5

    goto :goto_2

    :cond_5
    move-wide v2, v5

    :goto_2
    return-wide v2

    :cond_6
    const-wide/16 v2, 0x40

    cmp-long v4, p1, v2

    if-nez v4, :cond_8

    invoke-virtual {p0}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isInWhiteList()Z

    move-result p0

    if-eqz p0, :cond_7

    move-wide v2, v5

    :cond_7
    return-wide v2

    :cond_8
    return-wide v0
.end method

.method private static mergeAttribute(Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;JJ)J
    .locals 6

    invoke-static {p0, p3, p4}, Lcom/miui/gallery/scanner/MediaScanner;->mapAttributeBit(Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;J)J

    move-result-wide v0

    invoke-static {}, Lcom/miui/gallery/provider/AlbumManager;->getAlbumAttributes()Ljava/util/Map;

    move-result-object p0

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long p0, v0, v4

    if-ltz p0, :cond_1

    and-long v4, p1, v2

    cmp-long p0, v4, v2

    if-nez p0, :cond_0

    and-long/2addr p1, p3

    or-long/2addr p1, v2

    return-wide p1

    :cond_0
    return-wide v0

    :cond_1
    and-long v0, p1, v2

    and-long/2addr p1, p3

    or-long/2addr p1, v0

    return-wide p1
.end method

.method private static prescan(Landroid/content/Context;)V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->isAlbumPruneProtected()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v1, "_id IN (SELECT _id FROM ((SELECT _id, localFlag FROM cloud WHERE serverType=0) AS Album LEFT JOIN (SELECT localGroupId, count(_id) AS media_count FROM cloud WHERE serverType!=0 GROUP BY localGroupId) AS MediaCount ON Album._id=MediaCount.localGroupId) WHERE localFlag=7 AND (media_count IS NULL OR media_count=0))"

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lcom/miui/gallery/util/SafeDBUtil;->safeDelete(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0

    const-string v0, "MediaScanner"

    const-string v1, "delete empty albums %d"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {v0, v1, p0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private static queryAndUpdateAlbum(Landroid/content/Context;Ljava/lang/String;Landroid/content/ContentValues;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;
    .locals 11

    invoke-static {p0, p1}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const-string p0, "MediaScanner"

    const-string p2, "Couldn\'t get relative path from %s"

    invoke-static {p0, p2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v2

    :cond_0
    :try_start_0
    invoke-static {v0}, Lcom/miui/gallery/scanner/MediaScanner;->tryGetSystemAlbumServerId(Ljava/lang/String;)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-lez v1, :cond_1

    invoke-static {p0, v3, v4}, Lcom/miui/gallery/scanner/MediaScanner;->findAlbumByServerId(Landroid/content/Context;J)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    move-result-object v1

    goto :goto_0

    :cond_1
    invoke-static {p0, v0}, Lcom/miui/gallery/scanner/MediaScanner;->findAlbumByLocalPath(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    if-eqz v1, :cond_4

    invoke-static {v0}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->isOnlyLinkFileFolder(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->isOnlyLinkFolder:Z

    invoke-static {v0}, Lcom/miui/gallery/cloud/DownloadPathHelper;->isShareFolderRelativePath(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->isShareAlbum:Z

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v7

    iget-wide v9, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mDateModified:J

    cmp-long p1, v9, v7

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    goto :goto_1

    :cond_2
    const/4 p1, 0x0

    :goto_1
    iput-boolean p1, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->isModified:Z

    iput-wide v7, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mDateModified:J

    cmp-long p1, v3, v5

    if-gtz p1, :cond_3

    invoke-static {p0, v1, v0, p2}, Lcom/miui/gallery/scanner/MediaScanner;->updateAlbumByServerConfig(Landroid/content/Context;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;Ljava/lang/String;Landroid/content/ContentValues;)V

    goto :goto_2

    :cond_3
    if-eqz p2, :cond_4

    invoke-static {p0, v3, v4, p2}, Lcom/miui/gallery/scanner/MediaScanner;->updateSystemAlbumConfig(Landroid/content/Context;JLandroid/content/ContentValues;)V

    :cond_4
    :goto_2
    return-object v1

    :catch_0
    move-exception p0

    const-string p1, "MediaScanner"

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v2
.end method

.method private static queryOrInsertAlbum(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;
    .locals 2

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/scanner/MediaScanner;->queryAndUpdateAlbum(Landroid/content/Context;Ljava/lang/String;Landroid/content/ContentValues;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/scanner/MediaScanner;->insertAlbum(Landroid/content/Context;Ljava/lang/String;Landroid/content/ContentValues;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    move-result-object v1

    :cond_0
    return-object v1
.end method

.method private static recordHiddenAlbum(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "album_relative_path"

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "media_scanner"

    const-string v1, "scanner_directory_regard_as_hidden"

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static refreshIgnoreList(Landroid/content/Context;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V
    .locals 19

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->getLastRefreshedIgnoreListVersion()I

    move-result v0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getIgnoreAlbumVersion()I

    move-result v1

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const-string v10, "serverType=? AND attributes&64=64 AND _id>?"

    const-wide/16 v3, 0x0

    const/16 v11, 0x3e8

    const/4 v12, 0x0

    move-wide v13, v3

    const/4 v15, 0x0

    :cond_1
    if-eqz p1, :cond_2

    invoke-interface/range {p1 .. p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_2

    return-void

    :cond_2
    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {v3, v11}, Lcom/miui/gallery/util/UriUtil;->appendLimit(Landroid/net/Uri;I)Landroid/net/Uri;

    move-result-object v4

    const-string v3, "_id"

    const-string v5, "localFile"

    filled-new-array {v3, v5}, [Ljava/lang/String;

    move-result-object v5

    const/4 v9, 0x2

    new-array v7, v9, [Ljava/lang/String;

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v7, v12

    invoke-static {v13, v14}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    const/16 v16, 0x1

    aput-object v3, v7, v16

    const-string v8, "_id ASC"

    new-instance v6, Lcom/miui/gallery/scanner/-$$Lambda$MediaScanner$X1f395-b7ELOUzKOhbi0pjUOyMc;

    invoke-direct {v6, v2}, Lcom/miui/gallery/scanner/-$$Lambda$MediaScanner$X1f395-b7ELOUzKOhbi0pjUOyMc;-><init>(Ljava/util/List;)V

    move-object/from16 v3, p0

    move-object/from16 v17, v6

    move-object v6, v10

    const/16 v18, 0x2

    move-object/from16 v9, v17

    invoke-static/range {v3 .. v9}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    add-int/2addr v15, v4

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sget-object v6, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v7, "(localGroupId IN (?) AND serverType!=?) OR (_id IN (?) AND serverType=?)"

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/String;

    const-string v9, ","

    invoke-static {v9, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v16

    const-string v9, ","

    invoke-static {v9, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v18

    const/4 v9, 0x3

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v8, v9

    move-object/from16 v9, p0

    invoke-static {v9, v6, v7, v8}, Lcom/miui/gallery/util/SafeDBUtil;->safeDelete(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    new-instance v6, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    const/16 v7, 0xf

    const-string v8, ";"

    invoke-static {v8, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v8

    const-string v13, "MediaScanner"

    invoke-direct {v6, v7, v8, v13}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-static {v6}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Lcom/miui/gallery/util/deleterecorder/DeleteRecord;)V

    move-wide v13, v4

    goto :goto_0

    :cond_3
    move-object/from16 v9, p0

    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-gtz v3, :cond_1

    if-lez v15, :cond_4

    const-string v2, "MediaScanner"

    const-string v3, "refresh %d ignore albums, cost %d ms"

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v0

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3, v4, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_4
    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getIgnoreAlbumVersion()I

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->setLastRefreshedIgnoreListVersion(I)V

    return-void
.end method

.method private static renameAlbum(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/miui/gallery/scanner/MediaScanner;->checkAlbumNameConflict(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x3

    if-eqz v2, :cond_1

    add-int/lit8 v2, v0, 0x1

    if-lt v0, v3, :cond_0

    move v0, v2

    goto :goto_1

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    :goto_1
    if-lt v0, v3, :cond_2

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "_"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_2
    return-object v1
.end method

.method public static scanDirectories(Landroid/content/Context;Ljava/util/List;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;ZZ)I
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miui/gallery/threadpool/ThreadPool$JobContext;",
            "ZZ)I"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_2

    :cond_0
    invoke-static {p0}, Lcom/miui/gallery/scanner/MediaScanner;->prescan(Landroid/content/Context;)V

    if-eqz p2, :cond_1

    invoke-interface {p2}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_1

    return v0

    :cond_1
    new-instance v1, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;

    invoke-direct {v1, v0}, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;-><init>(Z)V

    new-instance v8, Lcom/miui/gallery/provider/ContentProviderBatchOperator;

    const-string v2, "com.miui.gallery.cloud.provider"

    invoke-direct {v8, v2}, Lcom/miui/gallery/provider/ContentProviderBatchOperator;-><init>(Ljava/lang/String;)V

    new-instance v9, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;

    new-instance v10, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, v10

    move v3, p4

    move-object v4, v1

    move-object v5, v8

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;-><init>(ZLcom/miui/gallery/scanner/MediaBulkInserter;Lcom/miui/gallery/provider/ContentProviderBatchOperator;ZZ)V

    invoke-direct {v9, v10, p2}, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;-><init>(Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V

    :goto_0
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p4

    if-ge v0, p4, :cond_4

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    if-eqz p2, :cond_2

    invoke-interface {p2}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_2

    invoke-virtual {v1, p0}, Lcom/miui/gallery/scanner/MediaBulkInserter;->flush(Landroid/content/Context;)V

    invoke-virtual {v8, p0}, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->apply(Landroid/content/Context;)V

    return v0

    :cond_2
    :try_start_1
    invoke-static {p4}, Lcom/miui/gallery/scanner/MediaScanner;->isScannableDirectory(Ljava/lang/String;)Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v2, :cond_3

    goto :goto_1

    :cond_3
    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, p0, v4, p3}, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->scanFolder(Landroid/content/Context;Ljava/io/File;Z)V

    const-string v4, "MediaScanner"

    const-string v5, "scan folder [%s] costs [%d]"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const/4 v10, 0x0

    sub-long/2addr v6, v2

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v4, v5, p4, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v2

    :try_start_3
    const-string v3, "MediaScanner"

    const-string v4, "scan folder %s %s"

    invoke-static {v3, v4, p4, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    invoke-virtual {v1, p0}, Lcom/miui/gallery/scanner/MediaBulkInserter;->flush(Landroid/content/Context;)V

    invoke-virtual {v8, p0}, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->apply(Landroid/content/Context;)V

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p0

    return p0

    :catchall_0
    move-exception p1

    invoke-virtual {v1, p0}, Lcom/miui/gallery/scanner/MediaBulkInserter;->flush(Landroid/content/Context;)V

    invoke-virtual {v8, p0}, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->apply(Landroid/content/Context;)V

    throw p1

    :cond_5
    :goto_2
    return v0
.end method

.method public static scanFiles(Landroid/content/Context;Ljava/util/List;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)I
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miui/gallery/threadpool/ThreadPool$JobContext;",
            ")I"
        }
    .end annotation

    move-object/from16 v1, p0

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    const/4 v3, 0x0

    if-nez v0, :cond_0

    return v3

    :cond_0
    if-eqz p2, :cond_1

    invoke-interface/range {p2 .. p2}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    return v3

    :cond_1
    invoke-static/range {p0 .. p0}, Lcom/miui/gallery/scanner/MediaScanner;->prescan(Landroid/content/Context;)V

    new-instance v10, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;

    invoke-direct {v10, v3}, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;-><init>(Z)V

    new-instance v11, Lcom/miui/gallery/provider/ContentProviderBatchOperator;

    const-string v0, "com.miui.gallery.cloud.provider"

    invoke-direct {v11, v0}, Lcom/miui/gallery/provider/ContentProviderBatchOperator;-><init>(Ljava/lang/String;)V

    new-instance v12, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;

    const/4 v5, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v4, v12

    move-object v6, v10

    move-object v7, v11

    invoke-direct/range {v4 .. v9}, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;-><init>(ZLcom/miui/gallery/scanner/MediaBulkInserter;Lcom/miui/gallery/provider/ContentProviderBatchOperator;ZZ)V

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    :try_start_0
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v0

    const-wide/16 v7, 0x21

    const/4 v9, 0x1

    if-ge v5, v0, :cond_12

    if-eqz p2, :cond_3

    invoke-interface/range {p2 .. p2}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz v6, :cond_2

    new-instance v0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object v2, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, v7, v8}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, v9}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setDelayUpload(Z)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    invoke-virtual {v10, v1}, Lcom/miui/gallery/scanner/MediaBulkInserter;->flush(Landroid/content/Context;)V

    invoke-virtual {v11, v1}, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->apply(Landroid/content/Context;)V

    return v5

    :cond_3
    move-object/from16 v13, p1

    :try_start_1
    invoke-interface {v13, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto/16 :goto_3

    :cond_4
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_10

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v8

    if-nez v8, :cond_5

    goto/16 :goto_3

    :cond_5
    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_6

    goto/16 :goto_3

    :cond_6
    invoke-static {v7}, Lcom/miui/gallery/util/FileMimeUtil;->getSupportUploadMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/miui/gallery/util/FileMimeUtil;->isImageFromMimeType(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_7

    invoke-static {v8}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_7

    const-string v0, "MediaScanner"

    const-string v9, "Unsupported MimeType: [%s], path: [%s]"

    invoke-static {v0, v9, v8, v7}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_3

    :cond_7
    invoke-static {v1, v0}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->isOnlyLinkFileFolder(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8

    goto/16 :goto_3

    :cond_8
    invoke-static {v0}, Lcom/miui/gallery/scanner/MediaScanner;->isScannableDirectory(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_9

    const-string v7, "MediaScanner"

    const-string v8, "Album directory is hidden or contains \".nomedia\" file: [%s]"

    invoke-static {v7, v8, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_3

    :cond_9
    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    if-nez v8, :cond_b

    invoke-static {v1, v0}, Lcom/miui/gallery/scanner/MediaScanner;->queryOrInsertAlbum(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    move-result-object v8

    if-nez v8, :cond_a

    const-string v7, "MediaScanner"

    const-string v8, "album query failed or insert ignored: [%s]"

    invoke-static {v7, v8, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    :cond_a
    invoke-virtual {v4, v0, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b
    iget-boolean v0, v8, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->isModified:Z

    if-eqz v0, :cond_c

    invoke-static {v8}, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->shouldScan(Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    goto :goto_1

    :cond_c
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_11

    :try_start_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v1, v0, v8}, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->scanFile(Landroid/content/Context;Ljava/io/File;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)J

    move-result-wide v14

    const-wide/16 v16, -0x1

    cmp-long v0, v16, v14

    if-nez v0, :cond_d

    const-string v0, "MediaScanner"

    const-string v3, "scan [%s] fail"

    invoke-static {v0, v3, v7}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_d
    const-wide/16 v16, 0x0

    cmp-long v0, v14, v16

    if-gtz v0, :cond_e

    const-wide/16 v18, -0x4

    cmp-long v0, v18, v14

    if-eqz v0, :cond_e

    const-wide/16 v18, -0x7

    cmp-long v0, v18, v14

    if-nez v0, :cond_11

    :cond_e
    iget v0, v8, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAttributes:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    int-to-long v7, v0

    const-wide/16 v14, 0x1

    and-long/2addr v7, v14

    cmp-long v0, v7, v16

    if-eqz v0, :cond_f

    goto :goto_2

    :cond_f
    const/4 v9, 0x0

    :goto_2
    or-int v0, v6, v9

    move v6, v0

    goto :goto_3

    :catch_0
    move-exception v0

    :try_start_3
    const-string v3, "MediaScanner"

    const-string v8, "scan file [%s] failed with exception: [%s]"

    invoke-static {v3, v8, v7, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_3

    :cond_10
    invoke-static {v1, v7}, Lcom/miui/gallery/scanner/MediaScanner;->cleanFile(Landroid/content/Context;Ljava/lang/String;)V

    :cond_11
    :goto_3
    add-int/lit8 v5, v5, 0x1

    const/4 v3, 0x0

    goto/16 :goto_0

    :cond_12
    move-object/from16 v13, p1

    invoke-virtual {v10, v1}, Lcom/miui/gallery/scanner/MediaBulkInserter;->flush(Landroid/content/Context;)V

    if-eqz v6, :cond_13

    new-instance v0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object v2, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, v7, v8}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, v9}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setDelayUpload(Z)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_13
    invoke-virtual {v10, v1}, Lcom/miui/gallery/scanner/MediaBulkInserter;->flush(Landroid/content/Context;)V

    invoke-virtual {v11, v1}, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->apply(Landroid/content/Context;)V

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v0

    return v0

    :catchall_0
    move-exception v0

    invoke-virtual {v10, v1}, Lcom/miui/gallery/scanner/MediaBulkInserter;->flush(Landroid/content/Context;)V

    invoke-virtual {v11, v1}, Lcom/miui/gallery/provider/ContentProviderBatchOperator;->apply(Landroid/content/Context;)V

    throw v0
.end method

.method public static scanSingleFile(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/scanner/MediaScanner;->doScanSingleFile(Landroid/content/Context;Ljava/lang/String;Z)V

    return-void
.end method

.method static scanSingleFileForExternal(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/scanner/MediaScanner;->doScanSingleFile(Landroid/content/Context;Ljava/lang/String;Z)V

    return-void
.end method

.method private static scannerCorrectLogic(Landroid/content/Context;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V
    .locals 20

    move-object/from16 v0, p0

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->isSecretAlbumFeatureOpen()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getSyncCompletelyFinish()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->isEverRestoreSecretItems()Z

    move-result v1

    if-nez v1, :cond_7

    invoke-interface/range {p1 .. p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    sget-object v1, Lcom/miui/gallery/util/StorageUtils;->DIRECTORY_SECRET_ALBUM_PATH:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/miui/gallery/util/StorageUtils;->getPathsInExternalStorage(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    array-length v2, v1

    if-lez v2, :cond_5

    const-string v2, "^[0-9a-zA-Z]+$"

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/scanner/MediaScanner$2;

    move-object/from16 v4, p1

    invoke-direct {v3, v4, v2}, Lcom/miui/gallery/scanner/MediaScanner$2;-><init>(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;Ljava/util/regex/Pattern;)V

    array-length v2, v1

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v2, :cond_6

    aget-object v7, v1, v6

    invoke-interface/range {p1 .. p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v8

    if-eqz v8, :cond_1

    return-void

    :cond_1
    invoke-static {v7}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v3}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v7

    if-eqz v7, :cond_4

    array-length v8, v7

    const/4 v9, 0x0

    :goto_1
    if-ge v9, v8, :cond_4

    aget-object v18, v7, v9

    invoke-interface/range {p1 .. p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v10

    if-eqz v10, :cond_2

    return-void

    :cond_2
    const-string v10, "MediaScanner"

    const-string v11, "secret item %s"

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v15, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;

    const-wide/16 v12, -0x3e8

    const/4 v14, 0x1

    const/16 v16, 0x8

    const/16 v17, 0x1

    const/16 v19, 0x1

    move-object v10, v15

    move-object/from16 v11, v18

    move-object v5, v15

    move/from16 v15, v16

    move/from16 v16, v17

    move/from16 v17, v19

    invoke-direct/range {v10 .. v17}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;-><init>(Ljava/io/File;JZIZZ)V

    invoke-static {v0, v5}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->saveToCloudDB(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)J

    move-result-wide v10

    const-wide/16 v12, 0x0

    cmp-long v5, v10, v12

    if-lez v5, :cond_3

    const-string v5, "MediaScanner"

    const-string v10, "secret item restore %s"

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-static {v5, v10, v11}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_5
    move-object/from16 v4, p1

    :cond_6
    invoke-interface/range {p1 .. p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_7

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->setHasRestoredSecretItems()V

    :cond_7
    return-void
.end method

.method private static tryGetSystemAlbumServerId(Ljava/lang/String;)J
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getCameraLocalFile()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, 0x1

    return-wide v0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getScreenshotsLocalFile()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    const-wide/16 v0, 0x2

    return-wide v0

    :cond_1
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method private static tryRenameConflictAlbums(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 9

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v3, Lcom/miui/gallery/scanner/MediaScanner;->ALBUM_PROJECTION:[Ljava/lang/String;

    const-string v4, "(serverType=0) AND fileName = ? COLLATE NOCASE AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    const/4 v7, 0x1

    new-array v5, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object p1, v5, v8

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_4

    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    const-wide/16 v4, 0x1

    cmp-long v0, v2, v4

    if-eqz v0, :cond_2

    const-wide/16 v4, 0x2

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x3

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-interface {v1, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    const-string v5, "fileName"

    invoke-static {p0, p1}, Lcom/miui/gallery/scanner/MediaScanner;->renameAlbum(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v0, :cond_1

    const-string v0, "localFlag"

    const/16 v5, 0xa

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v0, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :cond_1
    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v5, "_id=?"

    new-array v6, v7, [Ljava/lang/String;

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v6, v8

    invoke-static {p0, v0, v4, v5, v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    const-string v0, "MediaScanner"

    const-string v2, "Rename conflict album according to server config file: %s"

    invoke-static {v0, v2, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :cond_2
    :goto_1
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return v8

    :cond_3
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return v7

    :cond_4
    :try_start_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "query album cursor null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p0

    goto :goto_2

    :catchall_1
    move-exception p0

    move-object v1, v0

    :goto_2
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p0
.end method

.method private static updateAlbumByServerConfig(Landroid/content/Context;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    if-nez v1, :cond_0

    return-void

    :cond_0
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    sget-object v5, Lcom/miui/gallery/util/StorageUtils;->KEY_FOR_EMPTY_RELATIVE_PATH:Ljava/lang/String;

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string v5, "sdcard"

    goto :goto_0

    :cond_1
    invoke-static/range {p2 .. p2}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :goto_0
    const/4 v6, 0x1

    if-eqz v3, :cond_2

    const-string v8, "fileName"

    invoke-virtual {v3, v8}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    const-string v8, "fileName"

    invoke-virtual {v3, v8}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2

    const/4 v8, 0x1

    goto :goto_1

    :cond_2
    const/4 v8, 0x0

    :goto_1
    invoke-static/range {p2 .. p2}, Lcom/miui/gallery/util/StorageUtils;->ensureCommonRelativePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getAlbumByPath(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;

    move-result-object v9

    const/16 v10, 0xa

    if-eqz v9, :cond_e

    invoke-virtual {v9}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v13

    if-eqz v13, :cond_3

    const/4 v13, 0x0

    goto :goto_2

    :cond_3
    const/4 v13, 0x1

    :goto_2
    invoke-virtual {v9}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v14

    if-eqz v14, :cond_4

    invoke-virtual {v9}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v14

    invoke-virtual {v14}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isManualRenameRestricted()Z

    move-result v14

    if-eqz v14, :cond_4

    const/4 v14, 0x1

    goto :goto_3

    :cond_4
    const/4 v14, 0x0

    :goto_3
    if-nez v8, :cond_5

    iget-object v15, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAlbumName:Ljava/lang/String;

    invoke-virtual {v5, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_5

    if-eqz v14, :cond_d

    :cond_5
    const/4 v5, 0x0

    if-eqz v14, :cond_6

    invoke-virtual {v9}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getBestName()Ljava/lang/String;

    move-result-object v5

    :cond_6
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-eqz v15, :cond_7

    if-eqz v8, :cond_7

    const-string v5, "fileName"

    invoke-virtual {v3, v5}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_7
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_8

    invoke-virtual {v9}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getBestName()Ljava/lang/String;

    move-result-object v5

    :cond_8
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_d

    iget-object v8, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAlbumName:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_9

    iget-object v8, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAlbumName:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_d

    iget-object v8, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAlbumName:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "_"

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_d

    :cond_9
    const-string v7, "MediaScanner"

    const-string v8, "Rename album according to server config file: %s"

    invoke-static {v7, v8, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v0, v5}, Lcom/miui/gallery/scanner/MediaScanner;->checkAlbumNameConflict(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    if-eqz v7, :cond_b

    if-eqz v14, :cond_a

    const/4 v8, 0x2

    if-eq v7, v8, :cond_a

    invoke-static {v0, v5}, Lcom/miui/gallery/scanner/MediaScanner;->tryRenameConflictAlbums(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_b

    invoke-static {v0, v5}, Lcom/miui/gallery/scanner/MediaScanner;->renameAlbum(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_4

    :cond_a
    invoke-static {v0, v5}, Lcom/miui/gallery/scanner/MediaScanner;->renameAlbum(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_b
    :goto_4
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_d

    iget v7, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mLocalFlag:I

    if-nez v7, :cond_c

    const-string v7, "localFlag"

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :cond_c
    const-string v7, "fileName"

    invoke-virtual {v4, v7, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_d
    invoke-static {}, Lcom/miui/gallery/provider/AlbumManager;->getAlbumAttributes()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const-wide/16 v7, 0x0

    :goto_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_15

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    invoke-virtual {v9}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v14

    iget v15, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAttributes:I

    int-to-long v11, v15

    move-object/from16 v16, v9

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    invoke-static {v14, v11, v12, v9, v10}, Lcom/miui/gallery/scanner/MediaScanner;->mergeAttribute(Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;JJ)J

    move-result-wide v9

    or-long/2addr v7, v9

    move-object/from16 v9, v16

    goto :goto_5

    :cond_e
    if-eqz v8, :cond_12

    const-string v5, "fileName"

    invoke-virtual {v3, v5}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_12

    iget-object v7, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAlbumName:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_f

    iget-object v7, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAlbumName:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_12

    iget-object v7, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAlbumName:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "_"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_12

    :cond_f
    const-string v7, "MediaScanner"

    const-string v8, "Rename album according to override values: %s"

    invoke-static {v7, v8, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v0, v5}, Lcom/miui/gallery/scanner/MediaScanner;->checkAlbumNameConflict(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    if-eqz v7, :cond_10

    invoke-static {v0, v5}, Lcom/miui/gallery/scanner/MediaScanner;->renameAlbum(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_10
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_12

    iget v7, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mLocalFlag:I

    if-nez v7, :cond_11

    const-string v7, "localFlag"

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :cond_11
    const-string v7, "fileName"

    invoke-virtual {v4, v7, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_12
    invoke-static/range {p2 .. p2}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->getAttributesByPath(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v5

    if-eqz v5, :cond_14

    invoke-static {}, Lcom/miui/gallery/provider/AlbumManager;->getAlbumAttributes()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    const-wide/16 v8, 0x0

    :goto_6
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_13

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    iget v11, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAttributes:I

    int-to-long v11, v11

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    invoke-static {v5, v11, v12, v13, v14}, Lcom/miui/gallery/scanner/MediaScanner;->mergeAttribute(Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;JJ)J

    move-result-wide v10

    or-long/2addr v8, v10

    goto :goto_6

    :cond_13
    move-wide v7, v8

    const/4 v13, 0x0

    goto :goto_7

    :cond_14
    iget v5, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAttributes:I

    int-to-long v7, v5

    const/4 v13, 0x1

    :cond_15
    :goto_7
    if-eqz v13, :cond_18

    const-wide/16 v9, 0x10

    and-long v11, v7, v9

    const-wide/16 v13, 0x0

    cmp-long v5, v11, v13

    if-eqz v5, :cond_16

    const/4 v5, 0x1

    goto :goto_8

    :cond_16
    const/4 v5, 0x0

    :goto_8
    if-nez v5, :cond_18

    const-wide/16 v11, 0x20

    and-long/2addr v11, v7

    cmp-long v5, v11, v13

    if-eqz v5, :cond_17

    const/4 v5, 0x1

    goto :goto_9

    :cond_17
    const/4 v5, 0x0

    :goto_9
    if-nez v5, :cond_18

    invoke-static/range {p2 .. p2}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->isInHideList(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_18

    const-string v5, "MediaScanner"

    const-string v11, "update server config file: %s, set album as hidden."

    invoke-static {v5, v11, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    or-long/2addr v7, v9

    :cond_18
    iget v5, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAttributes:I

    int-to-long v9, v5

    cmp-long v5, v7, v9

    if-eqz v5, :cond_19

    const-string v5, "MediaScanner"

    const-string v9, "update server config file: %s, attributes: %s"

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-static {v5, v9, v2, v10}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v5, "attributes"

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :cond_19
    if-eqz v3, :cond_1a

    invoke-virtual/range {p3 .. p3}, Landroid/content/ContentValues;->size()I

    move-result v5

    if-lez v5, :cond_1a

    const-string v5, "fileName"

    invoke-virtual {v3, v5}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Landroid/content/ContentValues;->putAll(Landroid/content/ContentValues;)V

    const-string v5, "MediaScanner"

    const-string v7, "Override config for: [%s], values: [%s]"

    invoke-static {v5, v7, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1a
    invoke-virtual {v4}, Landroid/content/ContentValues;->size()I

    move-result v2

    if-lez v2, :cond_1c

    const-string v2, "attributes"

    invoke-virtual {v4, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1b

    const-string v2, "attributes"

    invoke-virtual {v4, v2}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iget v5, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAttributes:I

    int-to-long v7, v5

    cmp-long v5, v2, v7

    if-eqz v5, :cond_1b

    iget-object v2, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mEditedColumns:Ljava/lang/String;

    const/16 v3, 0x44

    invoke-static {v3}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->transformToEditedColumnsElement(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->mergeEditedColumns(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "editedColumns"

    invoke-virtual {v4, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1b
    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v3, "_id=?"

    new-array v5, v6, [Ljava/lang/String;

    iget-wide v6, v1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mID:J

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    const/4 v6, 0x0

    aput-object v1, v5, v6

    invoke-static {v0, v2, v4, v3, v5}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_1c
    return-void
.end method

.method private static updateAlbumDateModified(Landroid/content/Context;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)V
    .locals 6

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "dateModified"

    iget-wide v2, p1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mDateModified:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v2, "_id=?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    iget-wide v4, p1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mID:J

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {p0, v1, v0, v2, v3}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method public static updateOrInsertAlbum(Landroid/content/Context;Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 1

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/scanner/MediaScanner;->queryAndUpdateAlbum(Landroid/content/Context;Ljava/lang/String;Landroid/content/ContentValues;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/scanner/MediaScanner;->insertAlbum(Landroid/content/Context;Ljava/lang/String;Landroid/content/ContentValues;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    :cond_0
    return-void
.end method

.method private static updateSystemAlbumConfig(Landroid/content/Context;JLandroid/content/ContentValues;)V
    .locals 5

    const-string v0, "fileName"

    invoke-virtual {p3, v0}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    invoke-virtual {p3}, Landroid/content/ContentValues;->size()I

    move-result v0

    if-lez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v1, "serverId=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {p0, v0, p3, v1, v2}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    const-string p0, "MediaScanner"

    const-string v0, "Override config for system album: %s, values: %s"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p0, v0, p1, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
