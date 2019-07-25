.class public Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;
.super Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;
.source "BaseResourceAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BaseResourceHolder"
.end annotation


# instance fields
.field public mDownloadView:Lcom/miui/gallery/ui/DownloadView;

.field protected mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

.field protected mImageView:Landroid/widget/ImageView;

.field protected mTitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->this$0:Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;

    invoke-direct {p0, p2}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;-><init>(Landroid/view/View;)V

    const p1, 0x7f09018c

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->mTitle:Landroid/widget/TextView;

    const p1, 0x7f090188

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->mImageView:Landroid/widget/ImageView;

    const p1, 0x7f090186

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/DownloadView;

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->mDownloadView:Lcom/miui/gallery/ui/DownloadView;

    new-instance p1, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->mImageView:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    return-void
.end method

.method static synthetic lambda$bindView$131(Lcom/miui/gallery/movie/entity/MovieResource;)V
    .locals 1

    const/16 v0, 0x11

    iput v0, p0, Lcom/miui/gallery/movie/entity/MovieResource;->downloadState:I

    return-void
.end method


# virtual methods
.method public bindView(I)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->this$0:Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;->getItemData(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/movie/entity/MovieResource;

    iget-boolean v1, v0, Lcom/miui/gallery/movie/entity/MovieResource;->isPackageAssets:Z

    if-eqz v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->mTitle:Landroid/widget/TextView;

    iget v1, v0, Lcom/miui/gallery/movie/entity/MovieResource;->stringId:I

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->mImageView:Landroid/widget/ImageView;

    iget v1, v0, Lcom/miui/gallery/movie/entity/MovieResource;->imageId:I

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->cancelDisplayTask(Landroid/widget/ImageView;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/movie/utils/ImageLoaderUtils;->getNormalDisplayImageOptionsBuilder()Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->this$0:Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;

    invoke-static {v2}, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;->access$000(Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;)[I

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->this$0:Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;

    invoke-static {v3}, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;->access$000(Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;)[I

    move-result-object v3

    array-length v3, v3

    rem-int/2addr p1, v3

    aget p1, v2, p1

    invoke-virtual {v1, p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v1

    iget-object v2, v0, Lcom/miui/gallery/movie/entity/MovieResource;->icon:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    invoke-virtual {v1, v2, v3, p1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    invoke-virtual {v0}, Lcom/miui/gallery/movie/entity/MovieResource;->getNameId()I

    move-result p1

    if-eqz p1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->mTitle:Landroid/widget/TextView;

    iget-object v1, v0, Lcom/miui/gallery/movie/entity/MovieResource;->label:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    invoke-virtual {v0}, Lcom/miui/gallery/movie/entity/MovieResource;->getDownloadState()I

    move-result p1

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->mDownloadView:Lcom/miui/gallery/ui/DownloadView;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/ui/DownloadView;->setStateImage(I)V

    if-nez p1, :cond_2

    const/16 p1, 0x11

    iput p1, v0, Lcom/miui/gallery/movie/entity/MovieResource;->downloadState:I

    :cond_2
    return-void
.end method

.method public bindView(ILjava/lang/Object;)V
    .locals 3

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;->bindView(ILjava/lang/Object;)V

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->this$0:Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;->getItemData(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/movie/entity/MovieResource;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/entity/MovieResource;->getDownloadState()I

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->mDownloadView:Lcom/miui/gallery/ui/DownloadView;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/ui/DownloadView;->setStateImage(I)V

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->mDownloadView:Lcom/miui/gallery/ui/DownloadView;

    new-instance v0, Lcom/miui/gallery/movie/ui/adapter/-$$Lambda$BaseResourceAdapter$BaseResourceHolder$YofyEWqdkEzxPr3Rg5Ni13NdhuY;

    invoke-direct {v0, p1}, Lcom/miui/gallery/movie/ui/adapter/-$$Lambda$BaseResourceAdapter$BaseResourceHolder$YofyEWqdkEzxPr3Rg5Ni13NdhuY;-><init>(Lcom/miui/gallery/movie/entity/MovieResource;)V

    const-wide/16 v1, 0x3e8

    invoke-virtual {p2, v0, v1, v2}, Lcom/miui/gallery/ui/DownloadView;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method
