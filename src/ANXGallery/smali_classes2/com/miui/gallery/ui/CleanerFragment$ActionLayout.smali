.class Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;
.super Ljava/lang/Object;
.source "CleanerFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/CleanerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ActionLayout"
.end annotation


# instance fields
.field private mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

.field private mButton:Landroid/widget/TextView;

.field private mDescription:Landroid/widget/TextView;

.field private mLayoutParams:Landroid/view/ViewGroup$MarginLayoutParams;

.field private mTitle:Landroid/widget/TextView;

.field private mView:Landroid/view/View;

.field final synthetic this$0:Lcom/miui/gallery/ui/CleanerFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/CleanerFragment;Landroid/view/View;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

    iput-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mView:Landroid/view/View;

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mView:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    iput-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mLayoutParams:Landroid/view/ViewGroup$MarginLayoutParams;

    const p1, 0x7f0902fa

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mTitle:Landroid/widget/TextView;

    const p1, 0x7f0900d0

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mDescription:Landroid/widget/TextView;

    const p1, 0x7f0902ba

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mButton:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mButton:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->showNoScanResultTip()V

    return-void
.end method

.method private cancelAnimation()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {v0}, Landroid/view/animation/AlphaAnimation;->cancel()V

    iput-object v1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    :cond_0
    return-void
.end method

.method private showNoScanResultTip()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mTitle:Landroid/widget/TextView;

    const v1, 0x7f10027e

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mDescription:Landroid/widget/TextView;

    const v1, 0x7f10027f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mButton:Landroid/widget/TextView;

    const v1, 0x7f100280

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method


# virtual methods
.method public hide(Z)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->cancelAnimation()V

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->isVisible()Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Landroid/view/animation/AlphaAnimation;

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    iput-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

    const-wide/16 v0, 0x15e

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

    new-instance v0, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

    new-instance v0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout$1;-><init>(Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;)V

    invoke-virtual {p1, v0}, Landroid/view/animation/AlphaAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mView:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mView:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public isVisible()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->isVisible()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/CleanerFragment;->onBackPressed()Z

    :cond_0
    return-void
.end method

.method public setHeight(II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mLayoutParams:Landroid/view/ViewGroup$MarginLayoutParams;

    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mLayoutParams:Landroid/view/ViewGroup$MarginLayoutParams;

    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mView:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mLayoutParams:Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public setMarginTop(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mLayoutParams:Landroid/view/ViewGroup$MarginLayoutParams;

    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mView:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mLayoutParams:Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public show(Z)V
    .locals 2

    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->show(ZJ)V

    return-void
.end method

.method public show(ZJ)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->cancelAnimation()V

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->isVisible()Z

    move-result p1

    if-nez p1, :cond_0

    new-instance p1, Landroid/view/animation/AlphaAnimation;

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p1, v0, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    iput-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {p1, p2, p3}, Landroid/view/animation/AlphaAnimation;->setStartOffset(J)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

    const-wide/16 p2, 0x1f4

    invoke-virtual {p1, p2, p3}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

    new-instance p2, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mView:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mAlphaAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {p1, p2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->mView:Landroid/view/View;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
