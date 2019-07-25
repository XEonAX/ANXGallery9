.class public Lcom/miui/gallery/provider/FavoritesManager;
.super Ljava/lang/Object;
.source "FavoritesManager.java"


# static fields
.field private static final PROJECTION:[Ljava/lang/String;

.field private static TAG:Ljava/lang/String; = "FavoritesManager"


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "_id"

    const-string v1, "sha1"

    const-string v2, "localGroupId"

    const-string v3, "size"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/FavoritesManager;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method private static queryCloudItemByPath(Landroid/content/Context;Ljava/lang/String;Z)Landroid/database/Cursor;
    .locals 13

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_5

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    if-eqz v0, :cond_4

    :try_start_0
    invoke-static {p1}, Lcom/miui/gallery/util/ExifUtil;->getUserCommentData(Ljava/lang/String;)Lcom/miui/gallery/util/ExifUtil$UserCommentData;

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
    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    sget-object p0, Lcom/miui/gallery/provider/FavoritesManager;->TAG:Ljava/lang/String;

    const-string p2, "Could\'t get album path for %s"

    invoke-static {p0, p2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1

    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    sget-object v8, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v9, Lcom/miui/gallery/provider/FavoritesManager;->PROJECTION:[Ljava/lang/String;

    const-string v10, "fileName LIKE ? AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND localGroupId IN (SELECT _id FROM cloud WHERE localFile LIKE ?)"

    new-array v11, v4, [Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v11, v3

    aput-object v5, v11, v2

    const/4 v12, 0x0

    invoke-virtual/range {v7 .. v12}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p2, :cond_2

    if-eqz p0, :cond_2

    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p2

    if-eqz p2, :cond_2

    const/4 p2, 0x3

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->getFileSize(Ljava/lang/String;)J

    move-result-wide v4

    cmp-long p2, v2, v4

    if-eqz p2, :cond_2

    sget-object p2, Lcom/miui/gallery/provider/FavoritesManager;->TAG:Ljava/lang/String;

    const-string v0, "file size not equals, can not favorite: %s"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v1

    :cond_2
    return-object p0

    :cond_3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object p2, Lcom/miui/gallery/provider/FavoritesManager;->PROJECTION:[Ljava/lang/String;

    const-string v1, "sha1 = ? AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND localGroupId IN (SELECT _id FROM cloud WHERE localFile LIKE ?)"

    new-array v6, v4, [Ljava/lang/String;

    aput-object v0, v6, v3

    aput-object v5, v6, v2

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, v1

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0

    :catch_0
    move-exception p0

    const-string p1, "StorageItem"

    const-string p2, "exif exifSha1 read fail %s"

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1

    :cond_4
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v0, Lcom/miui/gallery/provider/FavoritesManager;->PROJECTION:[Ljava/lang/String;

    const-string v5, "(localFile LIKE ? or thumbnailFile LIKE ?) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    new-array v6, v4, [Ljava/lang/String;

    aput-object p1, v6, v3

    aput-object p1, v6, v2

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p2

    move-object v4, v0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0

    :cond_5
    return-object v1
.end method

.method public static queryFavoriteInfoByFilePath(Ljava/lang/String;Z)Lcom/miui/gallery/model/FavoriteInfo;
    .locals 10

    new-instance v0, Lcom/miui/gallery/model/FavoriteInfo;

    invoke-direct {v0}, Lcom/miui/gallery/model/FavoriteInfo;-><init>()V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {v1, p0, p1}, Lcom/miui/gallery/provider/FavoritesManager;->queryCloudItemByPath(Landroid/content/Context;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    goto :goto_0

    :cond_0
    move-object p0, v2

    :goto_0
    if-eqz p0, :cond_3

    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_3

    const/4 p1, 0x2

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    const-wide/16 v4, -0x3e8

    cmp-long p1, v2, v4

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-nez p1, :cond_1

    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    xor-int/2addr p1, v9

    invoke-virtual {v0, p1}, Lcom/miui/gallery/model/FavoriteInfo;->setFavoriteUsable(Z)V

    invoke-virtual {v0}, Lcom/miui/gallery/model/FavoriteInfo;->isFavoriteUsable()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-interface {p0, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Favorites;->URI:Landroid/net/Uri;

    const-string v3, "isFavorite"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    const-string v4, "sha1 = ?"

    new-array v5, v9, [Ljava/lang/String;

    aput-object p1, v5, v8

    const/4 v6, 0x0

    new-instance v7, Lcom/miui/gallery/provider/FavoritesManager$1;

    invoke-direct {v7}, Lcom/miui/gallery/provider/FavoritesManager$1;-><init>()V

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-lez p1, :cond_2

    const/4 v8, 0x1

    :cond_2
    invoke-virtual {v0, v8}, Lcom/miui/gallery/model/FavoriteInfo;->setFavorite(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_5

    :catch_0
    move-exception p1

    move-object v2, p0

    goto :goto_3

    :cond_3
    :goto_2
    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_4

    :catchall_1
    move-exception p0

    move-object p1, p0

    move-object p0, v2

    goto :goto_5

    :catch_1
    move-exception p0

    move-object p1, p0

    :goto_3
    :try_start_2
    sget-object p0, Lcom/miui/gallery/provider/FavoritesManager;->TAG:Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    :goto_4
    return-object v0

    :goto_5
    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p1
.end method
