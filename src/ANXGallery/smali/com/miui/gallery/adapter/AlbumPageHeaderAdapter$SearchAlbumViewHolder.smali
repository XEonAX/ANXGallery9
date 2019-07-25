.class Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbumViewHolder;
.super Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;
.source "AlbumPageHeaderAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SearchAlbumViewHolder"
.end annotation


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;-><init>(Landroid/view/View;)V

    return-void
.end method

.method private bindServerCover(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 7

    invoke-static {}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->getInstance()Lcom/miui/gallery/search/core/display/icon/IconImageLoader;

    move-result-object v0

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p2

    iget-object v6, p2, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-object v1, p1

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v6}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->displayImageEager(Landroid/content/Context;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    return-void
.end method


# virtual methods
.method protected doBindCover(Landroid/content/Context;Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)V
    .locals 4

    move-object v0, p2

    check-cast v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbum;

    iget-object v0, v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbum;->mCoverUris:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbumViewHolder;->mDefaultAlbumCover:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbumViewHolder;->setCoversVisibility(I)V

    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p2, v1, :cond_0

    const/4 v1, 0x3

    if-ge p2, v1, :cond_0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbumViewHolder;->getAlbumCoverByIdx(I)Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {p3}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v3

    invoke-direct {p0, p1, v1, v2, v3}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbumViewHolder;->bindServerCover(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbumViewHolder;->sAlbumCovers:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-ge p2, p1, :cond_2

    :goto_1
    sget-object p1, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbumViewHolder;->sAlbumCovers:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-ge p2, p1, :cond_2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbumViewHolder;->getAlbumCoverByIdx(I)Landroid/widget/ImageView;

    move-result-object p1

    const p3, 0x7f07019e

    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_1
    iget p1, p2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mDefaultCoverRes:I

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbumViewHolder;->bindDefaultCover(I)V

    :cond_2
    return-void
.end method
