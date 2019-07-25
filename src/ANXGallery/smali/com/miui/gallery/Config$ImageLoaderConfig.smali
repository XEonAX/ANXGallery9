.class public Lcom/miui/gallery/Config$ImageLoaderConfig;
.super Ljava/lang/Object;
.source "Config.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/Config;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImageLoaderConfig"
.end annotation


# direct methods
.method public static getConfig(Landroid/content/Context;)Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;
    .locals 4

    new-instance v0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->getDiskCacheDir()Ljava/io/File;

    move-result-object v1

    const/16 v2, 0x3a98

    const/high16 v3, 0x60000000

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;-><init>(Ljava/io/File;II)V

    sget-boolean v1, Lcom/miui/os/Rom;->IS_ALPHA:Z

    if-nez v1, :cond_1

    sget-boolean v1, Lcom/miui/os/Rom;->IS_DEV:Z

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    new-instance v2, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    invoke-direct {v2, p0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->thumbnailCache(Lcom/nostra13/universalimageloader/cache/disc/DiskCache;)Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    move-result-object p0

    const/high16 v0, 0x1e00000

    invoke-virtual {p0, v0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->diskCacheSize(I)Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    move-result-object p0

    new-instance v0, Lcom/nostra13/universalimageloader/cache/memory/impl/LRULimitedMemoryCache;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v2

    iget v2, v2, Lcom/miui/gallery/Config$ThumbConfig;->sImageMemoryCache:I

    invoke-direct {v0, v2}, Lcom/nostra13/universalimageloader/cache/memory/impl/LRULimitedMemoryCache;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->memoryCache(Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;)Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    move-result-object p0

    new-instance v0, Lcom/nostra13/universalimageloader/cache/memory/impl/FIFOLimitedMemoryCache;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v2

    iget v2, v2, Lcom/miui/gallery/Config$ThumbConfig;->sImagePreloadMemoryCache:I

    invoke-direct {v0, v2}, Lcom/nostra13/universalimageloader/cache/memory/impl/FIFOLimitedMemoryCache;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->subMemoryCache(Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;)Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    move-result-object p0

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->threadPoolSize(I)Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->threadPriority(I)Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    move-result-object p0

    sget-object v0, Lcom/nostra13/universalimageloader/core/assist/QueueProcessingType;->FIFO:Lcom/nostra13/universalimageloader/core/assist/QueueProcessingType;

    invoke-virtual {p0, v0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->tasksProcessingOrder(Lcom/nostra13/universalimageloader/core/assist/QueueProcessingType;)Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    move-result-object p0

    new-instance v0, Lcom/miui/gallery/util/uil/ImageDecoderSupportRegion;

    invoke-direct {v0, v1}, Lcom/miui/gallery/util/uil/ImageDecoderSupportRegion;-><init>(Z)V

    invoke-virtual {p0, v0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->imageDecoder(Lcom/nostra13/universalimageloader/core/decode/ImageDecoder;)Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    move-result-object p0

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->writeDebugLogs()Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    :cond_2
    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->build()Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;

    move-result-object p0

    return-object p0
.end method
