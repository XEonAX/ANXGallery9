.class Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;
.super Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;
.source "TypeFaceHolder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;
    }
.end annotation


# static fields
.field private static sDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;


# instance fields
.field private mDownloadView:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

.field private mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

.field private mImageLoadingProcess:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;

.field private mIvCheck:Landroid/widget/ImageView;

.field private mNameImage:Landroid/widget/ImageView;

.field private mNameText:Landroid/widget/TextView;

.field private mSelectedColor:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v3, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->IN_SAMPLE_INT:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {v0, v3}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisk(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheBigPhoto(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->sDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f090310

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mNameText:Landroid/widget/TextView;

    const v0, 0x7f09018e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mNameImage:Landroid/widget/ImageView;

    const v0, 0x7f0900ea

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mDownloadView:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    const v0, 0x7f09013c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mIvCheck:Landroid/widget/ImageView;

    new-instance v0, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mNameImage:Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f050169

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mSelectedColor:I

    return-void
.end method


# virtual methods
.method public bind(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Z)V
    .locals 5

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->isLocal()Z

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getDefaultNameResId()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mNameText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mNameImage:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mNameText:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mDownloadView:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    invoke-virtual {p1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mNameText:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setSelected(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mIvCheck:Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setSelected(Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mNameImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mNameText:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mImageLoadingProcess:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;

    if-nez v0, :cond_1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mDownloadView:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;

    invoke-direct {v0, p1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mImageLoadingProcess:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;

    :cond_1
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getIconUrl()Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    sget-object v3, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->sDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mImageLoadingProcess:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder$ImageLoadingProcess;

    invoke-virtual {v0, p1, v2, v3, v4}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mNameImage:Landroid/widget/ImageView;

    if-eqz p2, :cond_2

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mSelectedColor:I

    :cond_2
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setColorFilter(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceHolder;->mIvCheck:Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setSelected(Z)V

    :goto_0
    return-void
.end method

.method public setSelect(Z)V
    .locals 0

    return-void
.end method
