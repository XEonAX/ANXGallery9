.class public Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;
.super Landroid/view/View;
.source "FrameEditorView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;
    }
.end annotation


# instance fields
.field private mBackgroundColor:I

.field private mBackgroundPaint:Landroid/graphics/Paint;

.field private mBackgroundRect:Landroid/graphics/RectF;

.field private mBitmap:Landroid/graphics/Bitmap;

.field private mBitmapDisplayRect:Landroid/graphics/RectF;

.field private mBitmapMatrix:Landroid/graphics/Matrix;

.field private mBitmapPaint:Landroid/graphics/Paint;

.field private mBitmapRatio:F

.field private mBitmapRect:Landroid/graphics/RectF;

.field private mRatio:F

.field private mScaleProgress:F

.field private mViewRect:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapMatrix:Landroid/graphics/Matrix;

    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundPaint:Landroid/graphics/Paint;

    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x3

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapPaint:Landroid/graphics/Paint;

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mRatio:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mScaleProgress:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapRatio:F

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapMatrix:Landroid/graphics/Matrix;

    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundPaint:Landroid/graphics/Paint;

    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x3

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapPaint:Landroid/graphics/Paint;

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mRatio:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mScaleProgress:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapRatio:F

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapMatrix:Landroid/graphics/Matrix;

    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundPaint:Landroid/graphics/Paint;

    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x3

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapPaint:Landroid/graphics/Paint;

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mRatio:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mScaleProgress:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapRatio:F

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->init()V

    return-void
.end method

.method private init()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f05010c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundColor:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method

.method private refreshBackgroundRect()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mRatio:F

    cmpl-float v0, v1, v0

    const/high16 v1, 0x40000000    # 2.0f

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iput v2, v0, Landroid/graphics/RectF;->left:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    iput v2, v0, Landroid/graphics/RectF;->right:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mRatio:F

    div-float/2addr v0, v2

    div-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    sub-float/2addr v2, v0

    iput v2, v1, Landroid/graphics/RectF;->top:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    add-float/2addr v2, v0

    iput v2, v1, Landroid/graphics/RectF;->bottom:F

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iput v2, v0, Landroid/graphics/RectF;->top:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iput v2, v0, Landroid/graphics/RectF;->bottom:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mRatio:F

    mul-float v0, v0, v2

    div-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    sub-float/2addr v2, v0

    iput v2, v1, Landroid/graphics/RectF;->left:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    add-float/2addr v2, v0

    iput v2, v1, Landroid/graphics/RectF;->right:F

    :goto_0
    return-void
.end method

.method private refreshBitmapRect()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundRect:Landroid/graphics/RectF;

    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapMatrix:Landroid/graphics/Matrix;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mScaleProgress:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mScaleProgress:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerX()F

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerY()F

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    return-void
.end method

.method private refreshSize()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->refreshBackgroundRect()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->refreshBitmapRect()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->invalidate()V

    return-void

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public export()Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;
    .locals 3

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mRatio:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mScaleProgress:F

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;-><init>(FF)V

    return-object v0
.end method

.method public isEmpty()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mRatio:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapRatio:F

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mScaleProgress:F

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundColor:I

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mViewRect:Landroid/graphics/RectF;

    int-to-float p1, p1

    int-to-float p2, p2

    const/4 p4, 0x0

    invoke-virtual {p3, p4, p4, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->refreshSize()V

    return-void
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 4

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr v0, p1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mBitmapRatio:F

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->refreshSize()V

    return-void
.end method

.method public setRatio(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mRatio:F

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->refreshSize()V

    return-void
.end method

.method public setScaleProgress(F)V
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float p1, v0, p1

    const v1, 0x3ecccccd    # 0.4f

    mul-float p1, p1, v1

    sub-float/2addr v0, p1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->mScaleProgress:F

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->refreshBitmapRect()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;->invalidate()V

    return-void
.end method
