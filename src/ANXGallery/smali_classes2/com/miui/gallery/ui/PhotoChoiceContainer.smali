.class public Lcom/miui/gallery/ui/PhotoChoiceContainer;
.super Landroid/widget/FrameLayout;
.source "PhotoChoiceContainer.java"

# interfaces
.implements Lcom/miui/gallery/widget/slip/ISlipAnimView;


# instance fields
.field private mInitPadding:I

.field private mSlipPadding:I

.field private mSlipPaddingRatio:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoChoiceContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/ui/PhotoChoiceContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoChoiceContainer;->mInitPadding:I

    iput p1, p0, Lcom/miui/gallery/ui/PhotoChoiceContainer;->mSlipPadding:I

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoChoiceContainer;->mSlipPaddingRatio:F

    return-void
.end method

.method private doSlipAnim(F)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/ui/PhotoChoiceContainer;->mSlipPadding:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/ui/PhotoChoiceContainer;->mInitPadding:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/ui/PhotoChoiceContainer;->mSlipPadding:I

    iget v2, p0, Lcom/miui/gallery/ui/PhotoChoiceContainer;->mInitPadding:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    mul-float v1, v1, p1

    add-float/2addr v0, v1

    float-to-int p1, v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoChoiceContainer;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoChoiceContainer;->getPaddingRight()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoChoiceContainer;->getPaddingBottom()I

    move-result v2

    invoke-virtual {p0, v0, p1, v1, v2}, Lcom/miui/gallery/ui/PhotoChoiceContainer;->setPadding(IIII)V

    :cond_0
    return-void
.end method


# virtual methods
.method public hasOverlappingRendering()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected onFinishInflate()V
    .locals 3

    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoChoiceContainer;->getPaddingTop()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoChoiceContainer;->mInitPadding:I

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoChoiceContainer;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x1

    const v2, 0x7f080005

    invoke-virtual {v0, v2, v1, v1}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoChoiceContainer;->mSlipPaddingRatio:F

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    iget p2, p0, Lcom/miui/gallery/ui/PhotoChoiceContainer;->mSlipPadding:I

    if-eqz p2, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    sub-int/2addr p5, p3

    int-to-float p1, p5

    iget p2, p0, Lcom/miui/gallery/ui/PhotoChoiceContainer;->mSlipPaddingRatio:F

    mul-float p1, p1, p2

    float-to-int p1, p1

    iput p1, p0, Lcom/miui/gallery/ui/PhotoChoiceContainer;->mSlipPadding:I

    :cond_1
    return-void
.end method

.method public onSlipping(F)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoChoiceContainer;->doSlipAnim(F)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoChoiceContainer;->setAlpha(F)V

    return-void
.end method
