.class public Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;
.super Landroid/widget/LinearLayout;
.source "BabyAlbumDetailFaceHeaderItem.java"


# static fields
.field private static sDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

.field private static sDisplayImageOptionsLocalFace:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private static sDisplayImageOptionsNetFace:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;


# instance fields
.field private mAgeCurrent:Landroid/widget/TextView;

.field private mBackground:Landroid/widget/ImageView;

.field private mFace:Landroid/widget/ImageView;

.field private mImageAwareFace:Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private intialBuilder()V
    .locals 3

    sget-object v0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->sDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    if-nez v0, :cond_0

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v2, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    new-instance v2, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;

    invoke-direct {v2, v1}, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;-><init>(Z)V

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer(Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->usingRegionDecoderFace(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const v1, 0x7f070035

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showStubImage(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->sDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    :cond_0
    return-void
.end method


# virtual methods
.method public bindHeadFacePic(Ljava/lang/String;Landroid/graphics/RectF;)V
    .locals 8

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    sget-object v1, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v1, p1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->mImageAwareFace:Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    sget-object v3, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->sDisplayImageOptionsLocalFace:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v7, p2

    invoke-virtual/range {v0 .. v7}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;Landroid/graphics/RectF;)V

    return-void
.end method

.method public bindHeadFacePicFromNet(Ljava/lang/String;Landroid/graphics/RectF;)V
    .locals 9

    sget-object v0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->sDisplayImageOptionsNetFace:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->intialBuilder()V

    sget-object v0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->sDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisc()Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->sDisplayImageOptionsNetFace:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    :cond_0
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v1

    iget-object v3, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->mImageAwareFace:Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    sget-object v4, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->sDisplayImageOptionsNetFace:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p1

    move-object v8, p2

    invoke-virtual/range {v1 .. v8}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;Landroid/graphics/RectF;)V

    return-void
.end method

.method public bindHeaderBackgroundPic(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 6

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    iget-object v3, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->mBackground:Landroid/widget/ImageView;

    const/4 v5, 0x0

    move-object v0, p1

    move-object v1, p2

    move-object v4, p3

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    return-void
.end method

.method public getHeadFacePic()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->mImageAwareFace:Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onFinishInflate()V
    .locals 2

    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    const v0, 0x7f090055

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->mBackground:Landroid/widget/ImageView;

    const v0, 0x7f09010d

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->mFace:Landroid/widget/ImageView;

    new-instance v0, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    iget-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->mFace:Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->mImageAwareFace:Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    const v0, 0x7f090028

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->mAgeCurrent:Landroid/widget/TextView;

    sget-object v0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->sDisplayImageOptionsLocalFace:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->intialBuilder()V

    sget-object v0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->sDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheThumbnail(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadFromMicroCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->sDisplayImageOptionsLocalFace:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    :cond_0
    return-void
.end method

.method public setAge(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->mAgeCurrent:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setOnBackgroundClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->mBackground:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setOnFaceClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->mFace:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
