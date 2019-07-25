.class public Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;
.super Ljava/lang/Object;
.source "LongCropViewAnimatorHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;
    }
.end annotation


# instance fields
.field private mAnimatorState:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

.field private mDstRect:Landroid/graphics/Rect;

.field private mPreBitmap:Landroid/graphics/Bitmap;

.field private mScreenRect:[I

.field private mSrcRect:Landroid/graphics/Rect;

.field private mStartBottom:I

.field private mStartLeft:I

.field private mStartRight:I

.field private mStartTop:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_END:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mAnimatorState:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mScreenRect:[I

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mDstRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mSrcRect:Landroid/graphics/Rect;

    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method static synthetic access$002(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;)Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mAnimatorState:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    return-object p1
.end method

.method private animatorPreStart(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;)V
    .locals 5

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_PRE_START:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mAnimatorState:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mScreenRect:[I

    const/4 v1, 0x3

    aget v0, v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartBottom:I

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartBottom:I

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mScreenRect:[I

    const/4 v2, 0x2

    aget v1, v1, v2

    int-to-float v1, v1

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;->getPreBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v1, v3

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;->getPreBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    mul-float v1, v1, v3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartTop:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mScreenRect:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartLeft:I

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartLeft:I

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mScreenRect:[I

    aget v2, v3, v2

    add-int/2addr v0, v2

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartRight:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mSrcRect:Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mPreBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mPreBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-virtual {v0, v1, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mDstRect:Landroid/graphics/Rect;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartLeft:I

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartTop:I

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartRight:I

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartBottom:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;->onInvalidate()V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->animatorStart(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;)V

    return-void
.end method

.method private animatorStart(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;)V
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    const-wide/16 v1, 0x258

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v1, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/longcrop/-$$Lambda$LongCropViewAnimatorHelper$ecjI_oduJk7qgSPk8YWGApN0SRA;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/-$$Lambda$LongCropViewAnimatorHelper$ecjI_oduJk7qgSPk8YWGApN0SRA;-><init>(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private changeRect(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;F)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mDstRect:Landroid/graphics/Rect;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;->getShowRect()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->left:I

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartLeft:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    mul-float v1, v1, p2

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartLeft:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, v0, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mDstRect:Landroid/graphics/Rect;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;->getShowRect()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->top:I

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartTop:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    mul-float v1, v1, p2

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartTop:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, v0, Landroid/graphics/Rect;->top:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mDstRect:Landroid/graphics/Rect;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;->getShowRect()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->right:I

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartRight:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    mul-float v1, v1, p2

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartRight:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, v0, Landroid/graphics/Rect;->right:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mDstRect:Landroid/graphics/Rect;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;->getShowRect()Landroid/graphics/Rect;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartBottom:I

    sub-int/2addr p1, v1

    int-to-float p1, p1

    mul-float p1, p1, p2

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mStartBottom:I

    int-to-float p2, p2

    add-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    return-void
.end method

.method public static synthetic lambda$animatorStart$50(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;Landroid/animation/ValueAnimator;)V
    .locals 0

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->changeRect(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;F)V

    sget-object p2, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_UPDATE:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mAnimatorState:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;->onInvalidate()V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mPreBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mPreBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mSrcRect:Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mDstRect:Landroid/graphics/Rect;

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :cond_0
    return-void
.end method

.method public isAnimatorEnd()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mAnimatorState:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_END:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public startEnterAnimation(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;[I)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    if-eqz p2, :cond_0

    array-length v1, p2

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mScreenRect:[I

    aget v2, p2, v0

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;->getPreBitmap()Landroid/graphics/Bitmap;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->mPreBitmap:Landroid/graphics/Bitmap;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->animatorPreStart(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;)V

    return-void
.end method
