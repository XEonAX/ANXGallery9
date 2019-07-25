.class public Lcom/miui/gallery/widget/PagerIndicator;
.super Landroid/view/View;
.source "PagerIndicator.java"


# static fields
.field private static DEFAULT_CIRCLE_RADIUS_VALUE:I = 0xa

.field private static DEFAULT_CIRCLE_SPACING_VALUE:I = 0xf

.field private static DEFAULT_SELECTED_COLOR_VALUE:I

.field private static DEFAULT_UNSELECTED_COLOR_VALUE:I


# instance fields
.field private mCount:I

.field private mIndex:I

.field private mPaint:Landroid/graphics/Paint;

.field private mRadius:I

.field private mSelectedColor:I

.field private mSpacing:I

.field private mUnselectedColor:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/PagerIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/PagerIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sget-object p3, Lcom/miui/gallery/R$styleable;->PagerIndicator:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    sget p2, Lcom/miui/gallery/widget/PagerIndicator;->DEFAULT_CIRCLE_SPACING_VALUE:I

    const/4 p3, 0x1

    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/PagerIndicator;->mSpacing:I

    sget p2, Lcom/miui/gallery/widget/PagerIndicator;->DEFAULT_CIRCLE_RADIUS_VALUE:I

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/PagerIndicator;->mRadius:I

    sget p2, Lcom/miui/gallery/widget/PagerIndicator;->DEFAULT_SELECTED_COLOR_VALUE:I

    const/4 v0, 0x2

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/PagerIndicator;->mSelectedColor:I

    sget p2, Lcom/miui/gallery/widget/PagerIndicator;->DEFAULT_UNSELECTED_COLOR_VALUE:I

    const/4 v0, 0x3

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/PagerIndicator;->mUnselectedColor:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/PagerIndicator;->mPaint:Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/miui/gallery/widget/PagerIndicator;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    return-void
.end method

.method private measureHeight(I)I
    .locals 3

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    const/high16 v1, 0x40000000    # 2.0f

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/miui/gallery/widget/PagerIndicator;->mRadius:I

    mul-int/lit8 v1, v1, 0x2

    invoke-virtual {p0}, Lcom/miui/gallery/widget/PagerIndicator;->getPaddingTop()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/miui/gallery/widget/PagerIndicator;->getPaddingBottom()I

    move-result v2

    add-int/2addr v1, v2

    const/high16 v2, -0x80000000

    if-ne v0, v2, :cond_1

    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    goto :goto_0

    :cond_1
    move p1, v1

    :goto_0
    return p1
.end method

.method private measureWidth(I)I
    .locals 4

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    const/high16 v1, 0x40000000    # 2.0f

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/miui/gallery/widget/PagerIndicator;->mRadius:I

    mul-int/lit8 v1, v1, 0x2

    iget v2, p0, Lcom/miui/gallery/widget/PagerIndicator;->mCount:I

    mul-int v1, v1, v2

    iget v2, p0, Lcom/miui/gallery/widget/PagerIndicator;->mSpacing:I

    iget v3, p0, Lcom/miui/gallery/widget/PagerIndicator;->mCount:I

    add-int/lit8 v3, v3, -0x1

    mul-int v2, v2, v3

    add-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/miui/gallery/widget/PagerIndicator;->getPaddingLeft()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/miui/gallery/widget/PagerIndicator;->getPaddingRight()I

    move-result v2

    add-int/2addr v1, v2

    const/high16 v2, -0x80000000

    if-ne v0, v2, :cond_1

    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    goto :goto_0

    :cond_1
    move p1, v1

    :goto_0
    return p1
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Lcom/miui/gallery/widget/PagerIndicator;->getPaddingLeft()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/PagerIndicator;->getPaddingTop()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget v0, p0, Lcom/miui/gallery/widget/PagerIndicator;->mRadius:I

    iget v1, p0, Lcom/miui/gallery/widget/PagerIndicator;->mRadius:I

    const/4 v2, 0x0

    :goto_0
    iget v3, p0, Lcom/miui/gallery/widget/PagerIndicator;->mCount:I

    if-ge v2, v3, :cond_1

    iget v3, p0, Lcom/miui/gallery/widget/PagerIndicator;->mIndex:I

    if-ne v2, v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/widget/PagerIndicator;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/miui/gallery/widget/PagerIndicator;->mSelectedColor:I

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_1

    :cond_0
    iget-object v3, p0, Lcom/miui/gallery/widget/PagerIndicator;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/miui/gallery/widget/PagerIndicator;->mUnselectedColor:I

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    :goto_1
    int-to-float v3, v0

    int-to-float v4, v1

    iget v5, p0, Lcom/miui/gallery/widget/PagerIndicator;->mRadius:I

    int-to-float v5, v5

    iget-object v6, p0, Lcom/miui/gallery/widget/PagerIndicator;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget v3, p0, Lcom/miui/gallery/widget/PagerIndicator;->mRadius:I

    mul-int/lit8 v3, v3, 0x2

    add-int/2addr v0, v3

    iget v3, p0, Lcom/miui/gallery/widget/PagerIndicator;->mSpacing:I

    add-int/2addr v0, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/PagerIndicator;->measureWidth(I)I

    move-result p1

    invoke-direct {p0, p2}, Lcom/miui/gallery/widget/PagerIndicator;->measureHeight(I)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/widget/PagerIndicator;->setMeasuredDimension(II)V

    return-void
.end method

.method public showIndex(II)V
    .locals 1

    add-int/lit8 v0, p1, 0x1

    if-le v0, p2, :cond_0

    return-void

    :cond_0
    iput p1, p0, Lcom/miui/gallery/widget/PagerIndicator;->mIndex:I

    iget p1, p0, Lcom/miui/gallery/widget/PagerIndicator;->mCount:I

    if-eq p1, p2, :cond_1

    iput p2, p0, Lcom/miui/gallery/widget/PagerIndicator;->mCount:I

    invoke-virtual {p0}, Lcom/miui/gallery/widget/PagerIndicator;->requestLayout()V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/widget/PagerIndicator;->invalidate()V

    :goto_0
    return-void
.end method
