.class public Lcom/miui/gallery/Config$ThumbConfig;
.super Ljava/lang/Object;
.source "Config.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/Config;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ThumbConfig"
.end annotation


# static fields
.field public static final THUMBNAIL_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private static sInstance:Lcom/miui/gallery/Config$ThumbConfig;

.field private static final sUseHighQuality:Z


# instance fields
.field public final MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field public final sAlbumHeaderThumbTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

.field public final sImageMemoryCache:I

.field public final sImagePreloadMemoryCache:I

.field public final sMicroHorizontalDocumentTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

.field public final sMicroPanoColumns:I

.field public final sMicroPanoTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

.field public final sMicroRecentTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

.field public final sMicroScreenshotTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

.field public final sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

.field public final sMicroThumbColumnsLand:I

.field public final sMicroThumbColumnsPortrait:I

.field public final sMicroThumbHorizontalDocumentColumns:I

.field public final sMicroThumbRecentColumnsLand:I

.field public final sMicroThumbRecentColumnsPortrait:I

.field public final sMicroThumbScreenshotColumnsLand:I

.field public final sMicroThumbScreenshotColumnsPortrait:I

.field public final sPreloadNum:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const-string v0, "cepheus"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    const/4 v4, 0x1

    if-ge v2, v1, :cond_1

    aget-object v5, v0, v2

    sget-object v6, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v3, 0x1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sput-boolean v3, Lcom/miui/gallery/Config$ThumbConfig;->sUseHighQuality:Z

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-virtual {v0, v4}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadFromThumbnailCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheThumbnail(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadOriginScaleThumbnail(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/Config$ThumbConfig;->THUMBNAIL_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method private constructor <init>()V
    .locals 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    iput v0, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbHorizontalDocumentColumns:I

    const/4 v1, 0x1

    iput v1, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroPanoColumns:I

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0602a8

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getScreenWidth()I

    move-result v4

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getScreenHeight()I

    move-result v5

    const v6, 0x7f0a005c

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v6

    iput v6, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsPortrait:I

    const v6, 0x7f0a005d

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v6

    iput v6, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsLand:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v6

    iget v7, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsPortrait:I

    sub-int/2addr v7, v1

    mul-int v3, v3, v7

    sub-int/2addr v6, v3

    iget v3, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsPortrait:I

    iget v7, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsLand:I

    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    move-result v3

    div-int/2addr v6, v3

    new-instance v3, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-direct {v3, v6, v6}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(II)V

    iput-object v3, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    new-instance v3, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-direct {v3, v6, v6}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(II)V

    iput-object v3, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroRecentTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    const v3, 0x7f0a0007

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v7

    div-int/2addr v7, v3

    new-instance v3, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    int-to-double v8, v7

    const-wide/high16 v10, 0x3ff8000000000000L    # 1.5

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v8, v10

    double-to-int v8, v8

    invoke-direct {v3, v7, v8}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(II)V

    iput-object v3, p0, Lcom/miui/gallery/Config$ThumbConfig;->sAlbumHeaderThumbTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    const v3, 0x7f0a005e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    iput v3, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbRecentColumnsPortrait:I

    const v3, 0x7f0a005f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    iput v3, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbRecentColumnsLand:I

    const v3, 0x7f0a0060

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    iput v3, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbScreenshotColumnsPortrait:I

    const v3, 0x7f0a0061

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    iput v3, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbScreenshotColumnsLand:I

    const v3, 0x7f0602a5

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    const v7, 0x7f0602a4

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    new-instance v8, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-direct {v8, v3, v7}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(II)V

    iput-object v8, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroScreenshotTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    const v3, 0x7f0602a3

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    const v7, 0x7f0602a2

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    new-instance v8, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-direct {v8, v3, v7}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(II)V

    iput-object v8, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroPanoTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    const v3, 0x7f0602a1

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isXiaoMi()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getScreenWidth()I

    move-result v3

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getScreenHeight()I

    move-result v7

    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    move-result v3

    div-int/2addr v3, v0

    const v0, 0x7f0a0017

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    mul-int v0, v0, v3

    const v7, 0x7f0a0018

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    div-int v7, v0, v2

    :cond_0
    new-instance v0, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-direct {v0, v3, v7}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(II)V

    iput-object v0, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroHorizontalDocumentTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->getThumbConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/BitmapUtils;->getConfigSize(Landroid/graphics/Bitmap$Config;)S

    move-result v0

    mul-int v4, v4, v5

    mul-int v4, v4, v0

    const/high16 v2, 0x500000

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/Config$ThumbConfig;->sImageMemoryCache:I

    const v2, 0x3f19999a    # 0.6f

    iget v3, p0, Lcom/miui/gallery/Config$ThumbConfig;->sImageMemoryCache:I

    int-to-float v3, v3

    mul-float v3, v3, v2

    float-to-int v2, v3

    iput v2, p0, Lcom/miui/gallery/Config$ThumbConfig;->sImagePreloadMemoryCache:I

    const v2, 0x3f4ccccd    # 0.8f

    iget v3, p0, Lcom/miui/gallery/Config$ThumbConfig;->sImagePreloadMemoryCache:I

    int-to-float v3, v3

    mul-float v3, v3, v2

    mul-int v2, v6, v6

    mul-int v2, v2, v0

    int-to-float v0, v2

    div-float/2addr v3, v0

    float-to-int v0, v3

    const/4 v2, 0x0

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/Config$ThumbConfig;->sPreloadNum:I

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    const v3, 0x7f07019d

    invoke-virtual {v0, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v6, v6, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    new-instance v4, Landroid/graphics/Canvas;

    invoke-direct {v4, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v2, v2, v6, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {v0, v4}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheThumbnail(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadFromMicroCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v2, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->getThumbConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-direct {v2, v4, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(Landroid/graphics/drawable/Drawable;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    new-instance v2, Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;

    invoke-direct {v2}, Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;-><init>()V

    invoke-virtual {v2, v1}, Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;->requestThumbnail(Z)Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/core/download/ExtraInfo$Builder;->build()Lcom/nostra13/universalimageloader/core/download/ExtraInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->extraForDownloader(Lcom/nostra13/universalimageloader/core/download/ExtraInfo;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/Config$ThumbConfig;->MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method public static appendBlurOptions(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 1

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-virtual {v0, p0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p0

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p0, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadFromThumbnailCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheThumbnail(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p0

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->getBlurRadius()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->blurRadius(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p0

    return-object p0
.end method

.method public static declared-synchronized get()Lcom/miui/gallery/Config$ThumbConfig;
    .locals 2

    const-class v0, Lcom/miui/gallery/Config$ThumbConfig;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/Config$ThumbConfig;->sInstance:Lcom/miui/gallery/Config$ThumbConfig;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/Config$ThumbConfig;

    invoke-direct {v1}, Lcom/miui/gallery/Config$ThumbConfig;-><init>()V

    sput-object v1, Lcom/miui/gallery/Config$ThumbConfig;->sInstance:Lcom/miui/gallery/Config$ThumbConfig;

    :cond_0
    sget-object v1, Lcom/miui/gallery/Config$ThumbConfig;->sInstance:Lcom/miui/gallery/Config$ThumbConfig;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private static getBlurRadius()I
    .locals 1

    const/4 v0, 0x3

    return v0
.end method

.method public static getDiskCacheDir()Ljava/io/File;
    .locals 2

    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getCacheDirectory()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getThumbConfig()Landroid/graphics/Bitmap$Config;
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/Config$ThumbConfig;->sUseHighQuality:Z

    if-eqz v0, :cond_0

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    goto :goto_0

    :cond_0
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    :goto_0
    return-object v0
.end method
