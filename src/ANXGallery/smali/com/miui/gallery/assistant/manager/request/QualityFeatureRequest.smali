.class public Lcom/miui/gallery/assistant/manager/request/QualityFeatureRequest;
.super Lcom/miui/gallery/assistant/manager/request/PixelImageFeatureRequest;
.source "QualityFeatureRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/assistant/manager/request/PixelImageFeatureRequest<",
        "Lcom/miui/gallery/assistant/manager/result/QualityFeatureResult;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBgrRequestParams;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/assistant/manager/request/PixelImageFeatureRequest;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBgrRequestParams;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic process(Ljava/lang/Object;)Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;
    .locals 0

    check-cast p1, Lcom/miui/gallery/assistant/manager/request/param/BgrParams;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/manager/request/QualityFeatureRequest;->process(Lcom/miui/gallery/assistant/manager/request/param/BgrParams;)Lcom/miui/gallery/assistant/manager/result/QualityFeatureResult;

    move-result-object p1

    return-object p1
.end method

.method protected process(Lcom/miui/gallery/assistant/manager/request/param/BgrParams;)Lcom/miui/gallery/assistant/manager/result/QualityFeatureResult;
    .locals 4

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/assistant/manager/request/QualityFeatureRequest;->TAG:Ljava/lang/String;

    const-string v0, "bgr params is null"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcom/miui/gallery/assistant/manager/result/QualityFeatureResult;

    const/4 v0, 0x3

    iget-wide v1, p0, Lcom/miui/gallery/assistant/manager/request/QualityFeatureRequest;->mImageId:J

    invoke-direct {p1, v0, v1, v2}, Lcom/miui/gallery/assistant/manager/result/QualityFeatureResult;-><init>(IJ)V

    return-object p1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v0

    const-wide/32 v1, 0xf4a11

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/assistant/library/LibraryManager;->loadLibrary(J)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->getAlgorithmByFlag(I)Lcom/miui/gallery/assistant/algorithm/Algorithm;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/assistant/algorithm/QualityScoreAlgorithm;

    iget-object v2, p1, Lcom/miui/gallery/assistant/manager/request/param/BgrParams;->pix:[B

    iget v3, p1, Lcom/miui/gallery/assistant/manager/request/param/BgrParams;->width:I

    iget p1, p1, Lcom/miui/gallery/assistant/manager/request/param/BgrParams;->height:I

    invoke-virtual {v1, v2, v3, p1}, Lcom/miui/gallery/assistant/algorithm/QualityScoreAlgorithm;->getBaseQualityScore([BII)Lcom/miui/gallery/assistant/jni/score/QualityScore;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/request/QualityFeatureRequest;->TAG:Ljava/lang/String;

    const-string v1, "QualityScoreAlgorithm execute success,result: %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lcom/miui/gallery/assistant/manager/result/QualityFeatureResult;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/manager/request/QualityFeatureRequest;->mImageId:J

    invoke-direct {v0, p1, v1, v2}, Lcom/miui/gallery/assistant/manager/result/QualityFeatureResult;-><init>(Lcom/miui/gallery/assistant/jni/score/QualityScore;J)V

    return-object v0

    :cond_1
    new-instance p1, Lcom/miui/gallery/assistant/manager/result/QualityFeatureResult;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/manager/request/QualityFeatureRequest;->mImageId:J

    invoke-direct {p1, v0, v1, v2}, Lcom/miui/gallery/assistant/manager/result/QualityFeatureResult;-><init>(IJ)V

    return-object p1

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/assistant/manager/request/QualityFeatureRequest;->TAG:Ljava/lang/String;

    const-string v0, "Load library %s failed"

    const-string v1, "QualityScoreAlgorithm"

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p1, Lcom/miui/gallery/assistant/manager/result/QualityFeatureResult;

    const/4 v0, 0x2

    iget-wide v1, p0, Lcom/miui/gallery/assistant/manager/request/QualityFeatureRequest;->mImageId:J

    invoke-direct {p1, v0, v1, v2}, Lcom/miui/gallery/assistant/manager/result/QualityFeatureResult;-><init>(IJ)V

    return-object p1
.end method
