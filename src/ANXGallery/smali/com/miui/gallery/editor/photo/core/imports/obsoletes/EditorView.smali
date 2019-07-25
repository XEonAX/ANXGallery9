.class public Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;
.super Landroid/view/View;
.source "EditorView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;
    }
.end annotation


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mBitmapBounds:Landroid/graphics/RectF;

.field private mBitmapDisplayBounds:Landroid/graphics/RectF;

.field private mBitmapToCanvas:Landroid/graphics/Matrix;

.field private mCanvasBounds:Landroid/graphics/RectF;

.field private mDrawBoundLine:Z

.field private mEventHandler:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

.field private mPaint:Landroid/graphics/Paint;

.field private mPlugin:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;

.field private mRect:Landroid/graphics/Rect;

.field private mStrokeImageHelper:Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mCanvasBounds:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapBounds:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapDisplayBounds:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapToCanvas:Landroid/graphics/Matrix;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPlugin:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mDrawBoundLine:Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->initialize()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mCanvasBounds:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapBounds:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapDisplayBounds:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapToCanvas:Landroid/graphics/Matrix;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPlugin:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mRect:Landroid/graphics/Rect;

    new-instance p2, Landroid/graphics/Paint;

    const/4 p3, 0x7

    invoke-direct {p2, p3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPaint:Landroid/graphics/Paint;

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mDrawBoundLine:Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->initialize()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;)Landroid/graphics/Matrix;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapToCanvas:Landroid/graphics/Matrix;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mCanvasBounds:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapBounds:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapDisplayBounds:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;)Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmap:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method private initialize()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mEventHandler:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mStrokeImageHelper:Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;

    return-void
.end method

.method private notifyMatrixChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPlugin:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPlugin:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->onMatrixChanged()V

    :cond_0
    return-void
.end method

.method private resetMatrix()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapToCanvas:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapBounds:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mCanvasBounds:Landroid/graphics/RectF;

    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapDisplayBounds:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapBounds:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapToCanvas:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapDisplayBounds:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapBounds:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->notifyMatrixChanged()V

    return-void
.end method


# virtual methods
.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public install(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;)V
    .locals 1

    invoke-static {p1, p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->access$502(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mEventHandler:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->access$602(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPlugin:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getSaveCount()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPlugin:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPlugin:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->config(Landroid/graphics/Canvas;)V

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPlugin:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPlugin:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->draw(Landroid/graphics/Canvas;)Z

    move-result v1

    if-nez v1, :cond_2

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapToCanvas:Landroid/graphics/Matrix;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPlugin:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPlugin:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->drawOverlay(Landroid/graphics/Canvas;)V

    :cond_3
    iget-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mDrawBoundLine:Z

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mStrokeImageHelper:Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapBounds:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapToCanvas:Landroid/graphics/Matrix;

    invoke-virtual {v1, p1, v2, v3}, Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;->draw(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Matrix;)V

    :cond_4
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 5

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_2

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-ne v0, v1, :cond_2

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    int-to-float v0, p1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float v1, v0, v1

    int-to-float v2, p2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float v3, v2, v3

    cmpl-float v4, v1, v3

    if-lez v4, :cond_0

    mul-float v0, v0, v3

    div-float/2addr v0, v1

    float-to-int p1, v0

    goto :goto_0

    :cond_0
    mul-float v2, v2, v1

    div-float/2addr v2, v3

    float-to-int p2, v2

    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->setMeasuredDimension(II)V

    goto :goto_1

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->getPaddingRight()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->getPaddingBottom()I

    move-result v3

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    add-int/2addr v0, v1

    :cond_3
    add-int/2addr v2, v3

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    add-int/2addr v2, v1

    :cond_4
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->getSuggestedMinimumWidth()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->getSuggestedMinimumHeight()I

    move-result v1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v0, p1, v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->resolveSizeAndState(III)I

    move-result p1

    invoke-static {v1, p2, v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->resolveSizeAndState(III)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->setMeasuredDimension(II)V

    :goto_1
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mCanvasBounds:Landroid/graphics/RectF;

    invoke-virtual {p3}, Landroid/graphics/RectF;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mCanvasBounds:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->getPaddingLeft()I

    move-result p4

    int-to-float p4, p4

    iput p4, p3, Landroid/graphics/RectF;->left:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mCanvasBounds:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->getPaddingTop()I

    move-result p4

    int-to-float p4, p4

    iput p4, p3, Landroid/graphics/RectF;->top:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mCanvasBounds:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->getPaddingRight()I

    move-result p4

    sub-int/2addr p1, p4

    int-to-float p1, p1

    iput p1, p3, Landroid/graphics/RectF;->right:F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mCanvasBounds:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->getPaddingBottom()I

    move-result p3

    sub-int/2addr p2, p3

    int-to-float p2, p2

    iput p2, p1, Landroid/graphics/RectF;->bottom:F

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->resetMatrix()V

    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPlugin:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mPlugin:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmap:Landroid/graphics/Bitmap;

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapBounds:Landroid/graphics/RectF;

    const/4 v0, 0x0

    iput v0, p1, Landroid/graphics/RectF;->right:F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapBounds:Landroid/graphics/RectF;

    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapBounds:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->right:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mBitmapBounds:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    int-to-float p1, p1

    iput p1, v0, Landroid/graphics/RectF;->bottom:F

    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->resetMatrix()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->invalidate()V

    return-void
.end method

.method public setDrawBoundLine(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->mDrawBoundLine:Z

    return-void
.end method
