.class public Lcom/miui/gallery/video/editor/ui/menu/FilterAdjustView;
.super Lcom/miui/gallery/editor/ui/menu/type/BaseMenuTopView;
.source "FilterAdjustView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/ui/menu/type/BaseMenuTopView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected initContentView()Landroid/view/View;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/menu/FilterAdjustView;->mContext:Landroid/content/Context;

    const v1, 0x7f0b017f

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/video/editor/ui/menu/FilterAdjustView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected initTopView()Landroid/view/View;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/menu/FilterAdjustView;->mContext:Landroid/content/Context;

    const v1, 0x7f0b0182

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/video/editor/ui/menu/FilterAdjustView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
