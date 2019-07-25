.class Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$PeopleAlbumViewHolder;
.super Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;
.source "AlbumPageHeaderAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PeopleAlbumViewHolder"
.end annotation


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;-><init>(Landroid/view/View;)V

    return-void
.end method

.method private bindFaceCover(Ljava/lang/String;Landroid/widget/ImageView;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Landroid/graphics/RectF;)V
    .locals 8

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v5, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    const/4 v7, 0x0

    move-object v1, p1

    move-object v2, p3

    move-object v3, p2

    move-object v4, p4

    move-object v6, p5

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/BindImageHelper;->bindFaceImage(Ljava/lang/String;Landroid/net/Uri;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;Z)V

    return-void
.end method


# virtual methods
.method protected doBindCover(Landroid/content/Context;Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)V
    .locals 9

    move-object p1, p2

    check-cast p1, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbum;

    iget-object p1, p1, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbum;->mAlbumCovers:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$PeopleAlbumViewHolder;->mDefaultAlbumCover:Landroid/widget/ImageView;

    const/4 v0, 0x4

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$PeopleAlbumViewHolder;->setCoversVisibility(I)V

    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p2, v0, :cond_0

    const/4 v0, 0x3

    if-ge p2, v0, :cond_0

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/model/BaseAlbumCover;

    iget-wide v1, v0, Lcom/miui/gallery/model/BaseAlbumCover;->coverSize:J

    invoke-static {p3, v1, v2}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$PeopleAlbumViewHolder;->buildDisplayImageOptions(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v7

    iget-object v4, v0, Lcom/miui/gallery/model/BaseAlbumCover;->coverPath:Ljava/lang/String;

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$PeopleAlbumViewHolder;->getAlbumCoverByIdx(I)Landroid/widget/ImageView;

    move-result-object v5

    iget-wide v1, v0, Lcom/miui/gallery/model/BaseAlbumCover;->coverId:J

    iget v3, v0, Lcom/miui/gallery/model/BaseAlbumCover;->coverSyncState:I

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$PeopleAlbumViewHolder;->getDownloadUri(JI)Landroid/net/Uri;

    move-result-object v6

    check-cast v0, Lcom/miui/gallery/model/FaceAlbumCover;

    iget-object v8, v0, Lcom/miui/gallery/model/FaceAlbumCover;->faceRectF:Lcom/miui/gallery/util/face/FaceRegionRectF;

    move-object v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$PeopleAlbumViewHolder;->bindFaceCover(Ljava/lang/String;Landroid/widget/ImageView;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Landroid/graphics/RectF;)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$PeopleAlbumViewHolder;->sAlbumCovers:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-ge p2, p1, :cond_2

    :goto_1
    sget-object p1, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$PeopleAlbumViewHolder;->sAlbumCovers:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-ge p2, p1, :cond_2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$PeopleAlbumViewHolder;->getAlbumCoverByIdx(I)Landroid/widget/ImageView;

    move-result-object p1

    const p3, 0x7f07019e

    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_1
    iget p1, p2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mDefaultCoverRes:I

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$PeopleAlbumViewHolder;->bindDefaultCover(I)V

    :cond_2
    return-void
.end method
