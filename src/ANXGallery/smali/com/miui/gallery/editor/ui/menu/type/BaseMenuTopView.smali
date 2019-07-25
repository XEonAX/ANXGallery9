.class public abstract Lcom/miui/gallery/editor/ui/menu/type/BaseMenuTopView;
.super Lcom/miui/gallery/editor/ui/menu/type/BaseMenuBottomView;
.source "BaseMenuTopView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/ui/menu/type/BaseMenuBottomView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected modifyContentGuideline(Landroid/support/constraint/Guideline;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/ui/menu/type/BaseMenuTopView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/miui/gallery/editor/R$dimen;->editor_menu_filter_guide_line_end:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method

.method protected modifyTopGuideline(Landroid/support/constraint/Guideline;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/ui/menu/type/BaseMenuTopView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/miui/gallery/editor/R$dimen;->editor_filter_and_adjust_top_guide_line_end:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method
