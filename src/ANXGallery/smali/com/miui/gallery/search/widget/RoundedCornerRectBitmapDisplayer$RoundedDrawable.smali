.class public Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "RoundedCornerRectBitmapDisplayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RoundedDrawable"
.end annotation


# instance fields
.field protected final bitmapShader:Landroid/graphics/BitmapShader;

.field protected final cornerRadius:[I

.field protected final mBitmapRect:Landroid/graphics/RectF;

.field protected final mRect:Landroid/graphics/RectF;

.field protected final paint:Landroid/graphics/Paint;

.field protected path:Landroid/graphics/Path;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;[I)V
    .locals 2

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iput-object p2, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->cornerRadius:[I

    new-instance p2, Landroid/graphics/BitmapShader;

    sget-object v0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {p2, p1, v0, v1}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object p2, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->bitmapShader:Landroid/graphics/BitmapShader;

    new-instance p2, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    int-to-float p1, p1

    const/4 v1, 0x0

    invoke-direct {p2, v1, v1, v0, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p2, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->paint:Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->paint:Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->paint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->bitmapShader:Landroid/graphics/BitmapShader;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iget-object p1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    iget-object p1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setDither(Z)V

    invoke-direct {p0}, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->createPath()Landroid/graphics/Path;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->path:Landroid/graphics/Path;

    return-void
.end method

.method private createPath()Landroid/graphics/Path;
    .locals 10

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->cornerRadius:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    iget-object v3, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    iget-object v4, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    int-to-float v5, v1

    add-float/2addr v4, v5

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v3, 0x42b40000    # 90.0f

    const/4 v4, 0x2

    if-eqz v1, :cond_0

    new-instance v5, Landroid/graphics/RectF;

    iget-object v6, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    iget-object v7, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->top:F

    iget-object v8, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->left:F

    mul-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    add-float/2addr v8, v1

    iget-object v9, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->top:F

    add-float/2addr v9, v1

    invoke-direct {v5, v6, v7, v8, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/high16 v1, 0x43340000    # 180.0f

    invoke-virtual {v0, v5, v1, v3, v2}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->cornerRadius:[I

    const/4 v5, 0x1

    aget v1, v1, v5

    iget-object v5, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    int-to-float v6, v1

    sub-float/2addr v5, v6

    iget-object v6, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0, v5, v6}, Landroid/graphics/Path;->lineTo(FF)V

    if-eqz v1, :cond_1

    new-instance v5, Landroid/graphics/RectF;

    iget-object v6, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->right:F

    mul-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    sub-float/2addr v6, v1

    iget-object v7, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->top:F

    iget-object v8, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->right:F

    iget-object v9, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->top:F

    add-float/2addr v9, v1

    invoke-direct {v5, v6, v7, v8, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/high16 v1, 0x43870000    # 270.0f

    invoke-virtual {v0, v5, v1, v3, v2}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->cornerRadius:[I

    aget v1, v1, v4

    iget-object v5, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    iget-object v6, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    int-to-float v7, v1

    sub-float/2addr v6, v7

    invoke-virtual {v0, v5, v6}, Landroid/graphics/Path;->lineTo(FF)V

    if-eqz v1, :cond_2

    new-instance v5, Landroid/graphics/RectF;

    iget-object v6, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->right:F

    mul-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    sub-float/2addr v6, v1

    iget-object v7, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v7, v1

    iget-object v1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    iget-object v8, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->bottom:F

    invoke-direct {v5, v6, v7, v1, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/4 v1, 0x0

    invoke-virtual {v0, v5, v1, v3, v2}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->cornerRadius:[I

    const/4 v5, 0x3

    aget v1, v1, v5

    iget-object v5, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    int-to-float v6, v1

    add-float/2addr v5, v6

    iget-object v6, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v0, v5, v6}, Landroid/graphics/Path;->lineTo(FF)V

    if-eqz v1, :cond_3

    new-instance v5, Landroid/graphics/RectF;

    iget-object v6, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    iget-object v7, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->bottom:F

    mul-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    sub-float/2addr v7, v1

    iget-object v4, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    add-float/2addr v4, v1

    iget-object v1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    invoke-direct {v5, v6, v7, v4, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v0, v5, v3, v3, v2}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v3, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    iget-object v4, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->cornerRadius:[I

    aget v2, v4, v2

    int-to-float v2, v2

    add-float/2addr v3, v2

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    return-object v0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->path:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method public getOpacity()I
    .locals 1

    const/4 v0, -0x3

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 6

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    int-to-float p1, p1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2, v1, p1}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-direct {p0}, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->createPath()Landroid/graphics/Path;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->path:Landroid/graphics/Path;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iget-object v0, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    iget-object v3, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    div-float/2addr v1, v3

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-virtual {p1, v3, v3}, Landroid/graphics/Matrix;->setScale(FF)V

    cmpl-float v4, v0, v1

    const/high16 v5, 0x40000000    # 2.0f

    if-lez v4, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    mul-float v1, v1, v3

    sub-float/2addr v0, v1

    div-float/2addr v0, v5

    invoke-virtual {p1, v2, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_0

    :cond_0
    cmpl-float v0, v1, v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    mul-float v1, v1, v3

    sub-float/2addr v0, v1

    div-float/2addr v0, v5

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->bitmapShader:Landroid/graphics/BitmapShader;

    invoke-virtual {v0, p1}, Landroid/graphics/BitmapShader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    return-void
.end method

.method public setAlpha(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
