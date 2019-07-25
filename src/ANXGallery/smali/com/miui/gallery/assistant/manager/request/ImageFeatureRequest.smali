.class public abstract Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;
.super Lcom/miui/gallery/assistant/manager/AlgorithmRequest;
.source "ImageFeatureRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Ljava/lang/Object;",
        "P:",
        "Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams<",
        "TI;>;R:",
        "Lcom/miui/gallery/assistant/manager/result/ImageFeatureResult;",
        ">",
        "Lcom/miui/gallery/assistant/manager/AlgorithmRequest<",
        "TI;TP;TR;>;"
    }
.end annotation


# instance fields
.field protected mImageDateTime:J

.field protected mImageId:J

.field protected mSha1:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;",
            "TP;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/RequestParams;)V

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;->getMediaFeatureItem()Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;->getMediaFeatureItem()Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getMediaId()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;->mImageId:J

    invoke-virtual {p2}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;->getMediaFeatureItem()Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getSha1()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;->mSha1:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;->getMediaFeatureItem()Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getDateTime()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;->mImageDateTime:J

    :cond_0
    return-void
.end method


# virtual methods
.method protected bridge synthetic onSaveResult(Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/assistant/manager/result/ImageFeatureResult;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;->onSaveResult(Lcom/miui/gallery/assistant/manager/result/ImageFeatureResult;)V

    return-void
.end method

.method protected onSaveResult(Lcom/miui/gallery/assistant/manager/result/ImageFeatureResult;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;->mImageId:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;->mSha1:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;->updateFeatureToDb(Lcom/miui/gallery/assistant/manager/result/ImageFeatureResult;)Z

    :cond_0
    return-void
.end method

.method public updateFeatureToDb(Lcom/miui/gallery/assistant/manager/result/ImageFeatureResult;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)Z"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-string v1, "%s=%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "imageId"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-wide v5, p0, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;->mImageId:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-class v2, Lcom/miui/gallery/assistant/model/ImageFeature;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3}, Lcom/miui/gallery/dao/GalleryEntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/assistant/model/ImageFeature;

    invoke-virtual {p0, v1, p1}, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;->updateImageFeature(Lcom/miui/gallery/assistant/model/ImageFeature;Lcom/miui/gallery/assistant/manager/result/ImageFeatureResult;)V

    iget-object p1, p0, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;->TAG:Ljava/lang/String;

    const-string v2, "update image %d feature,flag:%d"

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/model/ImageFeature;->getImageId()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/model/ImageFeature;->getFeatureFlag()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {p1, v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/GalleryEntityManager;->update(Lcom/miui/gallery/dao/base/Entity;)Z

    move-result p1

    return p1

    :cond_0
    new-instance v7, Lcom/miui/gallery/assistant/model/ImageFeature;

    iget-wide v2, p0, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;->mImageId:J

    iget-object v4, p0, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;->mSha1:Ljava/lang/String;

    iget-wide v5, p0, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;->mImageDateTime:J

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/assistant/model/ImageFeature;-><init>(JLjava/lang/String;J)V

    invoke-virtual {p0, v7, p1}, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;->updateImageFeature(Lcom/miui/gallery/assistant/model/ImageFeature;Lcom/miui/gallery/assistant/manager/result/ImageFeatureResult;)V

    iget-object p1, p0, Lcom/miui/gallery/assistant/manager/request/ImageFeatureRequest;->TAG:Ljava/lang/String;

    const-string v1, "insert image %d feature,flag:%d"

    invoke-virtual {v7}, Lcom/miui/gallery/assistant/model/ImageFeature;->getImageId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v7}, Lcom/miui/gallery/assistant/model/ImageFeature;->getFeatureFlag()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {p1, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v7}, Lcom/miui/gallery/dao/GalleryEntityManager;->insert(Lcom/miui/gallery/dao/base/Entity;)Z

    move-result p1

    return p1
.end method

.method protected updateImageFeature(Lcom/miui/gallery/assistant/model/ImageFeature;Lcom/miui/gallery/assistant/manager/result/ImageFeatureResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/assistant/model/ImageFeature;",
            "TR;)V"
        }
    .end annotation

    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/miui/gallery/assistant/model/ImageFeature;->setVersion(I)V

    invoke-virtual {p2, p1}, Lcom/miui/gallery/assistant/manager/result/ImageFeatureResult;->updateImageFeature(Lcom/miui/gallery/assistant/model/ImageFeature;)V

    :cond_0
    return-void
.end method
