.class public Lcom/miui/gallery/util/SystemUiUtil;
.super Ljava/lang/Object;
.source "SystemUiUtil.java"


# direct methods
.method public static extendToStatusBar(Landroid/view/View;)V
    .locals 1

    const/16 v0, 0x500

    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method

.method public static hideSystemBars(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isNightMode(Landroid/content/Context;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {p0, v0}, Lcom/miui/gallery/util/SystemUiUtil;->hideSystemBars(Landroid/view/View;Z)V

    return-void
.end method

.method public static hideSystemBars(Landroid/view/View;Z)V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/16 p1, 0x3706

    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_1

    :cond_1
    :goto_0
    const/16 p1, 0x1706

    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    :goto_1
    return-void
.end method

.method public static setDrawSystemBarBackground(Landroid/view/Window;)V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_0

    return-void

    :cond_0
    if-eqz p0, :cond_1

    const/high16 v0, -0x80000000

    invoke-virtual {p0, v0}, Landroid/view/Window;->addFlags(I)V

    :cond_1
    return-void
.end method

.method public static setLayoutFullScreen(Landroid/view/View;Z)V
    .locals 2

    if-nez p1, :cond_0

    const/16 p1, 0x1706

    goto :goto_0

    :cond_0
    const/16 p1, 0x700

    :goto_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x16

    if-le v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isNightMode(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    or-int/lit16 p1, p1, 0x2000

    :cond_1
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method

.method public static setSystemBarsVisibility(ZLandroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isNightMode(Landroid/content/Context;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz p0, :cond_0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SystemUiUtil;->showSystemBars(Landroid/view/View;Z)V

    goto :goto_0

    :cond_0
    invoke-static {p1, v0}, Lcom/miui/gallery/util/SystemUiUtil;->hideSystemBars(Landroid/view/View;Z)V

    :goto_0
    return-void
.end method

.method public static showSystemBars(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isNightMode(Landroid/content/Context;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {p0, v0}, Lcom/miui/gallery/util/SystemUiUtil;->showSystemBars(Landroid/view/View;Z)V

    return-void
.end method

.method public static showSystemBars(Landroid/view/View;Z)V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/16 p1, 0x2700

    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_1

    :cond_1
    :goto_0
    const/16 p1, 0x700

    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    :goto_1
    return-void
.end method
