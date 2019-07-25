.class public final Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;
.super Lcom/miui/gallery/cloud/SyncCloudBase;
.source "SyncSharerImageForAlbum.java"


# instance fields
.field private final mShareAlbumId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/cloud/SyncCloudBase;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    iput-object p4, p0, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;->mShareAlbumId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected appendParams(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/cloud/SyncCloudBase;->appendParams(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    new-instance p2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v0, "sharedAlbumId"

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;->mShareAlbumId:Ljava/lang/String;

    invoke-direct {p2, v0, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected getBaseUri()Landroid/net/Uri;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_IMAGE_URI:Landroid/net/Uri;

    return-object v0
.end method

.method protected getCandidateItemsInAGroup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/data/DBImage;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;->mContext:Landroid/content/Context;

    const/4 v1, 0x1

    invoke-static {v0, p1, p2, p3, v1}, Lcom/miui/gallery/cloud/CloudUtils;->getCandidateItemsInAGroup(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected getItem(Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;
    .locals 3

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_IMAGE_URI:Landroid/net/Uri;

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;->mContext:Landroid/content/Context;

    const-string v2, "serverId"

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/cloud/CloudUtils;->getItem(Landroid/net/Uri;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object p1

    return-object p1
.end method

.method protected getLocalGroupId(Landroid/content/ContentValues;)Ljava/lang/String;
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;->mShareAlbumId:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/cloud/CloudUtils;->getLocalGroupIdForSharerAlbum(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getSyncTagList()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    const/16 v2, 0x8

    invoke-direct {v1, v2}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method protected getSyncTagSelection()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "albumId = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;->mShareAlbumId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSyncUrl()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$SyncPull;->getPullShareAlbumImage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTagColumnName()Ljava/lang/String;
    .locals 1

    const-string v0, "serverTag"

    return-object v0
.end method

.method protected handleNewImage(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2

    const-string v0, "custom"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "albumId"

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;->mShareAlbumId:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0, p1, p2, p3, p4}, Lcom/miui/gallery/cloud/SyncCloudBase;->handleNewImage(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p2

    const-string p3, "serverTag"

    invoke-virtual {p1, p3}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    if-nez p1, :cond_1

    const-string p1, "SyncSharerImageForAlbum"

    const-string p3, "server tag should not be null"

    invoke-static {p1, p3}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :cond_1
    :goto_0
    return-object p2
.end method

.method protected handleUbiSubImage(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const/4 v0, 0x1

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/util/UbiFocusUtils;->handleSubUbiImage(Lorg/json/JSONObject;ZLjava/lang/String;)V

    return-void
.end method

.method protected isCreatedByMySelf(Landroid/content/ContentValues;)Z
    .locals 1

    const-string v0, "creatorId"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;->mAccount:Landroid/accounts/Account;

    iget-object v0, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected onNewImageSynced(Landroid/content/ContentValues;Ljava/lang/String;)V
    .locals 9

    const-string v0, "serverTag"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p1, "SyncSharerImageForAlbum"

    const-string p2, "server tag should not be null"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sIsFirstSynced()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;->isCreatedByMySelf(Landroid/content/ContentValues;)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;->belong2BabyAlbum(Landroid/content/ContentValues;Z)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;->mShareAlbumId:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/cloud/CloudUtils;->getDBShareAlbumBySharedId(Ljava/lang/String;)Lcom/miui/gallery/data/DBShareAlbum;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;->getInstance()Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;->mShareAlbumId:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBShareAlbum;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBShareAlbum;->getFileName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-virtual/range {v1 .. v8}, Lcom/miui/gallery/util/baby/SendNotificationUtilForSharedBabyAlbum;->sendNotification(Ljava/lang/String;JLjava/lang/String;ZJ)V

    :cond_1
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->isAutoDownload()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getSyncStrategy()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownloadShare()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getInstance()Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$ShareImage;->SHARE_URI:Landroid/net/Uri;

    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->download(Landroid/net/Uri;)V

    :cond_2
    :goto_0
    return-void
.end method

.method protected updateLocalGroupIdInGroup(Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 0

    return-void
.end method
