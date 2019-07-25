.class public Lcom/miui/gallery/cloud/SyncOwnerAlbum;
.super Lcom/miui/gallery/cloud/SyncFromServer;
.source "SyncOwnerAlbum.java"


# instance fields
.field private mSyncId:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V
    .locals 2

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/cloud/SyncFromServer;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->initSyncId()V

    const-string p1, "SyncSystemAlbum"

    const-string p2, "init syncId %d"

    iget-wide v0, p0, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->mSyncId:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method private initSyncId()V
    .locals 8

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getEverSyncedSystemAlbum()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "max(serverId)"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v3

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s AND (%s=%d AND %s=\'%s\')"

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    const-string v4, "(serverType=0)"

    const/4 v5, 0x0

    aput-object v4, v2, v5

    const/4 v4, 0x1

    const-string v6, "localFlag"

    aput-object v6, v2, v4

    const/4 v4, 0x2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v4

    const/4 v4, 0x3

    const-string v5, "serverStatus"

    aput-object v5, v2, v4

    const/4 v4, 0x4

    const-string v5, "custom"

    aput-object v5, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->getBaseUri()Landroid/net/Uri;

    move-result-object v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    new-instance v7, Lcom/miui/gallery/cloud/SyncOwnerAlbum$1;

    invoke-direct {v7, p0}, Lcom/miui/gallery/cloud/SyncOwnerAlbum$1;-><init>(Lcom/miui/gallery/cloud/SyncOwnerAlbum;)V

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->mSyncId:J

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->mSyncId:J

    :goto_0
    return-void
.end method


# virtual methods
.method protected appendParams(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 3
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

    new-instance p2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v0, "syncId"

    iget-wide v1, p0, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->mSyncId:J

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p2, v0, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected getBaseUri()Landroid/net/Uri;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    return-object v0
.end method

.method protected getCurrentSyncTag()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getSyncTagList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getSyncTagSelection()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getSyncUrl()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$SyncPull;->getPullOwnerAlbumUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTagColumnName()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected handleResultAndShouldContinue(Lorg/json/JSONObject;Ljava/util/ArrayList;)Z
    .locals 17
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

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "albums"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    const-string v1, "SyncSystemAlbum"

    const-string v2, "response content null"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v3

    :cond_0
    const/4 v4, 0x0

    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v5

    const/4 v10, 0x3

    const/16 v11, 0x8

    const/4 v13, 0x2

    const/4 v14, 0x1

    if-ge v4, v5, :cond_5

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v15, "albumId"

    invoke-static {v5, v15}, Lcom/miui/gallery/cloud/CloudUtils;->getLongAttributeFromJson(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v15

    invoke-static {v5}, Lcom/miui/gallery/cloud/CloudUtils;->getContentValuesForOwnerAlbum(Lorg/json/JSONObject;)Landroid/content/ContentValues;

    move-result-object v5

    iget-object v6, v0, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->mContext:Landroid/content/Context;

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v12

    invoke-static {v6, v12}, Lcom/miui/gallery/cloud/CloudUtils;->getItemByServerID(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object v6

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/miui/gallery/cloud/CloudUtils;->isUmodifyAlbum(Ljava/lang/String;)Z

    move-result v12

    if-nez v6, :cond_1

    if-eqz v12, :cond_1

    new-instance v6, Lcom/miui/gallery/cloud/SyncOwnerAlbum$2;

    invoke-direct {v6, v0}, Lcom/miui/gallery/cloud/SyncOwnerAlbum$2;-><init>(Lcom/miui/gallery/cloud/SyncOwnerAlbum;)V

    invoke-static {v6}, Lcom/miui/gallery/cloud/CloudUtils;->addRecordsForCameraAndScreenshots(Lcom/miui/gallery/cloud/CloudUtils$Insertable;)V

    iget-object v6, v0, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->mContext:Landroid/content/Context;

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/miui/gallery/cloud/CloudUtils;->getItemByServerID(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object v6

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    const-string v8, "groupId"

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v8, "model"

    sget-object v9, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v8, "version"

    sget-object v9, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v8, "Sync"

    const-string v9, "system_album_record_not_found"

    invoke-static {v8, v9, v7}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_1
    if-eqz v12, :cond_2

    if-eqz v6, :cond_4

    invoke-virtual {v6}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v7

    if-nez v7, :cond_4

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getEverSyncedSystemAlbum()Z

    move-result v7

    if-nez v7, :cond_4

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->getBaseUri()Landroid/net/Uri;

    move-result-object v7

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v5, v8}, Lcom/miui/gallery/cloud/CloudUtils;->updateToLocalDBByServerId(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;)V

    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    const-string v7, "localGroupId"

    invoke-virtual {v6}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "%s=%s AND (%s!=%s) AND (%s=%d OR %s=%d)"

    new-array v9, v11, [Ljava/lang/Object;

    const-string v11, "groupId"

    aput-object v11, v9, v3

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v14

    const-string v11, "localGroupId"

    aput-object v11, v9, v13

    invoke-virtual {v6}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v9, v10

    const-string v6, "serverType"

    const/4 v10, 0x4

    aput-object v6, v9, v10

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v10, 0x5

    aput-object v6, v9, v10

    const-string v6, "serverType"

    const/4 v10, 0x6

    aput-object v6, v9, v10

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v10, 0x7

    aput-object v6, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v0, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->mContext:Landroid/content/Context;

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->getBaseUri()Landroid/net/Uri;

    move-result-object v8

    const/4 v9, 0x0

    invoke-static {v7, v8, v5, v6, v9}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_1

    :cond_2
    invoke-static/range {v15 .. v16}, Lcom/miui/gallery/cloud/CloudTableUtils;->isGroupWithoutRecord(J)Z

    move-result v7

    if-eqz v7, :cond_3

    goto :goto_1

    :cond_3
    if-nez v6, :cond_4

    iget-object v6, v0, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->mContext:Landroid/content/Context;

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->getBaseUri()Landroid/net/Uri;

    move-result-object v7

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v5, v8}, Lcom/miui/gallery/cloud/SyncCloudBase;->handleNewGroup(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;)Ljava/lang/String;

    :cond_4
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    :cond_5
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getEverSyncedSystemAlbum()Z

    move-result v2

    if-nez v2, :cond_6

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%s=-1 AND (%s=%d OR %s=%d) AND (%s=%d OR %s=%d)"

    const/16 v5, 0x9

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "localGroupId"

    aput-object v6, v5, v3

    const-string v3, "localFlag"

    aput-object v3, v5, v14

    const/4 v3, 0x7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v13

    const-string v6, "localFlag"

    aput-object v6, v5, v10

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x4

    aput-object v6, v5, v7

    const-string v6, "serverType"

    const/4 v7, 0x5

    aput-object v6, v5, v7

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x6

    aput-object v6, v5, v7

    const-string v6, "serverType"

    aput-object v6, v5, v3

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v11

    invoke-static {v2, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->mContext:Landroid/content/Context;

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->getBaseUri()Landroid/net/Uri;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v3, v4, v2, v5}, Lcom/miui/gallery/util/SafeDBUtil;->safeDelete(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_6
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setEverSyncedSystemAlbum()V

    const-string v2, "syncAlbumId"

    invoke-static {v1, v2}, Lcom/miui/gallery/cloud/CloudUtils;->getLongAttributeFromJson(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/miui/gallery/cloud/SyncOwnerAlbum;->mSyncId:J

    const-string v2, "lastPage"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    xor-int/2addr v1, v14

    return v1
.end method
