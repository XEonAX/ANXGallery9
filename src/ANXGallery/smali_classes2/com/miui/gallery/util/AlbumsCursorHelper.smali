.class public Lcom/miui/gallery/util/AlbumsCursorHelper;
.super Ljava/lang/Object;
.source "AlbumsCursorHelper.java"


# static fields
.field public static final ALL_ALBUMS_PROJECTION:[Ljava/lang/String;


# instance fields
.field private mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private mCursor:Landroid/database/Cursor;


# direct methods
.method static constructor <clinit>()V
    .locals 17

    const-string v0, "_id"

    const-string v1, "name"

    const-string v2, "cover_id"

    const-string v3, "cover_path"

    const-string v4, "cover_sha1"

    const-string v5, "cover_sync_state"

    const-string v6, "media_count"

    const-string v7, "face_people_id"

    const-string v8, "baby_info"

    const-string v9, "thumbnail_info"

    const-string v10, "serverId"

    const-string v11, "attributes"

    const-string v12, "immutable"

    const-string v13, "top_time"

    const-string v14, "sortBy"

    const-string v15, "baby_sharer_info"

    const-string v16, "local_path"

    filled-new-array/range {v0 .. v16}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/AlbumsCursorHelper;->ALL_ALBUMS_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mContext:Landroid/content/Context;

    return-void
.end method

.method private getAlbumId(Landroid/database/Cursor;)J
    .locals 2

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    int-to-long v0, p1

    return-wide v0
.end method

.method private getAlbumLocalPath(I)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->moveCursorToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAlbumLocalPath(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getAlbumLocalPath(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x10

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static getAlbumName(Landroid/content/Context;JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    invoke-static {p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isVideoAlbum(J)Z

    move-result v0

    if-eqz v0, :cond_0

    const p1, 0x7f100058

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    goto :goto_0

    :cond_0
    invoke-static {p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isFaceAlbum(J)Z

    move-result v0

    if-eqz v0, :cond_1

    const p1, 0x7f100032

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    goto :goto_0

    :cond_1
    invoke-static {p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isPanoAlbum(J)Z

    move-result v0

    if-eqz v0, :cond_2

    const p1, 0x7f100043

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    goto :goto_0

    :cond_2
    invoke-static {p3}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isCameraAlbum(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const p1, 0x7f10002e

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    goto :goto_0

    :cond_3
    invoke-static {p3}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isScreenshotsAlbum(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_4

    const p1, 0x7f100047

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    goto :goto_0

    :cond_4
    invoke-static {p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isRecentAlbum(J)Z

    move-result p3

    if-eqz p3, :cond_5

    const p1, 0x7f10003b

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    goto :goto_0

    :cond_5
    invoke-static {p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isFavoritesAlbum(J)Z

    move-result p1

    if-eqz p1, :cond_6

    const p1, 0x7f100033

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    :cond_6
    :goto_0
    return-object p4
.end method

.method private getAlbumName(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const/16 v3, 0xa

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v1, v2, v3, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAlbumName(Landroid/content/Context;JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getAttributes(Landroid/database/Cursor;)J
    .locals 2

    const/16 v0, 0xb

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method private getBabyAlbumPeopleId(I)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->moveCursorToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getBabyAlbumPeopleId(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getBabyAlbumPeopleId(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x7

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getBabyInfo(I)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->moveCursorToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getBabyInfo(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getBabyInfo(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x8

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getBabySharerInfo(I)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->moveCursorToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getBabySharerInfo(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getBabySharerInfo(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/16 v0, 0xf

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getServerId(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/16 v0, 0xa

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getThumbnailInfoOfBaby(I)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->moveCursorToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getThumbnailInfoOfBaby(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getThumbnailInfoOfBaby(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x9

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private isAutoUploadedAlbum(Landroid/database/Cursor;)Z
    .locals 5

    const/16 v0, 0xb

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    const-wide/16 v2, 0x1

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_2

    invoke-static {p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isSystemAlbum(Landroid/database/Cursor;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isScreenshotsAlbum(Landroid/database/Cursor;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isOtherShareAlbum(Landroid/database/Cursor;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private isBabyAlbum(I)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->moveCursorToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isBabyAlbum(Landroid/database/Cursor;)Z

    move-result p1

    return p1
.end method

.method private static isCameraAlbum(Ljava/lang/String;)Z
    .locals 2

    const-wide/16 v0, 0x1

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static isFaceAlbum(J)Z
    .locals 3

    const-wide/32 v0, 0x7ffffffe

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isFavoritesAlbum(J)Z
    .locals 3

    const-wide/32 v0, 0x7ffffffa

    cmp-long v2, v0, p0

    if-nez v2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private isLocalAlbum(I)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->moveCursorToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isLocalAlbum(Landroid/database/Cursor;)Z

    move-result p1

    return p1
.end method

.method private isLocalAlbum(Landroid/database/Cursor;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isAutoUploadedAlbum(Landroid/database/Cursor;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method private isOtherShareAlbum(I)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->moveCursorToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isOtherShareAlbum(Landroid/database/Cursor;)Z

    move-result p1

    return p1
.end method

.method private isOtherShareAlbum(Landroid/database/Cursor;)Z
    .locals 2

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    int-to-long v0, p1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result p1

    return p1
.end method

.method public static isPanoAlbum(J)Z
    .locals 3

    const-wide/32 v0, 0x7ffffffd

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isRecentAlbum(J)Z
    .locals 3

    const-wide/32 v0, 0x7ffffffc

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isScreenshotsAlbum(Landroid/database/Cursor;)Z
    .locals 1

    const/16 v0, 0xa

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isScreenshotsAlbum(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static isScreenshotsAlbum(Ljava/lang/String;)Z
    .locals 2

    const-wide/16 v0, 0x2

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static isSystemAlbum(Landroid/database/Cursor;)Z
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

.method private static isVideoAlbum(J)Z
    .locals 3

    const-wide/32 v0, 0x7fffffff

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private moveCursorToPosition(I)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public albumUnwriteable(I)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->moveCursorToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    const/16 v0, 0xc

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public albumUnwriteable(J)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->albumUnwriteable(I)Z

    move-result p1

    return p1
.end method

.method public getAlbumId(I)J
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->moveCursorToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAlbumId(Landroid/database/Cursor;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getAlbumLocalPath(Ljava/lang/Long;)Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAlbumLocalPath(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getAlbumName(I)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->moveCursorToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAlbumName(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getAlbumName(J)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAlbumName(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getAttributes(I)J
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->moveCursorToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAttributes(Landroid/database/Cursor;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getAttributes(J)J
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAttributes(I)J

    move-result-wide p1

    return-wide p1
.end method

.method public getBabyAlbumPeopleId(J)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getBabyAlbumPeopleId(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getBabyInfo(J)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getBabyInfo(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getBabySharerInfo(J)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getBabySharerInfo(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getServerId(I)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->moveCursorToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getServerId(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getServerId(J)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getServerId(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getThumbnailInfoOfBaby(J)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getThumbnailInfoOfBaby(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public isAlbumDataValid(J)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isBabyAlbum(J)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isBabyAlbum(I)Z

    move-result p1

    return p1
.end method

.method protected isBabyAlbum(Landroid/database/Cursor;)Z
    .locals 1

    const/16 v0, 0x8

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public isLocalAlbum(J)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isLocalAlbum(I)Z

    move-result p1

    return p1
.end method

.method public isOtherShareAlbum(J)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isOtherShareAlbum(I)Z

    move-result p1

    return p1
.end method

.method public declared-synchronized setAlbumsData(Landroid/database/Cursor;)V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->clear()V

    :cond_0
    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_2

    iput-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    if-nez v0, :cond_1

    new-instance v0, Landroid/util/LongSparseArray;

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v1

    invoke-direct {v0, v1}, Landroid/util/LongSparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    :cond_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAlbumId(Landroid/database/Cursor;)J

    move-result-wide v1

    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mCursor:Landroid/database/Cursor;

    iput-object p1, p0, Lcom/miui/gallery/util/AlbumsCursorHelper;->mAlbumId2CursorPosMapping:Landroid/util/LongSparseArray;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
