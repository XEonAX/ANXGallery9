.class public Lcom/miui/gallery/ui/PhotoChoiceTitle;
.super Landroid/support/constraint/ConstraintLayout;
.source "PhotoChoiceTitle.java"

# interfaces
.implements Lcom/miui/gallery/widget/slip/ISlipAnimView;


# instance fields
.field private mExitButton:Landroid/widget/ImageView;

.field private mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoChoiceTitle;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/ui/PhotoChoiceTitle;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/support/constraint/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private doSlipAnim(F)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float v1, v1, v2

    float-to-int v1, v1

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/MiscUtil;->floatEquals(FF)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->setVisibility(I)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->setVisibility(I)V

    :goto_0
    return-void
.end method


# virtual methods
.method public getExitButton()Landroid/widget/ImageView;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoChoiceTitle;->mExitButton:Landroid/widget/ImageView;

    return-object v0
.end method

.method public getTitle()Landroid/widget/TextView;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoChoiceTitle;->mTitle:Landroid/widget/TextView;

    return-object v0
.end method

.method public hasOverlappingRendering()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Landroid/support/constraint/ConstraintLayout;->onFinishInflate()V

    const v0, 0x7f090089

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoChoiceTitle;->mTitle:Landroid/widget/TextView;

    const v0, 0x7f090088

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoChoiceTitle;->mExitButton:Landroid/widget/ImageView;

    return-void
.end method

.method public onSlipping(F)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->doSlipAnim(F)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->setAlpha(F)V

    return-void
.end method
