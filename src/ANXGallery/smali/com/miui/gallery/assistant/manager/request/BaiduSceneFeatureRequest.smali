.class public Lcom/miui/gallery/assistant/manager/request/BaiduSceneFeatureRequest;
.super Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;
.source "BaiduSceneFeatureRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest<",
        "Landroid/graphics/Bitmap;",
        "Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;",
        "Lcom/miui/gallery/assistant/manager/result/BaiduSceneFeatureResult;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic process(Ljava/lang/Object;)Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/manager/request/BaiduSceneFeatureRequest;->process(Landroid/graphics/Bitmap;)Lcom/miui/gallery/assistant/manager/result/BaiduSceneFeatureResult;

    move-result-object p1

    return-object p1
.end method

.method protected process(Landroid/graphics/Bitmap;)Lcom/miui/gallery/assistant/manager/result/BaiduSceneFeatureResult;
    .locals 4

    if-eqz p1, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/request/BaiduSceneFeatureRequest;->mRequestParams:Lcom/miui/gallery/assistant/manager/request/param/RequestParams;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v0

    const-wide/16 v1, 0x3ed

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/assistant/library/LibraryManager;->loadLibrary(J)Z

    move-result v0

    if-eqz v0, :cond_2

    const/16 v0, 0x10

    invoke-static {v0}, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->getAlgorithmByFlag(I)Lcom/miui/gallery/assistant/algorithm/Algorithm;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/assistant/algorithm/BaiduSceneFilterAlgorithm;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/assistant/algorithm/BaiduSceneFilterAlgorithm;->predict(Landroid/graphics/Bitmap;)Lcom/baidu/vis/ClassIfication/Response;

    move-result-object p1

    if-eqz p1, :cond_1

    new-instance v0, Lcom/miui/gallery/assistant/manager/result/BaiduSceneFeatureResult;

    new-instance v1, Lcom/miui/gallery/assistant/jni/filter/BaiduSceneResult;

    iget v2, p1, Lcom/baidu/vis/ClassIfication/Response;->classNum:I

    iget-object p1, p1, Lcom/baidu/vis/ClassIfication/Response;->classProb:[F

    invoke-direct {v1, v2, p1}, Lcom/miui/gallery/assistant/jni/filter/BaiduSceneResult;-><init>(I[F)V

    iget-wide v2, p0, Lcom/miui/gallery/assistant/manager/request/BaiduSceneFeatureRequest;->mImageId:J

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/assistant/manager/result/BaiduSceneFeatureResult;-><init>(Lcom/miui/gallery/assistant/jni/filter/BaiduSceneResult;J)V

    return-object v0

    :cond_1
    new-instance p1, Lcom/miui/gallery/assistant/manager/result/BaiduSceneFeatureResult;

    const/4 v0, 0x1

    iget-wide v1, p0, Lcom/miui/gallery/assistant/manager/request/BaiduSceneFeatureRequest;->mImageId:J

    invoke-direct {p1, v0, v1, v2}, Lcom/miui/gallery/assistant/manager/result/BaiduSceneFeatureResult;-><init>(IJ)V

    return-object p1

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/assistant/manager/request/BaiduSceneFeatureRequest;->TAG:Ljava/lang/String;

    const-string v0, "Load library %s failed"

    const-string v1, "BaiduSceneFilterAlgorithm"

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p1, Lcom/miui/gallery/assistant/manager/result/BaiduSceneFeatureResult;

    const/4 v0, 0x2

    iget-wide v1, p0, Lcom/miui/gallery/assistant/manager/request/BaiduSceneFeatureRequest;->mImageId:J

    invoke-direct {p1, v0, v1, v2}, Lcom/miui/gallery/assistant/manager/result/BaiduSceneFeatureResult;-><init>(IJ)V

    return-object p1

    :cond_3
    :goto_0
    new-instance p1, Lcom/miui/gallery/assistant/manager/result/BaiduSceneFeatureResult;

    const/4 v0, 0x3

    iget-wide v1, p0, Lcom/miui/gallery/assistant/manager/request/BaiduSceneFeatureRequest;->mImageId:J

    invoke-direct {p1, v0, v1, v2}, Lcom/miui/gallery/assistant/manager/result/BaiduSceneFeatureResult;-><init>(IJ)V

    return-object p1
.end method
