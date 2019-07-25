.class Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;
.super Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$Delegator;
.source "ColorPicker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GradientDelegator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$Delegator<",
        "Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;",
        ">;"
    }
.end annotation


# instance fields
.field private mColors:[I


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$Delegator;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->getColors()[I

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    return-void
.end method

.method private ave(IIF)I
    .locals 0

    sub-int/2addr p2, p1

    int-to-float p2, p2

    mul-float p3, p3, p2

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p2

    add-int/2addr p1, p2

    return p1
.end method

.method private findColorProgress(III)F
    .locals 5

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    invoke-static {p2}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    invoke-static {p3}, Landroid/graphics/Color;->alpha(I)I

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->getValueProgress(III)F

    move-result v0

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v1

    invoke-static {p2}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static {p3}, Landroid/graphics/Color;->red(I)I

    move-result v3

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->getValueProgress(III)F

    move-result v1

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v2

    invoke-static {p2}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static {p3}, Landroid/graphics/Color;->green(I)I

    move-result v4

    invoke-direct {p0, v2, v3, v4}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->getValueProgress(III)F

    move-result v2

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    invoke-static {p2}, Landroid/graphics/Color;->blue(I)I

    move-result p2

    invoke-static {p3}, Landroid/graphics/Color;->blue(I)I

    move-result p3

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->getValueProgress(III)F

    move-result p1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result p2

    invoke-static {p2, v2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    invoke-static {p2, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    return p1
.end method

.method private getValueProgress(III)F
    .locals 0

    if-ne p3, p2, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    sub-int/2addr p1, p2

    int-to-float p1, p1

    sub-int/2addr p3, p2

    int-to-float p2, p3

    div-float/2addr p1, p2

    return p1
.end method

.method private isValueInside(III)Z
    .locals 0

    if-lt p1, p2, :cond_0

    if-le p1, p3, :cond_1

    :cond_0
    if-lt p1, p3, :cond_2

    if-gt p1, p2, :cond_2

    :cond_1
    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method findLevel(I)I
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p1

    const/4 v2, 0x0

    const/high16 v3, -0x1000000

    if-ne v1, v3, :cond_0

    return v2

    :cond_0
    const/4 v3, -0x1

    if-ne v1, v3, :cond_1

    invoke-static {}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->access$000()I

    move-result v1

    return v1

    :cond_1
    invoke-static/range {p1 .. p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v4

    invoke-static/range {p1 .. p1}, Landroid/graphics/Color;->red(I)I

    move-result v5

    invoke-static/range {p1 .. p1}, Landroid/graphics/Color;->green(I)I

    move-result v6

    invoke-static/range {p1 .. p1}, Landroid/graphics/Color;->blue(I)I

    move-result v7

    const/4 v8, 0x0

    :goto_0
    iget-object v9, v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    array-length v9, v9

    add-int/lit8 v9, v9, -0x1

    if-ge v8, v9, :cond_5

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    aget v9, v9, v8

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    add-int/lit8 v11, v8, 0x1

    aget v10, v10, v11

    if-ne v1, v9, :cond_2

    int-to-float v1, v8

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-static {}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->access$000()I

    move-result v2

    int-to-float v2, v2

    mul-float v1, v1, v2

    float-to-int v1, v1

    return v1

    :cond_2
    if-ne v1, v10, :cond_3

    int-to-float v1, v11

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-static {}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->access$000()I

    move-result v2

    int-to-float v2, v2

    mul-float v1, v1, v2

    float-to-int v1, v1

    return v1

    :cond_3
    invoke-static {v9}, Landroid/graphics/Color;->alpha(I)I

    move-result v12

    invoke-static {v9}, Landroid/graphics/Color;->red(I)I

    move-result v13

    invoke-static {v9}, Landroid/graphics/Color;->green(I)I

    move-result v14

    invoke-static {v9}, Landroid/graphics/Color;->blue(I)I

    move-result v9

    invoke-static {v10}, Landroid/graphics/Color;->alpha(I)I

    move-result v15

    invoke-static {v10}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static {v10}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static {v10}, Landroid/graphics/Color;->blue(I)I

    move-result v10

    invoke-direct {v0, v4, v12, v15}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->isValueInside(III)Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-direct {v0, v5, v13, v2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->isValueInside(III)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-direct {v0, v6, v14, v3}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->isValueInside(III)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-direct {v0, v7, v9, v10}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->isValueInside(III)Z

    move-result v2

    if-eqz v2, :cond_4

    const/4 v2, -0x1

    goto :goto_1

    :cond_4
    move v8, v11

    const/4 v2, 0x0

    const/4 v3, -0x1

    goto :goto_0

    :cond_5
    const/4 v2, -0x1

    const/4 v8, -0x1

    :goto_1
    if-ne v8, v2, :cond_6

    const/4 v2, 0x0

    return v2

    :cond_6
    iget-object v2, v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    aget v2, v2, v8

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    add-int/lit8 v4, v8, 0x1

    aget v3, v3, v4

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->findColorProgress(III)F

    move-result v1

    int-to-float v2, v8

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    int-to-float v3, v3

    div-float/2addr v2, v3

    const/high16 v3, 0x3f800000    # 1.0f

    iget-object v4, v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    int-to-float v4, v4

    div-float/2addr v3, v4

    mul-float v1, v1, v3

    add-float/2addr v2, v1

    invoke-static {}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->access$000()I

    move-result v1

    int-to-float v1, v1

    mul-float v2, v2, v1

    float-to-int v1, v2

    return v1
.end method

.method getColor()I
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->getLevel()I

    move-result v0

    invoke-static {}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->access$000()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    if-nez v0, :cond_1

    const/high16 v0, -0x1000000

    return v0

    :cond_1
    int-to-float v0, v0

    invoke-static {}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->access$000()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    const/4 v1, 0x0

    cmpg-float v1, v0, v1

    if-gtz v1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0

    :cond_2
    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v1, v0, v1

    if-ltz v1, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    return v0

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    int-to-float v1, v1

    mul-float v0, v0, v1

    float-to-int v1, v0

    int-to-float v2, v1

    sub-float/2addr v0, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    aget v2, v2, v1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->mColors:[I

    add-int/lit8 v1, v1, 0x1

    aget v1, v3, v1

    invoke-static {v2}, Landroid/graphics/Color;->alpha(I)I

    move-result v3

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v4

    invoke-direct {p0, v3, v4, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->ave(IIF)I

    move-result v3

    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v4

    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v5

    invoke-direct {p0, v4, v5, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->ave(IIF)I

    move-result v4

    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    move-result v5

    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v6

    invoke-direct {p0, v5, v6, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->ave(IIF)I

    move-result v5

    invoke-static {v2}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    move-result v1

    invoke-direct {p0, v2, v1, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$GradientDelegator;->ave(IIF)I

    move-result v0

    invoke-static {v3, v4, v5, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    return v0
.end method
