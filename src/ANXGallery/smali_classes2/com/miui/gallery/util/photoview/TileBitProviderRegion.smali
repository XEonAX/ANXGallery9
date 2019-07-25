.class public Lcom/miui/gallery/util/photoview/TileBitProviderRegion;
.super Ljava/lang/Object;
.source "TileBitProviderRegion.java"

# interfaces
.implements Lcom/miui/gallery/util/photoview/TileBitProvider;


# instance fields
.field private mImageHeight:I

.field private mImageWidth:I

.field private mIsFlip:Z

.field private mLock:Ljava/lang/Object;

.field private mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

.field private mRotation:I


# direct methods
.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mLock:Ljava/lang/Object;

    const/4 v0, 0x0

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/util/BitmapUtils;->safeCreateBitmapRegionDecoder(Ljava/lang/String;Z[B)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-static {v1}, Lcom/miui/gallery/util/BitmapUtils;->isValidate(Landroid/graphics/BitmapRegionDecoder;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v1}, Landroid/graphics/BitmapRegionDecoder;->getWidth()I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mImageWidth:I

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v1}, Landroid/graphics/BitmapRegionDecoder;->getHeight()I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mImageHeight:I

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ExifUtil;->parseRotationInfo(Ljava/lang/String;[B)Lcom/miui/gallery/util/ExifUtil$ExifInfo;

    move-result-object p1

    if-nez p1, :cond_0

    iput v0, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mRotation:I

    iput-boolean v0, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mIsFlip:Z

    goto :goto_0

    :cond_0
    iget p2, p1, Lcom/miui/gallery/util/ExifUtil$ExifInfo;->rotation:I

    iput p2, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mRotation:I

    iget-boolean p1, p1, Lcom/miui/gallery/util/ExifUtil$ExifInfo;->flip:Z

    iput-boolean p1, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mIsFlip:Z

    :cond_1
    :goto_0
    const-string p1, "TileBitProviderRegion"

    const-string p2, "create"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getImageHeight()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mImageHeight:I

    return v0
.end method

.method public getImageWidth()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mImageWidth:I

    return v0
.end method

.method public getRotation()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mRotation:I

    return v0
.end method

.method public getTileBit(Landroid/graphics/Rect;I)Lcom/miui/gallery/util/photoview/TileBit;
    .locals 7

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    new-instance v1, Landroid/graphics/Rect;

    iget v2, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mImageWidth:I

    iget v3, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mImageHeight:I

    const/4 v4, 0x0

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v1, p1}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    move-result v2

    if-nez v2, :cond_1

    return-object v0

    :cond_1
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    invoke-static {}, Lcom/miui/gallery/Config$TileConfig;->getBitmapConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v3

    iput-object v3, v2, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    iput p2, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v3

    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v3

    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {}, Lcom/miui/gallery/util/photoview/TileReusedBitCache;->getInstance()Lcom/miui/gallery/util/photoview/TileReusedBitCache;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/miui/gallery/util/photoview/TileReusedBitCache;->get(Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, v2, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mLock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    iget-object v4, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-static {v4}, Lcom/miui/gallery/util/BitmapUtils;->isValidate(Landroid/graphics/BitmapRegionDecoder;)Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-static {v4, v1, v2}, Lcom/miui/gallery/util/BitmapUtils;->safeDecodeRegion(Landroid/graphics/BitmapRegionDecoder;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v4

    goto :goto_0

    :cond_2
    move-object v4, v0

    :goto_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v4, :cond_4

    iget-object v3, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mLock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_1
    iget-object v5, v2, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    invoke-static {v5}, Lcom/miui/gallery/util/BitmapUtils;->isValidate(Landroid/graphics/Bitmap;)Z

    move-result v5

    if-eqz v5, :cond_3

    const-string p1, "TileBitProviderRegion"

    const-string v4, "fail in decoding region use inBitmap [width %d, height %d]"

    iget-object v5, v2, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget-object v6, v2, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {p1, v4, v5, v6}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p1, v2, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    iput-object v0, v2, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    iget-object p1, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/util/BitmapUtils;->safeDecodeRegion(Landroid/graphics/BitmapRegionDecoder;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    move-object v4, p1

    goto :goto_1

    :cond_3
    const-string v2, "TileBitProviderRegion"

    const-string v5, "fail in decoding region %s"

    invoke-virtual {p1}, Landroid/graphics/Rect;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, v5, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_1
    monitor-exit v3

    goto :goto_2

    :catchall_0
    move-exception p1

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_4
    :goto_2
    invoke-static {v4}, Lcom/miui/gallery/util/BitmapUtils;->isValidate(Landroid/graphics/Bitmap;)Z

    move-result p1

    if-eqz p1, :cond_5

    new-instance p1, Lcom/miui/gallery/util/photoview/TileBit;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v0

    div-int/2addr v0, p2

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    div-int/2addr v1, p2

    invoke-direct {p1, v4, v0, v1}, Lcom/miui/gallery/util/photoview/TileBit;-><init>(Landroid/graphics/Bitmap;II)V

    return-object p1

    :cond_5
    return-object v0

    :catchall_1
    move-exception p1

    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1
.end method

.method public isFlip()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mIsFlip:Z

    return v0
.end method

.method public release()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-static {v1}, Lcom/miui/gallery/util/BitmapUtils;->isValidate(Landroid/graphics/BitmapRegionDecoder;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v1}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    const-string v1, "TileBitProviderRegion"

    const-string v2, "release"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
