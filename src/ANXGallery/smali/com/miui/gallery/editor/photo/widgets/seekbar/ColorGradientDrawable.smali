.class public Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "ColorGradientDrawable.java"


# instance fields
.field private mColors:[I

.field private mHeight:I

.field private mLinearGradient:Landroid/graphics/LinearGradient;

.field private mPaint:Landroid/graphics/Paint;

.field private mRect:Landroid/graphics/Rect;

.field private mWidth:I


# direct methods
.method public constructor <init>([I)V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, p1, v0, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;-><init>([III)V

    return-void
.end method

.method public constructor <init>([III)V
    .locals 1

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->mRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->mPaint:Landroid/graphics/Paint;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->mColors:[I

    iput p2, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->mWidth:I

    iput p3, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->mHeight:I

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return-void
.end method

.method public getColors()[I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->mColors:[I

    return-object v0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->mHeight:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->mWidth:I

    return v0
.end method

.method public getOpacity()I
    .locals 1

    const/4 v0, -0x1

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 9

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    new-instance v8, Landroid/graphics/LinearGradient;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v3, v0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->mColors:[I

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v0, v8

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v8, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->mLinearGradient:Landroid/graphics/LinearGradient;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->mLinearGradient:Landroid/graphics/LinearGradient;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    return-void
.end method
