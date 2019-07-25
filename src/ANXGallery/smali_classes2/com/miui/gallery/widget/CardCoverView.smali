.class public Lcom/miui/gallery/widget/CardCoverView;
.super Landroid/widget/LinearLayout;
.source "CardCoverView.java"


# instance fields
.field private mCoverImageView1:Landroid/widget/ImageView;

.field private mCoverImageView2:Landroid/widget/ImageView;

.field private mCoverImageView3:Landroid/widget/ImageView;

.field private mCoverImageView4:Landroid/widget/ImageView;

.field private mCoverImageView5:Lcom/miui/gallery/widget/CardNumImageView;

.field private mMediaFeatureItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;"
        }
    .end annotation
.end field

.field private mOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mSecondRow:Landroid/widget/LinearLayout;

.field private mShouldUpdateViews:Z

.field private mThirdRow:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/CardCoverView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/CardCoverView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/CardCoverView;->initViews(Landroid/content/Context;)V

    return-void
.end method

.method private bindView(Landroid/widget/ImageView;Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 11

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    move-object v3, p4

    if-ne v3, v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    :goto_0
    move-object v6, v0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :goto_1
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p1

    move-object/from16 v5, p5

    invoke-static/range {v1 .. v10}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZLcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)V

    return-void
.end method

