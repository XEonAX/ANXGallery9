.class abstract Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AlbumPageHeaderAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "BaseViewHolder"
.end annotation


# static fields
.field static sAlbumCovers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected mAlbumName:Landroid/widget/TextView;

.field protected mCover1:Landroid/view/View;

.field protected mCover2:Landroid/view/View;

.field protected mCover3:Landroid/view/View;

.field protected mDefaultAlbumCover:Landroid/widget/ImageView;

.field protected mItemView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->sAlbumCovers:Ljava/util/List;

    sget-object v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->sAlbumCovers:Ljava/util/List;

    const v1, 0x7f09002c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->sAlbumCovers:Ljava/util/List;

    const v1, 0x7f09002d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->sAlbumCovers:Ljava/util/List;

    const v1, 0x7f09002e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->mItemView:Landroid/view/View;

    const v0, 0x7f09003a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->mAlbumName:Landroid/widget/TextView;

    const v0, 0x7f09002c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->mCover1:Landroid/view/View;

    const v0, 0x7f09002d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->mCover2:Landroid/view/View;

    const v0, 0x7f09002e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->mCover3:Landroid/view/View;

    const v0, 0x7f0900c5

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->mDefaultAlbumCover:Landroid/widget/ImageView;

    return-void
.end method

.method private bindCover(Landroid/content/Context;Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)V
    .locals 1

    iget-boolean v0, p2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mIsCoverDataValid:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->doBindCover(Landroid/content/Context;Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)V

    :cond_0
    return-void
.end method

.method protected static buildDisplayImageOptions(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->fileLength(J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method protected static getDownloadUri(JI)Landroid/net/Uri;
    .locals 0

    if-nez p2, :cond_0

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {p2, p0, p1}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method


# virtual methods
.method public bindClickListener(Landroid/content/Context;Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->mItemView:Landroid/view/View;

    new-instance v1, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder$1;

    invoke-direct {v1, p0, p2, p1}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder$1;-><init>(Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected bindDefaultCover(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->mDefaultAlbumCover:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->setCoversVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->mDefaultAlbumCover:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method

.method public bindView(Landroid/content/Context;Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->mAlbumName:Landroid/widget/TextView;

    iget v1, p2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mAlbumNameRes:I

    invoke-virtual {p1, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->bindCover(Landroid/content/Context;Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)V

    return-void
.end method

.method protected abstract doBindCover(Landroid/content/Context;Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)V
.end method

.method protected getAlbumCoverByIdx(I)Landroid/widget/ImageView;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->mItemView:Landroid/view/View;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->sAlbumCovers:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    return-object p1
.end method

.method protected setCoversVisibility(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->mCover1:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->mCover2:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->mCover3:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
