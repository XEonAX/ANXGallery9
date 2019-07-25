.class public Lcom/miui/gallery/data/DecodeUtils;
.super Ljava/lang/Object;
.source "DecodeUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;
    }
.end annotation


# static fields
.field private static final GIF_CVT_JPEG_CACHE:Lcom/miui/gallery/data/GifCvtJpegCache;

.field public static final LOCK:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/data/DecodeUtils;->LOCK:Ljava/lang/Object;

    new-instance v0, Lcom/miui/gallery/data/GifCvtJpegCache;

    invoke-static {}, Lcom/miui/gallery/util/GalleryUtils;->getInternalCacheDir()Ljava/io/File;

    move-result-object v1

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/data/GifCvtJpegCache;-><init>(Ljava/io/File;I)V

    sput-object v0, Lcom/miui/gallery/data/DecodeUtils;->GIF_CVT_JPEG_CACHE:Lcom/miui/gallery/data/GifCvtJpegCache;

    return-void
.end method

.method public static considerOrientation(Landroid/graphics/Bitmap;Lcom/miui/gallery/util/ExifUtil$ExifInfo;)Landroid/graphics/Bitmap;
    .locals 9

    if-eqz p0, :cond_6

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    return-object p0

    :cond_1
    const/4 v0, 0x0

    new-instance v6, Landroid/graphics/Matrix;

    invoke-direct {v6}, Landroid/graphics/Matrix;-><init>()V

    iget-boolean v1, p1, Lcom/miui/gallery/util/ExifUtil$ExifInfo;->flip:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    const/high16 v0, -0x40800000    # -1.0f

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Matrix;->postScale(FF)Z

    const/4 v0, 0x1

    :cond_2
    iget v1, p1, Lcom/miui/gallery/util/ExifUtil$ExifInfo;->rotation:I

    if-eqz v1, :cond_3

    iget p1, p1, Lcom/miui/gallery/util/ExifUtil$ExifInfo;->rotation:I

    int-to-float p1, p1

    invoke-virtual {v6, p1}, Landroid/graphics/Matrix;->postRotate(F)Z

    const/4 v0, 0x1

    :cond_3
    if-eqz v0, :cond_5

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    const/4 v7, 0x1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v8

    move-object v1, p0

    invoke-static/range {v1 .. v8}, Lcom/miui/gallery/util/BitmapUtils;->safeCreateBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;ZLandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eq p1, p0, :cond_4

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    :cond_4
    return-object p1

    :cond_5
    return-object p0

    :cond_6
    :goto_0
    return-object p0
.end method

.method public static ensureGLCompatibleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 2

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    return-object v0

    :cond_1
    :goto_0
    return-object p0
.end method