.method private getCoverImageView(II)Landroid/widget/ImageView;
    .locals 1

    const/4 v0, 0x0

    if-gt p1, p2, :cond_0

    return-object v0

    :cond_0
    packed-switch p2, :pswitch_data_0

    return-object v0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView5:Lcom/miui/gallery/widget/CardNumImageView;

    return-object p1

    :pswitch_1
    const/4 p2, 0x4

    if-ne p1, p2, :cond_1

    return-object v0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView4:Landroid/widget/ImageView;

    return-object p1

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView3:Landroid/widget/ImageView;

    return-object p1

    :pswitch_3
    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView2:Landroid/widget/ImageView;

    return-object p1

    :pswitch_4
    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView1:Landroid/widget/ImageView;

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getDownloadUri(IJ)Landroid/net/Uri;
    .locals 0

    if-nez p0, :cond_0

    invoke-static {p1, p2}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getImagePath(Lcom/miui/gallery/assistant/model/MediaFeatureItem;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 3

    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getOriginPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getThumbnailPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getMicroThumbnailPath()Ljava/lang/String;

    move-result-object p0

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne p1, v2, :cond_2

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    move-object p0, v1

    goto :goto_0

    :cond_1
    move-object p0, v0

    :goto_0
    return-object p0

    :cond_2
    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne p1, v2, :cond_5

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    move-object p0, v0

    goto :goto_1

    :cond_4
    move-object p0, v1

    :goto_1
    return-object p0

    :cond_5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_7

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_6

    move-object p0, v1

    goto :goto_2

    :cond_6
    move-object p0, v0

    :cond_7
    :goto_2
    return-object p0

    :cond_8
    const-string p0, ""

    return-object p0
.end method

.method private initViews(Landroid/content/Context;)V
    .locals 1

    const v0, 0x7f0b003a

    invoke-static {p1, v0, p0}, Landroid/widget/LinearLayout;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    const p1, 0x7f0900b5

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/CardCoverView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView1:Landroid/widget/ImageView;

    const p1, 0x7f0900b6

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/CardCoverView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView2:Landroid/widget/ImageView;

    const p1, 0x7f0900b7

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/CardCoverView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView3:Landroid/widget/ImageView;

    const p1, 0x7f0900b8

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/CardCoverView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView4:Landroid/widget/ImageView;

    const p1, 0x7f0900b9

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/CardCoverView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/CardNumImageView;

    iput-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView5:Lcom/miui/gallery/widget/CardNumImageView;

    const p1, 0x7f09028a

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/CardCoverView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mSecondRow:Landroid/widget/LinearLayout;

    const p1, 0x7f0902e9

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/CardCoverView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mThirdRow:Landroid/widget/LinearLayout;

    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x5

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mMediaFeatureItems:Ljava/util/List;

    return-void
.end method

.method private updateViews()V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/widget/CardCoverView;->mMediaFeatureItems:Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/miui/gallery/widget/CardCoverView;->mShouldUpdateViews:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/widget/CardCoverView;->mShouldUpdateViews:Z

    iget-object v1, p0, Lcom/miui/gallery/widget/CardCoverView;->mMediaFeatureItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    :goto_0
    if-ge v0, v1, :cond_2

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/widget/CardCoverView;->getCoverImageView(II)Landroid/widget/ImageView;

    move-result-object v3

    if-eqz v3, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/widget/CardCoverView;->mMediaFeatureItems:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-static {v1, v0}, Lcom/miui/gallery/card/CardUtil;->getDownloadType(II)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/miui/gallery/widget/CardCoverView;->getImagePath(Lcom/miui/gallery/assistant/model/MediaFeatureItem;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getLocalFlag()I

    move-result v5

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getId()J

    move-result-wide v7

    invoke-static {v5, v7, v8}, Lcom/miui/gallery/widget/CardCoverView;->getDownloadUri(IJ)Landroid/net/Uri;

    move-result-object v5

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne v6, v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/widget/CardCoverView;->mOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    :goto_1
    move-object v7, v2

    goto :goto_2

    :cond_0
    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v2

    iget-object v2, v2, Lcom/miui/gallery/Config$ThumbConfig;->MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    goto :goto_1

    :goto_2
    move-object v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/widget/CardCoverView;->bindView(Landroid/widget/ImageView;Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method


# virtual methods
.method protected onLayout(ZIIII)V
    .locals 0

    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/CardCoverView;->updateViews()V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 1

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    add-int/lit8 p2, p2, -0x4

    div-int/lit8 p2, p2, 0x2

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    return-void
.end method

.method public setImageCount(I)V
    .locals 5

    const/16 v0, 0x8

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-gt p1, v2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView1:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mSecondRow:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mThirdRow:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView1:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p1, v1, v1, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    goto/16 :goto_1

    :cond_0
    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x2

    if-ne p1, v3, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView1:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mSecondRow:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mThirdRow:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView3:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView1:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p1, v1, v1, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView2:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p1, v1, v1, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView1:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mSecondRow:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    goto/16 :goto_1

    :cond_1
    const/4 v4, 0x3

    if-eq p1, v4, :cond_3

    const/4 v4, 0x4

    if-ne p1, v4, :cond_2

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView1:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/widget/CardCoverView;->mSecondRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/widget/CardCoverView;->mThirdRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView3:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView1:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v1, v1, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView2:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v1, v1, v1, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView1:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v1, 0x40000000    # 2.0f

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    iget-object v0, p0, Lcom/miui/gallery/widget/CardCoverView;->mSecondRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    iget-object v0, p0, Lcom/miui/gallery/widget/CardCoverView;->mThirdRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    iget-object v0, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView5:Lcom/miui/gallery/widget/CardNumImageView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/CardNumImageView;->setNum(I)V

    goto :goto_1

    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView1:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mSecondRow:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mThirdRow:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView3:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView1:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p1, v1, v1, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView2:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p1, v1, v1, v1, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView1:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v0, 0x40a00000    # 5.0f

    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    iget-object p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mSecondRow:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    :goto_1
    return-void
.end method

.method public update(ILcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 0

    const/4 p2, 0x1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/widget/CardCoverView;->setImageCount(I)V

    iget-object p2, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView1:Landroid/widget/ImageView;

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method

.method public update(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 3

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/CardCoverView;->setImageCount(I)V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    new-instance v1, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    iget-object v2, p0, Lcom/miui/gallery/widget/CardCoverView;->mCoverImageView1:Landroid/widget/ImageView;

    invoke-direct {v1, v2}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    invoke-virtual {v0, p1, v1, p2}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    return-void
.end method

.method public update(Ljava/util/List;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;",
            "Lcom/nostra13/universalimageloader/core/DisplayImageOptions;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/widget/CardCoverView;->mMediaFeatureItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/widget/CardCoverView;->mMediaFeatureItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iput-object p2, p0, Lcom/miui/gallery/widget/CardCoverView;->mOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/widget/CardCoverView;->mShouldUpdateViews:Z

    invoke-virtual {p0}, Lcom/miui/gallery/widget/CardCoverView;->requestLayout()V

    return-void
.end method
