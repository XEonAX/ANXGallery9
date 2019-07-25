.class public Lcom/miui/gallery/editor/ui/menu/type/BaseMenuContentView;
.super Lcom/miui/gallery/editor/ui/menu/type/BaseMenuBottomView;
.source "BaseMenuContentView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/ui/menu/type/BaseMenuBottomView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected modifyContentGuideline(Landroid/support/constraint/Guideline;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/ui/menu/type/BaseMenuContentView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/miui/gallery/editor/R$dimen;->editor_menu_smart_video_guide_line_end:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method
