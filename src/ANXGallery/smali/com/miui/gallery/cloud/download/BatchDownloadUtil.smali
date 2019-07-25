.class public Lcom/miui/gallery/cloud/download/BatchDownloadUtil;
.super Ljava/lang/Object;
.source "BatchDownloadUtil.java"


# static fields
.field private static final PROJECTION:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "_id"

    const-string v1, "sha1"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cloud/download/BatchDownloadUtil;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public static cleanDownloadedMark(Landroid/content/Context;)V
    .locals 2

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/miui/gallery/cloud/download/BatchDownloadUtil;->cleanDownloadedMark(Landroid/content/Context;Lcom/miui/gallery/sdk/download/DownloadType;Z)V

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {p0, v0, v1}, Lcom/miui/gallery/cloud/download/BatchDownloadUtil;->cleanDownloadedMark(Landroid/content/Context;Lcom/miui/gallery/sdk/download/DownloadType;Z)V

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/miui/gallery/cloud/download/BatchDownloadUtil;->cleanDownloadedMark(Landroid/content/Context;Lcom/miui/gallery/sdk/download/DownloadType;Z)V

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {p0, v0, v1}, Lcom/miui/gallery/cloud/download/BatchDownloadUtil;->cleanDownloadedMark(Landroid/content/Context;Lcom/miui/gallery/sdk/download/DownloadType;Z)V

    return-void
.end method

.method public static cleanDownloadedMark(Landroid/content/Context;Lcom/miui/gallery/sdk/download/DownloadType;Z)V
    .locals 6

    sget-object v0, Lcom/miui/gallery/cloud/download/BatchDownloadUtil$1;->$SwitchMap$com$miui$gallery$sdk$download$DownloadType:[I

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/DownloadType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    move-object p1, v0

    goto :goto_0

    :pswitch_0
    const-string p1, "localFile"

    goto :goto_0

    :pswitch_1
    const-string p1, "thumbnailFile"

    :goto_0
    if-eqz p1, :cond_0

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    invoke-virtual {v1, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {p2}, Lcom/miui/gallery/cloud/download/BatchDownloadUtil;->getUri(Z)Landroid/net/Uri;

    move-result-object p2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%s=\'\'"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p2, v1, v2, v0}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0

    const-string p2, "BatchDownloadUtil"

    const-string v0, "clean %s, result %d"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {p2, v0, p1, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getFileSelection(Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 5

    const-string v0, ""

    sget-object v1, Lcom/miui/gallery/cloud/download/BatchDownloadUtil$1;->$SwitchMap$com$miui$gallery$sdk$download$DownloadType:[I

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/DownloadType;->ordinal()I

    move-result p0

    aget p0, v1, p0

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch p0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "(%s is null) AND "

    new-array v3, v2, [Ljava/lang/Object;

    const-string v4, "thumbnailFile"

    aput-object v4, v3, v1

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :pswitch_1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "(%s is null) "

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "localFile"

    aput-object v3, v2, v1

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static getTableName(Z)Ljava/lang/String;
    .locals 0

    if-eqz p0, :cond_0

    const-string p0, "shareImage"

    goto :goto_0

    :cond_0
    const-string p0, "cloud"

    :goto_0
    return-object p0
.end method

.method private static getUri(Z)Landroid/net/Uri;
    .locals 0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/miui/gallery/provider/GalleryContract$ShareImage;->SHARE_URI:Landroid/net/Uri;

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    :goto_0
    return-object p0
.end method

.method public static queryDownload(Landroid/content/Context;Lcom/miui/gallery/sdk/download/DownloadType;ZI)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/miui/gallery/sdk/download/DownloadType;",
            "ZI)",
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-static {p2}, Lcom/miui/gallery/cloud/download/BatchDownloadUtil;->getUri(Z)Landroid/net/Uri;

    move-result-object v7

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-lez p3, :cond_0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "SELECT_id FROM %s WHERE (localFlag = 0 AND serverStatus = \'custom\') AND serverType IN (1,2) AND %s LIMIT %s"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p2}, Lcom/miui/gallery/cloud/download/BatchDownloadUtil;->getTableName(Z)Ljava/lang/String;

    move-result-object p2

    aput-object p2, v3, v9

    invoke-static {p1}, Lcom/miui/gallery/cloud/download/BatchDownloadUtil;->getFileSelection(Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p2

    aput-object p2, v3, v8

    const/4 p2, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v3, p2

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    :goto_0
    move-object v4, p2

    goto :goto_1

    :cond_0
    sget-object p2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string p3, "(localFlag = 0 AND serverStatus = \'custom\') AND serverType IN (1,2) AND %s"

    new-array v1, v8, [Ljava/lang/Object;

    invoke-static {p1}, Lcom/miui/gallery/cloud/download/BatchDownloadUtil;->getFileSelection(Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v9

    invoke-static {p2, p3, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :goto_1
    const/4 p2, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v3, Lcom/miui/gallery/cloud/download/BatchDownloadUtil;->PROJECTION:[Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "serverTag DESC"

    move-object v2, v7

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p0, :cond_2

    :goto_2
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result p2

    if-eqz p2, :cond_2

    sget-object p2, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne p1, p2, :cond_1

    invoke-interface {p0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/preference/ThumbnailPreference;->containsThumbnailKey(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_2

    :cond_1
    invoke-interface {p0, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide p2

    invoke-static {v7, p2, p3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p2

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_5

    :catch_0
    move-exception p1

    move-object p2, p0

    goto :goto_3

    :cond_2
    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_4

    :catchall_1
    move-exception p1

    move-object p0, p2

    goto :goto_5

    :catch_1
    move-exception p1

    :goto_3
    :try_start_2
    const-string p0, "BatchDownloadUtil"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    :goto_4
    return-object v0

    :goto_5
    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p1
.end method
