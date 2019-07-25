.class public Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "ThumbDrawable.java"


# instance fields
.field private TAG:Ljava/lang/String;

.field private mBounds:Landroid/graphics/Rect;

.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private mDrawingLeft:I

.field private mDrawingRight:I

.field private mLocation:Landroid/graphics/Point;

.field private mPadding:Landroid/graphics/Rect;

.field private mPaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mLocation:Landroid/graphics/Point;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mPadding:Landroid/graphics/Rect;

    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mDrawingLeft:I

    const v0, 0x7fffffff

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mDrawingRight:I

    const-string v0, "ThumbDrawable"

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->TAG:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mPaint:Landroid/graphics/Paint;

    const/high16 v0, -0x10000

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mPaint:Landroid/graphics/Paint;

    const/high16 v0, 0x42480000    # 50.0f

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    return-void
.end method

.method private getDrawableExcludedPaddingCenterX()I
    .locals 4

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mPadding:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    iget v2, v0, Landroid/graphics/Rect;->left:I

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    iget v3, v0, Landroid/graphics/Rect;->left:I

    sub-int/2addr v2, v3

    iget v0, v0, Landroid/graphics/Rect;->right:I

    sub-int/2addr v2, v0

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    return v1
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public getAlpha()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    move-result v0

    return v0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    return v0
.end method

.method public getLocationX()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mLocation:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->x:I

    return v0
.end method

.method public getOpacity()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v0

    return v0
.end method

.method public getPaddingLeft()I
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getDrawableExcludedPaddingCenterX()I

    move-result v0

    return v0
.end method

.method public getPaddingRight()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getDrawableExcludedPaddingCenterX()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public moveLeftThumb(II)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getDrawableExcludedPaddingCenterX()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    sub-int/2addr p1, v0

    sub-int/2addr p1, v0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    sub-int/2addr p2, v0

    invoke-virtual {v1, p1, p2}, Landroid/graphics/Rect;->offsetTo(II)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method public moveProgressThumb(II)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getDrawableExcludedPaddingCenterX()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    sub-int/2addr p1, v0

    sub-int/2addr p1, v0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    sub-int/2addr p2, v0

    invoke-virtual {v1, p1, p2}, Landroid/graphics/Rect;->offsetTo(II)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method public moveRightThumb(II)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr p2, v1

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Rect;->offsetTo(II)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method public moveTo(II)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getDrawableExcludedPaddingCenterX()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    sub-int/2addr p1, v0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    sub-int/2addr p2, v0

    invoke-virtual {v1, p1, p2}, Landroid/graphics/Rect;->offsetTo(II)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mLocation:Landroid/graphics/Point;

    iget v1, p1, Landroid/graphics/Rect;->left:I

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getDrawableExcludedPaddingCenterX()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Point;->x:I

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mLocation:Landroid/graphics/Point;

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    iput v1, v0, Landroid/graphics/Point;->y:I

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mPadding:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v1, v2

    iget v2, p1, Landroid/graphics/Rect;->top:I

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mPadding:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    add-int/2addr v2, v3

    iget v3, p1, Landroid/graphics/Rect;->right:I

    iget-object v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mPadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    sub-int/2addr v3, v4

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    iget-object v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mPadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p1, v4

    invoke-virtual {v0, v1, v2, v3, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    return-void
.end method

.method public setAlpha(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    return-void
.end method

.method public setDrawingArea(II)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mDrawingLeft:I

    iput p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mDrawingRight:I

    return-void
.end method

.method public setPadding(IIII)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mPadding:Landroid/graphics/Rect;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->onBoundsChange(Landroid/graphics/Rect;)V

    return-void
.end method

.method public setSize(II)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mLocation:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->x:I

    div-int/lit8 p1, p1, 0x2

    sub-int/2addr v1, p1

    iput v1, v0, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mLocation:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->y:I

    div-int/lit8 p2, p2, 0x2

    sub-int/2addr v1, p2

    iput v1, v0, Landroid/graphics/Rect;->top:I

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mLocation:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->x:I

    add-int/2addr v1, p1

    iput v1, v0, Landroid/graphics/Rect;->right:I

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mLocation:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->y:I

    add-int/2addr v0, p2

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setBounds(Landroid/graphics/Rect;)V

    return-void
.end method
