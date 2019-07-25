.class public Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;
.super Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;
.source "ImageFeatureBitmapRequestParams.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/miui/gallery/assistant/model/MediaFeatureItem;Z)V
    .locals 2

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, v1, v0}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;-><init>(Lcom/miui/gallery/assistant/model/MediaFeatureItem;ZZLcom/miui/gallery/sdk/download/DownloadType;)V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/assistant/model/MediaFeatureItem;ZZLcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;-><init>(Lcom/miui/gallery/assistant/model/MediaFeatureItem;ZZLcom/miui/gallery/sdk/download/DownloadType;)V

    return-void
.end method


# virtual methods
.method public getAlgorithmRequestInputs()Landroid/graphics/Bitmap;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getImagePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->mShouldDownloadIfNotExist:Z

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    iget-object v1, p0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/process/BaseImageTask;->getImageFilePath(Lcom/miui/gallery/assistant/model/MediaFeatureItem;Lcom/miui/gallery/sdk/download/DownloadType;Z)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :cond_0
    invoke-static {v0}, Lcom/miui/gallery/util/assistant/ImageUtil;->getScaledBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic getAlgorithmRequestInputs()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;->getAlgorithmRequestInputs()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
