.class Lcom/miui/gallery/provider/cache/SearchIconManager$PeopleCoverIconLoader;
.super Ljava/lang/Object;
.source "SearchIconManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/SearchIconManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PeopleCoverIconLoader"
.end annotation


# static fields
.field private static final PROJECTION:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    const-string v0, "photo_id"

    const-string v1, "microthumbfile"

    const-string v2, "thumbnailFile"

    const-string v3, "localFile"

    const-string v4, "sha1"

    const-string v5, "exifOrientation"

    const-string v6, "faceXScale"

    const-string v7, "faceYScale"

    const-string v8, "faceWScale"

    const-string v9, "faceHScale"

    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/cache/SearchIconManager$PeopleCoverIconLoader;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Landroid/net/Uri;Landroid/content/ContentResolver;)Lcom/miui/gallery/provider/cache/SearchIconItem;
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/cache/SearchIconManager$PeopleCoverIconLoader;->queryIcon(Landroid/net/Uri;Landroid/content/ContentResolver;)Lcom/miui/gallery/provider/cache/SearchIconItem;

    move-result-object p0

    return-object p0
.end method

.method private static queryIcon(Landroid/net/Uri;Landroid/content/ContentResolver;)Lcom/miui/gallery/provider/cache/SearchIconItem;
    .locals 12

    const-string v0, "serverId"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PEOPLE_COVER_URI:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_0

    const-string v1, "serverId"

    invoke-virtual {v2, v1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_0

    :cond_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_8

    const-string v0, "_id"

    invoke-virtual {v2, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    :goto_0
    :try_start_0
    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v6

    sget-object v7, Lcom/miui/gallery/provider/cache/SearchIconManager$PeopleCoverIconLoader;->PROJECTION:[Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v5, p1

    invoke-virtual/range {v5 .. v10}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p1, :cond_4

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/StorageUtils;->getPriorMicroThumbnailPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_3
    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-interface {p1}, Landroid/database/Cursor;->getNotificationUri()Landroid/net/Uri;

    move-result-object v3

    invoke-static {p0, v0, v1, v2, v3}, Lcom/miui/gallery/provider/cache/SearchIconManager;->access$100(Landroid/net/Uri;Ljava/lang/String;JLandroid/net/Uri;)Lcom/miui/gallery/provider/cache/SearchIconItem;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v1, 0x5

    :try_start_2
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionOrientation:I

    const/4 v1, 0x6

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionX:Ljava/lang/Float;

    const/4 v1, 0x7

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionY:Ljava/lang/Float;

    const/16 v1, 0x8

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionW:Ljava/lang/Float;

    const/16 v1, 0x9

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionH:Ljava/lang/Float;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v1

    move-object v4, p1

    move-object p1, v0

    move-object v0, v1

    goto :goto_2

    :catchall_0
    move-exception p0

    goto :goto_4

    :catch_1
    move-exception v0

    move-object v11, v4

    move-object v4, p1

    move-object p1, v11

    goto :goto_2

    :cond_4
    move-object v0, v4

    :goto_1
    if-eqz p1, :cond_5

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_5
    move-object p1, v0

    goto :goto_3

    :catchall_1
    move-exception p0

    move-object p1, v4

    goto :goto_4

    :catch_2
    move-exception v0

    move-object p1, v4

    :goto_2
    :try_start_3
    const-string v1, ".searchProvider.SearchIconManager"

    const-string v2, "Error occurred while query icon uri %s, %s"

    invoke-static {v1, v2, p0, v0}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v4, :cond_6

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    :cond_6
    :goto_3
    return-object p1

    :goto_4
    if-eqz p1, :cond_7

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_7
    throw p0

    :cond_8
    const-string p1, ".searchProvider.SearchIconManager"

    const-string v0, "No valid id found for uri %s"

    invoke-static {p1, v0, p0}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v4
.end method
