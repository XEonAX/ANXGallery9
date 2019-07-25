.class public Lcom/miui/gallery/Config$TileConfig;
.super Ljava/lang/Object;
.source "Config.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/Config;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TileConfig"
.end annotation


# static fields
.field private static sCacheCount:I = 0xc


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static getBitmapConfig()Landroid/graphics/Bitmap$Config;
    .locals 1

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    return-object v0
.end method

.method public static getMaxCacheCount()I
    .locals 1

    sget v0, Lcom/miui/gallery/Config$TileConfig;->sCacheCount:I

    return v0
.end method

.method public static needUseTile(II)Z
    .locals 1

    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    move-result p0

    int-to-float p0, p0

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getScreenWidth()I

    move-result p1

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getScreenHeight()I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    int-to-float p1, p1

    const/high16 v0, 0x3f800000    # 1.0f

    mul-float p1, p1, v0

    cmpl-float p0, p0, p1

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
