.class public final Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;
.super Lcom/miui/gallery/cloud/SyncUserBase;
.source "SyncSharerUserForAlbum.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/cloud/SyncUserBase;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/lang/String;)V

    return-void
.end method

.method private cleanAllUsersInLocalDB()Z
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "albumId = ? "

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/String;

    iget-object v4, p0, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->mAlbumId:Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v0, v1, v3}, Lcom/miui/gallery/util/GalleryUtils;->safeDelete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2
.end method

.method public static insertCreatorIntoShareUser(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "albumId"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "userId"

    invoke-virtual {v0, p1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_USER_URI:Landroid/net/Uri;

    invoke-static {p0, v0}, Lcom/miui/gallery/util/GalleryUtils;->safeInsert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    return-void

    :cond_1
    :goto_0
    const-string p0, "SyncSharerUserForAlbum"

    const-string p1, "reset users, creator id or album id is null."

    invoke-static {p0, p1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private resetUsersInLocalDB()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->cleanAllUsersInLocalDB()Z

    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->mAlbumId:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/cloud/CloudUtils;->getCreatorIdByAlbumId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->mAlbumId:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->insertCreatorIntoShareUser(Ljava/lang/String;Ljava/lang/String;)V

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

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/cloud/SyncUserBase;->appendParams(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    new-instance p2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v0, "sharedAlbumId"

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->mAlbumId:Ljava/lang/String;

    invoke-direct {p2, v0, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected getBaseUri()Landroid/net/Uri;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_USER_URI:Landroid/net/Uri;

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

    const/16 v2, 0x9

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

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->mAlbumId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSyncUrl()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$SyncPull;->getPullShareUserUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTagColumnName()Ljava/lang/String;
    .locals 1

    const-string v0, "serverTag"

    return-object v0
.end method

.method protected final handleDataJson(Lorg/json/JSONObject;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "tag"

    invoke-static {p1, v0}, Lcom/miui/gallery/cloud/CloudUtils;->getLongAttributeFromJson(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->getCurrentSyncTag()Ljava/util/ArrayList;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    iget-wide v2, v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->currentValue:J

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->resetUsersInLocalDB()V

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->addUsers(Lorg/json/JSONObject;)Z

    move-result p1

    return p1
.end method

.method protected final handleUser(Lorg/json/JSONObject;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "status"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "normal"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miui/gallery/cloud/baby/BabyAlbumUtils;->BABY_PEOPLE_ID:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "userId"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-static {}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->getAccountName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->mAlbumId:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/cloud/CloudUtils;->getDBShareAlbumBySharedId(Ljava/lang/String;)Lcom/miui/gallery/data/DBShareAlbum;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lcom/miui/gallery/data/DBShareAlbum;->getBabyInfoJson()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/cloud/baby/BabyInfo;->fromJSON(Ljava/lang/String;)Lcom/miui/gallery/cloud/baby/BabyInfo;

    move-result-object v1

    :goto_0
    if-eqz v1, :cond_1

    sget-object v2, Lcom/miui/gallery/cloud/baby/BabyAlbumUtils;->BABY_AUTO_UPDATE:Ljava/lang/String;

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, v1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mAutoupdate:Z

    iput-object v0, v1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mPeopleId:Ljava/lang/String;

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v3, "editedColumns"

    invoke-virtual {v2, v3}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v3, "babyInfoJson"

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/baby/BabyInfo;->toJSON()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "peopleId"

    invoke-virtual {v2, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_ALBUM_URI:Landroid/net/Uri;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%s=?"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    const-string v6, "albumId"

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-static {v1, v3, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-array v3, v4, [Ljava/lang/String;

    iget-object v4, p0, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->mAlbumId:Ljava/lang/String;

    aput-object v4, v3, v7

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_1
    invoke-super {p0, p1}, Lcom/miui/gallery/cloud/SyncUserBase;->handleUser(Lorg/json/JSONObject;)Z

    move-result p1

    return p1
.end method

.method protected updateSyncTag(Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    iget v2, v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->syncTagType:I

    invoke-static {v2}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getColumnName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    iget-wide v3, p1, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->serverValue:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    sget-object p1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_ALBUM_URI:Landroid/net/Uri;

    const-string v2, "albumId = ? "

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    iget-object v4, p0, Lcom/miui/gallery/cloud/SyncSharerUserForAlbum;->mAlbumId:Ljava/lang/String;

    aput-object v4, v3, v1

    invoke-static {p1, v0, v2, v3}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method
