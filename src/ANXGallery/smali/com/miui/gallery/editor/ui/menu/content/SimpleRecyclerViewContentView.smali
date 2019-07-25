.class public Lcom/miui/gallery/editor/ui/menu/content/SimpleRecyclerViewContentView;
.super Lcom/miui/gallery/editor/ui/menu/content/BaseEditContentView;
.source "SimpleRecyclerViewContentView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/ui/menu/content/BaseEditContentView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected inflateContentView(Landroid/content/Context;)V
    .locals 1

    sget v0, Lcom/miui/gallery/editor/R$layout;->common_edit_menu_content_view:I

    invoke-static {p1, v0, p0}, Lcom/miui/gallery/editor/ui/menu/content/SimpleRecyclerViewContentView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    return-void
.end method
