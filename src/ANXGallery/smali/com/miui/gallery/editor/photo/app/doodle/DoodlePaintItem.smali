.class public Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;
.super Landroid/graphics/drawable/Drawable;
.source "DoodlePaintItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;
    }
.end annotation


# instance fields
.field private mAlphaProgress:F

.field private mBigSize:I

.field private mCurrentColor:I

.field private mPaint:Landroid/graphics/Paint;

.field private mScale:F

.field private mSelect:Z

.field private mSmallDefaultColor:I

.field private mSmallSize:F

.field private mStrokeColor:I

.field public final paintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;Landroid/content/res/Resources;)V
    .locals 1

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mScale:F

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->paintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

    const v0, 0x7f060126

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mBigSize:I

    sget-object v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$1;->$SwitchMap$com$miui$gallery$editor$photo$app$doodle$DoodlePaintItem$PaintType:[I

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const p1, 0x7f060129

    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mSmallSize:F

    goto :goto_0

    :pswitch_1
    const p1, 0x7f06012a

    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mSmallSize:F

    goto :goto_0

    :pswitch_2
    const p1, 0x7f060128

    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mSmallSize:F

    :goto_0
    const p1, 0x7f050082

    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mStrokeColor:I

    const p1, 0x7f050081

    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mSmallDefaultColor:I

    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mPaint:Landroid/graphics/Paint;

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getColorWithAlphaProgress(IF)I
    .locals 2

    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    int-to-float v0, v0

    mul-float v0, v0, p1

    float-to-int p1, v0

    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    invoke-static {p1, v0, v1, p0}, Landroid/graphics/Color;->argb(IIII)I

    move-result p0

    return p0
.end method

.method public static getList(Landroid/content/res/Resources;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/Resources;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    new-instance v1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    sget-object v2, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;->LIGHT:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

    invoke-direct {v1, v2, p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;Landroid/content/res/Resources;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    sget-object v2, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;->MEDIUM:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

    invoke-direct {v1, v2, p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;Landroid/content/res/Resources;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    sget-object v2, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;->HEAVY:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

    invoke-direct {v1, v2, p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;Landroid/content/res/Resources;)V

    const/4 p0, 0x2

    aput-object v1, v0, p0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private getSuggestColor(IZ)I
    .locals 0

    if-nez p2, :cond_0

    return p1

    :cond_0
    iget p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mAlphaProgress:F

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->getColorWithAlphaProgress(IF)I

    move-result p1

    return p1
.end method


# virtual methods
.method public centerX()I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 8

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mScale:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mScale:F

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->scale(FFFF)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mPaint:Landroid/graphics/Paint;

    iget-boolean v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mSelect:Z

    xor-int/lit8 v2, v2, 0x1

    const/4 v3, -0x1

    invoke-direct {p0, v3, v2}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->getSuggestColor(IZ)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    int-to-float v2, v2

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mBigSize:I

    int-to-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v4, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-boolean v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mSelect:Z

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mCurrentColor:I

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mSmallDefaultColor:I

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mPaint:Landroid/graphics/Paint;

    iget-boolean v4, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mSelect:Z

    xor-int/lit8 v4, v4, 0x1

    invoke-direct {p0, v1, v4}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->getSuggestColor(IZ)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v4

    int-to-float v4, v4

    iget v6, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mSmallSize:F

    div-float/2addr v6, v5

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v4, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mPaint:Landroid/graphics/Paint;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mStrokeColor:I

    iget-boolean v6, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mSelect:Z

    xor-int/lit8 v6, v6, 0x1

    invoke-direct {p0, v4, v6}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->getSuggestColor(IZ)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v4

    int-to-float v4, v4

    iget v6, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mBigSize:I

    int-to-float v6, v6

    div-float/2addr v6, v5

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v4, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    if-ne v1, v3, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    int-to-float v0, v0

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mSmallSize:F

    div-float/2addr v2, v5

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getIntrinsicHeight()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mBigSize:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mBigSize:I

    return v0
.end method

.method public getOpacity()I
    .locals 1

    const/4 v0, -0x2

    return v0
.end method

.method public isContain(FF)Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    float-to-int p1, p1

    float-to-int p2, p2

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result p1

    return p1
.end method

.method public offset(II)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Rect;->offset(II)V

    return-void
.end method

.method public setAlpha(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mAlphaProgress:F

    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    return-void
.end method

.method public setBigSize(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mBigSize:I

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    return-void
.end method

.method public setCurrentColor(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mCurrentColor:I

    return-void
.end method

.method public setScale(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mScale:F

    return-void
.end method

.method public setSelect(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->mSelect:Z

    return-void
.end method
