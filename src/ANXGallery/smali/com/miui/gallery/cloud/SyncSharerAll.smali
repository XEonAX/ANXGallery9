.class public final Lcom/miui/gallery/cloud/SyncSharerAll;
.super Lcom/miui/gallery/cloud/SyncFromServer;
.source "SyncSharerAll.java"


# instance fields
.field private mExtras:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Landroid/os/Bundle;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/cloud/SyncFromServer;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    iput-object p4, p0, Lcom/miui/gallery/cloud/SyncSharerAll;->mExtras:Landroid/os/Bundle;

    return-void
.end method

.method private handleAlbumList(Lorg/json/JSONObject;)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    move-object/from16 v1, p0

    const-string v0, "entries"

    move-object/from16 v2, p1

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_8

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "sharedId"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "status"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_0

    const-string v6, "normal"

    :cond_0
    const-string v7, "tag"

    invoke-static {v4, v7}, Lcom/miui/gallery/cloud/CloudUtils;->getLongAttributeFromJson(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v7

    const-string v9, "content"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "status"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "fileName"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    sget-object v12, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_ALBUM_URI:Landroid/net/Uri;

    monitor-enter v12

    :try_start_0
    invoke-static {v5}, Lcom/miui/gallery/cloud/CloudUtils;->getDBShareAlbumBySharedId(Ljava/lang/String;)Lcom/miui/gallery/data/DBShareAlbum;

    move-result-object v13

    const/4 v14, 0x1

    if-nez v13, :cond_2

    invoke-static {v10, v6}, Lcom/miui/gallery/data/DBShareAlbum;->isNormalStatus(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-static {v4, v13}, Lcom/miui/gallery/data/DBShareAlbum;->getContentValue(Lorg/json/JSONObject;Lcom/miui/gallery/data/DBShareAlbum;)Landroid/content/ContentValues;

    move-result-object v7

    sget-object v8, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_ALBUM_URI:Landroid/net/Uri;

    invoke-static {v8, v7}, Lcom/miui/gallery/util/GalleryUtils;->safeInsert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v7

    if-eqz v7, :cond_1

    sget-object v8, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_IMAGE_URI:Landroid/net/Uri;

    invoke-virtual {v7}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v7

    const-string v11, "albumId"

    invoke-static {v8, v5, v7, v11}, Lcom/miui/gallery/cloud/CloudUtils;->updateLocalGroupIdInGroup(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    invoke-direct {v1, v4}, Lcom/miui/gallery/cloud/SyncSharerAll;->insertCreatorIntoShareUser(Lorg/json/JSONObject;)V

    goto :goto_1

    :cond_2
    invoke-static {v10, v6}, Lcom/miui/gallery/data/DBShareAlbum;->isNormalStatus(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_4

    invoke-virtual {v13}, Lcom/miui/gallery/data/DBShareAlbum;->getServerTag()J

    move-result-wide v15

    cmp-long v11, v7, v15

    if-lez v11, :cond_3

    invoke-static {v4, v13}, Lcom/miui/gallery/data/DBShareAlbum;->getContentValue(Lorg/json/JSONObject;Lcom/miui/gallery/data/DBShareAlbum;)Landroid/content/ContentValues;

    move-result-object v7

    sget-object v8, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_ALBUM_URI:Landroid/net/Uri;

    const-string v11, "albumId = ? "

    new-array v13, v14, [Ljava/lang/String;

    aput-object v5, v13, v2

    invoke-static {v8, v7, v11, v13}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_3
    :goto_1
    const/4 v7, 0x1

    goto :goto_2

    :cond_4
    invoke-direct {v1, v11, v5}, Lcom/miui/gallery/cloud/SyncSharerAll;->notifyKicked(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v13}, Lcom/miui/gallery/data/DBShareAlbum;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/miui/gallery/cloud/CloudUtils;->deleteShareAlbumInLocal(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "SyncSharerAll"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "delete share album:"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    const/4 v7, 0x0

    :goto_2
    monitor-exit v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v7, :cond_6

    new-instance v7, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;

    iget-object v8, v1, Lcom/miui/gallery/cloud/SyncSharerAll;->mContext:Landroid/content/Context;

    iget-object v11, v1, Lcom/miui/gallery/cloud/SyncSharerAll;->mAccount:Landroid/accounts/Account;

    iget-object v12, v1, Lcom/miui/gallery/cloud/SyncSharerAll;->mExtendedAuthToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    invoke-direct {v7, v8, v11, v12, v5}, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/lang/String;)V

    const-string v5, "SyncSharerAll"

    const-string v8, "sync share image when insertCreatorAndSyncImages start"

    invoke-static {v5, v8}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7}, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;->sync()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    const-string v5, "SyncSharerAll"

    const-string v7, "sync share image when insertCreatorAndSyncImages end"

    invoke-static {v5, v7}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->getSyncShouldClearDataBase()Z

    move-result v5

    if-eqz v5, :cond_6

    const-string v0, "SyncSharerAll"

    const-string v2, "need clear data"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/SyncLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_6
    invoke-static {v10, v6}, Lcom/miui/gallery/data/DBShareAlbum;->isNormalStatus(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    const-string v5, "isPublic"

    invoke-virtual {v9, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    const-string v5, "isPublic"

    invoke-virtual {v9, v5}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    const-string v5, "sharedId"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v14}, Lcom/miui/gallery/cloud/AlbumShareOperations;->requestPublicUrl(Ljava/lang/String;Z)Lcom/miui/gallery/util/AsyncResult;

    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_8
    return-void
.end method

.method private handleImageList(Lorg/json/JSONObject;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "entries"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "sharedId"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;

    iget-object v3, p0, Lcom/miui/gallery/cloud/SyncSharerAll;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/miui/gallery/cloud/SyncSharerAll;->mAccount:Landroid/accounts/Account;

    iget-object v5, p0, Lcom/miui/gallery/cloud/SyncSharerAll;->mExtendedAuthToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    invoke-direct {v2, v3, v4, v5, v1}, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/lang/String;)V

    const-string v1, "SyncSharerAll"

    const-string v3, "sync share image when handleImageList start"

    invoke-static {v1, v3}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/miui/gallery/cloud/SyncSharerImageForAlbum;->sync()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    const-string v1, "SyncSharerAll"

    const-string v2, "sync share image when handleImageList end"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->getSyncShouldClearDataBase()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p1, "SyncSharerAll"

    const-string v0, "need clear data"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private handleUserList(Lorg/json/JSONObject;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "entries"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "albumId"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/SyncOwnerUserForAlbum;

    iget-object v4, p0, Lcom/miui/gallery/cloud/SyncSharerAll;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/miui/gallery/cloud/SyncSharerAll;->mAccount:Landroid/accounts/Account;

    iget-object v6, p0, Lcom/miui/gallery/cloud/SyncSharerAll;->mExtendedAuthToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    invoke-direct {v3, v4, v5, v6, v2}, Lcom/miui/gallery/cloud/SyncOwnerUserForAlbum;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Lcom/miui/gallery/cloud/SyncOwnerUserForAlbum;->handleDataJson(Lorg/json/JSONObject;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private insertCreatorIntoShareUser(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "sharedId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "creatorId"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v0}, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->insertCreatorIntoShareUser(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private notifyKicked(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerAll;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerAll;->mContext:Landroid/content/Context;

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/miui/gallery/cloud/SyncSharerAll;->mContext:Landroid/content/Context;

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v2, v5

    const p1, 0x7f1005bc

    invoke-virtual {v4, p1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v3, v5

    const p1, 0x7f100049

    invoke-virtual {v1, p1, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2}, Lcom/miui/gallery/cloud/CloudUtils;->sendShareAlbumNotification(Landroid/content/Context;Ljava/lang/String;ILandroid/net/Uri;)V

    invoke-static {}, Lcom/miui/gallery/cloud/CloudShareAlbumMediator;->getInstance()Lcom/miui/gallery/cloud/CloudShareAlbumMediator;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/CloudShareAlbumMediator;->onShareAlbumExited(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected getBaseUri()Landroid/net/Uri;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getCurrentSyncTag()Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;",
            ">;"
        }
    .end annotation

    invoke-super {p0}, Lcom/miui/gallery/cloud/SyncFromServer;->getCurrentSyncTag()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    iget v3, v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->syncTagType:I

    invoke-static {v3}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->shouldSyncTagValue(I)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-wide v3, v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->currentValue:J

    iget v2, v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->syncTagType:I

    invoke-static {v2}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getInitSyncTagValue(I)I

    move-result v2

    int-to-long v5, v2

    cmp-long v2, v3, v5

    if-nez v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_3

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    iget v3, v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->syncTagType:I

    invoke-static {v3}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->shouldSyncTagValue(I)Z

    move-result v3

    if-eqz v3, :cond_2

    iget v3, v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->syncTagType:I

    invoke-static {v3}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getInitSyncTagValue(I)I

    move-result v3

    int-to-long v3, v3

    iput-wide v3, v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->currentValue:J

    goto :goto_1

    :cond_3
    return-object v0
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

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    const/4 v2, 0x5

    invoke-direct {v1, v2}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method protected getSyncTagSelection()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerAll;->mAccount:Landroid/accounts/Account;

    invoke-static {v0}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getAccountSelections(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSyncUrl()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$SyncPull;->getPullShareAll()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTagColumnName()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected handleResultAndShouldContinue(Lorg/json/JSONObject;Ljava/util/ArrayList;)Z
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;",
            ">;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    iget v4, v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->syncTagType:I

    invoke-static {v4}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getJsonTagOutput(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string p1, "SyncSharerAll"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "get output tag is null, syncType:"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->syncTagType:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "lastPage"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    const-string v7, "syncTag"

    invoke-static {v5, v7}, Lcom/miui/gallery/cloud/CloudUtils;->getLongAttributeFromJson(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v7

    const-string v9, "entries"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    iget v4, v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->syncTagType:I

    packed-switch v4, :pswitch_data_0

    const-string v4, "SyncSharerAll"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "can\'t handle this syncTag:"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v9, v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->syncTagType:I

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/miui/gallery/util/SyncLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :pswitch_0
    invoke-direct {p0, v5}, Lcom/miui/gallery/cloud/SyncSharerAll;->handleImageList(Lorg/json/JSONObject;)V

    goto :goto_1

    :pswitch_1
    invoke-direct {p0, v5}, Lcom/miui/gallery/cloud/SyncSharerAll;->handleAlbumList(Lorg/json/JSONObject;)V

    goto :goto_1

    :pswitch_2
    invoke-direct {p0, v5}, Lcom/miui/gallery/cloud/SyncSharerAll;->handleAlbumList(Lorg/json/JSONObject;)V

    goto :goto_1

    :pswitch_3
    invoke-direct {p0, v5}, Lcom/miui/gallery/cloud/SyncSharerAll;->handleUserList(Lorg/json/JSONObject;)V

    goto :goto_1

    :cond_2
    const-string v9, "SyncSharerAll"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " entries is null, may be is first sync, just save syncTag:"

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v9, v4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->getSyncShouldClearDataBase()Z

    move-result v4

    if-eqz v4, :cond_3

    const-string p1, "SyncSharerAll"

    const-string p2, "need clear data"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_3
    iget-wide v4, v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->currentValue:J

    cmp-long v9, v7, v4

    if-lez v9, :cond_4

    const-string v4, "SyncSharerAll"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "update the syncTag:"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iput-wide v7, v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->serverValue:J

    invoke-virtual {p0, v3}, Lcom/miui/gallery/cloud/SyncSharerAll;->updateSyncTag(Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;)V

    :cond_4
    if-eqz v6, :cond_5

    const-string v4, "SyncSharerAll"

    const-string v5, "last page, break sync from server"

    invoke-static {v4, v5}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iput-boolean v1, v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->shouldSync:Z

    goto/16 :goto_0

    :cond_5
    const/4 v2, 0x1

    goto/16 :goto_0

    :cond_6
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/cloud/SyncSharerAll;->updateSyncInfo(Lorg/json/JSONObject;Ljava/util/ArrayList;)V

    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
