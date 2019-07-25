.class public Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;
.super Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;
.source "BatchImageAlgorithmRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest<",
        "Landroid/graphics/Bitmap;",
        "Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;",
        "Lcom/miui/gallery/assistant/manager/result/BatchAlgorithmResult;",
        ">;"
    }
.end annotation


# instance fields
.field private final mAlgorithmFlags:I

.field private mBitmap:Landroid/graphics/Bitmap;

.field private mHeight:I

.field private mPixs:[B

.field private mWidth:I


# direct methods
.method public constructor <init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;)V

    iput p3, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mAlgorithmFlags:I

    return-void
.end method

.method private declared-synchronized getBgrPixs()[B
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mPixs:[B

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mBitmap:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/miui/gallery/util/assistant/ImageUtil;->getPixelsBGR(Landroid/graphics/Bitmap;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mPixs:[B

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mPixs:[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private processSingleRequest(I)Lcom/miui/gallery/assistant/manager/result/ImageFeatureResult;
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    check-cast v0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->getMediaFeatureItem()Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance p1, Lcom/miui/gallery/assistant/manager/request/QualityFeatureRequest;

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->getPriority()Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBgrRequestParams;

    iget-object v3, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    check-cast v3, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    invoke-virtual {v3}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->isShouldDownloadIfNotExist()Z

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    check-cast v4, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    invoke-virtual {v4}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->isAllowedOverMetered()Z

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    check-cast v5, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    invoke-virtual {v5}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v5

    invoke-direct {v2, v0, v3, v4, v5}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBgrRequestParams;-><init>(Lcom/miui/gallery/assistant/model/MediaFeatureItem;ZZLcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-direct {p1, v1, v2}, Lcom/miui/gallery/assistant/manager/request/QualityFeatureRequest;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBgrRequestParams;)V

    new-instance v0, Lcom/miui/gallery/assistant/manager/request/param/BgrParams;

    invoke-direct {p0}, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->getBgrPixs()[B

    move-result-object v1

    iget v2, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mWidth:I

    iget v3, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mHeight:I

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/assistant/manager/request/param/BgrParams;-><init>([BII)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/assistant/manager/request/QualityFeatureRequest;->process(Lcom/miui/gallery/assistant/manager/request/param/BgrParams;)Lcom/miui/gallery/assistant/manager/result/QualityFeatureResult;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 v1, 0x2

    invoke-static {p1, v1}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance p1, Lcom/miui/gallery/assistant/manager/request/SceneFeatureRequest;

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->getPriority()Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBgrRequestParams;

    iget-object v3, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    check-cast v3, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    invoke-virtual {v3}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->isShouldDownloadIfNotExist()Z

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    check-cast v4, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    invoke-virtual {v4}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->isAllowedOverMetered()Z

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    check-cast v5, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    invoke-virtual {v5}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v5

    invoke-direct {v2, v0, v3, v4, v5}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBgrRequestParams;-><init>(Lcom/miui/gallery/assistant/model/MediaFeatureItem;ZZLcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-direct {p1, v1, v2}, Lcom/miui/gallery/assistant/manager/request/SceneFeatureRequest;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBgrRequestParams;)V

    new-instance v0, Lcom/miui/gallery/assistant/manager/request/param/BgrParams;

    invoke-direct {p0}, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->getBgrPixs()[B

    move-result-object v1

    iget v2, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mWidth:I

    iget v3, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mHeight:I

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/assistant/manager/request/param/BgrParams;-><init>([BII)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/assistant/manager/request/SceneFeatureRequest;->process(Lcom/miui/gallery/assistant/manager/request/param/BgrParams;)Lcom/miui/gallery/assistant/manager/result/SceneFeatureResult;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 v1, 0x4

    invoke-static {p1, v1}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance p1, Lcom/miui/gallery/assistant/manager/request/ClusterFeatureRequest;

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->getPriority()Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBgrRequestParams;

    iget-object v3, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    check-cast v3, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    invoke-virtual {v3}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->isShouldDownloadIfNotExist()Z

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    check-cast v4, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    invoke-virtual {v4}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->isAllowedOverMetered()Z

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    check-cast v5, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    invoke-virtual {v5}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v5

    invoke-direct {v2, v0, v3, v4, v5}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBgrRequestParams;-><init>(Lcom/miui/gallery/assistant/model/MediaFeatureItem;ZZLcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-direct {p1, v1, v2}, Lcom/miui/gallery/assistant/manager/request/ClusterFeatureRequest;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBgrRequestParams;)V

    new-instance v0, Lcom/miui/gallery/assistant/manager/request/param/BgrParams;

    invoke-direct {p0}, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->getBgrPixs()[B

    move-result-object v1

    iget v2, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mWidth:I

    iget v3, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mHeight:I

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/assistant/manager/request/param/BgrParams;-><init>([BII)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/assistant/manager/request/ClusterFeatureRequest;->process(Lcom/miui/gallery/assistant/manager/request/param/BgrParams;)Lcom/miui/gallery/assistant/manager/result/ClusterFeatureResult;

    move-result-object p1

    return-object p1

    :cond_2
    const/16 v1, 0x10

    invoke-static {p1, v1}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result p1

    if-eqz p1, :cond_3

    new-instance p1, Lcom/miui/gallery/assistant/manager/request/BaiduSceneFeatureRequest;

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->getPriority()Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    iget-object v3, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    check-cast v3, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    invoke-virtual {v3}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->isShouldDownloadIfNotExist()Z

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    check-cast v4, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    invoke-virtual {v4}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->isAllowedOverMetered()Z

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    check-cast v5, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    invoke-virtual {v5}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v5

    invoke-direct {v2, v0, v3, v4, v5}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;-><init>(Lcom/miui/gallery/assistant/model/MediaFeatureItem;ZZLcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-direct {p1, v1, v2}, Lcom/miui/gallery/assistant/manager/request/BaiduSceneFeatureRequest;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;)V

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/assistant/manager/request/BaiduSceneFeatureRequest;->process(Landroid/graphics/Bitmap;)Lcom/miui/gallery/assistant/manager/result/BaiduSceneFeatureResult;

    move-result-object p1

    return-object p1

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method protected bridge synthetic process(Ljava/lang/Object;)Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->process(Landroid/graphics/Bitmap;)Lcom/miui/gallery/assistant/manager/result/BatchAlgorithmResult;

    move-result-object p1

    return-object p1
.end method

.method protected process(Landroid/graphics/Bitmap;)Lcom/miui/gallery/assistant/manager/result/BatchAlgorithmResult;
    .locals 10

    iput-object p1, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mBitmap:Landroid/graphics/Bitmap;

    iget-object p1, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mBitmap:Landroid/graphics/Bitmap;

    if-nez p1, :cond_0

    new-instance p1, Lcom/miui/gallery/assistant/manager/result/BatchAlgorithmResult;

    const/4 v0, 0x3

    iget-wide v1, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mImageId:J

    invoke-direct {p1, v0, v1, v2}, Lcom/miui/gallery/assistant/manager/result/BatchAlgorithmResult;-><init>(IJ)V

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mWidth:I

    iget-object p1, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mHeight:I

    new-instance p1, Lcom/miui/gallery/assistant/manager/result/BatchAlgorithmResult;

    iget-wide v0, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mImageId:J

    const/4 v2, 0x0

    invoke-direct {p1, v2, v0, v1}, Lcom/miui/gallery/assistant/manager/result/BatchAlgorithmResult;-><init>(IJ)V

    sget-object v0, Lcom/miui/gallery/assistant/algorithm/Algorithm;->FLAG_FEATURE_ALL_ARRAY:[I

    array-length v1, v0

    :goto_0
    if-ge v2, v1, :cond_2

    aget v3, v0, v2

    iget v4, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mAlgorithmFlags:I

    invoke-static {v4, v3}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {p0, v3}, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->processSingleRequest(I)Lcom/miui/gallery/assistant/manager/result/ImageFeatureResult;

    move-result-object v6

    invoke-virtual {p1, v3, v6}, Lcom/miui/gallery/assistant/manager/result/BatchAlgorithmResult;->add(ILcom/miui/gallery/assistant/manager/result/ImageFeatureResult;)V

    iget-object v6, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->TAG:Ljava/lang/String;

    const-string v7, "Flag %d AlgorithmRequest process using time %d ms"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v4

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v6, v7, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->getInstance()Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->recycleBitmap(Landroid/graphics/Bitmap;)V

    return-object p1
.end method
