.class public Lcom/miui/gallery/BaseConfig$ScreenConfig;
.super Ljava/lang/Object;
.source "BaseConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/BaseConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ScreenConfig"
.end annotation


# static fields
.field private static sHeightPixels:I

.field private static sRealHeightPixels:I

.field private static sRealWidthPixels:I

.field private static sWidthPixels:I


# direct methods
.method public static getRealScreenHeight()I
    .locals 1

    sget v0, Lcom/miui/gallery/BaseConfig$ScreenConfig;->sRealHeightPixels:I

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->init()V

    :cond_0
    sget v0, Lcom/miui/gallery/BaseConfig$ScreenConfig;->sRealHeightPixels:I

    return v0
.end method

.method public static getRealScreenWidth()I
    .locals 1

    sget v0, Lcom/miui/gallery/BaseConfig$ScreenConfig;->sRealWidthPixels:I

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->init()V

    :cond_0
    sget v0, Lcom/miui/gallery/BaseConfig$ScreenConfig;->sRealWidthPixels:I

    return v0
.end method

.method public static getScreenHeight()I
    .locals 1

    sget v0, Lcom/miui/gallery/BaseConfig$ScreenConfig;->sHeightPixels:I

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->init()V

    :cond_0
    sget v0, Lcom/miui/gallery/BaseConfig$ScreenConfig;->sHeightPixels:I

    return v0
.end method

.method public static getScreenWidth()I
    .locals 1

    sget v0, Lcom/miui/gallery/BaseConfig$ScreenConfig;->sWidthPixels:I

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->init()V

    :cond_0
    sget v0, Lcom/miui/gallery/BaseConfig$ScreenConfig;->sWidthPixels:I

    return v0
.end method

.method private static init()V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    sput v2, Lcom/miui/gallery/BaseConfig$ScreenConfig;->sWidthPixels:I

    iget v2, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    sput v2, Lcom/miui/gallery/BaseConfig$ScreenConfig;->sHeightPixels:I

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    iget v0, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    sput v0, Lcom/miui/gallery/BaseConfig$ScreenConfig;->sRealWidthPixels:I

    iget v0, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    sput v0, Lcom/miui/gallery/BaseConfig$ScreenConfig;->sRealHeightPixels:I

    return-void
.end method
