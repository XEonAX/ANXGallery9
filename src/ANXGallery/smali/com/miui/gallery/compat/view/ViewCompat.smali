.class public Lcom/miui/gallery/compat/view/ViewCompat;
.super Ljava/lang/Object;
.source "ViewCompat.java"


# direct methods
.method private static getRootWindowInsets(Landroid/view/View;)Ljava/lang/Object;
    .locals 3

    if-eqz p0, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string v0, "ViewCompat"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "root window insets: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getSystemWindowInsetBottom(Landroid/view/View;)I
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/compat/view/ViewCompat;->getRootWindowInsets(Landroid/view/View;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/compat/view/WindowInsetsCompat;->getSystemWindowInsetBottom(Ljava/lang/Object;)I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static getSystemWindowInsetLeft(Landroid/view/View;)I
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/compat/view/ViewCompat;->getRootWindowInsets(Landroid/view/View;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/compat/view/WindowInsetsCompat;->getSystemWindowInsetLeft(Ljava/lang/Object;)I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static getSystemWindowInsetRight(Landroid/view/View;)I
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/compat/view/ViewCompat;->getRootWindowInsets(Landroid/view/View;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/compat/view/WindowInsetsCompat;->getSystemWindowInsetRight(Ljava/lang/Object;)I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static getSystemWindowInsets(Landroid/view/View;)Landroid/graphics/Rect;
    .locals 4

    new-instance v0, Landroid/graphics/Rect;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-static {p0}, Lcom/miui/gallery/compat/view/ViewCompat;->getRootWindowInsets(Landroid/view/View;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/compat/view/WindowInsetsCompat;->getSystemWindowInsetLeft(Ljava/lang/Object;)I

    move-result v1

    invoke-static {p0}, Lcom/miui/gallery/compat/view/WindowInsetsCompat;->getSystemWindowInsetTop(Ljava/lang/Object;)I

    move-result v2

    invoke-static {p0}, Lcom/miui/gallery/compat/view/WindowInsetsCompat;->getSystemWindowInsetRight(Ljava/lang/Object;)I

    move-result v3

    invoke-static {p0}, Lcom/miui/gallery/compat/view/WindowInsetsCompat;->getSystemWindowInsetBottom(Ljava/lang/Object;)I

    move-result p0

    invoke-virtual {v0, v1, v2, v3, p0}, Landroid/graphics/Rect;->set(IIII)V

    :cond_0
    return-object v0
.end method

.method public static setTransitionName(Landroid/view/View;I)V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setTransitionName(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
