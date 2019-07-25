.class public Lcom/miui/gallery/widget/BottomMenu;
.super Landroid/widget/FrameLayout;
.source "BottomMenu.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;
    }
.end annotation


# instance fields
.field private mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

.field private mBaseInnerInsets:Landroid/graphics/Rect;

.field private mContentMask:Landroid/view/View;

.field private mContentMaskOnClickListener:Landroid/view/View$OnClickListener;

.field private mCustomView:Landroid/view/View;

.field private mHiddenByApp:Z

.field private mMenuBarAnim:Landroid/animation/Animator;

.field private mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

.field private mOptionsMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

.field private mSplitMenuView:Lcom/miui/gallery/view/menu/PhoneActionMenuView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mBaseInnerInsets:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mBaseInnerInsets:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mBaseInnerInsets:Landroid/graphics/Rect;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/BottomMenu;)Lcom/miui/gallery/view/menu/PhoneActionMenuView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/BottomMenu;->mSplitMenuView:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/BottomMenu;)Lcom/miui/gallery/view/menu/ActionMenuView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/widget/BottomMenu;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/BottomMenu;->mContentMask:Landroid/view/View;

    return-object p0
.end method

.method private applyInsets(Landroid/view/View;Landroid/graphics/Rect;ZZZZ)Z
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v0, 0x1

    if-eqz p3, :cond_0

    iget p3, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iget v1, p2, Landroid/graphics/Rect;->left:I

    if-eq p3, v1, :cond_0

    iget p3, p2, Landroid/graphics/Rect;->left:I

    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    const/4 p3, 0x1

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    if-eqz p4, :cond_1

    iget p4, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iget v1, p2, Landroid/graphics/Rect;->top:I

    if-eq p4, v1, :cond_1

    iget p3, p2, Landroid/graphics/Rect;->top:I

    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    const/4 p3, 0x1

    :cond_1
    if-eqz p6, :cond_2

    iget p4, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    iget p6, p2, Landroid/graphics/Rect;->right:I

    if-eq p4, p6, :cond_2

    iget p3, p2, Landroid/graphics/Rect;->right:I

    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    const/4 p3, 0x1

    :cond_2
    if-eqz p5, :cond_3

    iget p4, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    iget p5, p2, Landroid/graphics/Rect;->bottom:I

    if-eq p4, p5, :cond_3

    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    const/4 p3, 0x1

    :cond_3
    return p3
.end method

