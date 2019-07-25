.class public abstract Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;
.super Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;
.source "CloudGalleryRequestorBase.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor<",
        "Lcom/miui/gallery/cloud/RequestCloudItem;",
        ">;"
    }
.end annotation


# instance fields
.field protected mAccount:Landroid/accounts/Account;

.field private final mUrlProvider:Lcom/miui/gallery/cloud/CloudUrlProvider;


# direct methods
.method public constructor <init>(Landroid/accounts/Account;Lcom/miui/gallery/cloud/CloudUrlProvider;)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->mAccount:Landroid/accounts/Account;

    iput-object p2, p0, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->mUrlProvider:Lcom/miui/gallery/cloud/CloudUrlProvider;

    return-void
.end method

.method private addExtraParameters(Ljava/util/Map;IZI)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;IZI)V"
        }
    .end annotation

    if-lez p2, :cond_0

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    const-string v0, "retry"

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    if-eqz p3, :cond_1

    invoke-static {p3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p2

    const-string p3, "needReRequest"

    invoke-interface {p1, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    if-ltz p4, :cond_2

    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    const-string p3, "ubiIndex"

    invoke-interface {p1, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    return-void
.end method

.method private addRetryParameters(Ljava/util/Map;IZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;IZ)V"
        }
    .end annotation

    const/4 v0, -0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->addExtraParameters(Ljava/util/Map;IZI)V

    return-void
.end method

.method private addUbiParam(Ljava/util/Map;Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ")V"
        }
    .end annotation

    iget-object v0, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isUbiFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "isUbiImage"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object v0, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isSubUbiFocus()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "ubiIndex"

    iget-object p2, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getSubUbiIndex()I

    move-result p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method

.method private encodeSecretFiles(Lcom/miui/gallery/data/DBImage;Landroid/content/ContentValues;)V
    .locals 1

    invoke-static {p2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->isSynced(Landroid/content/ContentValues;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1, p2}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->encryptFiles(Lcom/miui/gallery/data/DBImage;Landroid/content/ContentValues;)V

    :cond_0
    return-void
.end method

.method private static isSynced(Landroid/content/ContentValues;)Z
    .locals 2

    const-string v0, "custom"

    const-string v1, "serverStatus"

    invoke-virtual {p0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private putCommitResult(Lorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    iget-object v0, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isShareItem()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/miui/gallery/cloud/CloudUtils;->getContentValuesForAll(Lorg/json/JSONObject;Z)Landroid/content/ContentValues;

    move-result-object v0

    invoke-virtual {p0, p2, p1, v0}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->putAlbumIdInValues(Lcom/miui/gallery/cloud/RequestCloudItem;Lorg/json/JSONObject;Landroid/content/ContentValues;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/RequestCloudItem;->isSecretItem()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->encodeSecretFiles(Lcom/miui/gallery/data/DBImage;Landroid/content/ContentValues;)V

    :cond_0
    iget-object v1, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->isSubUbiFocus()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-direct {p0, p2, v0}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->updateLocalDBForSyncAndConnectUbi(Lcom/miui/gallery/cloud/RequestCloudItem;Landroid/content/ContentValues;)V

    return-void

    :cond_1
    iget-object v1, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->isShareItem()Z

    move-result v1

    if-eqz v1, :cond_2

    sget-object v1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_IMAGE_URI:Landroid/net/Uri;

    goto :goto_0

    :cond_2
    sget-object v1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    :goto_0
    iget-object v2, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    check-cast v2, Lcom/miui/gallery/data/DBImage$SubUbiImage;

    invoke-interface {v2}, Lcom/miui/gallery/data/DBImage$SubUbiImage;->getUbiLocalId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/miui/gallery/cloud/CloudUtils;->updateToLocalDBForSync(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;)V

    const-string v0, "content"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "ubiSubImageContentMap"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    iget-object v0, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getSubUbiIndex()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object v0, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isShareItem()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/miui/gallery/cloud/CloudUtils;->getContentValuesForAll(Lorg/json/JSONObject;Z)Landroid/content/ContentValues;

    move-result-object v0

    invoke-virtual {p0, p2, p1, v0}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->putAlbumIdInValues(Lcom/miui/gallery/cloud/RequestCloudItem;Lorg/json/JSONObject;Landroid/content/ContentValues;)V

    iget-object p1, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object p1

    iget-object p2, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/cloud/CloudUtils;->updateToLocalDBForSync(Landroid/net/Uri;Landroid/content/ContentValues;Lcom/miui/gallery/data/DBImage;)V

    :cond_3
    return-void
.end method

.method private updateLocalDBForSyncAndConnectUbi(Lcom/miui/gallery/cloud/RequestCloudItem;Landroid/content/ContentValues;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    iget-object v0, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    iget-object v1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-static {v0, p2, v1}, Lcom/miui/gallery/cloud/CloudUtils;->updateToLocalDBForSync(Landroid/net/Uri;Landroid/content/ContentValues;Lcom/miui/gallery/data/DBImage;)V

    iget-object p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->isUbiFocus()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->connectSubUbi(Lcom/miui/gallery/cloud/RequestCloudItem;)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected abstract connectSubUbi(Lcom/miui/gallery/cloud/RequestCloudItem;)V
.end method

.method protected abstract getAlbumId(Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;
.end method

.method protected getCommitUploadParams(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/CommitParameter;)Ljava/util/Map;
    .locals 3
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

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget v1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->commitRetryTimes:I

    iget-boolean v2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->needReRequest:Z

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->addRetryParameters(Ljava/util/Map;IZ)V

    const-string v1, "data"

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getCommitUploadPostString(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/CommitParameter;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getCommitUploadParams(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/CommitParameter;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method protected getCommitUploadPostString(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/CommitParameter;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "kss"

    new-instance v1, Lorg/json/JSONObject;

    invoke-virtual {p2}, Lcom/xiaomi/opensdk/file/model/CommitParameter;->getKssString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected final getCommitUploadURL(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/CommitParameter;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p2}, Lcom/xiaomi/opensdk/file/model/CommitParameter;->getUploadId()Ljava/lang/String;

    move-result-object p2

    iget-object v0, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isSubUbiFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->mUrlProvider:Lcom/miui/gallery/cloud/CloudUrlProvider;

    iget-object v0, p0, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->mAccount:Landroid/accounts/Account;

    iget-object v0, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    iget-object v1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getUbiServerId()Ljava/lang/String;

    move-result-object v1

    iget-object p1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSubUbiIndex()I

    move-result p1

    invoke-virtual {p2, v0, v1, p1}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getCommitSubUbiUrl(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->mUrlProvider:Lcom/miui/gallery/cloud/CloudUrlProvider;

    iget-object v0, p0, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->mAccount:Landroid/accounts/Account;

    iget-object v0, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {p1, v0, p2}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getCommitUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic getCommitUploadURL(Ljava/lang/Object;Lcom/xiaomi/opensdk/file/model/CommitParameter;)Ljava/lang/String;
    .locals 0

    check-cast p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getCommitUploadURL(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/CommitParameter;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected final getCreateSubUbiUrl(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->mUrlProvider:Lcom/miui/gallery/cloud/CloudUrlProvider;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getCreateSubUbiUrl(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected final getCreateUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->mUrlProvider:Lcom/miui/gallery/cloud/CloudUrlProvider;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getCreateUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected abstract getItemByRequestId(Ljava/lang/String;Lcom/miui/gallery/cloud/RequestCloudItem;)Lcom/miui/gallery/data/DBImage;
.end method

.method protected getRequestDownloadParams(Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/util/Map;
    .locals 3
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

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/RequestCloudItem;->getDownloadType()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    iget-object v1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->isUbiFocus()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->isSubUbiFocus()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    iget-object v1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getSubUbiIndex()I

    move-result v1

    goto :goto_0

    :cond_1
    const/4 v1, -0x1

    :goto_0
    iget v2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->otherRetryTimes:I

    iget-boolean p1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->needReRequest:Z

    invoke-direct {p0, v0, v2, p1, v1}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->addExtraParameters(Ljava/util/Map;IZI)V

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

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getRequestDownloadParams(Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method protected final getRequestDownloadURL(Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->mUrlProvider:Lcom/miui/gallery/cloud/CloudUrlProvider;

    iget-object v1, p0, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->mAccount:Landroid/accounts/Account;

    iget-object v1, v1, Landroid/accounts/Account;->name:Ljava/lang/String;

    iget-object p1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getRequestId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getRequestDownloadUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic getRequestDownloadURL(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    check-cast p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getRequestDownloadURL(Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getRequestUploadParams(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;)Ljava/util/Map;
    .locals 3
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

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget v1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->createRetryTimes:I

    iget-boolean v2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->needReRequest:Z

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->addRetryParameters(Ljava/util/Map;IZ)V

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->addUbiParam(Ljava/util/Map;Lcom/miui/gallery/cloud/RequestCloudItem;)V

    const-string v1, "data"

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getRequestUploadPostString(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method protected bridge synthetic getRequestUploadParams(Ljava/lang/Object;Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    check-cast p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getRequestUploadParams(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method protected getRequestUploadPostString(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {p2}, Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;->getKssString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iget-object v1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;->getFileSHA1()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Lcom/miui/gallery/data/DBImage;->setSha1(Ljava/lang/String;)V

    iget-object p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->toJSONObject()Lorg/json/JSONObject;

    move-result-object p2

    const-string v1, "creatorId"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    const-string v1, "shareId"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    iget-object v1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object p1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/ExifUtil;->isFromFrontCamera(Ljava/lang/String;)Z

    move-result p1

    const-string v1, "isFrontCamera"

    invoke-virtual {p2, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    :cond_0
    const-string p1, "content"

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getRequestUploadURL(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getAlbumId(Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    iget-object v0, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isSubUbiFocus()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getUbiServerId()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_2

    iget-object p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getSubUbiIndex()I

    move-result p2

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->mAccount:Landroid/accounts/Account;

    iget-object p2, p2, Landroid/accounts/Account;->name:Ljava/lang/String;

    iget-object v0, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getUbiServerId()Ljava/lang/String;

    move-result-object v0

    iget-object p1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSubUbiIndex()I

    move-result p1

    invoke-virtual {p0, p2, v0, p1}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getCreateSubUbiUrl(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    :goto_0
    return-object v1

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->mAccount:Landroid/accounts/Account;

    iget-object p1, p1, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getCreateUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic getRequestUploadURL(Ljava/lang/Object;Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;)Ljava/lang/String;
    .locals 0

    check-cast p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getRequestUploadURL(Lcom/miui/gallery/cloud/RequestCloudItem;Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected abstract getSpaceFullListener()Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;
.end method

.method protected handleCommitUploadResult(Lcom/miui/gallery/cloud/RequestCloudItem;Lorg/json/JSONObject;)Lcom/miui/gallery/cloud/RequestCloudItem;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/opensdk/exception/UnretriableException;,
            Lcom/xiaomi/opensdk/exception/RetriableException;,
            Lcom/xiaomi/opensdk/exception/AuthenticationException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getSpaceFullListener()Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;

    move-result-object v0

    invoke-static {p2, p1, v0}, Lcom/miui/gallery/cloud/CheckResult;->checkXMResultCode(Lorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestItemBase;Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v0

    iget-object v1, v0, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v2, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const/4 v3, 0x0

    if-eq v1, v2, :cond_0

    const-string v1, "CloudGalleryRequestorBase"

    const-string v2, "upload commit error %s"

    invoke-static {v1, v2, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p2, v0, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    iput-object p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->result:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    iget p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->commitRetryTimes:I

    add-int/lit8 p2, p2, 0x1

    iput p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->commitRetryTimes:I

    return-object v3

    :cond_0
    const-string v0, "data"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    invoke-direct {p0, p2, p1}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->putCommitResult(Lorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestCloudItem;)V

    invoke-static {}, Lcom/miui/gallery/util/Log2File;->getInstance()Lcom/miui/gallery/util/Log2File;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/util/Log2File;->canLog()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/Log2File;->getInstance()Lcom/miui/gallery/util/Log2File;

    move-result-object p2

    const-string v0, "CloudGalleryRequestorBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "upload a pic:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1, v3}, Lcom/miui/gallery/util/Log2File;->flushLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return-object p1

    :catch_0
    move-exception p1

    new-instance p2, Lcom/xiaomi/opensdk/exception/UnretriableException;

    invoke-direct {p2, p1}, Lcom/xiaomi/opensdk/exception/UnretriableException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method protected bridge synthetic handleCommitUploadResult(Ljava/lang/Object;Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/opensdk/exception/UnretriableException;,
            Lcom/xiaomi/opensdk/exception/RetriableException;,
            Lcom/xiaomi/opensdk/exception/AuthenticationException;
        }
    .end annotation

    check-cast p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->handleCommitUploadResult(Lcom/miui/gallery/cloud/RequestCloudItem;Lorg/json/JSONObject;)Lcom/miui/gallery/cloud/RequestCloudItem;

    move-result-object p1

    return-object p1
.end method

.method protected handleRequestDownloadResultJson(Lcom/miui/gallery/cloud/RequestCloudItem;Lorg/json/JSONObject;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/opensdk/exception/UnretriableException;,
            Lcom/xiaomi/opensdk/exception/RetriableException;,
            Lcom/xiaomi/opensdk/exception/AuthenticationException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getSpaceFullListener()Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;

    move-result-object v0

    invoke-static {p2, p1, v0}, Lcom/miui/gallery/cloud/CheckResult;->checkXMResultCode(Lorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestItemBase;Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p2

    iget-object v0, p2, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const/4 v2, 0x1

    if-eq v0, v1, :cond_0

    iget-object p2, p2, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    iput-object p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->result:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    iget p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->otherRetryTimes:I

    add-int/2addr p2, v2

    iput p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->otherRetryTimes:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x0

    return p1

    :cond_0
    return v2

    :catch_0
    move-exception p1

    new-instance p2, Lcom/xiaomi/opensdk/exception/UnretriableException;

    invoke-direct {p2, p1}, Lcom/xiaomi/opensdk/exception/UnretriableException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method protected bridge synthetic handleRequestDownloadResultJson(Ljava/lang/Object;Lorg/json/JSONObject;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/opensdk/exception/UnretriableException;,
            Lcom/xiaomi/opensdk/exception/RetriableException;,
            Lcom/xiaomi/opensdk/exception/AuthenticationException;
        }
    .end annotation

    check-cast p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->handleRequestDownloadResultJson(Lcom/miui/gallery/cloud/RequestCloudItem;Lorg/json/JSONObject;)Z

    move-result p1

    return p1
.end method

.method protected handleRequestUploadResultJson(Lcom/miui/gallery/cloud/RequestCloudItem;Lorg/json/JSONObject;)Lcom/miui/gallery/cloud/RequestCloudItem;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/opensdk/exception/UnretriableException;,
            Lcom/xiaomi/opensdk/exception/RetriableException;,
            Lcom/xiaomi/opensdk/exception/AuthenticationException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getSpaceFullListener()Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;

    move-result-object v0

    invoke-static {p2, p1, v0}, Lcom/miui/gallery/cloud/CheckResult;->checkXMResultCode(Lorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestItemBase;Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v0

    iget-object v1, v0, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v2, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const/4 v3, 0x1

    if-eq v1, v2, :cond_0

    const-string v1, "CloudGalleryRequestorBase"

    const-string v2, "upload request error %s"

    invoke-static {v1, v2, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p2, v0, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    iput-object p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->result:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    iget p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->createRetryTimes:I

    add-int/2addr p2, v3

    iput p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->createRetryTimes:I

    return-object p1

    :cond_0
    const-string v0, "data"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "content"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->parseRequestId(Lorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "upload_id"

    invoke-virtual {v0, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "fileName"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v5}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    const-string v5, "CloudGalleryRequestorBase"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "create image name changed from:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v7}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " to:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget-object v4, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v4}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v4

    monitor-enter v4
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v5, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v5}, Lcom/miui/gallery/data/DBImage;->isSubUbiFocus()Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {p0, v2, p1}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->getItemByRequestId(Ljava/lang/String;Lcom/miui/gallery/cloud/RequestCloudItem;)Lcom/miui/gallery/data/DBImage;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v6}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-static {v2}, Lcom/miui/gallery/cloud/CloudUtils;->deleteDirty(Lcom/miui/gallery/data/DBImage;)V

    :cond_2
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    iget-object v2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v2}, Lcom/miui/gallery/data/DBImage;->isShareItem()Z

    move-result v2

    invoke-static {v1, v2}, Lcom/miui/gallery/cloud/CloudUtils;->getContentValuesForAll(Lorg/json/JSONObject;Z)Landroid/content/ContentValues;

    move-result-object v1

    invoke-virtual {p0, p1, p2, v1}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->putAlbumIdInValues(Lcom/miui/gallery/cloud/RequestCloudItem;Lorg/json/JSONObject;Landroid/content/ContentValues;)V

    const-string p2, "kss"

    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_4

    const-string p2, "fileExists"

    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_4

    const-string p2, "fileExists"

    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/RequestCloudItem;->isSecretItem()Z

    move-result p2

    if-eqz p2, :cond_3

    iget-object p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-direct {p0, p2, v1}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->encodeSecretFiles(Lcom/miui/gallery/data/DBImage;Landroid/content/ContentValues;)V

    :cond_3
    invoke-direct {p0, p1, v1}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->updateLocalDBForSyncAndConnectUbi(Lcom/miui/gallery/cloud/RequestCloudItem;Landroid/content/ContentValues;)V

    goto :goto_0

    :cond_4
    const/4 v3, 0x0

    iget-object p2, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object p2

    iget-object v0, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-static {p2, v1, v0}, Lcom/miui/gallery/cloud/CloudUtils;->updateToLocalDB(Landroid/net/Uri;Landroid/content/ContentValues;Lcom/miui/gallery/data/DBImage;)I

    :goto_0
    monitor-exit v4

    if-eqz v3, :cond_5

    return-object p1

    :cond_5
    const/4 p1, 0x0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p1
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p1

    new-instance p2, Lcom/xiaomi/opensdk/exception/UnretriableException;

    invoke-direct {p2, p1}, Lcom/xiaomi/opensdk/exception/UnretriableException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method protected bridge synthetic handleRequestUploadResultJson(Ljava/lang/Object;Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/opensdk/exception/UnretriableException;,
            Lcom/xiaomi/opensdk/exception/RetriableException;,
            Lcom/xiaomi/opensdk/exception/AuthenticationException;
        }
    .end annotation

    check-cast p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/cloud/CloudGalleryRequestorBase;->handleRequestUploadResultJson(Lcom/miui/gallery/cloud/RequestCloudItem;Lorg/json/JSONObject;)Lcom/miui/gallery/cloud/RequestCloudItem;

    move-result-object p1

    return-object p1
.end method

.method protected abstract parseRequestId(Lorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation
.end method

.method protected putAlbumIdInValues(Lcom/miui/gallery/cloud/RequestCloudItem;Lorg/json/JSONObject;Landroid/content/ContentValues;)V
    .locals 0

    return-void
.end method
