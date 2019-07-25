.class public Lcom/miui/gallery/cloud/EditCloudThumbnailInfo;
.super Lcom/miui/gallery/cloud/EditCloudBase;
.source "EditCloudThumbnailInfo.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/EditCloudBase;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected buildRequest(Landroid/accounts/Account;Lcom/miui/gallery/cloud/RequestCloudItem;)Lcom/miui/gallery/cloud/RequestOperationBase$Request;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    iget-object v1, p0, Lcom/miui/gallery/cloud/EditCloudThumbnailInfo;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getServerId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/miui/gallery/cloud/CloudUtils;->getItemByServerID(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/miui/gallery/cloud/CloudGroupUrlProvider;->getUrlProvider(Z)Lcom/miui/gallery/cloud/CloudGroupUrlProvider;

    move-result-object v2

    iget-object p1, p1, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getServerId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Lcom/miui/gallery/cloud/CloudGroupUrlProvider;->getEditGroupUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    move-object v2, v0

    check-cast v2, Lcom/miui/gallery/data/DBCloud;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBCloud;->getThumbnailInfo()Lcom/miui/gallery/cloud/ThumbnailInfo;

    move-result-object v2

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/miui/gallery/cloud/ThumbnailInfo;->getBgImageLocalId()J

    move-result-wide v3

    invoke-virtual {v2}, Lcom/miui/gallery/cloud/ThumbnailInfo;->getFaceId()Ljava/lang/String;

    move-result-object v2

    const-wide/16 v5, -0x1

    cmp-long v7, v3, v5

    if-eqz v7, :cond_1

    sget-object v5, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    iget-object v6, p0, Lcom/miui/gallery/cloud/EditCloudThumbnailInfo;->mContext:Landroid/content/Context;

    const-string v7, "_id"

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v6, v7, v3}, Lcom/miui/gallery/cloud/CloudUtils;->getItem(Landroid/net/Uri;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v3}, Lcom/miui/gallery/data/DBImage;->getServerId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "backgroundImageId"

    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/EditCloudThumbnailInfo;->getTag()Ljava/lang/String;

    move-result-object p1

    const-string p2, "bg image not synced!"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1

    :cond_1
    :goto_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "faceId"

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_2
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "content"

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    new-instance v2, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    invoke-direct {v2}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;-><init>()V

    invoke-virtual {v2, p1}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setUrl(Ljava/lang/String;)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    move-result-object p1

    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setMethod(I)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setPostData(Lorg/json/JSONObject;)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    move-result-object p1

    iget p2, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->otherRetryTimes:I

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setRetryTimes(I)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->setNeedReRequest(Z)Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/RequestOperationBase$Request$Builder;->build()Lcom/miui/gallery/cloud/RequestOperationBase$Request;

    move-result-object p1

    return-object p1
.end method

.method protected getColumnIndex()I
    .locals 1

    const/16 v0, 0x42

    return v0
.end method

.method protected updateDb(Landroid/content/ContentValues;Lcom/miui/gallery/data/DBImage;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    move-object v0, p2

    check-cast v0, Lcom/miui/gallery/data/DBCloud;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBCloud;->getThumbnailInfo()Lcom/miui/gallery/cloud/ThumbnailInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/ThumbnailInfo;->getBgImageLocalId()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    invoke-static {v0, v1}, Lcom/miui/gallery/cloud/CloudUtils;->deleteItemInHiddenAlbum(J)Z

    :cond_0
    const-string v0, "thumbnailInfo"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/cloud/EditCloudBase;->updateDb(Landroid/content/ContentValues;Lcom/miui/gallery/data/DBImage;)V

    return-void
.end method
