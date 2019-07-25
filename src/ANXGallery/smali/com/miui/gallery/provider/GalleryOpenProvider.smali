.class public Lcom/miui/gallery/provider/GalleryOpenProvider;
.super Landroid/content/ContentProvider;
.source "GalleryOpenProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;
    }
.end annotation


# static fields
.field private static final CLOUD_COLUMNS:[Ljava/lang/String;

.field private static final MEDIA_COLUMNS:[Ljava/lang/String;

.field private static final NEED_RETURN_CONTENT_URI_SYSTEM_APPS:[Ljava/lang/String;

.field private static final PRIVACY_COLUMNS:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "GalleryOpenProvider"


# instance fields
.field private mCacheDB:Landroid/database/sqlite/SQLiteDatabase;

.field private mDatabase:Landroid/database/sqlite/SQLiteDatabase;

.field private mUriMatcher:Landroid/content/UriMatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 31

    const-string v0, "com.android.bluetooth"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/GalleryOpenProvider;->NEED_RETURN_CONTENT_URI_SYSTEM_APPS:[Ljava/lang/String;

    const-string v1, "_id"

    const-string v2, "serverType"

    const-string v3, "exifGPSLatitude"

    const-string v4, "exifGPSLatitudeRef"

    const-string v5, "exifGPSLongitude"

    const-string v6, "exifGPSLongitudeRef"

    const-string v7, "dateTaken"

    const-string v8, "exifOrientation"

    const-string v9, "localGroupId"

    const-string v10, "microthumbfile"

    const-string v11, "thumbnailFile"

    const-string v12, "localFile"

    const-string v13, "size"

    const-string v14, "fileName"

    const-string v15, "title"

    const-string v16, "dateModified"

    const-string v17, "mimeType"

    const-string v18, "exifImageWidth"

    const-string v19, "exifImageLength"

    const-string v20, "duration"

    filled-new-array/range {v1 .. v20}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/GalleryOpenProvider;->CLOUD_COLUMNS:[Ljava/lang/String;

    const-string v1, "_id"

    const-string v2, "_data"

    const-string v3, "_size"

    const-string v4, "_display_name"

    const-string v5, "title"

    const-string v6, "date_added"

    const-string v7, "date_modified"

    const-string v8, "mime_type"

    const-string v9, "width"

    const-string v10, "height"

    const-string v11, "description"

    const-string v12, "picasa_id"

    const-string v13, "isprivate"

    const-string v14, "latitude"

    const-string v15, "longitude"

    const-string v16, "datetaken"

    const-string v17, "orientation"

    const-string v18, "mini_thumb_magic"

    const-string v19, "bucket_id"

    const-string v20, "bucket_display_name"

    const-string v21, "bookmark"

    const-string v22, "album"

    const-string v23, "artist"

    const-string v24, "category"

    const-string v25, "duration"

    const-string v26, "language"

    const-string v27, "resolution"

    const-string v28, "tags"

    const-string v29, "mini_thumb_data"

    const-string v30, "media_type"

    filled-new-array/range {v1 .. v30}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/GalleryOpenProvider;->MEDIA_COLUMNS:[Ljava/lang/String;

    const-string v0, "latitude"

    const-string v1, "longitude"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/GalleryOpenProvider;->PRIVACY_COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->mUriMatcher:Landroid/content/UriMatcher;

    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/miui/gallery/provider/GalleryOpenProvider;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    return-object p0
.end method

.method static synthetic access$300()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/GalleryOpenProvider;->MEDIA_COLUMNS:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Landroid/content/ContentValues;)Landroid/content/ContentValues;
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/provider/GalleryOpenProvider;->filterPrivateColumns(Landroid/content/ContentValues;)Landroid/content/ContentValues;

    move-result-object p0

    return-object p0
.end method

.method private static filterPrivateColumns(Landroid/content/ContentValues;)Landroid/content/ContentValues;
    .locals 4

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0, p0}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    sget-object p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->PRIVACY_COLUMNS:[Ljava/lang/String;

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p0, v2

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private initialize()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.open"

    const-string v2, "raw/*"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method private static isNeedReturnContentUriApp(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 5

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/GalleryOpenProvider;->isSystemApp(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    const/4 v0, 0x1

    if-nez p0, :cond_0

    return v0

    :cond_0
    sget-object p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->NEED_RETURN_CONTENT_URI_SYSTEM_APPS:[Ljava/lang/String;

    array-length v1, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v4, p0, v3

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    return v0

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v2
.end method

.method private static isSystemApp(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-object p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    const-string p1, "no package name"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    :try_start_0
    invoke-virtual {p0, p1, v1}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    const/4 v0, 0x1

    if-eqz p0, :cond_1

    iget p0, p0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/2addr p0, v0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    if-eqz p0, :cond_2

    sget-object p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    const-string v2, "system app: %s"

    invoke-static {p0, v2, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception p0

    sget-object v0, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    sget-object p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    const-string v0, "data app: %s"

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v1
.end method

.method public static needReturnContentUri()Z
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static needReturnContentUri(Landroid/content/Context;Landroid/content/Intent;)Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->needReturnContentUri()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v0

    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    invoke-static {p0, v0}, Lcom/miui/gallery/provider/GalleryOpenProvider;->isNeedReturnContentUriApp(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "no packageName assigned to intent"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static needReturnContentUri(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->needReturnContentUri()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/GalleryOpenProvider;->isNeedReturnContentUriApp(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

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

.method private static prepareDB()Landroid/database/sqlite/SQLiteDatabase;
    .locals 2

    const/4 v0, 0x0

    invoke-static {v0}, Landroid/database/sqlite/SQLiteDatabase;->create(Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "CREATE TABLE media (_id INTEGER PRIMARY KEY AUTOINCREMENT,_data TEXT UNIQUE COLLATE NOCASE,_size INTEGER,date_added INTEGER,date_modified INTEGER,mime_type TEXT,title TEXT,description TEXT,_display_name TEXT,picasa_id TEXT,orientation INTEGER,latitude DOUBLE,longitude DOUBLE,datetaken INTEGER,mini_thumb_magic INTEGER,bucket_id TEXT,bucket_display_name TEXT,isprivate INTEGER,duration INTEGER,bookmark INTEGER,artist TEXT,album TEXT,resolution TEXT,tags TEXT,category TEXT,language TEXT,mini_thumb_data TEXT,media_type INTEGER,width INTEGER,height INTEGER)"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v1, "CREATE VIEW image AS SELECT _id,_data,_size,_display_name,mime_type,title,date_added,date_modified,description,picasa_id,isprivate,latitude,longitude,datetaken,orientation,mini_thumb_magic,bucket_id,bucket_display_name,width,height FROM media WHERE media_type=1"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v1, "CREATE VIEW video AS SELECT _id,_data,_display_name,_size,mime_type,date_added,date_modified,title,duration,artist,album,resolution,description,isprivate,tags,category,language,mini_thumb_data,latitude,longitude,datetaken,mini_thumb_magic,bucket_id,bucket_display_name,bookmark,width,height FROM media WHERE media_type=2"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-object v0
.end method

.method private query(Landroid/net/Uri;)Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;
    .locals 13

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance()Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->mUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v1, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v1, v2, :cond_1

    move-object v1, v3

    goto :goto_0

    :cond_1
    sget-object v1, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    const-string v4, "internal query for file: %s"

    invoke-static {v1, v4, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v5, p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v6, "cloud"

    sget-object v7, Lcom/miui/gallery/provider/GalleryOpenProvider;->CLOUD_COLUMNS:[Ljava/lang/String;

    const-string v8, "microthumbfile=? OR thumbnailFile = ? OR localFile = ?"

    const/4 v1, 0x3

    new-array v9, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object v0, v9, v1

    aput-object v0, v9, v2

    const/4 v1, 0x2

    aput-object v0, v9, v1

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    :goto_0
    :try_start_0
    new-instance v2, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;-><init>(Lcom/miui/gallery/provider/GalleryOpenProvider;Lcom/miui/gallery/provider/GalleryOpenProvider$1;)V

    if-eqz v1, :cond_3

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {v2, v1}, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->init(Landroid/database/Cursor;)Z

    move-result v4

    if-eqz v4, :cond_3

    sget-object p1, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    const-string v0, "translate cursor to MediaInfo success: %s"

    invoke-static {p1, v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_2

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_2
    return-object v2

    :cond_3
    :try_start_1
    invoke-virtual {v2, v0}, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->init(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    sget-object p1, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    const-string v0, "translate file to MediaInfo success: %s"

    invoke-static {p1, v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_4

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_4
    return-object v2

    :cond_5
    :try_start_2
    sget-object v0, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    const-string v2, "translate into MediaInfo failed: %s"

    invoke-static {v0, v2, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v1, :cond_6

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_6
    return-object v3

    :catchall_0
    move-exception p1

    if-eqz v1, :cond_7

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_7
    throw p1
.end method

.method public static translateToContent(Ljava/lang/String;)Landroid/net/Uri;
    .locals 1

    const-string v0, "content://com.miui.gallery.open/raw"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 2

    sget-object v0, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    const-string v1, "query type for %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/GalleryOpenProvider;->query(Landroid/net/Uri;)Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object p1, v0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mMimeType:Ljava/lang/String;

    return-object p1

    :cond_0
    sget-object v0, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    const-string v1, "query type for %s failed."

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string p1, "*/*"

    return-object p1
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public onCreate()Z
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/provider/GalleryOpenProvider;->initialize()V

    const/4 v0, 0x1

    return v0
.end method

.method public openFile(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    sget-object p2, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    const-string v0, "open file for: %s"

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p2, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_0

    const/high16 p1, 0x10000000

    invoke-static {p2, p1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance p1, Ljava/io/FileNotFoundException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "file not found: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 8

    sget-object p4, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    const-string p5, "query uri: %s, %s, %s"

    invoke-static {p2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p4, p5, p1, v0, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    monitor-enter p0

    :try_start_0
    iget-object p3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->mCacheDB:Landroid/database/sqlite/SQLiteDatabase;

    if-nez p3, :cond_0

    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->prepareDB()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p3

    iput-object p3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->mCacheDB:Landroid/database/sqlite/SQLiteDatabase;

    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/GalleryOpenProvider;->query(Landroid/net/Uri;)Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;

    move-result-object p1

    if-nez p1, :cond_1

    sget-object p1, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    const-string p3, "query failed, return a empty"

    invoke-static {p1, p3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Landroid/database/MatrixCursor;

    invoke-direct {p1, p2}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    return-object p1

    :cond_1
    iget-object p3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->mCacheDB:Landroid/database/sqlite/SQLiteDatabase;

    const-string p4, "media"

    const/4 p5, 0x0

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->toContentValue()Landroid/content/ContentValues;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {p3, p4, p5, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide p3

    const-wide/16 v0, 0x0

    cmp-long p5, p3, v0

    if-lez p5, :cond_3

    sget-object p5, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    const-string v0, "insert cache success: %d"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p5, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget p1, p1, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mType:I

    const/4 p5, 0x1

    if-ne p1, p5, :cond_2

    const-string p1, "image"

    :goto_0
    move-object v1, p1

    goto :goto_1

    :cond_2
    const-string p1, "video"

    goto :goto_0

    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider;->mCacheDB:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "_id=?"

    new-array v4, p5, [Ljava/lang/String;

    const/4 p1, 0x0

    invoke-static {p3, p4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p3

    aput-object p3, v4, p1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p2

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1

    :cond_3
    sget-object p1, Lcom/miui/gallery/provider/GalleryOpenProvider;->TAG:Ljava/lang/String;

    const-string p3, "insert failed, return null"

    invoke-static {p1, p3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Landroid/database/MatrixCursor;

    invoke-direct {p1, p2}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    return-object p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
