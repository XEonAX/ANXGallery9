.class public Lcom/miui/gallery/editor/ui/menu/type/EditNavMenuView;
.super Lcom/miui/gallery/editor/ui/menu/BaseMenuView;
.source "EditNavMenuView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/ui/menu/BaseMenuView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected initBottomView()Landroid/view/View;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/ui/menu/type/EditNavMenuView;->mContext:Landroid/content/Context;

    sget v1, Lcom/miui/gallery/editor/R$layout;->common_edit_menu_confirm_layout:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/editor/ui/menu/type/EditNavMenuView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected initContentView()Landroid/view/View;
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/ui/menu/content/SimpleRecyclerViewContentView;

    iget-object v1, p0, Lcom/miui/gallery/editor/ui/menu/type/EditNavMenuView;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/ui/menu/content/SimpleRecyclerViewContentView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected initTopView()Landroid/view/View;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected modifyBottomGuideline(Landroid/support/constraint/Guideline;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/ui/menu/type/EditNavMenuView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/miui/gallery/editor/R$dimen;->editor_nav_bottom_guide_line_end:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method

.method protected modifyContentGuideline(Landroid/support/constraint/Guideline;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/ui/menu/type/EditNavMenuView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/miui/gallery/editor/R$dimen;->editor_content_guide_line_end:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method

.method protected modifyTopGuideline(Landroid/support/constraint/Guideline;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/ui/menu/type/EditNavMenuView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/miui/gallery/editor/R$dimen;->editor_menu_height:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method