.method public static requestDecodeThumbNail(Ljava/io/FileDescriptor;Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;Lcom/miui/gallery/util/BitmapUtils$BitmapDimension;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 2

    if-nez p1, :cond_0

    new-instance p1, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;

    invoke-direct {p1}, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;-><init>()V

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->inJustDecodeBounds:Z

    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/util/GalleryUtils;->safeDecodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;)Landroid/graphics/Bitmap;

    iget p0, p1, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->outWidth:I

    iget v0, p1, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->outHeight:I

    if-eqz p2, :cond_1

    iput p0, p2, Lcom/miui/gallery/util/BitmapUtils$BitmapDimension;->width:I

    iput v0, p2, Lcom/miui/gallery/util/BitmapUtils$BitmapDimension;->height:I

    :cond_1
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget v1, p2, Landroid/util/DisplayMetrics;->widthPixels:I

    iget p2, p2, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {p0, v0, v1, p2}, Lcom/miui/gallery/util/BitmapUtils;->computeThumbNailSampleSize(IIII)I

    move-result p0

    iput p0, p1, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->inSampleSize:I

    const/4 p0, 0x0

    iput-boolean p0, p1, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->inJustDecodeBounds:Z

    iput-boolean p0, p1, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->inPurgeable:Z

    iput-boolean p0, p1, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->inInputShareable:Z

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->needOptimizeForLowMemory()Z

    move-result p0

    if-eqz p0, :cond_2

    sget-object p0, Lcom/miui/gallery/data/DecodeUtils;->LOCK:Ljava/lang/Object;

    monitor-enter p0

    :try_start_0
    invoke-static {p1, v1, p2, p3}, Lcom/miui/gallery/data/DecodeUtils;->tryDecodeAndFit(Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;IILjava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p1

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_2
    invoke-static {p1, v1, p2, p3}, Lcom/miui/gallery/data/DecodeUtils;->tryDecodeAndFit(Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;IILjava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static requestDecodeThumbNail(Ljava/lang/String;Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;)Landroid/graphics/Bitmap;
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/data/DecodeUtils;->requestDecodeThumbNail(Ljava/lang/String;Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;Lcom/miui/gallery/util/BitmapUtils$BitmapDimension;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static requestDecodeThumbNail(Ljava/lang/String;Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;Lcom/miui/gallery/util/BitmapUtils$BitmapDimension;)Landroid/graphics/Bitmap;
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual {v1}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v2

    invoke-static {v2, p1, p2, p0}, Lcom/miui/gallery/data/DecodeUtils;->requestDecodeThumbNail(Ljava/io/FileDescriptor;Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;Lcom/miui/gallery/util/BitmapUtils$BitmapDimension;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-static {v1}, Lcom/miui/gallery/util/Utils;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_3

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    goto :goto_1

    :catchall_0
    move-exception p0

    move-object v1, v0

    goto :goto_4

    :catch_2
    move-exception p0

    move-object v1, v0

    :goto_0
    :try_start_2
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    :catch_3
    move-exception p0

    move-object v1, v0

    :goto_1
    invoke-virtual {p0}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :goto_2
    invoke-static {v1}, Lcom/miui/gallery/util/Utils;->closeSilently(Ljava/io/Closeable;)V

    move-object p0, v0

    :goto_3
    return-object p0

    :catchall_1
    move-exception p0

    :goto_4
    invoke-static {v1}, Lcom/miui/gallery/util/Utils;->closeSilently(Ljava/io/Closeable;)V

    throw p0
.end method

.method private static tryDecodeAndFit(Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;IILjava/lang/String;)Landroid/graphics/Bitmap;
    .locals 10

    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object v2, v0

    move-object v3, v2

    move-object v4, v3

    :goto_0
    const/4 v5, 0x3

    if-ge v1, v5, :cond_5

    if-nez v2, :cond_5

    if-eqz p3, :cond_0

    :try_start_0
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, p3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-virtual {v5}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_3

    :catchall_0
    move-exception p1

    move-object v3, v5

    goto/16 :goto_b

    :catch_0
    move-exception v3

    move-object v9, v5

    move-object v5, v2

    move-object v2, v3

    :goto_1
    move-object v3, v9

    goto/16 :goto_7

    :catch_1
    move-exception v3

    move-object v9, v5

    move-object v5, v2

    move-object v2, v3

    :goto_2
    move-object v3, v9

    goto/16 :goto_8

    :catchall_1
    move-exception p1

    goto/16 :goto_b

    :catch_2
    move-exception v5

    move-object v9, v5

    move-object v5, v2

    move-object v2, v9

    goto/16 :goto_7

    :catch_3
    move-exception v5

    move-object v9, v5

    move-object v5, v2

    move-object v2, v9

    goto/16 :goto_8

    :cond_0
    :try_start_2
    invoke-virtual {p0}, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->getFD()Landroid/os/ParcelFileDescriptor;

    move-result-object v5
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v5, :cond_1

    :try_start_3
    invoke-virtual {v5}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v4
    :try_end_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-object v9, v5

    move-object v5, v3

    move-object v3, v4

    move-object v4, v9

    goto :goto_3

    :catchall_2
    move-exception p1

    move-object v4, v5

    goto/16 :goto_b

    :catch_4
    move-exception v4

    move-object v9, v5

    move-object v5, v2

    move-object v2, v4

    move-object v4, v9

    goto/16 :goto_7

    :catch_5
    move-exception v4

    move-object v9, v5

    move-object v5, v2

    move-object v2, v4

    move-object v4, v9

    goto/16 :goto_8

    :cond_1
    move-object v4, v5

    move-object v5, v3

    move-object v3, v0

    :goto_3
    :try_start_4
    invoke-static {v3, v0, p0}, Lcom/miui/gallery/util/GalleryUtils;->safeDecodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;)Landroid/graphics/Bitmap;

    move-result-object v3
    :try_end_4
    .catch Ljava/lang/OutOfMemoryError; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-nez v3, :cond_2

    iget v2, p0, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->inSampleSize:I

    mul-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->inSampleSize:I

    invoke-static {v5}, Lcom/miui/gallery/util/GalleryUtils;->closeStream(Ljava/io/Closeable;)V

    invoke-static {v4}, Lcom/miui/gallery/util/Utils;->closeSilently(Landroid/os/ParcelFileDescriptor;)V

    move-object v2, v3

    :goto_4
    move-object v3, v5

    goto/16 :goto_a

    :cond_2
    :try_start_5
    invoke-static {v3}, Landroid/opengl/GLUtils;->getType(Landroid/graphics/Bitmap;)I
    :try_end_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_8
    .catch Ljava/lang/OutOfMemoryError; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_6
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-object v2, v3

    goto :goto_5

    :catch_6
    move-exception v2

    move-object v9, v5

    move-object v5, v3

    goto :goto_1

    :catch_7
    move-exception v2

    move-object v9, v5

    move-object v5, v3

    goto :goto_2

    :catch_8
    move-exception v2

    :try_start_6
    invoke-virtual {v2}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    const-string v6, "DecodeService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "decoded bitmap type error, IllegalArgumentException:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v3}, Lcom/miui/gallery/data/DecodeUtils;->ensureGLCompatibleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v2
    :try_end_6
    .catch Ljava/lang/OutOfMemoryError; {:try_start_6 .. :try_end_6} :catch_7
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    if-nez v2, :cond_3

    goto :goto_6

    :cond_3
    :goto_5
    :try_start_7
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-static {v3, v6, p1, p2}, Lcom/miui/gallery/util/BitmapUtils;->isBitmapInScreen(IIII)Z

    move-result v3

    if-nez v3, :cond_4

    const/4 v3, 0x1

    invoke-static {v2, p1, p2, v3}, Lcom/miui/gallery/util/BitmapUtils;->fitBitmapToScreen(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v3
    :try_end_7
    .catch Ljava/lang/OutOfMemoryError; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-object v2, v3

    :cond_4
    :goto_6
    iget v3, p0, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->inSampleSize:I

    mul-int/lit8 v3, v3, 0x2

    iput v3, p0, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->inSampleSize:I

    invoke-static {v5}, Lcom/miui/gallery/util/GalleryUtils;->closeStream(Ljava/io/Closeable;)V

    invoke-static {v4}, Lcom/miui/gallery/util/Utils;->closeSilently(Landroid/os/ParcelFileDescriptor;)V

    goto :goto_4

    :goto_7
    :try_start_8
    const-string v6, "DecodeService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "unkown exception in decode and fit:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9

    :goto_8
    const-string v6, "DecodeService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Decode and fit is out of memory: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :goto_9
    iget v2, p0, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->inSampleSize:I

    mul-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->inSampleSize:I

    invoke-static {v3}, Lcom/miui/gallery/util/GalleryUtils;->closeStream(Ljava/io/Closeable;)V

    invoke-static {v4}, Lcom/miui/gallery/util/Utils;->closeSilently(Landroid/os/ParcelFileDescriptor;)V

    move-object v2, v5

    :goto_a
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :goto_b
    iget p2, p0, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->inSampleSize:I

    mul-int/lit8 p2, p2, 0x2

    iput p2, p0, Lcom/miui/gallery/data/DecodeUtils$GalleryOptions;->inSampleSize:I

    invoke-static {v3}, Lcom/miui/gallery/util/GalleryUtils;->closeStream(Ljava/io/Closeable;)V

    invoke-static {v4}, Lcom/miui/gallery/util/Utils;->closeSilently(Landroid/os/ParcelFileDescriptor;)V

    throw p1

    :cond_5
    invoke-static {p3, v0}, Lcom/miui/gallery/util/ExifUtil;->parseRotationInfo(Ljava/lang/String;[B)Lcom/miui/gallery/util/ExifUtil$ExifInfo;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/miui/gallery/data/DecodeUtils;->considerOrientation(Landroid/graphics/Bitmap;Lcom/miui/gallery/util/ExifUtil$ExifInfo;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method
