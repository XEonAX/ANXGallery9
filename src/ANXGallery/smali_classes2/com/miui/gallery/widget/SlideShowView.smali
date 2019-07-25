.class public Lcom/miui/gallery/widget/SlideShowView;
.super Landroid/view/View;
.source "SlideShowView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/SlideShowView$OnRefreshedListener;,
        Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;,
        Lcom/miui/gallery/widget/SlideShowView$FloatAnimation;
    }
.end annotation


# instance fields
.field private mAlphaAnim:Landroid/view/animation/AlphaAnimation;

.field private mCurrentAnim:Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;

.field private mCurrentBitmap:Landroid/graphics/Bitmap;

.field private mIsAnimEnable:Z

.field private mIsScaleOnlyMode:Z

.field private mPaint:Landroid/graphics/Paint;

.field private mPreAnim:Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;

.field private mPreBitmap:Landroid/graphics/Bitmap;

.field private mRefreshedListener:Lcom/miui/gallery/widget/SlideShowView$OnRefreshedListener;

.field private mScaleMode:I

.field private mSlideDuration:I

.field private mTransFormation:Landroid/view/animation/Transformation;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/SlideShowView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/SlideShowView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 v0, 0xdac

    iput v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mSlideDuration:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mIsAnimEnable:Z

    sget-object v0, Lcom/miui/gallery/R$styleable;->SlideShowView:[I

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v1, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/SlideShowView;->mScaleMode:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/SlideShowView;->initParams()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/SlideShowView;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/SlideShowView;->mScaleMode:I

    return p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/SlideShowView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/widget/SlideShowView;->mIsScaleOnlyMode:Z

    return p0
.end method

.method private initParams()V
    .locals 7

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    new-instance v0, Landroid/view/animation/Transformation;

    invoke-direct {v0}, Landroid/view/animation/Transformation;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mTransFormation:Landroid/view/animation/Transformation;

    new-instance v0, Lcom/miui/gallery/widget/SlideShowView$FloatAnimation;

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const-wide/16 v5, 0x3e8

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/widget/SlideShowView$FloatAnimation;-><init>(Lcom/miui/gallery/widget/SlideShowView;FFJ)V

    iput-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mAlphaAnim:Landroid/view/animation/AlphaAnimation;

    return-void
.end method

.method private invalidateView()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/SlideShowView;->invalidate()V

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mRefreshedListener:Lcom/miui/gallery/widget/SlideShowView$OnRefreshedListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mRefreshedListener:Lcom/miui/gallery/widget/SlideShowView$OnRefreshedListener;

    invoke-interface {v0}, Lcom/miui/gallery/widget/SlideShowView$OnRefreshedListener;->onRefreshed()V

    :cond_0
    return-void
.end method

.method private isCurValid()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mCurrentBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mCurrentBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isPreValid()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mPreBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mPreBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public next(Landroid/graphics/Bitmap;I)V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mAlphaAnim:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {v0}, Landroid/view/animation/AlphaAnimation;->start()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/SlideShowView;->isPreValid()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mPreBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mPreBitmap:Landroid/graphics/Bitmap;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mCurrentBitmap:Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mPreBitmap:Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mCurrentAnim:Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;

    iput-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mPreAnim:Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;

    iput-object p1, p0, Lcom/miui/gallery/widget/SlideShowView;->mCurrentBitmap:Landroid/graphics/Bitmap;

    div-int/lit8 v1, p2, 0x5a

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_1

    new-instance v7, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    iget v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mSlideDuration:I

    int-to-long v5, v0

    move-object v0, v7

    move-object v1, p0

    move v4, p2

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;-><init>(Lcom/miui/gallery/widget/SlideShowView;IIIJ)V

    iput-object v7, p0, Lcom/miui/gallery/widget/SlideShowView;->mCurrentAnim:Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;

    goto :goto_0

    :cond_1
    new-instance v7, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mSlideDuration:I

    int-to-long v5, v0

    move-object v0, v7

    move-object v1, p0

    move v4, p2

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;-><init>(Lcom/miui/gallery/widget/SlideShowView;IIIJ)V

    iput-object v7, p0, Lcom/miui/gallery/widget/SlideShowView;->mCurrentAnim:Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mCurrentAnim:Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->start()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/SlideShowView;->invalidateView()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    invoke-virtual {p0}, Lcom/miui/gallery/widget/SlideShowView;->getDrawingTime()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/widget/SlideShowView;->mTransFormation:Landroid/view/animation/Transformation;

    invoke-virtual {v2}, Landroid/view/animation/Transformation;->clear()V

    iget-object v2, p0, Lcom/miui/gallery/widget/SlideShowView;->mAlphaAnim:Landroid/view/animation/AlphaAnimation;

    iget-object v3, p0, Lcom/miui/gallery/widget/SlideShowView;->mTransFormation:Landroid/view/animation/Transformation;

    invoke-virtual {v2, v0, v1, v3}, Landroid/view/animation/AlphaAnimation;->getTransformation(JLandroid/view/animation/Transformation;)Z

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/widget/SlideShowView;->mPreBitmap:Landroid/graphics/Bitmap;

    const/high16 v4, 0x3f800000    # 1.0f

    if-nez v3, :cond_0

    const/high16 v3, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lcom/miui/gallery/widget/SlideShowView;->mTransFormation:Landroid/view/animation/Transformation;

    invoke-virtual {v3}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v3

    :goto_0
    iget-boolean v5, p0, Lcom/miui/gallery/widget/SlideShowView;->mIsAnimEnable:Z

    const/4 v6, 0x0

    if-nez v5, :cond_4

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/miui/gallery/widget/SlideShowView;->isPreValid()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mPreBitmap:Landroid/graphics/Bitmap;

    goto :goto_1

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/widget/SlideShowView;->isCurValid()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mCurrentBitmap:Landroid/graphics/Bitmap;

    :cond_2
    :goto_1
    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/widget/SlideShowView;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/SlideShowView;->getHeight()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    sub-int/2addr v1, v3

    int-to-float v1, v1

    const/high16 v3, 0x3f000000    # 0.5f

    mul-float v1, v1, v3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    sub-int/2addr v2, v4

    int-to-float v2, v2

    mul-float v2, v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v5, v1, v2}, Landroid/graphics/Matrix;->setTranslate(FF)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-object v1, p0, Lcom/miui/gallery/widget/SlideShowView;->mPaint:Landroid/graphics/Paint;

    const/16 v2, 0xff

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v1, p0, Lcom/miui/gallery/widget/SlideShowView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v6, v6, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/SlideShowView;->invalidateView()V

    :cond_3
    return-void

    :cond_4
    invoke-direct {p0}, Lcom/miui/gallery/widget/SlideShowView;->isPreValid()Z

    move-result v5

    const/high16 v7, 0x437f0000    # 255.0f

    if-eqz v5, :cond_5

    cmpg-float v5, v3, v4

    if-gez v5, :cond_5

    iget-object v5, p0, Lcom/miui/gallery/widget/SlideShowView;->mTransFormation:Landroid/view/animation/Transformation;

    invoke-virtual {v5}, Landroid/view/animation/Transformation;->clear()V

    iget-object v5, p0, Lcom/miui/gallery/widget/SlideShowView;->mPreAnim:Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;

    iget-object v8, p0, Lcom/miui/gallery/widget/SlideShowView;->mTransFormation:Landroid/view/animation/Transformation;

    invoke-virtual {v5, v0, v1, v8}, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->getTransformation(JLandroid/view/animation/Transformation;)Z

    move-result v5

    or-int/2addr v2, v5

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v5, p0, Lcom/miui/gallery/widget/SlideShowView;->mTransFormation:Landroid/view/animation/Transformation;

    invoke-virtual {v5}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v5

    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-object v5, p0, Lcom/miui/gallery/widget/SlideShowView;->mPaint:Landroid/graphics/Paint;

    sub-float/2addr v4, v3

    mul-float v4, v4, v7

    float-to-int v4, v4

    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v4, p0, Lcom/miui/gallery/widget/SlideShowView;->mPreBitmap:Landroid/graphics/Bitmap;

    iget-object v5, p0, Lcom/miui/gallery/widget/SlideShowView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v6, v6, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_5
    invoke-direct {p0}, Lcom/miui/gallery/widget/SlideShowView;->isCurValid()Z

    move-result v4

    if-eqz v4, :cond_6

    cmpl-float v4, v3, v6

    if-lez v4, :cond_6

    iget-object v4, p0, Lcom/miui/gallery/widget/SlideShowView;->mTransFormation:Landroid/view/animation/Transformation;

    invoke-virtual {v4}, Landroid/view/animation/Transformation;->clear()V

    iget-object v4, p0, Lcom/miui/gallery/widget/SlideShowView;->mCurrentAnim:Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;

    iget-object v5, p0, Lcom/miui/gallery/widget/SlideShowView;->mTransFormation:Landroid/view/animation/Transformation;

    invoke-virtual {v4, v0, v1, v5}, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->getTransformation(JLandroid/view/animation/Transformation;)Z

    move-result v0

    or-int/2addr v2, v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mTransFormation:Landroid/view/animation/Transformation;

    invoke-virtual {v0}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mPaint:Landroid/graphics/Paint;

    mul-float v3, v3, v7

    float-to-int v1, v3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mCurrentBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/miui/gallery/widget/SlideShowView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v6, v6, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_6
    if-eqz v2, :cond_7

    invoke-direct {p0}, Lcom/miui/gallery/widget/SlideShowView;->invalidateView()V

    :cond_7
    return-void
