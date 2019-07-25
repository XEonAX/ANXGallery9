.class public Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;
.super Landroid/view/View;
.source "LongScreenshotCropEditorView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;
    }
.end annotation


# instance fields
.field private mAnimatorCallback:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;

.field private mAnimatorHelper:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;

.field private mBitmapPaint:Landroid/graphics/Paint;

.field private mBitmapToDisplayMatrix:Landroid/graphics/Matrix;

.field private mBmpRect:Landroid/graphics/Rect;

.field private mBorder:Landroid/graphics/drawable/Drawable;

.field private mBounds:Landroid/graphics/RectF;

.field private mCorner:Landroid/graphics/Bitmap;

.field private mCornerBarWidth:I

.field private mCropRect:Landroid/graphics/RectF;

.field private mCropYFirst:F

.field private mDragLineEdge:I

.field private mDragState:I

.field private mMinHeight:I

.field private mOriginalBmp:Landroid/graphics/drawable/Drawable;

.field private mPaint:Landroid/graphics/Paint;

.field private mPaintColor:I

.field private mPreviewBmp:Landroid/graphics/Bitmap;

.field private mScissor:Landroid/graphics/Bitmap;

.field private mShadow:Landroid/graphics/drawable/Drawable;

.field private mShowOriginalAnimator:Landroid/animation/ValueAnimator;

.field private mShowOriginalBmp:F

.field private mShowRect:Landroid/graphics/Rect;

.field private mShowShadow:Z

.field private mTouchDownY:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBounds:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaint:Landroid/graphics/Paint;

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaintColor:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowShadow:Z

    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x3

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBitmapPaint:Landroid/graphics/Paint;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBitmapToDisplayMatrix:Landroid/graphics/Matrix;

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mAnimatorCallback:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f06028f

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mDragLineEdge:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f06028e

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCornerBarWidth:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f060290

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mMinHeight:I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    const v0, 0x3f333333    # 0.7f

    mul-float p2, p2, v0

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/4 p1, 0x2

    new-array p1, p1, [F

    fill-array-data p1, :array_0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowOriginalAnimator:Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowOriginalAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0701ad

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBorder:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0701ae

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShadow:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0701ac

    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCorner:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0701af

    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mScissor:Landroid/graphics/Bitmap;

    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;)Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPreviewBmp:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;)Landroid/graphics/Rect;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    return-object p0
.end method

