.class public Lcom/miui/gallery/util/ShareAlbumsCursorHelper;
.super Ljava/lang/Object;
.source "ShareAlbumsCursorHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/ShareAlbumsCursorHelper$ShareAlbum;
    }
.end annotation


# static fields
.field public static final SHARED_ALBUM_PROJECTION:[Ljava/lang/String;


# instance fields
.field private mDataValid:Z

.field private mSharedAlbums:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/util/ShareAlbumsCursorHelper$ShareAlbum;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "_id"

    const-string v1, "creatorId"

    const-string v2, "count"

    const-string v3, "nickname"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->SHARED_ALBUM_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mDataValid:Z

    return-void
.end method


# virtual methods
.method public isDataValid()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mDataValid:Z

    return v0
.end method

.method public isOwnerShareAlbum(J)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mSharedAlbums:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mSharedAlbums:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const-wide/32 v0, 0x7ffe795f

    cmp-long v2, p1, v0

    if-gez v2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mSharedAlbums:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public declared-synchronized reset()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mDataValid:Z

    iget-object v0, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mSharedAlbums:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mSharedAlbums:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mSharedAlbums:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setSharedAlbums(Landroid/database/Cursor;)V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mSharedAlbums:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mSharedAlbums:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    :cond_0
    const/4 v0, 0x1

    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->isClosed()Z

    move-result v1

    if-nez v1, :cond_2

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_3

    new-instance v1, Lcom/miui/gallery/util/ShareAlbumsCursorHelper$ShareAlbum;

    invoke-direct {v1}, Lcom/miui/gallery/util/ShareAlbumsCursorHelper$ShareAlbum;-><init>()V

    const/4 v2, 0x0

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/miui/gallery/util/ShareAlbumsCursorHelper$ShareAlbum;->mAlbumId:Ljava/lang/String;

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/miui/gallery/util/ShareAlbumsCursorHelper$ShareAlbum;->mCreatorId:Ljava/lang/String;

    const/4 v2, 0x2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, v1, Lcom/miui/gallery/util/ShareAlbumsCursorHelper$ShareAlbum;->mUserCount:I

    const/4 v2, 0x3

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/miui/gallery/util/ShareAlbumsCursorHelper$ShareAlbum;->mOwnerNickName:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mSharedAlbums:Ljava/util/Map;

    if-nez v2, :cond_1

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mSharedAlbums:Ljava/util/Map;

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mSharedAlbums:Ljava/util/Map;

    iget-object v3, v1, Lcom/miui/gallery/util/ShareAlbumsCursorHelper$ShareAlbum;->mAlbumId:Ljava/lang/String;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mSharedAlbums:Ljava/util/Map;

    :cond_3
    iput-boolean v0, p0, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->mDataValid:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
