.class public Lcom/miui/gallery/ui/PhotoPageMaskView;
.super Landroid/view/View;
.source "PhotoPageMaskView.java"


# instance fields
.field private isActionBarDividerVisible:Z

.field private isMaskVisible:Z

.field private isSplitBarDividerVisible:Z

.field private mActionBarDividerY:I

.field private mActionBarMask:Landroid/graphics/drawable/Drawable;

.field private mActionBarMaskAnim:Landroid/animation/ValueAnimator;

.field private mDividerPaint:Landroid/graphics/Paint;

.field private mHost:Lcom/miui/gallery/app/BottomMenuFragment;

.field private mSplitBarDividerY:I

.field private mSplitBarHeight:I

.field private mSplitBarMask:Landroid/graphics/drawable/Drawable;

.field private mSystemWindowInsetTop:I


# direct methods
.method static synthetic access$1002(Lcom/miui/gallery/ui/PhotoPageMaskView;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarDividerY:I

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/PhotoPageMaskView;)Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMask:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/PhotoPageMaskView;)I
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getActionBarHeight()I

    move-result p0

    return p0
.end method

.method static synthetic access$702(Lcom/miui/gallery/ui/PhotoPageMaskView;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarDividerY:I

    return p1
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/PhotoPageMaskView;)Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarMask:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/PhotoPageMaskView;)I
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getSplitBarHeight()I

    move-result p0

    return p0
.end method

.method private cancelAnim()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMaskAnim:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMaskAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMaskAnim:Landroid/animation/ValueAnimator;

    :cond_0
    return-void
.end method

.method private getActionBarHeight()I
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mHost:Lcom/miui/gallery/app/BottomMenuFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mHost:Lcom/miui/gallery/app/BottomMenuFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/app/BottomMenuFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSystemWindowInsetTop:I

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060388

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method private getMaskAnim(Z)Landroid/animation/ValueAnimator;
    .locals 2

    const/4 v0, 0x2

    if-eqz p1, :cond_0

    new-array p1, v0, [I

    fill-array-data p1, :array_0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a002c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object p1

    new-instance v0, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    goto :goto_0

    :cond_0
    new-array p1, v0, [I

    fill-array-data p1, :array_1

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a002d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object p1

    new-instance v0, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    :goto_0
    return-object p1

    nop

    :array_0
    .array-data 4
        0x0
        0xff
    .end array-data

    :array_1
    .array-data 4
        0xff
        0x0
    .end array-data
.end method

.method private getSplitBarHeight()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mHost:Lcom/miui/gallery/app/BottomMenuFragment;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarHeight:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mHost:Lcom/miui/gallery/app/BottomMenuFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/app/BottomMenuFragment;->getMenuCollapsedHeight()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarHeight:I

    :cond_0
    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarHeight:I

    if-lez v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarHeight:I

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->getDefaultSplitActionBarHeight(Landroid/content/Context;)I

    move-result v0

    :goto_0
    invoke-static {p0}, Lcom/miui/gallery/compat/view/ViewCompat;->getSystemWindowInsetBottom(Landroid/view/View;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private initActionBarDividerPos()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getActionBarHeight()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarDividerY:I

    return-void
.end method

.method private initSplitBarDividerPos()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getSplitBarHeight()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getHeight()I

    move-result v0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getSplitBarHeight()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarDividerY:I

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarDividerY:I

    :goto_0
    return-void
.end method

.method private setMaskBounds()Z
    .locals 5

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getActionBarHeight()I

    move-result v0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getSplitBarHeight()I

    move-result v1

    const/4 v2, -0x1

    const/4 v3, 0x0

    if-eq v0, v2, :cond_3

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMask:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMask:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getWidth()I

    move-result v4

    invoke-virtual {v2, v3, v3, v4, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarMask:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarMask:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getHeight()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getHeight()I

    move-result v4

    invoke-virtual {v0, v3, v2, v1, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_2
    const/4 v0, 0x1

    return v0

    :cond_3
    :goto_0
    return v3
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 8

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->isActionBarDividerVisible:Z

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarDividerY:I

    if-eq v0, v1, :cond_0

    const/4 v3, 0x0

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarDividerY:I

    int-to-float v4, v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getWidth()I

    move-result v0

    int-to-float v5, v0

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarDividerY:I

    int-to-float v6, v0

    iget-object v7, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mDividerPaint:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->isSplitBarDividerVisible:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarDividerY:I

    if-eq v0, v1, :cond_1

    const/4 v3, 0x0

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarDividerY:I

    int-to-float v4, v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getWidth()I

    move-result v0

    int-to-float v5, v0

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarDividerY:I

    int-to-float v6, v0

    iget-object v7, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mDividerPaint:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMask:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMask:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarMask:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarMask:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_3
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->cancelAnim()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->setMaskBounds()Z

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->initActionBarDividerPos()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->initSplitBarDividerPos()V

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->isMaskVisible:Z

    if-eqz p1, :cond_0

    const/16 p1, 0xff

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMask:Landroid/graphics/drawable/Drawable;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMask:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarMask:Landroid/graphics/drawable/Drawable;

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarMask:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->invalidate()V

    return-void
.end method

.method public setActionBarDividerVisible(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->isActionBarDividerVisible:Z

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->isActionBarDividerVisible:Z

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->initActionBarDividerPos()V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->invalidate()V

    const/4 p1, 0x1

    return p1
.end method

.method public setActionBarMaskVisible(ZZ)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMask:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarMask:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->isMaskVisible:Z

    if-ne p1, v0, :cond_1

    return v1

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->setMaskBounds()Z

    move-result v0

    if-nez v0, :cond_2

    return v1

    :cond_2
    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->isMaskVisible:Z

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->cancelAnim()V

    if-eqz p2, :cond_3

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getMaskAnim(Z)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMaskAnim:Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMaskAnim:Landroid/animation/ValueAnimator;

    new-instance p2, Lcom/miui/gallery/ui/PhotoPageMaskView$2;

    invoke-direct {p2, p0}, Lcom/miui/gallery/ui/PhotoPageMaskView$2;-><init>(Lcom/miui/gallery/ui/PhotoPageMaskView;)V

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMaskAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_0

    :cond_3
    if-eqz p1, :cond_4

    const/16 v1, 0xff

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMask:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mActionBarMask:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_5
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarMask:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mSplitBarMask:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_6
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->invalidate()V

    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public setHost(Lcom/miui/gallery/app/BottomMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->mHost:Lcom/miui/gallery/app/BottomMenuFragment;

    return-void
.end method

.method public setSplitBarDividerVisible(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->isSplitBarDividerVisible:Z

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView;->isSplitBarDividerVisible:Z

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->initSplitBarDividerPos()V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->invalidate()V

    const/4 p1, 0x1

    return p1
.end method
