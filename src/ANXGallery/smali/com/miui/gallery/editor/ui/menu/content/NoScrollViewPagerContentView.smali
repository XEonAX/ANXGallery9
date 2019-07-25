.class public Lcom/miui/gallery/editor/ui/menu/content/NoScrollViewPagerContentView;
.super Lcom/miui/gallery/editor/ui/menu/content/BaseEditContentView;
.source "NoScrollViewPagerContentView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/ui/menu/content/BaseEditContentView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected inflateContentView(Landroid/content/Context;)V
    .locals 1

    sget v0, Lcom/miui/gallery/editor/R$layout;->common_edit_view_pager_layout:I

    invoke-static {p1, v0, p0}, Lcom/miui/gallery/editor/ui/menu/content/NoScrollViewPagerContentView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    return-void
.end method
