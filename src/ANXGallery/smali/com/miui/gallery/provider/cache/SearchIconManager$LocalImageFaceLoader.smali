.class Lcom/miui/gallery/provider/cache/SearchIconManager$LocalImageFaceLoader;
.super Ljava/lang/Object;
.source "SearchIconManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/SearchIconManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LocalImageFaceLoader"
.end annotation


# static fields
.field private static final PROJECTION:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const-string v0, "photo_id"

    const-string v1, "microthumbfile"

    const-string v2, "thumbnailFile"

    const-string v3, "localFile"

    const-string v4, "sha1"

    const-string v5, "faceXScale"

    const-string v6, "faceYScale"

    const-string v7, "faceWScale"

    const-string v8, "faceHScale"

    filled-new-array/range {v0 .. v8}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/cache/SearchIconManager$LocalImageFaceLoader;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method static synthetic lambda$queryIcon$19(Landroid/net/Uri;Landroid/database/Cursor;)Lcom/miui/gallery/provider/cache/SearchIconItem;
    .locals 4

    if-eqz p1, :cond_3

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/StorageUtils;->getPriorMicroThumbnailPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_2
    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-interface {p1}, Landroid/database/Cursor;->getNotificationUri()Landroid/net/Uri;

    move-result-object v3

    invoke-static {p0, v0, v1, v2, v3}, Lcom/miui/gallery/provider/cache/SearchIconManager;->access$100(Landroid/net/Uri;Ljava/lang/String;JLandroid/net/Uri;)Lcom/miui/gallery/provider/cache/SearchIconItem;

    move-result-object p0

    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getFloat(I)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionX:Ljava/lang/Float;

    const/4 v0, 0x6

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getFloat(I)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionY:Ljava/lang/Float;

    const/4 v0, 0x7

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getFloat(I)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionW:Ljava/lang/Float;

    const/16 v0, 0x8

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getFloat(I)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionH:Ljava/lang/Float;

    return-object p0

    :cond_3
    const/4 p0, 0x0

    return-object p0
.end method

.method static queryIcon(Landroid/net/Uri;Landroid/content/Context;)Lcom/miui/gallery/provider/cache/SearchIconItem;
    .locals 8

    const-string v0, "serverId"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "faceId"

    invoke-virtual {p0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->IMAGE_FACE_URI:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v3, "image_server_id"

    invoke-virtual {v2, v3, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v2, "serverId"

    invoke-virtual {v0, v2, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/provider/cache/SearchIconManager$LocalImageFaceLoader;->PROJECTION:[Ljava/lang/String;

    new-instance v7, Lcom/miui/gallery/provider/cache/-$$Lambda$SearchIconManager$LocalImageFaceLoader$IqyPZiLndOPK1Ed4Ru1806JbJjU;

    invoke-direct {v7, p0}, Lcom/miui/gallery/provider/cache/-$$Lambda$SearchIconManager$LocalImageFaceLoader$IqyPZiLndOPK1Ed4Ru1806JbJjU;-><init>(Landroid/net/Uri;)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p1

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/provider/cache/SearchIconItem;

    return-object p0
.end method
