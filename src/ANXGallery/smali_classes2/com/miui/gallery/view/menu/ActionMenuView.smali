.class public abstract Lcom/miui/gallery/view/menu/ActionMenuView;
.super Landroid/widget/LinearLayout;
.source "ActionMenuView.java"

# interfaces
.implements Lcom/miui/gallery/view/menu/MenuBuilder$ItemInvoker;
.implements Lcom/miui/gallery/view/menu/MenuView;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/view/menu/ActionMenuView$OpenCloseAnimator;,
        Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;
    }
.end annotation


# instance fields
.field private mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

.field private mOpenCloseAnimator:Lcom/miui/gallery/view/menu/ActionMenuView$OpenCloseAnimator;

.field private mPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

.field private mReserveOverflow:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/view/menu/ActionMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->setBaselineAligned(Z)V

    new-instance p1, Lcom/miui/gallery/view/menu/ActionMenuView$OpenCloseAnimator;

    invoke-direct {p1, p0}, Lcom/miui/gallery/view/menu/ActionMenuView$OpenCloseAnimator;-><init>(Lcom/miui/gallery/view/menu/ActionMenuView;)V

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuView;->mOpenCloseAnimator:Lcom/miui/gallery/view/menu/ActionMenuView$OpenCloseAnimator;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    return-void
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 0

    if-eqz p1, :cond_0

    instance-of p1, p1, Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public filterLeftoverView(I)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->removeView(Landroid/view/View;)V

    const/4 p1, 0x1

    return p1
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/ActionMenuView;->generateDefaultLayoutParams()Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/widget/LinearLayout$LayoutParams;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/ActionMenuView;->generateDefaultLayoutParams()Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected generateDefaultLayoutParams()Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;
    .locals 2

    new-instance v0, Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->generateLayoutParams(Landroid/util/AttributeSet;)Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/LinearLayout$LayoutParams;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->generateLayoutParams(Landroid/util/AttributeSet;)Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/LinearLayout$LayoutParams;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;
    .locals 2

    new-instance v0, Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/ActionMenuView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;
    .locals 1

    instance-of v0, p1, Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    check-cast p1, Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    invoke-direct {v0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;-><init>(Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;)V

    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/ActionMenuView;->generateDefaultLayoutParams()Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public generateOverflowButtonLayoutParams()Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/ActionMenuView;->generateDefaultLayoutParams()Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;->isOverflowButton:Z

    return-object v0
.end method

.method public abstract getCollapsedHeight()I
.end method

.method public getPresenter()Lcom/miui/gallery/view/menu/ActionMenuPresenter;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuView;->mPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    return-object v0
.end method

.method public getWindowAnimations()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public hasBackgroundView()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public initialize(Lcom/miui/gallery/view/menu/MenuBuilder;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuView;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    return-void
.end method

.method public invokeItem(Lcom/miui/gallery/view/menu/MenuItemImpl;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuView;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/view/menu/MenuBuilder;->performItemAction(Landroid/view/MenuItem;I)Z

    move-result p1

    return p1
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-lt v0, v1, :cond_0

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuView;->mPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuView;->mPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->updateMenuView(Z)V

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuView;->mPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->isOverflowMenuShowing()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuView;->mPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->hideOverflowMenu(Z)Z

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuView;->mPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->showOverflowMenu()Z

    :cond_1
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuView;->mPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->dismissPopupMenus(Z)Z

    return-void
.end method

.method protected onMeasure(II)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/ActionMenuView;->getChildCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->setMeasuredDimension(II)V

    return-void

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    return-void
.end method

.method public setCustomView(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public setOverflowReserved(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/view/menu/ActionMenuView;->mReserveOverflow:Z

    return-void
.end method

.method public setPresenter(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuView;->mPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    return-void
.end method
