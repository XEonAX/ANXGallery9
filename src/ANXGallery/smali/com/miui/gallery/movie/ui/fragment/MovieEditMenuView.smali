.class public Lcom/miui/gallery/movie/ui/fragment/MovieEditMenuView;
.super Lcom/miui/gallery/editor/ui/menu/BaseMenuView;
.source "MovieEditMenuView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected initBottomView()Landroid/view/View;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditMenuView;->mContext:Landroid/content/Context;

    const v1, 0x7f0b00b8

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/movie/ui/fragment/MovieEditMenuView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected initContentView()Landroid/view/View;
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/ui/menu/content/NoScrollViewPagerContentView;

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditMenuView;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/ui/menu/content/NoScrollViewPagerContentView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected initTopView()Landroid/view/View;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditMenuView;->mContext:Landroid/content/Context;

    const v1, 0x7f0b00b9

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/movie/ui/fragment/MovieEditMenuView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected modifyBottomGuideline(Landroid/support/constraint/Guideline;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditMenuView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06036d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method

.method protected modifyContentGuideline(Landroid/support/constraint/Guideline;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditMenuView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060370

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method

.method protected modifyTopGuideline(Landroid/support/constraint/Guideline;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditMenuView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060383

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method
