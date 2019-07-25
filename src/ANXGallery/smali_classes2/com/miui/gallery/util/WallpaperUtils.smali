.class public Lcom/miui/gallery/util/WallpaperUtils;
.super Ljava/lang/Object;
.source "WallpaperUtils.java"


# static fields
.field private static sWallpagerPackage:Ljava/lang/String;


# direct methods
.method private static resolve(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance p1, Landroid/content/ComponentName;

    invoke-direct {p1, p2, p3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->resolveActivityInfo(Landroid/content/pm/PackageManager;I)Landroid/content/pm/ActivityInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    return-object v0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static setWallPapers(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)V
    .locals 3

    invoke-static {p0}, Lcom/miui/gallery/util/WallpaperUtils;->supported(Landroid/content/Context;)Z

    move-result p2

    if-nez p2, :cond_0

    const-string p0, "WallpaperUtils"

    const-string p1, "set wallpaper not supported"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    sget-object p2, Lcom/miui/gallery/util/WallpaperUtils;->sWallpagerPackage:Ljava/lang/String;

    const-string v0, "com.android.thememanager"

    if-ne p2, v0, :cond_1

    new-instance p2, Landroid/content/Intent;

    const-string v0, "miui.intent.action.START_WALLPAPER_DETAIL"

    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v0, Landroid/content/ComponentName;

    const-string v1, "com.android.thememanager"

    const-string v2, "com.android.thememanager.activity.WallpaperDetailActivity"

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const-string v0, "Wallpaper_uri"

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, ":miui:starting_window_label"

    const-string v0, ""

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    :cond_1
    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.intent.action.ATTACH_DATA"

    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v0, Landroid/content/ComponentName;

    const-string v1, "com.miui.home"

    const-string v2, "com.miui.home.launcher.setting.WallpaperPreviewActivity"

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const-string v0, "Wallpaper_uri"

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :goto_0
    invoke-virtual {p0, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static supported(Landroid/content/Context;)Z
    .locals 4

    sget-object v0, Lcom/miui/gallery/util/WallpaperUtils;->sWallpagerPackage:Ljava/lang/String;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    sget-object p0, Lcom/miui/gallery/util/WallpaperUtils;->sWallpagerPackage:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    xor-int/2addr p0, v1

    return p0

    :cond_0
    const-string v0, "miui.intent.action.START_WALLPAPER_DETAIL"

    const-string v2, "com.android.thememanager"

    const-string v3, "com.android.thememanager.activity.WallpaperDetailActivity"

    invoke-static {p0, v0, v2, v3}, Lcom/miui/gallery/util/WallpaperUtils;->resolve(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v0, "miui.permission.USE_INTERNAL_GENERAL_API"

    invoke-static {p0, v0}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    const-string p0, "com.android.thememanager"

    sput-object p0, Lcom/miui/gallery/util/WallpaperUtils;->sWallpagerPackage:Ljava/lang/String;

    return v1

    :cond_1
    const-string v0, "android.intent.action.ATTACH_DATA"

    const-string v2, "com.miui.home"

    const-string v3, "com.miui.home.launcher.setting.WallpaperPreviewActivity"

    invoke-static {p0, v0, v2, v3}, Lcom/miui/gallery/util/WallpaperUtils;->resolve(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    if-eqz p0, :cond_2

    const-string p0, "com.miui.home"

    sput-object p0, Lcom/miui/gallery/util/WallpaperUtils;->sWallpagerPackage:Ljava/lang/String;

    return v1

    :cond_2
    const-string p0, ""

    sput-object p0, Lcom/miui/gallery/util/WallpaperUtils;->sWallpagerPackage:Ljava/lang/String;

    const/4 p0, 0x0

    return p0
.end method
