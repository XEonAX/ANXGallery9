.class public abstract Lcom/miui/gallery/adapter/AlbumListAdapterBase;
.super Lcom/miui/gallery/adapter/BaseAdapter;
.source "AlbumListAdapterBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/AlbumListAdapterBase$ShareAlbum;
    }
.end annotation


# static fields
.field protected static final PROJECTION:[Ljava/lang/String;

.field public static final SHARED_ALBUM_PROJECTION:[Ljava/lang/String;


# instance fields
.field protected mDisplayImageOption:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mPeopleFaceCover:Landroid/os/Bundle;

.field private mSharedAlbums:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/adapter/AlbumListAdapterBase$ShareAlbum;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/16 v0, 0x12

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "name"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "cover_id"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string v1, "cover_path"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const-string v1, "cover_sha1"

    const/4 v2, 0x4

    aput-object v1, v0, v2

    const-string v1, "cover_sync_state"

    const/4 v2, 0x5

    aput-object v1, v0, v2

    const-string v1, "media_count"

    const/4 v2, 0x6

    aput-object v1, v0, v2

    const-string v1, "face_people_id"

    const/4 v2, 0x7

    aput-object v1, v0, v2

    const-string v1, "baby_info"

    const/16 v2, 0x8

    aput-object v1, v0, v2

    const-string v1, "thumbnail_info"

    const/16 v2, 0x9

    aput-object v1, v0, v2

    const-string v1, "serverId"

    const/16 v2, 0xa

    aput-object v1, v0, v2

    const-string v1, "attributes"

    const/16 v2, 0xb

    aput-object v1, v0, v2

    const-string v1, "immutable"

    const/16 v2, 0xc

    aput-object v1, v0, v2

    const-string v1, "top_time"

    const/16 v2, 0xd

    aput-object v1, v0, v2

    const-string v1, "sortBy"

    const/16 v2, 0xe

    aput-object v1, v0, v2

    const-string v1, "baby_sharer_info"

    const/16 v2, 0xf

    aput-object v1, v0, v2

    const-string v1, "local_path"

    const/16 v2, 0x10

    aput-object v1, v0, v2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/miui/gallery/provider/InternalContract$Cloud;->ALIAS_ALBUM_CLASSIFICATION:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " AS "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "classification"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sput-object v0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->PROJECTION:[Ljava/lang/String;

    const-string v0, "_id"

    const-string v1, "creatorId"

    const-string v2, "count"

    const-string v3, "nickname"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->SHARED_ALBUM_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BaseAdapter;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mPeopleFaceCover:Landroid/os/Bundle;

    return-void
.end method

.method protected static isAutoUploadedAlbum(Landroid/database/Cursor;)Z
    .locals 5

    const/16 v0, 0xb

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    const-wide/16 v2, 0x1

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_2

    invoke-static {p0}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->isSystemAlbum(Landroid/database/Cursor;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->isScreenshotsAlbum(Landroid/database/Cursor;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    invoke-static {p0}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->isOtherShareAlbum(Landroid/database/Cursor;)Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method protected static isBabyAlbum(Landroid/database/Cursor;)Z
    .locals 1

    const/16 v0, 0x8

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method private isFaceAlbum(Landroid/database/Cursor;)Z
    .locals 5

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const-wide/32 v3, 0x7ffffffe

    cmp-long p1, v1, v3

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public static isFavoritesAlbum(Landroid/database/Cursor;)Z
    .locals 5

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const-wide/32 v3, 0x7ffffffa

    cmp-long p0, v1, v3

    if-nez p0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method protected static isOtherShareAlbum(Landroid/database/Cursor;)Z
    .locals 2

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    int-to-long v0, p0

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result p0

    return p0
.end method

.method public static isRecentAlbum(Landroid/database/Cursor;)Z
    .locals 5

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const-wide/32 v3, 0x7ffffffc

    cmp-long p0, v1, v3

    if-nez p0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private static isScreenshotsAlbum(Landroid/database/Cursor;)Z
    .locals 2

    const/16 v0, 0xa

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    const-wide/16 v0, 0x2

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method protected static isSystemAlbum(Landroid/database/Cursor;)Z
    .locals 5

    const/16 v0, 0xa

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->ALL_SYSTEM_ALBUM_SERVER_IDS:[Ljava/lang/Long;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method


# virtual methods
.method protected getAlbumCount(Landroid/database/Cursor;)I
    .locals 1

    const/4 v0, 0x6

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    return p1
.end method

.method public getAlbumName(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->getAlbumName(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getAlbumName(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->isCameraAlbum(Landroid/database/Cursor;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mContext:Landroid/content/Context;

    const v0, 0x7f10002e

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->isScreenshotsAlbum(Landroid/database/Cursor;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mContext:Landroid/content/Context;

    const v0, 0x7f100047

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->isVideoAlbum(Landroid/database/Cursor;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mContext:Landroid/content/Context;

    const v0, 0x7f100058

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_2
    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->isFaceAlbum(Landroid/database/Cursor;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mContext:Landroid/content/Context;

    const v0, 0x7f100032

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_3
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->isPanoAlbum(Landroid/database/Cursor;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mContext:Landroid/content/Context;

    const v0, 0x7f100043

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_4
    invoke-static {p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->isRecentAlbum(Landroid/database/Cursor;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mContext:Landroid/content/Context;

    const v0, 0x7f10003b

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_5
    invoke-static {p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->isFavoritesAlbum(Landroid/database/Cursor;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mContext:Landroid/content/Context;

    const v0, 0x7f100033

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_6
    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public getDownloadUri(I)Landroid/net/Uri;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x5

    const/4 v1, 0x2

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->getDownloadUri(Landroid/database/Cursor;II)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public getLocalPath(I)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x3

    const/4 v1, 0x4

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->getMicroPath(Landroid/database/Cursor;II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getProjection()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method protected initDisplayImageOptions()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/adapter/BaseAdapter;->initDisplayImageOptions()V

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const v1, 0x7f0700d5

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showStubImage(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mDisplayImageOption:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method public isAutoUploadedAlbum(I)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->isAutoUploadedAlbum(Landroid/database/Cursor;)Z

    move-result p1

    return p1
.end method

.method public isBabyAlbum(I)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->isBabyAlbum(Landroid/database/Cursor;)Z

    move-result p1

    return p1
.end method

.method public isCameraAlbum(I)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->isCameraAlbum(Landroid/database/Cursor;)Z

    move-result p1

    return p1
.end method

.method protected isCameraAlbum(Landroid/database/Cursor;)Z
    .locals 2

    const/16 v0, 0xa

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    const-wide/16 v0, 0x1

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public isOwnerShareAlbum(I)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->isOwnerShareAlbum(Landroid/database/Cursor;)Z

    move-result p1

    return p1
.end method

.method protected isOwnerShareAlbum(Landroid/database/Cursor;)Z
    .locals 2

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    const v1, 0x7ffe795f

    if-ge p1, v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mSharedAlbums:Ljava/util/Map;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mSharedAlbums:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method protected isPanoAlbum(Landroid/database/Cursor;)Z
    .locals 5

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const-wide/32 v3, 0x7ffffffd

    cmp-long p1, v1, v3

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method protected isVideoAlbum(Landroid/database/Cursor;)Z
    .locals 5

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const-wide/32 v3, 0x7fffffff

    cmp-long p1, v1, v3

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public setSharedAlbums(Landroid/database/Cursor;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mSharedAlbums:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mSharedAlbums:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    :cond_0
    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_2
    new-instance v0, Lcom/miui/gallery/adapter/AlbumListAdapterBase$ShareAlbum;

    invoke-direct {v0}, Lcom/miui/gallery/adapter/AlbumListAdapterBase$ShareAlbum;-><init>()V

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/adapter/AlbumListAdapterBase$ShareAlbum;->mAlbumId:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/adapter/AlbumListAdapterBase$ShareAlbum;->mCreatorId:Ljava/lang/String;

    const/4 v1, 0x2

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lcom/miui/gallery/adapter/AlbumListAdapterBase$ShareAlbum;->mUserCount:I

    const/4 v1, 0x3

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/adapter/AlbumListAdapterBase$ShareAlbum;->mOwnerNickName:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mSharedAlbums:Ljava/util/Map;

    if-nez v1, :cond_3

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mSharedAlbums:Ljava/util/Map;

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->mSharedAlbums:Ljava/util/Map;

    iget-object v2, v0, Lcom/miui/gallery/adapter/AlbumListAdapterBase$ShareAlbum;->mAlbumId:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_2

    :cond_4
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->getCount()I

    move-result p1

    if-lez p1, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;->notifyDataSetChanged()V

    :cond_5
    return-void
.end method
