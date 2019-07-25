.class public Lcom/miui/gallery/cloud/CopyImageToOwnerAlbum;
.super Lcom/miui/gallery/cloud/CopyImageBase;
.source "CopyImageToOwnerAlbum.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/CopyImageBase;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected getAlbumId(Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/CopyImageToOwnerAlbum;->mContext:Landroid/content/Context;

    iget-object v1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getLocalGroupId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/cloud/CloudUtils;->getServerIdByLocalId(Landroid/content/Context;Ljava/lang/String;Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getAlbumIdTagName()Ljava/lang/String;
    .locals 1

    const-string v0, "toAlbumId"

    return-object v0
.end method

.method protected getBaseUri()Landroid/net/Uri;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    return-object v0
.end method

.method protected getSpaceFullListener()Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/SpaceFullHandler;->getOwnerSpaceFullListener()Lcom/miui/gallery/cloud/SpaceFullHandler$OwnerSpaceFullListener;

    move-result-object v0

    return-object v0
.end method

.method protected getUrl(Lcom/miui/gallery/cloud/CloudUrlProvider;Ljava/lang/String;Ljava/lang/String;ZLcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/CopyImageToOwnerAlbum;->mAlbumId:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/cloud/CloudTableUtils;->isSecretAlbum(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez p4, :cond_1

    iget-object p5, p5, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p5}, Lcom/miui/gallery/data/DBImage;->getLocalImageId()Ljava/lang/String;

    move-result-object p5

    invoke-static {p5}, Lcom/miui/gallery/cloud/CloudUtils;->getGroupIdByPhotoLocalId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_0
    invoke-static {p5, v1}, Lcom/miui/gallery/cloud/CloudTableUtils;->isSecretAlbum(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p5

    goto :goto_0

    :cond_1
    const/4 p5, 0x0

    :goto_0
    if-nez p4, :cond_5

    if-nez v0, :cond_2

    if-nez p5, :cond_2

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getCopyUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    if-eqz v0, :cond_3

    if-nez p5, :cond_3

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getHideCopyUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_3
    if-nez v0, :cond_4

    if-eqz p5, :cond_4

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getUnhideCopyUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_4
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/CopyImageToOwnerAlbum;->getTag()Ljava/lang/String;

    move-result-object p1

    const-string p2, "getUrl  only support one hide album now"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_5
    if-nez v0, :cond_6

    if-nez p5, :cond_6

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getCopyUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_6
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/CopyImageToOwnerAlbum;->getTag()Ljava/lang/String;

    move-result-object p1

    const-string p2, "getUrl  cannot support copy share image to hide album"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method protected handleSubUbiSchema(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/util/UbiFocusUtils;->handleSubUbiImage(Lorg/json/JSONObject;ZLjava/lang/String;)V

    return-void
.end method

.method protected isToShare()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