.end method

.method public release()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/widget/SlideShowView;->isPreValid()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mPreBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    iput-object v1, p0, Lcom/miui/gallery/widget/SlideShowView;->mPreBitmap:Landroid/graphics/Bitmap;

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/SlideShowView;->isCurValid()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mCurrentBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    iput-object v1, p0, Lcom/miui/gallery/widget/SlideShowView;->mCurrentBitmap:Landroid/graphics/Bitmap;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mAlphaAnim:Landroid/view/animation/AlphaAnimation;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mAlphaAnim:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {v0}, Landroid/view/animation/AlphaAnimation;->cancel()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mPreAnim:Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mPreAnim:Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->cancel()V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mCurrentAnim:Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView;->mCurrentAnim:Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->cancel()V

    :cond_4
    return-void
.end method

.method public setRefreshListener(Lcom/miui/gallery/widget/SlideShowView$OnRefreshedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/SlideShowView;->mRefreshedListener:Lcom/miui/gallery/widget/SlideShowView$OnRefreshedListener;

    return-void
.end method

.method public setScaleOnlyMode(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/SlideShowView;->mIsScaleOnlyMode:Z

    return-void
.end method

.method public setSlideAnimEnable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/SlideShowView;->mIsAnimEnable:Z

    return-void
.end method

.method public setSlideDuration(I)V
    .locals 1

    const/16 v0, 0xdac

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/SlideShowView;->mSlideDuration:I

    return-void
.end method
