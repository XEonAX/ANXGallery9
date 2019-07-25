.class public Lcom/miui/gallery/view/menu/PhoneActionMenuView;
.super Lcom/miui/gallery/view/menu/ActionMenuView;
.source "PhoneActionMenuView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;,
        Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;
    }
.end annotation


# static fields
.field private static final ATTRS:[I


# instance fields
.field private mAverageActionButtonWidth:I

.field private mBackgroundPadding:Landroid/graphics/Rect;

.field private mBackgroundView:Landroid/view/View;

.field private mBaseInnerInsets:Landroid/graphics/Rect;

.field private mCollapseBackground:Landroid/graphics/drawable/Drawable;

.field private mCustomView:Landroid/view/View;

.field private mExpandBackground:Landroid/graphics/drawable/Drawable;

.field private mInsetBottom:I

.field private mMaxActionButtonWidth:I

.field private mMenuItemHeight:I

.field private mMenuItemWidth:I

.field private mOverflowMenuState:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

.field private mOverflowMenuView:Landroid/view/View;

.field private mOverflowMenuViewAnimator:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;

.field private mSplitActionBarDivider:Landroid/graphics/drawable/Drawable;

.field private mSplitActionBarOverlayHeight:I

.field private mSplitBarDividerY:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->ATTRS:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x10100d4
        0x7f03002c
        0x7f0300d0
        0x7f0300d1
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/view/menu/ActionMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    sget-object v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Collapsed:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    iput-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuState:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mMaxActionButtonWidth:I

    iput v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mAverageActionButtonWidth:I

    const/4 v1, -0x1

    iput v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mSplitBarDividerY:I

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBaseInnerInsets:Landroid/graphics/Rect;

    const/4 v1, 0x0

    invoke-super {p0, v1}, Lcom/miui/gallery/view/menu/ActionMenuView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    sget-object v1, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->ATTRS:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCollapseBackground:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x1

    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mExpandBackground:Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x2

    invoke-virtual {p2, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mSplitActionBarDivider:Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x3

    invoke-virtual {p2, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mSplitActionBarOverlayHeight:I

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    invoke-direct {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->extractBackground()V

    new-instance p2, Landroid/view/View;

    invoke-direct {p2, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundView:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundView:Landroid/view/View;

    invoke-virtual {p0, p2}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->addView(Landroid/view/View;)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->setChildrenDrawingOrderEnabled(Z)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f060006

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mMaxActionButtonWidth:I

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuState:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    return-object p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/view/menu/PhoneActionMenuView;Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;)Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuState:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    return-object p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCollapseBackground:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundView:Landroid/view/View;

    return-object p0
.end method

.method private extractBackground()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundPadding:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundPadding:Landroid/graphics/Rect;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCollapseBackground:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mExpandBackground:Landroid/graphics/drawable/Drawable;

    :goto_0
    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundPadding:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    return-void

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundPadding:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    return-void
.end method

.method private getOverflowMenuViewAnimator()Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuViewAnimator:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;-><init>(Lcom/miui/gallery/view/menu/PhoneActionMenuView;Lcom/miui/gallery/view/menu/PhoneActionMenuView$1;)V

    iput-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuViewAnimator:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuViewAnimator:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;

    return-object v0
.end method

.method private getStatusBarHeight()I
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "status_bar_height"

    const-string v2, "dimen"

    const-string v3, "android"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->dispatchDraw(Landroid/graphics/Canvas;)V

    iget v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mSplitBarDividerY:I

    if-ltz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->isCustomViewShowing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->isOverflowMenuShowing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    const/4 v0, 0x0

    iget v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mSplitBarDividerY:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mSplitActionBarDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_0
    return-void
.end method

.method public filterLeftoverView(I)Z
    .locals 4

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundView:Landroid/view/View;

    if-eq v0, v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    if-eqz v0, :cond_1

    iget-boolean v0, v0, Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;->isOverflowButton:Z

    if-nez v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_3

    invoke-super {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->filterLeftoverView(I)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_2

    :cond_3
    const/4 v2, 0x0

    :goto_2
    return v2
.end method

.method protected fitSystemWindows(Landroid/graphics/Rect;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBaseInnerInsets:Landroid/graphics/Rect;

    invoke-static {p0}, Lcom/miui/gallery/compat/view/ViewCompat;->getSystemWindowInsets(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBaseInnerInsets:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    iget v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mInsetBottom:I

    if-eq v1, v0, :cond_0

    iput v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mInsetBottom:I

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->requestLayout()V

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->fitSystemWindows(Landroid/graphics/Rect;)Z

    move-result p1

    return p1
.end method

.method protected getChildDrawingOrder(II)I
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->indexOfChild(Landroid/view/View;)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->indexOfChild(Landroid/view/View;)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundView:Landroid/view/View;

    invoke-virtual {p0, v2}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->indexOfChild(Landroid/view/View;)I

    move-result v2

    const/4 v3, -0x1

    if-nez p2, :cond_2

    if-eq v0, v3, :cond_0

    return v0

    :cond_0
    if-eq v1, v3, :cond_1

    return v1

    :cond_1
    if-eq v2, v3, :cond_6

    return v2

    :cond_2
    const/4 v4, 0x1

    if-ne p2, v4, :cond_5

    if-eq v0, v3, :cond_4

    if-eq v1, v3, :cond_3

    return v1

    :cond_3
    if-eq v2, v3, :cond_6

    return v2

    :cond_4
    if-eq v1, v3, :cond_6

    if-eq v2, v3, :cond_6

    return v2

    :cond_5
    const/4 v4, 0x2

    if-ne p2, v4, :cond_6

    if-eq v0, v3, :cond_6

    if-eq v1, v3, :cond_6

    if-eq v2, v3, :cond_6

    return v2

    :cond_6
    const/4 v3, 0x0

    :goto_0
    if-ge v3, p1, :cond_c

    if-eq v3, v1, :cond_b

    if-eq v3, v2, :cond_b

    if-ne v3, v0, :cond_7

    goto :goto_2

    :cond_7
    if-ge v3, v1, :cond_8

    add-int/lit8 v4, v3, 0x1

    goto :goto_1

    :cond_8
    move v4, v3

    :goto_1
    if-ge v3, v2, :cond_9

    add-int/lit8 v4, v4, 0x1

    :cond_9
    if-ge v3, v0, :cond_a

    add-int/lit8 v4, v4, 0x1

    :cond_a
    if-ne v4, p2, :cond_b

    return v3

    :cond_b
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_c
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/view/menu/ActionMenuView;->getChildDrawingOrder(II)I

    move-result p1

    return p1
.end method

.method public getCollapsedHeight()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mMenuItemHeight:I

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mMenuItemHeight:I

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundPadding:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mSplitActionBarOverlayHeight:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public hasBackgroundView()Z
    .locals 3

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundView:Landroid/view/View;

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public hideOverflowMenu()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuState:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    sget-object v1, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Collapsing:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-eq v0, v1, :cond_3

    sget-object v1, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Collapsed:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getOverflowMenuViewAnimator()Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Expanded:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v2, :cond_1

    sget-object v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Collapsing:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    iput-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuState:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    invoke-virtual {v1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->hide()V

    goto :goto_0

    :cond_1
    sget-object v2, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Expanding:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v2, :cond_2

    invoke-virtual {v1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->reverse()V

    :cond_2
    :goto_0
    const/4 v0, 0x1

    return v0

    :cond_3
    :goto_1
    const/4 v0, 0x0

    return v0
.end method

.method public isCustomViewShowing()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

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

.method public isOverflowMenuShowing()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuState:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    sget-object v1, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Expanding:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuState:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    sget-object v1, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Expanded:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected onLayout(ZIIII)V
    .locals 10

    sub-int p1, p4, p2

    sub-int p2, p5, p3

    iget-object p3, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    const/4 p4, 0x0

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getMeasuredHeight()I

    move-result p3

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    iget-object p5, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    if-eqz p5, :cond_1

    iget-object p5, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    invoke-virtual {p5}, Landroid/view/View;->getMeasuredHeight()I

    move-result p5

    goto :goto_1

    :cond_1
    const/4 p5, 0x0

    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    if-eqz v0, :cond_3

    if-le p3, p5, :cond_2

    const/4 v6, 0x0

    goto :goto_2

    :cond_2
    sub-int v0, p5, p3

    move v6, v0

    :goto_2
    add-int v7, p3, v6

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    const/4 v2, 0x0

    move-object v0, p0

    move v3, v6

    move v4, p1

    move v5, v7

    invoke-static/range {v0 .. v5}, Lmiui/util/ViewUtils;->layoutChildView(Landroid/view/ViewGroup;Landroid/view/View;IIII)V

    goto :goto_3

    :cond_3
    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_3
    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    if-eqz v0, :cond_5

    if-le p3, p5, :cond_4

    sub-int/2addr p3, p5

    goto :goto_4

    :cond_4
    const/4 p3, 0x0

    :goto_4
    add-int/2addr p5, p3

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    const/4 v2, 0x0

    move-object v0, p0

    move v3, p3

    move v4, p1

    move v5, p5

    invoke-static/range {v0 .. v5}, Lmiui/util/ViewUtils;->layoutChildView(Landroid/view/ViewGroup;Landroid/view/View;IIII)V

    goto :goto_5

    :cond_5
    move p3, v6

    move p5, v7

    :goto_5
    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    if-eqz v0, :cond_7

    :cond_6
    iget-object p3, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundPadding:Landroid/graphics/Rect;

    iget p3, p3, Landroid/graphics/Rect;->top:I

    sub-int/2addr p5, p3

    move p3, p5

    :cond_7
    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundView:Landroid/view/View;

    const/4 v2, 0x0

    move-object v0, p0

    move v3, p3

    move v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Lmiui/util/ViewUtils;->layoutChildView(Landroid/view/ViewGroup;Landroid/view/View;IIII)V

    iget-object p5, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundPadding:Landroid/graphics/Rect;

    iget p5, p5, Landroid/graphics/Rect;->top:I

    add-int/2addr p3, p5

    iget-object p5, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundPadding:Landroid/graphics/Rect;

    iget p5, p5, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p2, p5

    iget p5, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mInsetBottom:I

    sub-int/2addr p2, p5

    iget-object p5, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mSplitActionBarDivider:Landroid/graphics/drawable/Drawable;

    if-eqz p5, :cond_8

    iput p3, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mSplitBarDividerY:I

    iget-object p5, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mSplitActionBarDivider:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mSplitActionBarDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    invoke-virtual {p5, p4, p4, p1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_6

    :cond_8
    const/4 p5, -0x1

    iput p5, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mSplitBarDividerY:I

    :goto_6
    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getChildCount()I

    move-result p5

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v6, 0x0

    :goto_7
    const/4 v7, 0x1

    if-ge v0, p5, :cond_c

    invoke-virtual {p0, v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    if-eq v2, v3, :cond_b

    iget-object v3, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundView:Landroid/view/View;

    if-eq v2, v3, :cond_b

    iget-object v3, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    if-ne v2, v3, :cond_9

    goto :goto_8

    :cond_9
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    iget v3, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mAverageActionButtonWidth:I

    if-lt v2, v3, :cond_a

    const/4 v6, 0x1

    :cond_a
    add-int/lit8 v1, v1, 0x1

    :cond_b
    :goto_8
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_c
    if-eqz v6, :cond_d

    iget v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mAverageActionButtonWidth:I

    mul-int v0, v0, v1

    sub-int/2addr p1, v0

    shr-int/2addr p1, v7

    goto :goto_9

    :cond_d
    iget v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mMenuItemWidth:I

    sub-int/2addr p1, v0

    shr-int/2addr p1, v7

    :goto_9
    if-ge p4, p5, :cond_11

    invoke-virtual {p0, p4}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    if-eq v8, v0, :cond_10

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundView:Landroid/view/View;

    if-eq v8, v0, :cond_10

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    if-ne v8, v0, :cond_e

    goto :goto_a

    :cond_e
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    if-eqz v6, :cond_f

    iget v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mAverageActionButtonWidth:I

    sub-int/2addr v1, v0

    shr-int/lit8 v9, v1, 0x1

    add-int/2addr p1, v9

    add-int v4, p1, v0

    move-object v0, p0

    move-object v1, v8

    move v2, p1

    move v3, p3

    move v5, p2

    invoke-static/range {v0 .. v5}, Lmiui/util/ViewUtils;->layoutChildView(Landroid/view/ViewGroup;Landroid/view/View;IIII)V

    sub-int/2addr p1, v9

    iget v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mAverageActionButtonWidth:I

    add-int/2addr p1, v0

    goto :goto_a

    :cond_f
    add-int v4, p1, v0

    move-object v0, p0

    move-object v1, v8

    move v2, p1

    move v3, p3

    move v5, p2

    invoke-static/range {v0 .. v5}, Lmiui/util/ViewUtils;->layoutChildView(Landroid/view/ViewGroup;Landroid/view/View;IIII)V

    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    add-int/2addr p1, v0

    :cond_10
    :goto_a
    add-int/lit8 p4, p4, 0x1

    goto :goto_9

    :cond_11
    return-void
.end method

.method protected onMeasure(II)V
    .locals 13

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getChildCount()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getChildCount()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    invoke-virtual {p0, v2}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->indexOfChild(Landroid/view/View;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    add-int/lit8 v1, v1, -0x1

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    invoke-virtual {p0, v2}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->indexOfChild(Landroid/view/View;)I

    move-result v2

    if-eq v2, v3, :cond_1

    add-int/lit8 v1, v1, -0x1

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundView:Landroid/view/View;

    invoke-virtual {p0, v2}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->indexOfChild(Landroid/view/View;)I

    move-result v2

    if-eq v2, v3, :cond_2

    add-int/lit8 v1, v1, -0x1

    :cond_2
    const/4 v2, 0x0

    if-eqz v0, :cond_e

    if-nez v1, :cond_3

    goto/16 :goto_5

    :cond_3
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    div-int/2addr v3, v1

    iget v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mMaxActionButtonWidth:I

    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mAverageActionButtonWidth:I

    iget v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mAverageActionButtonWidth:I

    const/high16 v3, -0x80000000

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    const/4 v3, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_0
    if-ge v3, v0, :cond_6

    invoke-virtual {p0, v3}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    iget-object v4, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    if-eq v12, v4, :cond_5

    iget-object v4, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundView:Landroid/view/View;

    if-eq v12, v4, :cond_5

    iget-object v4, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    if-ne v12, v4, :cond_4

    goto :goto_1

    :cond_4
    const/4 v7, 0x0

    const/4 v9, 0x0

    move-object v4, p0

    move-object v5, v12

    move v6, v1

    move v8, p2

    invoke-virtual/range {v4 .. v9}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->measureChildWithMargins(Landroid/view/View;IIII)V

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    add-int/2addr v10, v4

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    invoke-static {v11, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    move v11, v4

    :cond_5
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_6
    iput v10, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mMenuItemWidth:I

    iput v11, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mMenuItemHeight:I

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getStatusBarHeight()I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mMenuItemHeight:I

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iget-object v4, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v3, p0

    move v5, p1

    move v7, p2

    invoke-virtual/range {v3 .. v8}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->measureChildWithMargins(Landroid/view/View;IIII)V

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-static {v10, v0}, Ljava/lang/Math;->max(II)I

    move-result v10

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    goto :goto_2

    :cond_7
    const/4 v0, 0x0

    :goto_2
    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    if-eqz v1, :cond_8

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getStatusBarHeight()I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mMenuItemHeight:I

    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iget-object v4, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v3, p0

    move v5, p1

    move v7, p2

    invoke-virtual/range {v3 .. v8}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->measureChildWithMargins(Landroid/view/View;IIII)V

    iget-object p2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result p2

    invoke-static {v10, p2}, Ljava/lang/Math;->max(II)I

    move-result v10

    iget-object p2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    :cond_8
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result p2

    add-int/2addr v11, p2

    iget-object p2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    if-eqz p2, :cond_a

    iget-object p2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuState:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    sget-object v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Expanded:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne p2, v0, :cond_9

    iget-object p2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_3

    :cond_9
    iget-object p2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuState:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    sget-object v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Collapsed:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne p2, v0, :cond_a

    iget-object p2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    int-to-float v0, v11

    invoke-virtual {p2, v0}, Landroid/view/View;->setTranslationY(F)V

    :cond_a
    :goto_3
    iget-object p2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    if-eqz p2, :cond_b

    iget-object p2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    if-nez p2, :cond_c

    :cond_b
    iget-object p2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundPadding:Landroid/graphics/Rect;

    iget p2, p2, Landroid/graphics/Rect;->top:I

    add-int/2addr v11, p2

    :cond_c
    iget-object p2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundView:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuState:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    sget-object v1, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Collapsed:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v1, :cond_d

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCollapseBackground:Landroid/graphics/drawable/Drawable;

    goto :goto_4

    :cond_d
    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mExpandBackground:Landroid/graphics/drawable/Drawable;

    :goto_4
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget p2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mInsetBottom:I

    add-int/2addr v11, p2

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-static {v10, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p0, p1, v11}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->setMeasuredDimension(II)V

    return-void

    :cond_e
    :goto_5
    iput v2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mMenuItemHeight:I

    invoke-virtual {p0, v2, v2}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->setMeasuredDimension(II)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    move-result v1

    :goto_0
    cmpl-float v0, v0, v1

    if-gtz v0, :cond_2

    invoke-super {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 p1, 0x1

    :goto_2
    return p1
.end method

.method public setBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCollapseBackground:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCollapseBackground:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->extractBackground()V

    :cond_0
    return-void
.end method

.method public setCustomView(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    if-eq v0, p1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->removeView(Landroid/view/View;)V

    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->addView(Landroid/view/View;)V

    :cond_1
    iput-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mCustomView:Landroid/view/View;

    :cond_2
    return-void
.end method

.method public setOverflowMenuView(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    if-eq v0, p1, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->removeView(Landroid/view/View;)V

    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->addView(Landroid/view/View;)V

    :cond_2
    iput-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    invoke-direct {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->extractBackground()V

    :cond_3
    return-void
.end method

.method public setValue(F)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getMeasuredHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float p1, p1, v1

    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationY(F)V

    return-void
.end method

.method public showOverflowMenu()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuState:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    sget-object v1, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Expanding:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-eq v0, v1, :cond_3

    sget-object v1, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Expanded:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-eq v0, v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuView:Landroid/view/View;

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mBackgroundView:Landroid/view/View;

    iget-object v2, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mExpandBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-direct {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getOverflowMenuViewAnimator()Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Collapsed:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v2, :cond_1

    sget-object v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Expanding:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    iput-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->mOverflowMenuState:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    invoke-virtual {v1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->show()V

    goto :goto_0

    :cond_1
    sget-object v2, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Collapsing:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v2, :cond_2

    invoke-virtual {v1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->reverse()V

    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->postInvalidateOnAnimation()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->setFocusable(Z)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->setFocusableInTouchMode(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->requestFocus()Z

    return v0

    :cond_3
    :goto_1
    const/4 v0, 0x0

    return v0
.end method
