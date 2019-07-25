.class public Lcom/miui/gallery/editor/ui/menu/bottom/BaseEditBottomView;
.super Landroid/support/constraint/ConstraintLayout;
.source "BaseEditBottomView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/ui/menu/bottom/BaseEditBottomView;->init(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected init(Landroid/content/Context;)V
    .locals 1

    sget v0, Lcom/miui/gallery/editor/R$layout;->common_editor_apply_layout:I

    invoke-static {p1, v0, p0}, Lcom/miui/gallery/editor/ui/menu/bottom/BaseEditBottomView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    return-void
.end method
