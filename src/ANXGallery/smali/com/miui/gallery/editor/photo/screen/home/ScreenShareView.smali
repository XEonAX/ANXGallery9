.class public Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;
.super Landroid/view/View;
.source "ScreenShareView.java"


# instance fields
.field private mAnimatorState:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

.field private mDstRect:Landroid/graphics/RectF;

.field private mEnterFrom:I

.field private mPaint:Landroid/graphics/Paint;

.field private mResultMatrix:Landroid/graphics/Matrix;

.field private mResultRect:Landroid/graphics/RectF;

.field private mRoundRadius:F

.field private mShareBitmap:Landroid/graphics/Bitmap;

.field private mSrcRect:Landroid/graphics/Rect;

.field private mThumbnailDstRectStartLeft:I

.field private mThumbnailDstRectStartTop:I

.field private mThumbnailRect:[I

.field private mValueAnimator:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mResultMatrix:Landroid/graphics/Matrix;

    const/4 p2, 0x4

    new-array p2, p2, [I

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailRect:[I

    const/4 p2, 0x0

    iput p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mEnterFrom:I

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->init(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$002(Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;)Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mAnimatorState:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    return-object p1
.end method

.method static synthetic access$102(Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;F)F
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mRoundRadius:F

    return p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;)[I
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailRect:[I

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;F[I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->changeTransformRect(F[I)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;)Landroid/animation/ValueAnimator;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mValueAnimator:Landroid/animation/ValueAnimator;

    return-object p0
.end method

.method private changeTransformRect(F[I)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mDstRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mResultRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailDstRectStartLeft:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    mul-float v1, v1, p1

    iget v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailDstRectStartLeft:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    float-to-int v1, v1

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->left:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mDstRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mResultRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailDstRectStartTop:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    mul-float v1, v1, p1

    iget v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailDstRectStartTop:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    float-to-int v1, v1

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->top:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mDstRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mResultRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailDstRectStartLeft:I

    const/4 v3, 0x2

    aget v4, p2, v3

    add-int/2addr v2, v4

    int-to-float v2, v2

    sub-float/2addr v1, v2

    mul-float v1, v1, p1

    iget v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailDstRectStartLeft:I

    aget v3, p2, v3

    add-int/2addr v2, v3

    int-to-float v2, v2

    add-float/2addr v1, v2

    float-to-int v1, v1

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->right:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mDstRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mResultRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailDstRectStartTop:I

    const/4 v3, 0x3

    aget v4, p2, v3

    add-int/2addr v2, v4

    int-to-float v2, v2

    sub-float/2addr v1, v2

    mul-float v1, v1, p1

    iget p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailDstRectStartTop:I

    aget p2, p2, v3

    add-int/2addr p1, p2

    int-to-float p1, p1

    add-float/2addr v1, p1

    float-to-int p1, v1

    int-to-float p1, p1

    iput p1, v0, Landroid/graphics/RectF;->bottom:F

    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 3

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mSrcRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/RectF;

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result v1

    int-to-float v1, v1

    check-cast p1, Landroid/app/Activity;

    invoke-static {p1}, Lcom/miui/gallery/util/ScreenUtils;->getExactScreenHeight(Landroid/app/Activity;)I

    move-result p1

    int-to-float p1, p1

    const/4 v2, 0x0

    invoke-direct {v0, v2, v2, v1, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mDstRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mResultRect:Landroid/graphics/RectF;

    return-void
.end method

.method private refreshResultRectF()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mResultMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mResultMatrix:Landroid/graphics/Matrix;

    new-instance v1, Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mSrcRect:Landroid/graphics/Rect;

    invoke-direct {v1, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mDstRect:Landroid/graphics/RectF;

    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mResultRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mSrcRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mResultMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mResultRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    return-void
.end method

.method private startAnimator(Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;)V
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mValueAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mValueAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x1c2

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mValueAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mValueAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView$1;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mValueAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView$2;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView$3;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView$3;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;)V

    const-wide/16 v0, 0x1e

    invoke-virtual {p0, p1, v0, v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mShareBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mShareBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    :cond_0
    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mEnterFrom:I

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mShareBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mSrcRect:Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mResultRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mAnimatorState:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_END:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mShareBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mSrcRect:Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mDstRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mAnimatorState:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_PRE_START:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    if-eq v0, v1, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mAnimatorState:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_UPDATE:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    if-ne v0, v1, :cond_3

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mAnimatorState:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_START:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    if-ne v0, v1, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mShareBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mSrcRect:Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mDstRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto :goto_1

    :cond_4
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mShareBitmap:Landroid/graphics/Bitmap;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mRoundRadius:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailRect:[I

    const/4 v3, 0x2

    aget v2, v2, v3

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailRect:[I

    const/4 v4, 0x3

    aget v3, v3, v4

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/BitmapUtils;->getRoundedCornerBitmap(Landroid/graphics/Bitmap;FII)Landroid/graphics/Bitmap;

    move-result-object v0

    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mDstRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :cond_5
    :goto_1
    return-void

    :cond_6
    :goto_2
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    iget p3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mEnterFrom:I

    if-nez p3, :cond_0

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mDstRect:Landroid/graphics/RectF;

    int-to-float p1, p1

    int-to-float p2, p2

    const/4 p4, 0x0

    invoke-virtual {p3, p4, p4, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->refreshResultRectF()V

    :cond_0
    return-void
.end method

.method public setShareBitmap(Landroid/graphics/Bitmap;Z)V
    .locals 3

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mShareBitmap:Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mSrcRect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2, v1, p1}, Landroid/graphics/Rect;->set(IIII)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->refreshResultRectF()V

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->invalidate()V

    :cond_0
    return-void
.end method

.method public startShareViewAnimator(Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;)V
    .locals 2

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;->getThumbnailStartLeft()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailDstRectStartLeft:I

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;->getThumbnailStartTop()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailDstRectStartTop:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06040a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mRoundRadius:F

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_PRE_START:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mAnimatorState:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;->getThumbnailRect()[I

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailRect:[I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mThumbnailRect:[I

    const/4 v1, 0x0

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->changeTransformRect(F[I)V

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;->onPrepareAnimatorStart()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->mEnterFrom:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->invalidate()V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->startAnimator(Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;)V

    return-void
.end method
