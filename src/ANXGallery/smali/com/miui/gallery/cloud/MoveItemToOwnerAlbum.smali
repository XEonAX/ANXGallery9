.class public Lcom/miui/gallery/cloud/MoveItemToOwnerAlbum;
.super Lcom/miui/gallery/cloud/MoveItemBase;
.source "MoveItemToOwnerAlbum.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/MoveItemBase;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected appendAlbumIdParameter(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lorg/apache/http/NameValuePair;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    const-string v1, "toAlbumId"

    iget-object v2, p0, Lcom/miui/gallery/cloud/MoveItemToOwnerAlbum;->mAlbumId:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected appendValues(Landroid/content/ContentValues;)V
    .locals 1

    const-string v0, "fromLocalGroupId"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    return-void
.end method

.method protected getAlbumId(Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/MoveItemToOwnerAlbum;->mContext:Landroid/content/Context;

    iget-object v1, p1, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v1}, Lcom/miui/gallery/data/DBImage;->getLocalGroupId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/cloud/CloudUtils;->getServerIdByLocalId(Landroid/content/Context;Ljava/lang/String;Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getSpaceFullListener()Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/SpaceFullHandler;->getOwnerSpaceFullListener()Lcom/miui/gallery/cloud/SpaceFullHandler$OwnerSpaceFullListener;

    move-result-object v0

    return-object v0
.end method

.method protected getUrl(Lcom/miui/gallery/cloud/CloudUrlProvider;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/cloud/RequestCloudItem;)Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/MoveItemToOwnerAlbum;->mAlbumId:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/cloud/CloudTableUtils;->isSecretAlbum(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    iget-object p4, p4, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p4}, Lcom/miui/gallery/data/DBImage;->getFromLocalGroupId()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string p4, "MoveItemToOwnerAlbum"

    const-string v0, "getUrl  fromLocalGroupId does not exist"

    invoke-static {p4, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getMoveUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-static {v1, p4}, Lcom/miui/gallery/cloud/CloudTableUtils;->isSecretAlbum(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p4

    if-nez v0, :cond_1

    if-nez p4, :cond_1

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getMoveUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    if-nez v0, :cond_2

    if-eqz p4, :cond_2

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getUnHideMoveUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getHideMoveUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
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
