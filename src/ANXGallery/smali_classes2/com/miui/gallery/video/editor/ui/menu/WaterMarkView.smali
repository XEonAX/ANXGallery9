.class public Lcom/miui/gallery/video/editor/ui/menu/WaterMarkView;
.super Lcom/miui/gallery/editor/ui/menu/type/BaseMenuBottomView;
.source "WaterMarkView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/ui/menu/type/BaseMenuBottomView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected initBottomView()Landroid/view/View;
    .locals 2

    new-instance v0, Lcom/miui/gallery/video/editor/ui/menu/bottom/WaterMarkBottomView;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/menu/WaterMarkView;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/video/editor/ui/menu/bottom/WaterMarkBottomView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected initContentView()Landroid/view/View;
    .locals 2

    new-instance v0, Lcom/miui/gallery/video/editor/ui/menu/content/BaseContentView;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/menu/WaterMarkView;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/video/editor/ui/menu/content/BaseContentView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected modifyContentGuideline(Landroid/support/constraint/Guideline;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/menu/WaterMarkView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0601ec

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method
