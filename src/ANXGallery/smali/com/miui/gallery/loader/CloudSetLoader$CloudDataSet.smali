.class public Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;
.super Lcom/miui/gallery/model/BaseCloudDataSet;
.source "CloudSetLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/loader/CloudSetLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "CloudDataSet"
.end annotation


# direct methods
.method public constructor <init>(Landroid/database/Cursor;IIJLjava/lang/String;)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/miui/gallery/model/BaseCloudDataSet;-><init>(Landroid/database/Cursor;IIJLjava/lang/String;)V

    return-void
.end method

.method private wrapItemByCursor(Lcom/miui/gallery/model/BaseDataItem;Landroid/database/Cursor;)V
    .locals 5

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getMediaId(Landroid/database/Cursor;)J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/model/BaseDataItem;->setKey(J)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getMicroThumbnailPath(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/model/BaseDataItem;->setMicroPath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getThumbnailPath(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/model/BaseDataItem;->setThumbPath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getFilePath(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/model/BaseDataItem;->setFilePath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getMimeType(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/model/BaseDataItem;->setMimeType(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getCreateTime(Landroid/database/Cursor;)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lcom/miui/gallery/model/BaseDataItem;->setCreateTime(J)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getLocation(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/model/BaseDataItem;->setLocation(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getSize(Landroid/database/Cursor;)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lcom/miui/gallery/model/BaseDataItem;->setSize(J)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getWidth(Landroid/database/Cursor;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/model/BaseDataItem;->setWidth(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getHeight(Landroid/database/Cursor;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/model/BaseDataItem;->setHeight(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getDuration(Landroid/database/Cursor;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/model/BaseDataItem;->setDuration(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getSecretKey(Landroid/database/Cursor;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/model/BaseDataItem;->setSecretKey([B)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getLatitude(Landroid/database/Cursor;)D

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lcom/miui/gallery/model/BaseDataItem;->setLatitude(D)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getLongitude(Landroid/database/Cursor;)D

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lcom/miui/gallery/model/BaseDataItem;->setLongitude(D)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getOrientation(Landroid/database/Cursor;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/model/BaseDataItem;->setOrientation(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getTitle(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/model/BaseDataItem;->setTitle(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    check-cast p1, Lcom/miui/gallery/model/CloudItem;

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/model/CloudItem;->setId(J)Lcom/miui/gallery/model/CloudItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->isSynced(Landroid/database/Cursor;)Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/model/CloudItem;->setSynced(Z)Lcom/miui/gallery/model/CloudItem;

    move-result-object v2

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getSha1(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/model/CloudItem;->setSha1(Ljava/lang/String;)Lcom/miui/gallery/model/CloudItem;

    move-result-object v2

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result v0

    invoke-virtual {v2, v0}, Lcom/miui/gallery/model/CloudItem;->setShare(Z)Lcom/miui/gallery/model/CloudItem;

    move-result-object v0

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getCreator(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/model/CloudItem;->setCreatorId(Ljava/lang/String;)Lcom/miui/gallery/model/CloudItem;

    move-result-object v0

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->isFavorite(Landroid/database/Cursor;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/model/CloudItem;->setIsFavorite(I)Lcom/miui/gallery/model/CloudItem;

    move-result-object v0

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getServerId(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/model/CloudItem;->setServerId(Ljava/lang/String;)Lcom/miui/gallery/model/CloudItem;

    invoke-static {p2}, Lcom/miui/gallery/util/MediaCursorHelper;->getAlbumId(Landroid/database/Cursor;)J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/model/CloudItem;->setLocalGroupId(J)Lcom/miui/gallery/model/BaseDataItem;

    return-void
.end method


# virtual methods
.method protected bindItem(Lcom/miui/gallery/model/BaseDataItem;I)V
    .locals 6

    invoke-virtual {p0, p2}, Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;->moveToPosition(I)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;->wrapItemByCursor(Lcom/miui/gallery/model/BaseDataItem;Landroid/database/Cursor;)V

    invoke-virtual {p0}, Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;->foldBurst()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    check-cast v0, Lcom/miui/gallery/util/BurstFilterCursor;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/util/BurstFilterCursor;->isBurstPosition(I)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, p2}, Lcom/miui/gallery/util/BurstFilterCursor;->getContentCursorPosition(I)I

    move-result v2

    invoke-virtual {v0, p2}, Lcom/miui/gallery/util/BurstFilterCursor;->getBurstCount(I)I

    move-result p2

    add-int/2addr p2, v2

    const/4 v3, 0x1

    sub-int/2addr p2, v3

    :goto_0
    if-gt v2, p2, :cond_0

    invoke-virtual {v0, v2}, Lcom/miui/gallery/util/BurstFilterCursor;->getContentCursorAtPosition(I)Landroid/database/Cursor;

    move-result-object v4

    new-instance v5, Lcom/miui/gallery/model/CloudItem;

    invoke-direct {v5}, Lcom/miui/gallery/model/CloudItem;-><init>()V

    invoke-direct {p0, v5, v4}, Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;->wrapItemByCursor(Lcom/miui/gallery/model/BaseDataItem;Landroid/database/Cursor;)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1, v3}, Lcom/miui/gallery/model/BaseDataItem;->setBurstItem(Z)Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/model/BaseDataItem;->setBurstGroup(Ljava/util/List;)Lcom/miui/gallery/model/BaseDataItem;

    const-wide/16 v0, 0x40

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/model/BaseDataItem;->setSpecialTypeFlags(J)V

    :cond_1
    return-void
.end method

.method protected burstKeyIndex()I
    .locals 1

    const/16 v0, 0x17

    return v0
.end method

.method protected foldBurst()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getItemKey(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;->moveToPosition(I)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    invoke-static {p1}, Lcom/miui/gallery/util/MediaCursorHelper;->getMediaId(Landroid/database/Cursor;)J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method protected getItemPath(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;->moveToPosition(I)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    invoke-static {p1}, Lcom/miui/gallery/util/MediaCursorHelper;->getFilePath(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
