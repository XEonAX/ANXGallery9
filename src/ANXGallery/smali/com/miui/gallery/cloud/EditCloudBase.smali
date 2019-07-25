.class public abstract Lcom/miui/gallery/cloud/EditCloudBase;
.super Lcom/miui/gallery/cloud/RequestOperationBase;
.source "EditCloudBase.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/RequestOperationBase;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected abstract buildRequest(Landroid/accounts/Account;Lcom/miui/gallery/cloud/RequestCloudItem;)Lcom/miui/gallery/cloud/RequestOperationBase$Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected final buildRequest(Landroid/accounts/Account;Lcom/miui/gallery/cloud/RequestItemBase;)Lcom/miui/gallery/cloud/RequestOperationBase$Request;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    check-cast p2, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/cloud/EditCloudBase;->buildRequest(Landroid/accounts/Account;Lcom/miui/gallery/cloud/RequestCloudItem;)Lcom/miui/gallery/cloud/RequestOperationBase$Request;

    move-result-object p1

    return-object p1
.end method

.method protected abstract getColumnIndex()I
.end method

.method protected onPreRequest(Lcom/miui/gallery/cloud/RequestItemBase;)Lcom/miui/gallery/cloud/base/GallerySyncCode;
    .locals 2

    instance-of v0, p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    if-nez v0, :cond_0

    const-string p1, "EditCloudBase"

    const-string v0, "item is not instanceof RequestCloudItem."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    return-object p1

    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/cloud/RequestCloudItem;

    iget-object v0, v0, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isShareItem()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p1, "EditCloudBase"

    const-string v0, "share item can\'t be edit"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    return-object p1

    :cond_2
    invoke-super {p0, p1}, Lcom/miui/gallery/cloud/RequestOperationBase;->onPreRequest(Lcom/miui/gallery/cloud/RequestItemBase;)Lcom/miui/gallery/cloud/base/GallerySyncCode;

    move-result-object p1

    return-object p1

    :cond_3
    :goto_0
    const-string p1, "EditCloudBase"

    const-string v0, "item has not been synced yet"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    return-object p1
.end method

.method protected onRequestError(Lcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/RequestItemBase;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    sget-object p3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-eq p1, p3, :cond_0

    iget p1, p2, Lcom/miui/gallery/cloud/RequestItemBase;->otherRetryTimes:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p2, Lcom/miui/gallery/cloud/RequestItemBase;->otherRetryTimes:I

    :cond_0
    return-void
.end method

.method protected onRequestSuccess(Lcom/miui/gallery/cloud/RequestItemBase;Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    check-cast p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    iget-object p1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-static {p2}, Lcom/miui/gallery/cloud/CloudUtils;->getContentValuesForAll(Lorg/json/JSONObject;)Landroid/content/ContentValues;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/cloud/EditCloudBase;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getServerId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/cloud/CloudUtils;->getItemByServerID(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object v0

    invoke-virtual {p0, p2, v0}, Lcom/miui/gallery/cloud/EditCloudBase;->updateDb(Landroid/content/ContentValues;Lcom/miui/gallery/data/DBImage;)V

    const-string p2, "EditCloudBase"

    const-string v0, "edit success %s"

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method protected updateDb(Landroid/content/ContentValues;Lcom/miui/gallery/data/DBImage;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/EditCloudBase;->getColumnIndex()I

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->transformToEditedColumnsElement(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBImage;->getEditedColumns()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/Utils;->ensureNotNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "editedColumns"

    invoke-virtual {p1, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {v0, p1, p2}, Lcom/miui/gallery/cloud/CloudUtils;->updateToLocalDB(Landroid/net/Uri;Landroid/content/ContentValues;Lcom/miui/gallery/data/DBImage;)I

    return-void
.end method
