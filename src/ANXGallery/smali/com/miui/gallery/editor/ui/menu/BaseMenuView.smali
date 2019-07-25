.class public abstract Lcom/miui/gallery/editor/ui/menu/BaseMenuView;
.super Landroid/widget/FrameLayout;
.source "BaseMenuView.java"


# instance fields
.field protected mBottomLine:Landroid/support/constraint/Guideline;

.field protected mConfirmLayout:Landroid/widget/FrameLayout;

.field private mConfirmView:Landroid/view/View;

.field protected mContentLine:Landroid/support/constraint/Guideline;

.field protected mContext:Landroid/content/Context;

.field protected mMenuLayout:Landroid/widget/FrameLayout;

.field private mMenuView:Landroid/view/View;

.field protected mTopLayout:Landroid/widget/FrameLayout;

.field protected mTopLine:Landroid/support/constraint/Guideline;

.field private mTopView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->init(Landroid/content/Context;)V

    return-void
.end method

.method private addChildViewToParent(Landroid/view/ViewGroup;Landroid/view/View;)V
    .locals 0

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method private inflateView()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mContext:Landroid/content/Context;

    sget v1, Lcom/miui/gallery/editor/R$layout;->common_editor_bottom_layout:I

    invoke-static {v0, v1, p0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    sget v0, Lcom/miui/gallery/editor/R$id;->layout_bottom_area:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mConfirmLayout:Landroid/widget/FrameLayout;

    sget v0, Lcom/miui/gallery/editor/R$id;->layout_content_area:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mMenuLayout:Landroid/widget/FrameLayout;

    sget v0, Lcom/miui/gallery/editor/R$id;->layout_top_area:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mTopLayout:Landroid/widget/FrameLayout;

    sget v0, Lcom/miui/gallery/editor/R$id;->top_guide_line:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/Guideline;

    iput-object v0, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mTopLine:Landroid/support/constraint/Guideline;

    sget v0, Lcom/miui/gallery/editor/R$id;->content_guide_line:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/Guideline;

    iput-object v0, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mContentLine:Landroid/support/constraint/Guideline;

    sget v0, Lcom/miui/gallery/editor/R$id;->bottom_guide_line:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/Guideline;

    iput-object v0, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mBottomLine:Landroid/support/constraint/Guideline;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->initTopView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mTopView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->initContentView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mMenuView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->initBottomView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mConfirmView:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mTopLayout:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mTopView:Landroid/view/View;

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->addChildViewToParent(Landroid/view/ViewGroup;Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mMenuLayout:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mMenuView:Landroid/view/View;

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->addChildViewToParent(Landroid/view/ViewGroup;Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mConfirmLayout:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mConfirmView:Landroid/view/View;

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->addChildViewToParent(Landroid/view/ViewGroup;Landroid/view/View;)V

    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mContext:Landroid/content/Context;

    invoke-direct {p0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->inflateView()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->modifyGuideLinePos()V

    return-void
.end method

.method private modifyGuideLinePos()V
    .locals 1

    sget v0, Lcom/miui/gallery/editor/R$id;->top_guide_line:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/Guideline;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->modifyTopGuideline(Landroid/support/constraint/Guideline;)V

    sget v0, Lcom/miui/gallery/editor/R$id;->content_guide_line:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/Guideline;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->modifyContentGuideline(Landroid/support/constraint/Guideline;)V

    sget v0, Lcom/miui/gallery/editor/R$id;->bottom_guide_line:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/Guideline;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->modifyBottomGuideline(Landroid/support/constraint/Guideline;)V

    return-void
.end method


# virtual methods
.method public getConfirmView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;->mConfirmView:Landroid/view/View;

    return-object v0
.end method

.method protected abstract initBottomView()Landroid/view/View;
.end method

.method protected abstract initContentView()Landroid/view/View;
.end method

.method protected abstract initTopView()Landroid/view/View;
.end method

.method protected abstract modifyBottomGuideline(Landroid/support/constraint/Guideline;)V
.end method

.method protected abstract modifyContentGuideline(Landroid/support/constraint/Guideline;)V
.end method

.method protected abstract modifyTopGuideline(Landroid/support/constraint/Guideline;)V
.end method
