.class Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "FrameItemPreviewDrawable.java"


# instance fields
.field private mPaint:Landroid/graphics/Paint;

.field private mRatio:F

.field private mRect:Landroid/graphics/Rect;

.field private mRectF:Landroid/graphics/RectF;

.field private mSelectColor:I

.field private mSolidNormalColor:I

.field private mStrokeDrawable:Landroid/graphics/drawable/Drawable;


# direct methods
.method constructor <init>(Landroid/content/res/Resources;)V
    .locals 2

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mRatio:F

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mRectF:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x0

    const v1, 0x7f0500a1

    invoke-static {p1, v1, v0}, Landroid/support/v4/content/res/ResourcesCompat;->getColor(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mSolidNormalColor:I

    const v1, 0x7f0500a0

    invoke-static {p1, v1, v0}, Landroid/support/v4/content/res/ResourcesCompat;->getColor(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mSelectColor:I

    const v1, 0x7f070154

    invoke-static {p1, v1, v0}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mStrokeDrawable:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 8

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x41900000    # 18.0f

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mRatio:F

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_0

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mRatio:F

    div-float v2, v1, v2

    goto :goto_0

    :cond_0
    iget v2, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mRatio:F

    mul-float v2, v2, v1

    move v7, v2

    move v2, v1

    move v1, v7

    :goto_0
    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v1, v3

    div-float/2addr v2, v3

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v6, v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v0, v2

    invoke-virtual {v3, v4, v5, v6, v0}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mSolidNormalColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mRectF:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mRect:Landroid/graphics/Rect;

    const/4 v1, -0x8

    invoke-virtual {v0, v1, v1}, Landroid/graphics/Rect;->inset(II)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mStrokeDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mStrokeDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public getOpacity()I
    .locals 1

    const/4 v0, -0x2

    return v0
.end method

.method public isStateful()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected onStateChange([I)Z
    .locals 5

    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    aget v3, p1, v2

    const v4, 0x10100a1

    if-ne v3, v4, :cond_0

    const/4 v1, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-eqz v1, :cond_2

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mSelectColor:I

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    :goto_2
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onStateChange([I)Z

    move-result p1

    return p1
.end method

.method public setAlpha(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mStrokeDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->invalidateSelf()V

    :cond_0
    return-void
.end method

.method public setRatio(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->mRatio:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/frame/FrameItemPreviewDrawable;->invalidateSelf()V

    return-void
.end method
