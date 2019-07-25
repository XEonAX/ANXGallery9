.class public Lcom/miui/gallery/view/menu/BottomMenuBarUtils;
.super Ljava/lang/Object;
.source "BottomMenuBarUtils.java"


# direct methods
.method public static findBottomMenuBar(Landroid/view/View;)Lcom/miui/gallery/widget/BottomMenu;
    .locals 2

    const/4 v0, 0x0

    :goto_0
    if-eqz p0, :cond_2

    instance-of v1, p0, Lcom/miui/gallery/widget/BottomMenu;

    if-eqz v1, :cond_0

    move-object v0, p0

    check-cast v0, Lcom/miui/gallery/widget/BottomMenu;

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/View;

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    goto :goto_0

    :cond_1
    move-object p0, v0

    goto :goto_0

    :cond_2
    :goto_1
    return-object v0
.end method
