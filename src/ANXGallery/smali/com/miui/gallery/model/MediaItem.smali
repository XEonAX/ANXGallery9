.class public Lcom/miui/gallery/model/MediaItem;
.super Lcom/miui/gallery/model/BaseDataItem;
.source "MediaItem.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/model/BaseDataItem;-><init>()V

    return-void
.end method


# virtual methods
.method public getDetailInfo(Landroid/content/Context;)Lcom/miui/gallery/model/PhotoDetailInfo;
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/model/BaseDataItem;->getDetailInfo(Landroid/content/Context;)Lcom/miui/gallery/model/PhotoDetailInfo;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/model/MediaItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->extractExifInfo(Lcom/miui/gallery/model/PhotoDetailInfo;Ljava/lang/String;Z)V

    return-object p1
.end method

.method public getFavoriteInfo(Z)Lcom/miui/gallery/model/FavoriteInfo;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/model/MediaItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/FavoritesManager;->queryFavoriteInfoByFilePath(Ljava/lang/String;Z)Lcom/miui/gallery/model/FavoriteInfo;

    move-result-object p1

    return-object p1
.end method

.method public initSupportOperations()I
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/model/MediaItem;->isVideo()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/model/MediaItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/PhotoOperationsUtil;->getVideoSupportedOperations(Ljava/lang/String;)I

    move-result v0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/model/MediaItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/model/MediaItem;->getMimeType()Ljava/lang/String;

    move-result-object v2

    iget-wide v3, p0, Lcom/miui/gallery/model/MediaItem;->mLatitude:D

    iget-wide v5, p0, Lcom/miui/gallery/model/MediaItem;->mLongitude:D

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/util/PhotoOperationsUtil;->getImageSupportedOperations(Ljava/lang/String;Ljava/lang/String;DD)I

    move-result v0

    return v0
.end method
