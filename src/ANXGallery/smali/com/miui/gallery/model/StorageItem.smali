.class public Lcom/miui/gallery/model/StorageItem;
.super Lcom/miui/gallery/model/BaseDataItem;
.source "StorageItem.java"


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/model/BaseDataItem;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/miui/gallery/model/StorageItem;->mSize:J

    iput-wide v0, p0, Lcom/miui/gallery/model/StorageItem;->mCreateTime:J

    return-void
.end method


# virtual methods
.method public getCreateTime()J
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/model/StorageItem;->mCreateTime:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/model/StorageItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/model/StorageItem;->mCreateTime:J

    :cond_0
    iget-wide v0, p0, Lcom/miui/gallery/model/StorageItem;->mCreateTime:J

    return-wide v0
.end method

.method public getDetailInfo(Landroid/content/Context;)Lcom/miui/gallery/model/PhotoDetailInfo;
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/model/BaseDataItem;->getDetailInfo(Landroid/content/Context;)Lcom/miui/gallery/model/PhotoDetailInfo;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/model/StorageItem;->isVideo()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/model/StorageItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->extractVideoAttr(Lcom/miui/gallery/model/PhotoDetailInfo;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/model/StorageItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->extractExifInfo(Lcom/miui/gallery/model/PhotoDetailInfo;Ljava/lang/String;Z)V

    :goto_0
    return-object p1
.end method

.method public getFavoriteInfo(Z)Lcom/miui/gallery/model/FavoriteInfo;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/model/StorageItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/FavoritesManager;->queryFavoriteInfoByFilePath(Ljava/lang/String;Z)Lcom/miui/gallery/model/FavoriteInfo;

    move-result-object p1

    return-object p1
.end method

.method public getSize()J
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/model/StorageItem;->mSize:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/model/StorageItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/model/StorageItem;->mSize:J

    :cond_0
    iget-wide v0, p0, Lcom/miui/gallery/model/StorageItem;->mSize:J

    return-wide v0
.end method

.method public initSupportOperations()I
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/model/StorageItem;->isVideo()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/model/StorageItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/PhotoOperationsUtil;->getVideoSupportedOperations(Ljava/lang/String;)I

    move-result v0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/model/StorageItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/model/StorageItem;->getMimeType()Ljava/lang/String;

    move-result-object v2

    iget-wide v3, p0, Lcom/miui/gallery/model/StorageItem;->mLatitude:D

    iget-wide v5, p0, Lcom/miui/gallery/model/StorageItem;->mLongitude:D

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/util/PhotoOperationsUtil;->getImageSupportedOperations(Ljava/lang/String;Ljava/lang/String;DD)I

    move-result v0

    return v0
.end method
