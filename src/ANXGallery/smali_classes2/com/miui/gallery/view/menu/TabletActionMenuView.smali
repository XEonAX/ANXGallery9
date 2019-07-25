.class public Lcom/miui/gallery/view/menu/TabletActionMenuView;
.super Lcom/miui/gallery/view/menu/ActionMenuView;
.source "TabletActionMenuView.java"


# instance fields
.field private mBaseInnerInsets:Landroid/graphics/Rect;

.field private mInsetBottom:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/view/menu/ActionMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/view/menu/TabletActionMenuView;->mBaseInnerInsets:Landroid/graphics/Rect;

    return-void
.end method


# virtual methods
.method public filterLeftoverView(I)Z
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/TabletActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    if-eqz v0, :cond_0

    iget-boolean v0, v0, Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;->isOverflowButton:Z

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->filterLeftoverView(I)Z

    move-result p1

    return p1
.end method

.method protected fitSystemWindows(Landroid/graphics/Rect;)Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/view/menu/TabletActionMenuView;->mBaseInnerInsets:Landroid/graphics/Rect;

    invoke-static {p0}, Lcom/miui/gallery/compat/view/ViewCompat;->getSystemWindowInsets(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/view/menu/TabletActionMenuView;->mBaseInnerInsets:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    iget v1, p0, Lcom/miui/gallery/view/menu/TabletActionMenuView;->mInsetBottom:I

    if-eq v1, v0, :cond_0

    iput v0, p0, Lcom/miui/gallery/view/menu/TabletActionMenuView;->mInsetBottom:I

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/TabletActionMenuView;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/TabletActionMenuView;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/TabletActionMenuView;->getPaddingRight()I

    move-result v3

    invoke-virtual {p0, v1, v2, v3, v0}, Lcom/miui/gallery/view/menu/TabletActionMenuView;->setPadding(IIII)V

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->fitSystemWindows(Landroid/graphics/Rect;)Z

    move-result p1

    return p1
.end method

.method public getCollapsedHeight()I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/TabletActionMenuView;->getMeasuredHeight()I

    move-result v0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method
