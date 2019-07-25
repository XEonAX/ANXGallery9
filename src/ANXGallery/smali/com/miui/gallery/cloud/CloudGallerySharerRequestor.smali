.class public Lcom/miui/gallery/cloud/CloudGallerySharerRequestor;
.super Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;
.source "CloudGallerySharerRequestor.java"


# direct methods
.method public constructor <init>(Landroid/accounts/Account;Lcom/miui/gallery/cloud/CloudUrlProvider;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;-><init>(Landroid/accounts/Account;Lcom/miui/gallery/cloud/CloudUrlProvider;)V

    return-void
.end method


# virtual methods
.method protected connectSubUbi(Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 5

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "ubiServerId"

    iget-object v2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    check-cast v2, Lcom/miui/gallery/data/DBShareImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBShareImage;->getShareId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_SUB_UBIFOCUS_URI:Landroid/net/Uri;

    const-string v2, "ubiLocalId = ? "

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    iget-object p1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p1

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v1, v0, v2, v3}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method protected getAlbumId(Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;
    .locals 3

    iget-object v0, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getGroupId()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/cloud/CloudTableUtils;->isSystemAlbum(J)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/cloud/CloudUtils;->getShareAlbumIdByLocalId(Landroid/content/Context;Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 p1, 0x0

    return-object p1

    :cond_1
    iget-object p1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/data/DBImage;->setRequestAlbumId(Ljava/lang/String;)V

    return-object v0
.end method

.method protected getCommitUploadParams(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/CommitParameter;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            "Lcom/xiaomi/opensdk/file/model/CommitParameter;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getCommitUploadParams(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/CommitParameter;)Ljava/util/Map;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :cond_0
    iget-object v1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->isSubUbiFocus()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string p2, "sharedGalleryId"

    iget-object p1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getUbiServerId()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    const-string p1, "sharedGalleryId"

    invoke-virtual {p2}, Lcom/xiaomi/opensdk/file/model/CommitParameter;->getUploadId()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-object v0
.end method

.method protected bridge synthetic getCommitUploadParams(Ljava/lang/Object;Lcom/xiaomi/opensdk/file/model/CommitParameter;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    check-cast p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/cloud/CloudGallerySharerRequestor;->getCommitUploadParams(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/CommitParameter;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method protected getItemByRequestId(Ljava/lang/String;Lcom/miui/gallery/cloud/RequestCloudItem;)Lcom/miui/gallery/data/DBImage;
    .locals 2

    iget-object p2, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object p2

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "shareId"

    invoke-static {p2, v0, v1, p1}, Lcom/miui/gallery/cloud/CloudUtils;->getItem(Landroid/net/Uri;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object p1

    return-object p1
.end method

.method protected getRequestDownloadParams(Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-super {p0, p1}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getRequestDownloadParams(Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/util/Map;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :cond_0
    const-string v1, "sharedGalleryId"

    iget-object p1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getRequestId()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method protected bridge synthetic getRequestDownloadParams(Ljava/lang/Object;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    check-cast p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/CloudGallerySharerRequestor;->getRequestDownloadParams(Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method protected getRequestUploadParams(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            "Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getRequestUploadParams(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;)Ljava/util/Map;

    move-result-object p2

    if-nez p2, :cond_0

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    :cond_0
    iget-object v0, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isSubUbiFocus()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "sharedGalleryId"

    iget-object p1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getUbiServerId()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    const-string v0, "sharedAlbumId"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/CloudGallerySharerRequestor;->getAlbumId(Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-object p2
.end method

.method protected bridge synthetic getRequestUploadParams(Ljava/lang/Object;Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    check-cast p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/cloud/CloudGallerySharerRequestor;->getRequestUploadParams(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method protected getSpaceFullListener()Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/SpaceFullHandler;->getSharerSpaceFullListener()Lcom/miui/gallery/cloud/SpaceFullHandler$SharerSpaceFullListener;

    move-result-object v0

    return-object v0
.end method

.method protected parseRequestId(Lorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "shareId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/data/DBImage;->setShareId(Ljava/lang/String;)V

    return-object p1
.end method

.method protected putAlbumIdInValues(Lcom/miui/gallery/cloud/RequestCloudItem;Lorg/json/JSONObject;Landroid/content/ContentValues;)V
    .locals 0

    iget-object p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getShareAlbumId()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    const-string p2, "albumId"

    iget-object p1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getShareAlbumId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