.method private configPresenters(Lcom/miui/gallery/view/menu/MenuBuilder;)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/view/menu/MenuBuilder;->addMenuPresenter(Lcom/miui/gallery/view/menu/MenuPresenter;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/BottomMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->initForMenu(Landroid/content/Context;Lcom/miui/gallery/view/menu/MenuBuilder;)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->updateMenuView(Z)V

    return-void
.end method

.method private getMenuBarAnimator(Z)Landroid/animation/Animator;
    .locals 9

    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    const-string v5, "TranslationY"

    new-array v6, v4, [F

    iget-object v7, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    invoke-virtual {v7}, Lcom/miui/gallery/view/menu/ActionMenuView;->getTranslationY()F

    move-result v7

    aput v7, v6, v3

    aput v1, v6, v2

    invoke-static {p1, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    const-string v5, "Alpha"

    new-array v6, v4, [F

    iget-object v7, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    invoke-virtual {v7}, Lcom/miui/gallery/view/menu/ActionMenuView;->getAlpha()F

    move-result v7

    aput v7, v6, v3

    const/high16 v7, 0x3f800000    # 1.0f

    aput v7, v6, v2

    invoke-static {v1, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    new-array v4, v4, [Landroid/animation/Animator;

    aput-object p1, v4, v3

    aput-object v1, v4, v2

    invoke-virtual {v0, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    new-instance p1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/BottomMenu;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f0a0001

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/BottomMenu;->getMenuBarHeight()I

    move-result p1

    invoke-static {p0}, Lcom/miui/gallery/compat/view/ViewCompat;->getSystemWindowInsetBottom(Landroid/view/View;)I

    move-result v5

    add-int/2addr p1, v5

    iget-object v5, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    const-string v6, "TranslationY"

    new-array v7, v4, [F

    iget-object v8, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    invoke-virtual {v8}, Lcom/miui/gallery/view/menu/ActionMenuView;->getTranslationY()F

    move-result v8

    aput v8, v7, v3

    int-to-float p1, p1

    aput p1, v7, v2

    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iget-object v5, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    const-string v6, "Alpha"

    new-array v7, v4, [F

    iget-object v8, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    invoke-virtual {v8}, Lcom/miui/gallery/view/menu/ActionMenuView;->getAlpha()F

    move-result v8

    aput v8, v7, v3

    aput v1, v7, v2

    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    new-array v4, v4, [Landroid/animation/Animator;

    aput-object p1, v4, v3

    aput-object v1, v4, v2

    invoke-virtual {v0, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    new-instance p1, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/BottomMenu;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f0a0002

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    new-instance p1, Lcom/miui/gallery/widget/BottomMenu$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/widget/BottomMenu$2;-><init>(Lcom/miui/gallery/widget/BottomMenu;)V

    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :goto_0
    return-object v0
.end method

.method private getMenuBarHeight()I
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/ActionMenuView;->getHeight()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    instance-of v1, v1, Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    check-cast v1, Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-virtual {v1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->isOverflowMenuShowing()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getCollapsedHeight()I

    move-result v0

    :cond_0
    return v0
.end method

.method private isBackPressed(Landroid/view/KeyEvent;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x4

    if-ne v0, v2, :cond_0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private pullChildren()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mContentMask:Landroid/view/View;

    if-nez v0, :cond_0

    const v0, 0x7f0900b2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/BottomMenu;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mContentMask:Landroid/view/View;

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isOledDisplay()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mContentMask:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mContentMask:Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/BottomMenu;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070338

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method

.method private updateContentMaskVisibility(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    instance-of v0, v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    check-cast v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    iput-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mSplitMenuView:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mSplitMenuView:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->isOverflowMenuShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mContentMask:Landroid/view/View;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mContentMaskOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/BottomMenu;->getContentMaskAnimator(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->show()Landroid/animation/Animator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/BottomMenu;->getContentMaskAnimator(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->hide()Landroid/animation/Animator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method protected createActionMenuPresenter(Lcom/miui/gallery/view/menu/MenuPresenter$Callback;)Lcom/miui/gallery/view/menu/ActionMenuPresenter;
    .locals 7

    new-instance v6, Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/BottomMenu;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isTablet()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f0b0005

    const v2, 0x7f0b0005

    goto :goto_0

    :cond_0
    const v0, 0x7f0b0004

    const v2, 0x7f0b0004

    :goto_0
    const v3, 0x7f0b0003

    const/high16 v4, 0x7f0b0000

    const v5, 0x7f0b0001

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;-><init>(Landroid/content/Context;IIII)V

    invoke-virtual {v6, p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->setCallback(Lcom/miui/gallery/view/menu/MenuPresenter$Callback;)V

    const p1, 0x7f090013

    invoke-virtual {v6, p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->setId(I)V

    return-object v6
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/BottomMenu;->isBackPressed(Landroid/view/KeyEvent;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->hideOverflowMenu(Z)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method protected fitSystemWindows(Landroid/graphics/Rect;)Z
    .locals 8

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mBaseInnerInsets:Landroid/graphics/Rect;

    invoke-static {p0}, Lcom/miui/gallery/compat/view/ViewCompat;->getSystemWindowInsets(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    iget-object v3, p0, Lcom/miui/gallery/widget/BottomMenu;->mBaseInnerInsets:Landroid/graphics/Rect;

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/widget/BottomMenu;->applyInsets(Landroid/view/View;Landroid/graphics/Rect;ZZZZ)Z

    move-result p1

    or-int/2addr p1, v0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/BottomMenu;->requestLayout()V

    :cond_1
    return v0
.end method

.method public getAnimatedVisibility()I
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mHiddenByApp:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/BottomMenu;->getVisibility()I

    move-result v0

    goto :goto_0

    :cond_0
    const/16 v0, 0x8

    :goto_0
    return v0
.end method

.method public getCollapsedHeight()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/ActionMenuView;->getCollapsedHeight()I

    move-result v0

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_1
    return v1
.end method

.method public getContentMaskAnimator(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;
    .locals 2

    new-instance v0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;-><init>(Lcom/miui/gallery/widget/BottomMenu;Landroid/view/View$OnClickListener;Lcom/miui/gallery/widget/BottomMenu$1;)V

    return-object v0
.end method

.method public hide(Z)V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mHiddenByApp:Z

    if-nez v0, :cond_3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mHiddenByApp:Z

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuBarAnim:Landroid/animation/Animator;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuBarAnim:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    :cond_1
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/BottomMenu;->getMenuBarAnimator(Z)Landroid/animation/Animator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuBarAnim:Landroid/animation/Animator;

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuBarAnim:Landroid/animation/Animator;

    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    invoke-direct {p0}, Lcom/miui/gallery/widget/BottomMenu;->getMenuBarHeight()I

    move-result v1

    invoke-static {p0}, Lcom/miui/gallery/compat/view/ViewCompat;->getSystemWindowInsetBottom(Landroid/view/View;)I

    move-result v2

    add-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/view/menu/ActionMenuView;->setTranslationY(F)V

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/miui/gallery/view/menu/ActionMenuView;->setAlpha(F)V

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Lcom/miui/gallery/view/menu/ActionMenuView;->setVisibility(I)V

    :goto_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/BottomMenu;->updateContentMaskVisibility(Z)V

    :cond_3
    return-void
.end method

.method public hideOverflowMenu()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->hideOverflowMenu(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public isOverflowMenuShowing()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->isOverflowMenuShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isOverflowReserved()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->isOverflowReserved()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 0

    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/BottomMenu;->requestFitSystemWindows()V

    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/BottomMenu;->pullChildren()V

    new-instance v0, Lcom/miui/gallery/widget/BottomMenu$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/BottomMenu$1;-><init>(Lcom/miui/gallery/widget/BottomMenu;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mContentMaskOnClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public setCustomView(Landroid/view/View;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mCustomView:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->setCustomView(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public setMenu(Landroid/view/Menu;Lcom/miui/gallery/view/menu/MenuPresenter$Callback;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mOptionsMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mOptionsMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mOptionsMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    iget-object v1, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/view/menu/MenuBuilder;->removeMenuPresenter(Lcom/miui/gallery/view/menu/MenuPresenter;)V

    :cond_1
    check-cast p1, Lcom/miui/gallery/view/menu/MenuBuilder;

    iput-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mOptionsMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/ActionMenuView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    if-nez v0, :cond_3

    invoke-virtual {p0, p2}, Lcom/miui/gallery/widget/BottomMenu;->createActionMenuPresenter(Lcom/miui/gallery/view/menu/MenuPresenter$Callback;)Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    :cond_3
    iget-object p2, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->setExpandedActionViewsExclusive(Z)V

    iget-object p2, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/BottomMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    const/4 v1, 0x1

    invoke-virtual {p2, v0, v1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->setWidthLimit(IZ)V

    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p2, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v0, 0x50

    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/BottomMenu;->configPresenters(Lcom/miui/gallery/view/menu/MenuBuilder;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->getMenuView(Landroid/view/ViewGroup;)Lcom/miui/gallery/view/menu/MenuView;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/view/menu/ActionMenuView;

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_4

    if-eq v0, p0, :cond_4

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_4
    invoke-virtual {p0}, Lcom/miui/gallery/widget/BottomMenu;->getAnimatedVisibility()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/view/menu/ActionMenuView;->setVisibility(I)V

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/widget/BottomMenu;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const p2, 0x7f09010a

    invoke-virtual {p1, p2}, Lcom/miui/gallery/view/menu/ActionMenuView;->findViewById(I)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_5

    invoke-virtual {p2}, Landroid/view/View;->requestLayout()V

    :cond_5
    const/16 p2, 0x8

    if-eq v0, p2, :cond_6

    invoke-virtual {p0}, Lcom/miui/gallery/widget/BottomMenu;->requestFitSystemWindows()V

    :cond_6
    iget-object p2, p0, Lcom/miui/gallery/widget/BottomMenu;->mCustomView:Landroid/view/View;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/view/menu/ActionMenuView;->setCustomView(Landroid/view/View;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    return-void
.end method

.method public show(Z)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mHiddenByApp:Z

    if-eqz v0, :cond_4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mHiddenByApp:Z

    iget-object v1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    if-nez v1, :cond_0

    const-string p1, "BottomMenu"

    const-string v0, "show: menuView is null"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuBarAnim:Landroid/animation/Animator;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuBarAnim:Landroid/animation/Animator;

    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/view/menu/ActionMenuView;->setVisibility(I)V

    const/4 v0, 0x1

    if-eqz p1, :cond_2

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/BottomMenu;->getMenuBarAnimator(Z)Landroid/animation/Animator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuBarAnim:Landroid/animation/Animator;

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuBarAnim:Landroid/animation/Animator;

    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    instance-of p1, p1, Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    check-cast p1, Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->isOverflowMenuShowing()Z

    move-result p1

    xor-int/2addr p1, v0

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->startLayoutAnimation()V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/miui/gallery/view/menu/ActionMenuView;->setTranslationY(F)V

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu;->mMenuView:Lcom/miui/gallery/view/menu/ActionMenuView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p1, v1}, Lcom/miui/gallery/view/menu/ActionMenuView;->setAlpha(F)V

    :cond_3
    :goto_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/BottomMenu;->updateContentMaskVisibility(Z)V

    :cond_4
    return-void
.end method

.method public showOverflowMenu()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu;->mActionMenuPresenter:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->showOverflowMenu()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
