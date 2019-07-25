.class public Lcom/miui/gallery/editor/ui/view/RoundImageView;
.super Landroid/widget/ImageView;
.source "RoundImageView.java"


# instance fields
.field private bottomCorner:F

.field private corner:F

.field private height:F

.field public mDefaultCorners:F

.field private topCorner:F

.field private width:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/ui/view/RoundImageView;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/ui/view/RoundImageView;->init(Landroid/content/Context;)V

    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/miui/gallery/editor/R$dimen;->editor_menu_filter_item_corner:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->mDefaultCorners:F

    iget p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->mDefaultCorners:F

    iput p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->corner:F

    iget p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->mDefaultCorners:F

    iput p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->topCorner:F

    iget p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->mDefaultCorners:F

    iput p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->bottomCorner:F

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    iget v0, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->width:F

    iget v1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->corner:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->height:F

    iget v1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->corner:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iget v1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->topCorner:F

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    iget v1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->width:F

    iget v3, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->corner:F

    sub-float/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    iget v1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->width:F

    iget v3, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->width:F

    iget v4, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->topCorner:F

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Path;->quadTo(FFFF)V

    iget v1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->width:F

    iget v3, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->height:F

    iget v4, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->bottomCorner:F

    sub-float/2addr v3, v4

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    iget v1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->width:F

    iget v3, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->height:F

    iget v4, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->width:F

    iget v5, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->bottomCorner:F

    sub-float/2addr v4, v5

    iget v5, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->height:F

    invoke-virtual {v0, v1, v3, v4, v5}, Landroid/graphics/Path;->quadTo(FFFF)V

    iget v1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->bottomCorner:F

    iget v3, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->height:F

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    iget v1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->height:F

    iget v3, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->height:F

    iget v4, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->bottomCorner:F

    sub-float/2addr v3, v4

    invoke-virtual {v0, v2, v1, v2, v3}, Landroid/graphics/Path;->quadTo(FFFF)V

    iget v1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->topCorner:F

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    iget v1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->topCorner:F

    invoke-virtual {v0, v2, v2, v1, v2}, Landroid/graphics/Path;->quadTo(FFFF)V

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    invoke-super/range {p0 .. p5}, Landroid/widget/ImageView;->onLayout(ZIIII)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/ui/view/RoundImageView;->getWidth()I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->width:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/ui/view/RoundImageView;->getHeight()I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->height:F

    return-void
.end method

.method public setBottomCorner(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->corner:F

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->bottomCorner:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/ui/view/RoundImageView;->invalidate()V

    return-void
.end method

.method public setCorner(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->corner:F

    iput p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->topCorner:F

    iput p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->bottomCorner:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/ui/view/RoundImageView;->invalidate()V

    return-void
.end method

.method public setTopCorner(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->corner:F

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput p1, p0, Lcom/miui/gallery/editor/ui/view/RoundImageView;->topCorner:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/ui/view/RoundImageView;->invalidate()V

    return-void
.end method
