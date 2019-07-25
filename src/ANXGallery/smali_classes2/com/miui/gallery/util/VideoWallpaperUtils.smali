.class public Lcom/miui/gallery/util/VideoWallpaperUtils;
.super Ljava/lang/Object;
.source "VideoWallpaperUtils.java"


# static fields
.field private static sSupported:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget-boolean v0, Lcom/miui/os/Rom;->IS_INTERNATIONAL:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/miui/os/Rom;->IS_MIUI:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isTablet()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isPad()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "com.android.thememanager"

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->getAppVersionCode(Ljava/lang/String;)I

    move-result v0

    const/16 v1, 0x1ea

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/miui/gallery/util/VideoWallpaperUtils;->sSupported:Z

    return-void
.end method

.method public static isSupported()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/util/VideoWallpaperUtils;->sSupported:Z

    return v0
.end method

.method public static setVideoWallpaper(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "miui.intent.action.START_VIDEO_DETAIL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.DEFAULT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "path"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "miref"

    const-string v1, "com.miui.gallery"

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    const-string p0, "video"

    const-string p1, "set_as_video_wallpaper"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "VideoWallpaperUtils"

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    const-string p0, "video"

    const-string p1, "set_slide_wallpaper_fail"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
