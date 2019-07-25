.class public Lcom/miui/gallery/widget/VideoSeekBar;
.super Landroid/widget/SeekBar;
.source "VideoSeekBar.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public setProgressDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 9

    instance-of v0, p1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_3

    move-object v0, p1

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v1

    new-array v2, v1, [Landroid/graphics/drawable/Drawable;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v4, v1, :cond_2

    invoke-virtual {v0, v4}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    move-result v6

    invoke-virtual {v0, v4}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    const v8, 0x102000d

    if-eq v6, v8, :cond_0

    const v8, 0x102000f

    if-ne v6, v8, :cond_1

    :cond_0
    instance-of v6, v7, Landroid/graphics/drawable/NinePatchDrawable;

    if-eqz v6, :cond_1

    new-instance v5, Lcom/miui/gallery/widget/LevelNinePathDrawable;

    check-cast v7, Landroid/graphics/drawable/NinePatchDrawable;

    invoke-direct {v5, v7}, Lcom/miui/gallery/widget/LevelNinePathDrawable;-><init>(Landroid/graphics/drawable/NinePatchDrawable;)V

    const/4 v6, 0x1

    goto :goto_1

    :cond_1
    move v6, v5

    move-object v5, v7

    :goto_1
    aput-object v5, v2, v4

    add-int/lit8 v4, v4, 0x1

    move v5, v6

    goto :goto_0

    :cond_2
    if-eqz v5, :cond_3

    new-instance p1, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {p1, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    :goto_2
    if-ge v3, v1, :cond_3

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    move-result v2

    invoke-virtual {p1, v3, v2}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_3
    invoke-super {p0, p1}, Landroid/widget/SeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
