.class final Lcom/miui/gallery/share/CloudUserCache$1;
.super Lcom/miui/gallery/share/CloudUserCache;
.source "CloudUserCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/share/CloudUserCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/share/CloudUserCache;-><init>()V

    return-void
.end method


# virtual methods
.method protected getProjection()[Ljava/lang/String;
    .locals 7

    const-string v0, "albumId"

    const-string v1, "userId"

    const-string v2, "createTime"

    const-string v3, "relation"

    const-string v4, "relationText"

    const-string v5, "serverStatus"

    const-string v6, "phone"

    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSelection()Ljava/lang/String;
    .locals 1

    const-string v0, "serverStatus = ?"

    return-object v0
.end method

.method protected getSelectionArgs()[Ljava/lang/String;
    .locals 1

    const-string v0, "normal"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$CloudUser;->CLOUD_USER_URI:Landroid/net/Uri;

    return-object v0
.end method

.method protected bridge synthetic newKey(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/share/CloudUserCache;->newKey(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic newValue(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/share/CloudUserCache;->newValue(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected newValueElement(Landroid/database/Cursor;)Lcom/miui/gallery/share/CloudUserCacheEntry;
    .locals 10

    new-instance v9, Lcom/miui/gallery/share/CloudUserCacheEntry;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v0, 0x6

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object v0, v9

    invoke-direct/range {v0 .. v8}, Lcom/miui/gallery/share/CloudUserCacheEntry;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v9
.end method

.method public syncFromServer(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    invoke-static {p2}, Lcom/miui/gallery/share/AlbumShareUIManager;->syncAllUserInfoFromNetworkAsync(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method
