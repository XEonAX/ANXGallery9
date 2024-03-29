.class public Lcom/miui/gallery/search/widget/IntroIconView;
.super Landroid/view/View;
.source "IntroIconView.java"


# instance fields
.field private mBackgroundColor:I

.field private mIconDrawable:Landroid/graphics/drawable/Drawable;

.field private mLandPaint:Landroid/graphics/Paint;

.field private mLandPath:Landroid/graphics/Path;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/search/widget/IntroIconView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/search/widget/IntroIconView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/IntroIconView;->getContext()Landroid/content/Context;

    move-result-object p3

    sget-object v0, Lcom/miui/gallery/R$styleable;->IntroIconView:[I

    invoke-virtual {p3, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p2

    const/4 p3, 0x1

    :try_start_0
    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/widget/IntroIconView;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v0, 0x0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0500bc

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/widget/IntroIconView;->mBackgroundColor:I

    const/4 v0, 0x2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f0500bd

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    invoke-virtual {p2, v0, p1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/search/widget/IntroIconView;->mLandPaint:Landroid/graphics/Paint;

    iget-object p2, p0, Lcom/miui/gallery/search/widget/IntroIconView;->mLandPaint:Landroid/graphics/Paint;

    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p2, p0, Lcom/miui/gallery/search/widget/IntroIconView;->mLandPaint:Landroid/graphics/Paint;

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setColor(I)V

    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/widget/IntroIconView;->mLandPath:Landroid/graphics/Path;

    return-void

    :catchall_0
    move-exception p1

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    throw p1
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    iget v4, v0, Lcom/miui/gallery/search/widget/IntroIconView;->mBackgroundColor:I

    invoke-virtual {v1, v4}, Landroid/graphics/Canvas;->drawColor(I)V

    int-to-float v4, v3

    const/high16 v5, 0x3f400000    # 0.75f

    mul-float v5, v5, v4

    iget-object v6, v0, Lcom/miui/gallery/search/widget/IntroIconView;->mLandPath:Landroid/graphics/Path;

    invoke-virtual {v6}, Landroid/graphics/Path;->reset()V

    iget-object v6, v0, Lcom/miui/gallery/search/widget/IntroIconView;->mLandPath:Landroid/graphics/Path;

    int-to-float v7, v2

    invoke-virtual {v6, v7, v5}, Landroid/graphics/Path;->moveTo(FF)V

    iget-object v6, v0, Lcom/miui/gallery/search/widget/IntroIconView;->mLandPath:Landroid/graphics/Path;

    invoke-virtual {v6, v7, v4}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v6, v0, Lcom/miui/gallery/search/widget/IntroIconView;->mLandPath:Landroid/graphics/Path;

    const/4 v8, 0x0

    invoke-virtual {v6, v8, v4}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v6, v0, Lcom/miui/gallery/search/widget/IntroIconView;->mLandPath:Landroid/graphics/Path;

    invoke-virtual {v6, v8, v5}, Landroid/graphics/Path;->lineTo(FF)V

    const v6, 0x3cf5c28f    # 0.03f

    mul-float v6, v6, v4

    float-to-int v6, v6

    const/4 v8, 0x0

    :goto_0
    if-ge v8, v2, :cond_0

    iget-object v9, v0, Lcom/miui/gallery/search/widget/IntroIconView;->mLandPath:Landroid/graphics/Path;

    int-to-float v10, v8

    float-to-double v11, v5

    int-to-double v13, v6

    add-int v15, v8, v2

    int-to-float v15, v15

    div-float/2addr v15, v7

    move/from16 v16, v5

    move/from16 v17, v6

    float-to-double v5, v15

    const-wide v18, 0x3fe999999999999aL    # 0.8

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v5, v5, v18

    const-wide v18, 0x3fe3333333333333L    # 0.6

    add-double v5, v5, v18

    const-wide v18, 0x400921fb54442d18L    # Math.PI

    mul-double v5, v5, v18

    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v13, v13, v5

    invoke-static {v11, v12}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v11, v13

    double-to-float v5, v11

    invoke-virtual {v9, v10, v5}, Landroid/graphics/Path;->lineTo(FF)V

    add-int/lit8 v8, v8, 0x1

    move/from16 v5, v16

    move/from16 v6, v17

    goto :goto_0

    :cond_0
    iget-object v5, v0, Lcom/miui/gallery/search/widget/IntroIconView;->mLandPath:Landroid/graphics/Path;

    invoke-virtual {v5}, Landroid/graphics/Path;->close()V

    iget-object v5, v0, Lcom/miui/gallery/search/widget/IntroIconView;->mLandPath:Landroid/graphics/Path;

    iget-object v6, v0, Lcom/miui/gallery/search/widget/IntroIconView;->mLandPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v5, v6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    const v5, 0x3f2e147b    # 0.68f

    mul-float v5, v5, v4

    iget-object v6, v0, Lcom/miui/gallery/search/widget/IntroIconView;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v6

    int-to-float v6, v6

    mul-float v6, v6, v5

    iget-object v8, v0, Lcom/miui/gallery/search/widget/IntroIconView;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v6, v8

    sub-float/2addr v7, v6

    float-to-int v6, v7

    div-int/lit8 v6, v6, 0x2

    sub-float/2addr v4, v5

    float-to-int v4, v4

    div-int/lit8 v4, v4, 0x2

    iget-object v5, v0, Lcom/miui/gallery/search/widget/IntroIconView;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    sub-int/2addr v2, v6

    sub-int/2addr v3, v4

    invoke-virtual {v5, v6, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v2, v0, Lcom/miui/gallery/search/widget/IntroIconView;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method
