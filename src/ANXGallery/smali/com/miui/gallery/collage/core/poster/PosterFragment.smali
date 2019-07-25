.class public Lcom/miui/gallery/collage/core/poster/PosterFragment;
.super Lcom/miui/gallery/collage/app/common/AbstractPosterFragment;
.source "PosterFragment.java"


# instance fields
.field private mBitmapExchangeListener:Lcom/miui/gallery/collage/widget/CollageLayout$BitmapExchangeListener;

.field private mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

.field private mDefaultRatio:F

.field private mImageViewMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/graphics/Bitmap;",
            "Lcom/miui/gallery/collage/widget/CollageImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mInit:Z

.field private mLayoutModel:Lcom/miui/gallery/collage/core/layout/LayoutModel;

.field private mModelReady:Z

.field private mPosterLayout:Lcom/miui/gallery/collage/widget/PosterLayout;

.field private mPosterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

.field private mRootView:Landroid/view/ViewGroup;

.field private mViewReady:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/collage/app/common/AbstractPosterFragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mModelReady:Z

    iput-boolean v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mViewReady:Z

    iput-boolean v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mInit:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mImageViewMap:Ljava/util/Map;

    new-instance v0, Lcom/miui/gallery/collage/core/poster/PosterFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/collage/core/poster/PosterFragment$3;-><init>(Lcom/miui/gallery/collage/core/poster/PosterFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mBitmapExchangeListener:Lcom/miui/gallery/collage/widget/CollageLayout$BitmapExchangeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/collage/core/poster/PosterFragment;)Lcom/miui/gallery/collage/widget/CollageLayout;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/collage/core/poster/PosterFragment;)Lcom/miui/gallery/collage/widget/PosterLayout;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mPosterLayout:Lcom/miui/gallery/collage/widget/PosterLayout;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/collage/core/poster/PosterFragment;)Ljava/util/Map;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mImageViewMap:Ljava/util/Map;

    return-object p0
.end method