.method private static calcFixCenter(II[I)V
    .locals 6

    const/4 v0, 0x0

    aget v1, p2, v0

    int-to-float v1, v1

    int-to-float v2, p0

    div-float/2addr v1, v2

    const/4 v2, 0x1

    aget v3, p2, v2

    int-to-float v3, v3

    int-to-float v4, p1

    div-float/2addr v3, v4

    cmpl-float v4, v1, v3

    const/high16 v5, 0x3f000000    # 0.5f

    if-lez v4, :cond_0

    aput p0, p2, v0

    aget p0, p2, v2

    int-to-float p0, p0

    div-float/2addr p0, v1

    add-float/2addr p0, v5

    float-to-int p0, p0

    aput p0, p2, v2

    goto :goto_0

    :cond_0
    aget p0, p2, v0

    int-to-float p0, p0

    div-float/2addr p0, v3

    add-float/2addr p0, v5

    float-to-int p0, p0

    aput p0, p2, v0

    aput p1, p2, v2

    :goto_0
    return-void
.end method

.method private detectBeginDragState(F)I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    sub-float v0, p1, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mDragLineEdge:I

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_0

    const/4 p1, 0x2

    return p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mDragLineEdge:I

    int-to-float v0, v0

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method protected drawChild(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 0

    return-void
.end method

.method public export()Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    new-instance v2, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    invoke-direct {v2, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;-><init>(FF)V

    return-object v2
.end method

.method public isEmpty()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    new-instance v1, Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    invoke-direct {v1, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->contains(Landroid/graphics/RectF;)Z

    move-result v0

    return v0
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowOriginalBmp:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->invalidate()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPreviewBmp:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mAnimatorHelper:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mAnimatorHelper:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->isAnimatorEnd()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mAnimatorHelper:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->draw(Landroid/graphics/Canvas;)V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaintColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowOriginalBmp:F

    const/high16 v1, 0x43190000    # 153.0f

    mul-float v0, v0, v1

    float-to-int v6, v0

    const/4 v7, 0x2

    const/4 v8, 0x0

    if-lez v6, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mOriginalBmp:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mDragState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mOriginalBmp:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    mul-float v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v1

    goto :goto_0

    :cond_2
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mDragState:I

    if-ne v0, v7, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mOriginalBmp:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    mul-float v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, v1

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    :goto_0
    neg-float v1, v0

    invoke-virtual {p1, v8, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mOriginalBmp:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v6}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mOriginalBmp:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1, v8, v0}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_4
    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowShadow:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBorder:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShadow:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_5
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowOriginalBmp:F

    const/high16 v1, 0x43320000    # 178.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mDragState:I

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getWidth()I

    move-result v0

    int-to-float v3, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v4, v0, Landroid/graphics/RectF;->top:F

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_1

    :pswitch_1
    const/4 v1, 0x0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v2, v0, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getWidth()I

    move-result v0

    int-to-float v3, v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getHeight()I

    move-result v0

    int-to-float v4, v0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPreviewBmp:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBitmapToDisplayMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->drawChild(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowShadow:Z

    const/high16 v9, 0x3f800000    # 1.0f

    if-eqz v0, :cond_6

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowOriginalBmp:F

    sub-float v0, v9, v0

    const/high16 v1, 0x429a0000    # 77.0f

    mul-float v0, v0, v1

    const/high16 v1, 0x42fe0000    # 127.0f

    add-float/2addr v0, v1

    float-to-int v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    int-to-float v1, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    int-to-float v2, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    int-to-float v3, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v4, v0, Landroid/graphics/RectF;->top:F

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    int-to-float v1, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v2, v0, Landroid/graphics/RectF;->bottom:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    int-to-float v3, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_6
    if-lez v6, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaint:Landroid/graphics/Paint;

    const v1, -0x77000001

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mDragState:I

    packed-switch v0, :pswitch_data_1

    const/4 v6, 0x0

    goto :goto_3

    :pswitch_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    goto :goto_2

    :pswitch_3
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    :goto_2
    move v6, v0

    :goto_3
    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getWidth()I

    move-result v0

    int-to-float v3, v0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, v6

    move v4, v6

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mScissor:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mScissor:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    div-int/2addr v1, v7

    int-to-float v1, v1

    sub-float/2addr v6, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v8, v6, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    :cond_7
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCornerBarWidth:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCornerBarWidth:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCorner:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v8, v8, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCornerBarWidth:I

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v0, v2

    int-to-float v0, v0

    invoke-virtual {p1, v0, v8}, Landroid/graphics/Canvas;->translate(FF)V

    const/high16 v0, -0x40800000    # -1.0f

    invoke-virtual {p1, v0, v9}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCorner:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v2, v8, v8, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCornerBarWidth:I

    mul-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    add-float/2addr v2, v3

    invoke-virtual {p1, v8, v2}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, v9, v0}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCorner:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v2, v8, v8, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCornerBarWidth:I

    mul-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {p1, v2, v8}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, v0, v9}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCorner:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0, v8, v8, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method protected onSizeChanged(IIII)V
    .locals 2

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getPaddingLeft()I

    move-result p4

    int-to-float p4, p4

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getPaddingTop()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getPaddingRight()I

    move-result v1

    sub-int/2addr p1, v1

    int-to-float p1, p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->getPaddingBottom()I

    move-result v1

    sub-int/2addr p2, v1

    int-to-float p2, p2

    invoke-virtual {p3, p4, v0, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBounds:Landroid/graphics/RectF;

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCornerBarWidth:I

    int-to-float p2, p2

    iget p3, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCornerBarWidth:I

    int-to-float p3, p3

    invoke-virtual {p1, p2, p3}, Landroid/graphics/RectF;->inset(FF)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->refreshBounds()V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_2

    :pswitch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mTouchDownY:F

    sub-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropYFirst:F

    add-float/2addr v0, p1

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mDragState:I

    packed-switch p1, :pswitch_data_1

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->top:I

    int-to-float p1, p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mMinHeight:I

    int-to-float v2, v2

    sub-float/2addr v0, v2

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v0, v2, p1, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float p1, p1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mMinHeight:I

    int-to-float v2, v2

    add-float/2addr v0, v2

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    invoke-virtual {v0, v2, v3, v4, p1}, Landroid/graphics/RectF;->set(FFFF)V

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->invalidate()V

    goto :goto_2

    :pswitch_3
    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mDragState:I

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowOriginalAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->reverse()V

    goto :goto_2

    :pswitch_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->detectBeginDragState(F)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mDragState:I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mTouchDownY:F

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mDragState:I

    if-ne p1, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropYFirst:F

    goto :goto_1

    :cond_0
    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mDragState:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->top:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropYFirst:F

    :cond_1
    :goto_1
    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mDragState:I

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowOriginalAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    :cond_2
    :goto_2
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public refreshBounds()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPreviewBmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBounds:Landroid/graphics/RectF;

    if-nez v0, :cond_0

    goto/16 :goto_0

    :cond_0
    new-instance v0, Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPreviewBmp:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPreviewBmp:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBmpRect:Landroid/graphics/Rect;

    const/4 v0, 0x2

    new-array v1, v0, [I

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBmpRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    aput v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBmpRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    const/4 v4, 0x1

    aput v2, v1, v4

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    float-to-int v2, v2

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    float-to-int v5, v5

    invoke-static {v2, v5, v1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->calcFixCenter(II[I)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBounds:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    float-to-int v2, v2

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v5

    float-to-int v5, v5

    aget v6, v1, v3

    sub-int/2addr v5, v6

    div-int/2addr v5, v0

    add-int/2addr v2, v5

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBounds:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    float-to-int v5, v5

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v6

    float-to-int v6, v6

    aget v7, v1, v4

    sub-int/2addr v6, v7

    div-int/2addr v6, v0

    add-int/2addr v5, v6

    new-instance v0, Landroid/graphics/Rect;

    aget v3, v1, v3

    add-int/2addr v3, v2

    aget v1, v1, v4

    add-int/2addr v1, v5

    invoke-direct {v0, v2, v5, v3, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mCropRect:Landroid/graphics/RectF;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBitmapToDisplayMatrix:Landroid/graphics/Matrix;

    new-instance v1, Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBmpRect:Landroid/graphics/Rect;

    invoke-direct {v1, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBounds:Landroid/graphics/RectF;

    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBorder:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBorder:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    iget v3, v0, Landroid/graphics/Rect;->left:I

    sub-int/2addr v2, v3

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    iget v4, v0, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v4

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    iget v5, v0, Landroid/graphics/Rect;->right:I

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v5, v6

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShadow:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShadow:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    iget v3, v0, Landroid/graphics/Rect;->left:I

    sub-int/2addr v2, v3

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    iget v4, v0, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v4

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    iget v5, v0, Landroid/graphics/Rect;->right:I

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v5, v0

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->invalidate()V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPreviewBmp:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->refreshBounds()V

    return-void
.end method

.method public setBounds(Landroid/graphics/RectF;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->refreshBounds()V

    return-void
.end method

.method public setOriginalBitmap(Landroid/graphics/Bitmap;FF)V
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongBitmapDrawable;

    invoke-direct {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mOriginalBmp:Landroid/graphics/drawable/Drawable;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    const/4 v1, 0x0

    iput v1, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iput v1, v0, Landroid/graphics/Rect;->right:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float v1, v1, p2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result p2

    iput p2, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    int-to-float p1, p1

    mul-float p1, p1, p3

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mOriginalBmp:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method public setPaintColor(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mPaintColor:I

    return-void
.end method

.method public setShowShadow(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mShowShadow:Z

    return-void
.end method

.method public startEnterAnimator([I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mAnimatorHelper:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mAnimatorHelper:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mAnimatorHelper:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->mAnimatorCallback:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->startEnterAnimation(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;[I)V

    return-void
.end method
