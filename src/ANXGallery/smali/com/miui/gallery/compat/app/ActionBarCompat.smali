.class public Lcom/miui/gallery/compat/app/ActionBarCompat;
.super Ljava/lang/Object;
.source "ActionBarCompat.java"


# direct methods
.method public static setShowHideAnimationEnabled(Landroid/app/ActionBar;Z)V
    .locals 5

    if-eqz p0, :cond_1

    instance-of v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;

    if-eqz v0, :cond_0

    check-cast p0, Lcom/miui/gallery/view/ActionBarWrapper;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/ActionBarWrapper;->setShowHideAnimationEnabled(Z)V

    goto :goto_0

    :cond_0
    const-string v0, "setShowHideAnimationEnabled"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, v1, v4

    invoke-static {p0, v0, v2, v1}, Lcom/miui/gallery/util/MiscUtil;->invokeSafely(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    :goto_0
    return-void
.end method
