.class public Lcom/miui/gallery/widget/CardNumImageView;
.super Lcom/miui/gallery/widget/ForegroundImageView;
.source "CardNumImageView.java"


# instance fields
.field private mFontMetrics:Landroid/graphics/Paint$FontMetricsInt;

.field private mNum:I

.field private mTextPaint:Landroid/text/TextPaint;

.field private mTextSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/CardNumImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/CardNumImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/widget/ForegroundImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sget-object v0, Lcom/miui/gallery/R$styleable;->CardNumImageView:[I

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f06007b

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    if-eqz p2, :cond_0

    invoke-virtual {p2, v1, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    iput p3, p0, Lcom/miui/gallery/widget/CardNumImageView;->mNum:I

    const/4 p3, 0x1

    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/CardNumImageView;->mTextSize:I

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_0

    :cond_0
    iput p1, p0, Lcom/miui/gallery/widget/CardNumImageView;->mTextSize:I

    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/CardNumImageView;->initPaint()V

    return-void
.end method

.method private drawNumText(Landroid/graphics/Canvas;)V
    .locals 4

    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/CardNumImageView;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/CardNumImageView;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/widget/CardNumImageView;->mFontMetrics:Landroid/graphics/Paint$FontMetricsInt;

    iget v2, v2, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/widget/CardNumImageView;->mFontMetrics:Landroid/graphics/Paint$FontMetricsInt;

    iget v2, v2, Landroid/graphics/Paint$FontMetricsInt;->top:I

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    iget v2, p0, Lcom/miui/gallery/widget/CardNumImageView;->mNum:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    int-to-float v0, v0

    int-to-float v1, v1

    iget-object v3, p0, Lcom/miui/gallery/widget/CardNumImageView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {p1, v2, v0, v1, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method private initPaint()V
    .locals 2

    new-instance v0, Landroid/text/TextPaint;

    const/16 v1, 0x101

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/widget/CardNumImageView;->mTextPaint:Landroid/text/TextPaint;

    iget-object v0, p0, Lcom/miui/gallery/widget/CardNumImageView;->mTextPaint:Landroid/text/TextPaint;

    iget v1, p0, Lcom/miui/gallery/widget/CardNumImageView;->mTextSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTextSize(F)V

    iget-object v0, p0, Lcom/miui/gallery/widget/CardNumImageView;->mTextPaint:Landroid/text/TextPaint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/widget/CardNumImageView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/CardNumImageView;->mFontMetrics:Landroid/graphics/Paint$FontMetricsInt;

    iget-object v0, p0, Lcom/miui/gallery/widget/CardNumImageView;->mTextPaint:Landroid/text/TextPaint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/ForegroundImageView;->draw(Landroid/graphics/Canvas;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/CardNumImageView;->drawNumText(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public setNum(I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/CardNumImageView;->mNum:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/miui/gallery/widget/CardNumImageView;->mNum:I

    invoke-virtual {p0}, Lcom/miui/gallery/widget/CardNumImageView;->invalidate()V

    :cond_0
    return-void
.end method
