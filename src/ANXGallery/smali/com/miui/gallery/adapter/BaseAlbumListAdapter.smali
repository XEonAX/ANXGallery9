.class public abstract Lcom/miui/gallery/adapter/BaseAlbumListAdapter;
.super Lcom/miui/gallery/adapter/BaseGalleryAdapter;
.source "BaseAlbumListAdapter.java"

# interfaces
.implements Lcom/miui/gallery/model/AlbumConstants;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<VH:",
        "Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;",
        ">",
        "Lcom/miui/gallery/adapter/BaseGalleryAdapter<",
        "Lcom/miui/gallery/model/Album;",
        "TVH;>;",
        "Lcom/miui/gallery/model/AlbumConstants;"
    }
.end annotation


# instance fields
.field private mData:Landroid/support/v7/util/SortedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/util/SortedList<",
            "Lcom/miui/gallery/model/Album;",
            ">;"
        }
    .end annotation
.end field

.field private mPeopleFaceCover:Landroid/os/Bundle;

.field private mSharedAlbums:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BaseGalleryAdapter;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mPeopleFaceCover:Landroid/os/Bundle;

    new-instance p1, Landroid/support/v7/util/SortedList;

    const-class v0, Lcom/miui/gallery/model/Album;

    new-instance v1, Lcom/miui/gallery/adapter/BaseAlbumListAdapter$1;

    invoke-direct {v1, p0, p0}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter$1;-><init>(Lcom/miui/gallery/adapter/BaseAlbumListAdapter;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    invoke-direct {p1, v0, v1}, Landroid/support/v7/util/SortedList;-><init>(Ljava/lang/Class;Landroid/support/v7/util/SortedList$Callback;)V

    iput-object p1, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mData:Landroid/support/v7/util/SortedList;

    return-void
.end method

.method protected static isAutoUploadedAlbum(Lcom/miui/gallery/model/Album;)Z
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/model/Album;->getAttributes()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/model/Album;->getServerId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isSystemAlbum(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/model/Album;->getServerId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isScreenshotsAlbum(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isOtherShareAlbum(J)Z

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

.method public static isFavoritesAlbum(J)Z
    .locals 3

    const-wide/32 v0, 0x7ffffffa

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isFavoritesAlbum(Lcom/miui/gallery/model/Album;)Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isFavoritesAlbum(J)Z

    move-result p0

    return p0
.end method

.method public static isOtherShareAlbum(J)Z
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result p0

    return p0
.end method

.method public static isOthersAlbum(J)Z
    .locals 3

    const-wide/32 v0, 0x7ffffff9

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

.method public static isRecentAlbum(Lcom/miui/gallery/model/Album;)Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isRecentAlbum(J)Z

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

.method public static isSystemAlbum(Ljava/lang/String;)Z
    .locals 5

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
.method public albumUnwriteable(I)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->isImmutable()Z

    move-result p1

    return p1
.end method

.method public getAlbumCount(I)I
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getCount()I

    move-result p1

    return p1
.end method

.method public getAlbumLocalPath(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getLocalPath()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getAlbumName(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getLocalizedAlbumName()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getAttributes(I)Ljava/lang/Long;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAttributes()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method public getBabyAlbumPeopleId(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getPeopleId()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getBabyInfo(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getBabyInfo()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getBabySharerInfo(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getBabyShareInfo()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getData()Landroid/support/v7/util/SortedList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v7/util/SortedList<",
            "Lcom/miui/gallery/model/Album;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mData:Landroid/support/v7/util/SortedList;

    return-object v0
.end method

.method public getDownloadUri(I)Landroid/net/Uri;
    .locals 3

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getCoverSyncState()I

    move-result v0

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getCoverId()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getDownloadUri(IJ)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public getFileLength(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getCoverSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public getItem(I)Lcom/miui/gallery/model/Album;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mData:Landroid/support/v7/util/SortedList;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mData:Landroid/support/v7/util/SortedList;

    invoke-virtual {v0}, Landroid/support/v7/util/SortedList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mData:Landroid/support/v7/util/SortedList;

    invoke-virtual {v0, p1}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/model/Album;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mData:Landroid/support/v7/util/SortedList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mData:Landroid/support/v7/util/SortedList;

    invoke-virtual {v0}, Landroid/support/v7/util/SortedList;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getItemId(I)J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mData:Landroid/support/v7/util/SortedList;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mData:Landroid/support/v7/util/SortedList;

    invoke-virtual {v0}, Landroid/support/v7/util/SortedList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mData:Landroid/support/v7/util/SortedList;

    invoke-virtual {v0, p1}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/model/Album;

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v0

    return-wide v0

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/adapter/BaseGalleryAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLocalPath(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getCoverPath()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getPeopleFaceCover()Landroid/os/Bundle;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mPeopleFaceCover:Landroid/os/Bundle;

    return-object v0
.end method

.method public final getProjection()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method public getServerId(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getServerId()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getShareAlbumInfo(I)Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;
    .locals 3

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mSharedAlbums:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mSharedAlbums:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public getThumbnailInfoOfBaby(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getThumbnailInfoOfBaby()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected initDisplayImageOptions()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/adapter/BaseGalleryAdapter;->initDisplayImageOptions()V

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const v1, 0x7f0700d5

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnFail(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method public isAutoUploadedAlbum(I)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isAutoUploadedAlbum(Lcom/miui/gallery/model/Album;)Z

    move-result p1

    return p1
.end method

.method public isAutoUploadedAlbum(JLjava/lang/String;J)Z
    .locals 3

    const-wide/16 v0, 0x1

    and-long/2addr p1, v0

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-nez v2, :cond_2

    invoke-static {p3}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isSystemAlbum(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {p3}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isScreenshotsAlbum(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    :cond_0
    invoke-static {p4, p5}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isOtherShareAlbum(J)Z

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

.method public isBabyAlbum(I)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isBabyAlbum(Lcom/miui/gallery/model/Album;)Z

    move-result p1

    return p1
.end method

.method public isBabyAlbum(Lcom/miui/gallery/model/Album;)Z
    .locals 0

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getBabyInfo()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public isForceTypeTime(I)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isForceTypeTime(Lcom/miui/gallery/model/Album;)Z

    move-result p1

    return p1
.end method

.method public isForceTypeTime(Lcom/miui/gallery/model/Album;)Z
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getSortBy()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/GalleryPreferences$Album;->isForceTopAlbumByTopTime(J)Z

    move-result p1

    return p1
.end method

.method public isHiddenAlbum(I)Z
    .locals 4

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAttributes()J

    move-result-wide v0

    const-wide/16 v2, 0x10

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isOtherAlbum(I)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isOtherAlbum(Lcom/miui/gallery/model/Album;)Z

    move-result p1

    return p1
.end method

.method public isOtherAlbum(Lcom/miui/gallery/model/Album;)Z
    .locals 1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAlbumClassification()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isOtherShareAlbum(I)Z
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isOtherShareAlbum(J)Z

    move-result p1

    return p1
.end method

.method public isOwnerShareAlbum(I)Z
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isOwnerShareAlbum(J)Z

    move-result p1

    return p1
.end method

.method public isOwnerShareAlbum(J)Z
    .locals 3

    const-wide/32 v0, 0x7ffe795f

    cmp-long v2, p1, v0

    if-gez v2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mSharedAlbums:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mSharedAlbums:Ljava/util/Map;

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

.method public isPanoAlbum(I)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isPanoAlbum(Lcom/miui/gallery/model/Album;)Z

    move-result p1

    return p1
.end method

.method protected isPanoAlbum(Lcom/miui/gallery/model/Album;)Z
    .locals 4

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v0

    const-wide/32 v2, 0x7ffffffd

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isScreenshotsAlbum(I)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getServerId()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isScreenshotsAlbum(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public isShareAlbum(J)Z
    .locals 1

    invoke-static {p1, p2}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isOtherShareAlbum(J)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isOwnerShareAlbum(J)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public isShowedPhotosTabAlbum(I)Z
    .locals 4

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAttributes()J

    move-result-wide v0

    const-wide/16 v2, 0x4

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isSystemAlbum(I)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getServerId()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isSystemAlbum(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method protected isVideoAlbum(Lcom/miui/gallery/model/Album;)Z
    .locals 4

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v0

    const-wide/32 v2, 0x7fffffff

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public setPeopleFaceCover(Landroid/database/Cursor;)V
    .locals 0

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mPeopleFaceCover:Landroid/os/Bundle;

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setSharedAlbums(Landroid/database/Cursor;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mSharedAlbums:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mSharedAlbums:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    :cond_0
    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_2
    new-instance v0, Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;

    invoke-direct {v0}, Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;-><init>()V

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;->mAlbumId:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;->mCreatorId:Ljava/lang/String;

    const/4 v1, 0x2

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;->mUserCount:I

    const/4 v1, 0x3

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;->mOwnerNickName:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mSharedAlbums:Ljava/util/Map;

    if-nez v1, :cond_3

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mSharedAlbums:Ljava/util/Map;

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->mSharedAlbums:Ljava/util/Map;

    iget-object v2, v0, Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;->mAlbumId:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_2

    :cond_4
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->getItemCount()I

    move-result p1

    if-lez p1, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->notifyDataSetChanged()V

    :cond_5
    return-void
.end method