.method private generateCollageLayout(Lcom/miui/gallery/collage/core/layout/LayoutModel;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/CollageLayout;->removeAllViews()V

    iget-object p1, p1, Lcom/miui/gallery/collage/core/layout/LayoutModel;->items:[Lcom/miui/gallery/collage/core/layout/LayoutItemModel;

    const/4 v0, 0x0

    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mBitmaps:[Landroid/graphics/Bitmap;

    aget-object v1, v1, v0

    aget-object v2, p1, v0

    new-instance v3, Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/miui/gallery/collage/widget/CollageImageView;-><init>(Landroid/content/Context;)V

    iget-object v4, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mBitmaps:[Landroid/graphics/Bitmap;

    array-length v4, v4

    if-ge v0, v4, :cond_0

    invoke-virtual {v3, v1}, Lcom/miui/gallery/collage/widget/CollageImageView;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object v4, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mImageViewMap:Ljava/util/Map;

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    new-instance v4, Lcom/miui/gallery/collage/widget/CollageLayout$LayoutParams;

    iget-object v5, v2, Lcom/miui/gallery/collage/core/layout/LayoutItemModel;->clipType:Lcom/miui/gallery/collage/ClipType;

    iget-object v2, v2, Lcom/miui/gallery/collage/core/layout/LayoutItemModel;->data:[F

    invoke-direct {v4, v5, v2}, Lcom/miui/gallery/collage/widget/CollageLayout$LayoutParams;-><init>(Lcom/miui/gallery/collage/ClipType;[F)V

    invoke-virtual {v1, v3, v4}, Lcom/miui/gallery/collage/widget/CollageLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static getResourceFloat(Landroid/content/res/Resources;IF)F
    .locals 2

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    const/4 v1, 0x1

    :try_start_0
    invoke-virtual {p0, p1, v0, v1}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    invoke-virtual {v0}, Landroid/util/TypedValue;->getFloat()F

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const-string p0, "PosterFragment"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Missing resource "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return p2
.end method

.method private refreshCollageLayout(Lcom/miui/gallery/collage/core/layout/LayoutModel;)V
    .locals 6

    iget-object p1, p1, Lcom/miui/gallery/collage/core/layout/LayoutModel;->items:[Lcom/miui/gallery/collage/core/layout/LayoutItemModel;

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/CollageLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    array-length v2, p1

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-ge v1, v2, :cond_0

    aget-object v2, p1, v1

    iget-object v3, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {v3, v1}, Lcom/miui/gallery/collage/widget/CollageLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lcom/miui/gallery/collage/widget/CollageLayout$LayoutParams;

    iget-object v5, v2, Lcom/miui/gallery/collage/core/layout/LayoutItemModel;->clipType:Lcom/miui/gallery/collage/ClipType;

    iget-object v2, v2, Lcom/miui/gallery/collage/core/layout/LayoutItemModel;->data:[F

    invoke-direct {v4, v5, v2}, Lcom/miui/gallery/collage/widget/CollageLayout$LayoutParams;-><init>(Lcom/miui/gallery/collage/ClipType;[F)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private refreshCollagePosition(Lcom/miui/gallery/collage/core/poster/PosterModel;)V
    .locals 6

    iget-object p1, p1, Lcom/miui/gallery/collage/core/poster/PosterModel;->collagePositions:[Lcom/miui/gallery/collage/core/poster/CollagePositionModel;

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mBitmaps:[Landroid/graphics/Bitmap;

    array-length v0, v0

    invoke-static {p1, v0}, Lcom/miui/gallery/collage/core/poster/CollagePositionModel;->getCollagePositionModelByImageSize([Lcom/miui/gallery/collage/core/poster/CollagePositionModel;I)Lcom/miui/gallery/collage/core/poster/CollagePositionModel;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    new-instance v1, Lcom/miui/gallery/collage/widget/PosterLayout$LayoutParams;

    iget-object v2, p1, Lcom/miui/gallery/collage/core/poster/CollagePositionModel;->position:[F

    invoke-direct {v1, v2}, Lcom/miui/gallery/collage/widget/PosterLayout$LayoutParams;-><init>([F)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/widget/CollageLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    iget v1, p1, Lcom/miui/gallery/collage/core/poster/CollagePositionModel;->margin:F

    iget-boolean v2, p1, Lcom/miui/gallery/collage/core/poster/CollagePositionModel;->ignoreEdgeMargin:Z

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/collage/widget/CollageLayout;->setCollageMargin(FZ)V

    iget-object v0, p1, Lcom/miui/gallery/collage/core/poster/CollagePositionModel;->masks:[Ljava/lang/String;

    if-eqz v0, :cond_0

    array-length v1, v0

    if-lez v1, :cond_0

    array-length v1, v0

    new-array v1, v1, [Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p1, Lcom/miui/gallery/collage/core/poster/CollagePositionModel;->relativePath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v5, v0, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/miui/gallery/collage/CollageUtils;->getDrawableByAssets(Landroid/content/res/Resources;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    new-instance v2, Lcom/miui/gallery/collage/core/poster/PosterFragment$1;

    invoke-direct {v2, p0, v1, p1}, Lcom/miui/gallery/collage/core/poster/PosterFragment$1;-><init>(Lcom/miui/gallery/collage/core/poster/PosterFragment;[Landroid/graphics/drawable/Drawable;Lcom/miui/gallery/collage/core/poster/CollagePositionModel;)V

    invoke-virtual {v0, v2}, Lcom/miui/gallery/collage/widget/CollageLayout;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private refreshLayout()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mInit:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mModelReady:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mBitmapReady:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mViewReady:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mLayoutModel:Lcom/miui/gallery/collage/core/layout/LayoutModel;

    invoke-direct {p0, v0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->generateCollageLayout(Lcom/miui/gallery/collage/core/layout/LayoutModel;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mPosterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    invoke-direct {p0, v0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->refreshCollagePosition(Lcom/miui/gallery/collage/core/poster/PosterModel;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mPosterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    invoke-direct {p0, v0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->setPosterModelToPosterLayout(Lcom/miui/gallery/collage/core/poster/PosterModel;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    iget-object v1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mReplaceImageListener:Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/widget/CollageLayout;->setReplaceImageListener(Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    iget-object v1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mBitmapExchangeListener:Lcom/miui/gallery/collage/widget/CollageLayout$BitmapExchangeListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/widget/CollageLayout;->setBitmapExchangeListener(Lcom/miui/gallery/collage/widget/CollageLayout$BitmapExchangeListener;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mInit:Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mLayoutModel:Lcom/miui/gallery/collage/core/layout/LayoutModel;

    invoke-direct {p0, v0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->refreshCollageLayout(Lcom/miui/gallery/collage/core/layout/LayoutModel;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mPosterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    invoke-direct {p0, v0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->refreshCollagePosition(Lcom/miui/gallery/collage/core/poster/PosterModel;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mPosterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    invoke-direct {p0, v0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->setPosterModelToPosterLayout(Lcom/miui/gallery/collage/core/poster/PosterModel;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private setPosterModelToPosterLayout(Lcom/miui/gallery/collage/core/poster/PosterModel;)V
    .locals 3

    iget v0, p1, Lcom/miui/gallery/collage/core/poster/PosterModel;->ratio:F

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-nez v1, :cond_0

    iget v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mDefaultRatio:F

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mPosterLayout:Lcom/miui/gallery/collage/widget/PosterLayout;

    invoke-virtual {v1}, Lcom/miui/gallery/collage/widget/PosterLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/constraint/ConstraintLayout$LayoutParams;

    iget-object v2, v1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {v0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mPosterLayout:Lcom/miui/gallery/collage/widget/PosterLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/PosterLayout;->requestLayout()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mPosterLayout:Lcom/miui/gallery/collage/widget/PosterLayout;

    new-instance v1, Lcom/miui/gallery/collage/core/poster/PosterFragment$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/collage/core/poster/PosterFragment$2;-><init>(Lcom/miui/gallery/collage/core/poster/PosterFragment;Lcom/miui/gallery/collage/core/poster/PosterModel;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/widget/PosterLayout;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method public dismissControlWindow()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/CollageLayout;->dismissControlWindow()V

    :cond_0
    return-void
.end method

.method public export()Lcom/miui/gallery/collage/core/RenderData;
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mPosterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    iget-object v2, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mLayoutModel:Lcom/miui/gallery/collage/core/layout/LayoutModel;

    iget-object v3, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    iget-object v4, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mPosterLayout:Lcom/miui/gallery/collage/widget/PosterLayout;

    invoke-virtual {v4}, Lcom/miui/gallery/collage/widget/PosterLayout;->getWidth()I

    move-result v4

    invoke-static {v0, v1, v2, v3, v4}, Lcom/miui/gallery/collage/render/CollageRender;->generateRenderData(Landroid/content/Context;Lcom/miui/gallery/collage/core/poster/PosterModel;Lcom/miui/gallery/collage/core/layout/LayoutModel;Lcom/miui/gallery/collage/widget/CollageLayout;I)Lcom/miui/gallery/collage/render/CollageRender$RenderData;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/collage/core/poster/PosterRenderData;

    invoke-direct {v1, v0}, Lcom/miui/gallery/collage/core/poster/PosterRenderData;-><init>(Lcom/miui/gallery/collage/render/CollageRender$RenderData;)V

    return-object v1
.end method

.method public isActivating()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/CollageLayout;->isActivating()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onBitmapReplace(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mImageViewMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/collage/widget/CollageImageView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p2}, Lcom/miui/gallery/collage/widget/CollageImageView;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object v1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mImageViewMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mImageViewMap:Ljava/util/Map;

    invoke-interface {p1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method protected onBitmapsReceive()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->refreshLayout()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0056

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onSelectModel(Lcom/miui/gallery/collage/core/poster/PosterModel;Lcom/miui/gallery/collage/core/layout/LayoutModel;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mPosterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    iput-object p2, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mLayoutModel:Lcom/miui/gallery/collage/core/layout/LayoutModel;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mModelReady:Z

    invoke-direct {p0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->refreshLayout()V

    return-void
.end method

.method public onSimple()Ljava/util/HashMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mPosterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mPosterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    iget-object v1, v1, Lcom/miui/gallery/collage/core/poster/PosterModel;->name:Ljava/lang/String;

    :goto_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x3

    if-le v2, v3, :cond_1

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :cond_1
    const-string v2, "collage_save_type"

    const-string v3, "Poster"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "collage_image_size"

    iget-object v3, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mBitmaps:[Landroid/graphics/Bitmap;

    if-nez v3, :cond_2

    const/4 v3, 0x0

    goto :goto_1

    :cond_2
    iget-object v3, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mBitmaps:[Landroid/graphics/Bitmap;

    array-length v3, v3

    :goto_1
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "Poster"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1

    move-object p2, p1

    check-cast p2, Landroid/view/ViewGroup;

    iput-object p2, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mRootView:Landroid/view/ViewGroup;

    const p2, 0x7f090225

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/collage/widget/PosterLayout;

    iput-object p2, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mPosterLayout:Lcom/miui/gallery/collage/widget/PosterLayout;

    const p2, 0x7f090099

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/collage/widget/CollageLayout;

    iput-object p1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mCollageLayout:Lcom/miui/gallery/collage/widget/CollageLayout;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mViewReady:Z

    invoke-virtual {p0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f06039e

    const/high16 v0, 0x3f400000    # 0.75f

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->getResourceFloat(Landroid/content/res/Resources;IF)F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment;->mDefaultRatio:F

    invoke-direct {p0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->refreshLayout()V

    return-void
.end method
