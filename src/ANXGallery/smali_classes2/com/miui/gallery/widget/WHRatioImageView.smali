.class public Lcom/miui/gallery/widget/WHRatioImageView;
.super Lcom/miui/gallery/widget/ForegroundImageView;
.source "WHRatioImageView.java"


# instance fields
.field private mWHRatio:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/ForegroundImageView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/widget/WHRatioImageView;->mWHRatio:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/WHRatioImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/widget/ForegroundImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/widget/WHRatioImageView;->mWHRatio:F

    sget-object v1, Lcom/miui/gallery/R$styleable;->WHRatioImageView:[I

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p2, 0x2

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/WHRatioImageView;->mWHRatio:F

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    :cond_0
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/widget/WHRatioImageView;->mWHRatio:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_2

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    const/high16 v2, 0x40000000    # 2.0f

    if-ne v0, v2, :cond_0

    int-to-float p2, p1

    iget v1, p0, Lcom/miui/gallery/widget/WHRatioImageView;->mWHRatio:F

    div-float/2addr p2, v1

    float-to-int p2, p2

    const/high16 v1, 0x40000000    # 2.0f

    goto :goto_0

    :cond_0
    if-ne v1, v2, :cond_1

    int-to-float p1, p2

    iget v0, p0, Lcom/miui/gallery/widget/WHRatioImageView;->mWHRatio:F

    mul-float p1, p1, v0

    float-to-int p1, p1

    const/high16 v0, 0x40000000    # 2.0f

    :cond_1
    :goto_0
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    :cond_2
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/widget/ForegroundImageView;->onMeasure(II)V

    return-void
.end method

.method public setWHRatio(F)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/WHRatioImageView;->mWHRatio:F

    invoke-static {p1, v0}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-eqz v0, :cond_0

    iput p1, p0, Lcom/miui/gallery/widget/WHRatioImageView;->mWHRatio:F

    invoke-virtual {p0}, Lcom/miui/gallery/widget/WHRatioImageView;->requestLayout()V

    :cond_0
    return-void
.end method
