.class public Lcom/miui/gallery/widget/EndTopCornerTextView;
.super Landroid/widget/TextView;
.source "EndTopCornerTextView.java"


# instance fields
.field private mCornerMargin:I

.field private mCornerPaint:Landroid/graphics/Paint;

.field private mCornerText:Ljava/lang/CharSequence;

.field private mTemp1:Landroid/graphics/Rect;

.field private mTemp2:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/EndTopCornerTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/EndTopCornerTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mTemp1:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mTemp2:Landroid/graphics/Rect;

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/widget/EndTopCornerTextView;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    sget-object v0, Lcom/miui/gallery/R$styleable;->EndTopCornerTextView:[I

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerPaint:Landroid/graphics/Paint;

    iget-object p2, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerPaint:Landroid/graphics/Paint;

    const/4 p3, 0x1

    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p2, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerPaint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->getCurrentTextColor()I

    move-result v0

    const/4 v2, 0x2

    invoke-virtual {p1, v2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p2, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerPaint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->getTextSize()F

    move-result v0

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    float-to-int v0, v0

    const/4 v2, 0x3

    invoke-virtual {p1, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    invoke-virtual {p1, v1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerMargin:I

    invoke-virtual {p1, p3}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/widget/EndTopCornerTextView;->setCornerText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerText:Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v1

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    iget-object v3, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mTemp1:Landroid/graphics/Rect;

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v0, v3}, Landroid/text/TextPaint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerText:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerText:Ljava/lang/CharSequence;

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mTemp2:Landroid/graphics/Rect;

    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->getLayoutDirection()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerText:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mTemp1:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    add-int/2addr v1, v2

    iget v2, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerMargin:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->getBaseline()I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mTemp1:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mTemp2:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    add-int/2addr v2, v3

    int-to-float v2, v2

    iget-object v3, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerText:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->getPaddingLeft()I

    move-result v1

    iget v2, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerMargin:I

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mTemp2:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->getBaseline()I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mTemp1:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mTemp2:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    add-int/2addr v2, v3

    int-to-float v2, v2

    iget-object v3, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setCornerText(Ljava/lang/CharSequence;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerText:Ljava/lang/CharSequence;

    iget-object p1, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerText:Ljava/lang/CharSequence;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->getPaddingEnd()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerText:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/widget/EndTopCornerTextView;->mCornerMargin:I

    add-int/2addr v0, v1

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->getPaddingBottom()I

    move-result v1

    invoke-virtual {p0, p1, v0, p1, v1}, Lcom/miui/gallery/widget/EndTopCornerTextView;->setPadding(IIII)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->invalidate()V

    return-void
.end method
