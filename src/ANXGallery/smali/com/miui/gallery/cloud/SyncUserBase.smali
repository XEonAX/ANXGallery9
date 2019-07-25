.class public abstract Lcom/miui/gallery/cloud/SyncUserBase;
.super Lcom/miui/gallery/cloud/SyncFromServer;
.source "SyncUserBase.java"


# instance fields
.field protected final mAlbumId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/cloud/SyncFromServer;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    iput-object p4, p0, Lcom/miui/gallery/cloud/SyncUserBase;->mAlbumId:Ljava/lang/String;

    return-void
.end method

.method private final getInvitedShareUserByRelation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBShareUser;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncUserBase;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncUserBase;->mAlbumId:Ljava/lang/String;

    invoke-static {v0, p1, v1, p2, p3}, Lcom/miui/gallery/cloud/CloudUtils;->getInvitedDBShareUserInLocal(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBShareUser;

    move-result-object p1

    return-object p1
.end method

.method private final getShareUserById(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/data/DBShareUser;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncUserBase;->getBaseUri()Landroid/net/Uri;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncUserBase;->mAlbumId:Ljava/lang/String;

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/cloud/CloudUtils;->getDBShareUserInLocal(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBShareUser;

    move-result-object p1

    return-object p1
.end method

.method private handleUserInvited(Lorg/json/JSONObject;Lcom/miui/gallery/data/DBShareUser;Ljava/lang/String;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p2, :cond_2

    const-string v1, "normal"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_1

    const-string v1, "invited"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncUserBase;->getBaseUri()Landroid/net/Uri;

    move-result-object p1

    const-string p3, "_id = ? "

    new-array v1, v2, [Ljava/lang/String;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBShareUser;->getId()Ljava/lang/String;

    move-result-object p2

    aput-object p2, v1, v0

    invoke-static {p1, p3, v1}, Lcom/miui/gallery/util/GalleryUtils;->safeDelete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_1

    :cond_1
    :goto_0
    invoke-static {p1}, Lcom/miui/gallery/data/DBShareUser;->getContentValues(Lorg/json/JSONObject;)Landroid/content/ContentValues;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncUserBase;->getBaseUri()Landroid/net/Uri;

    move-result-object p3

    const-string v1, "_id = ? "

    new-array v3, v2, [Ljava/lang/String;

    invoke-virtual {p2}, Lcom/miui/gallery/data/DBShareUser;->getId()Ljava/lang/String;

    move-result-object p2

    aput-object p2, v3, v0

    invoke-static {p3, p1, v1, v3}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return v2

    :cond_2
    :goto_1
    return v0
.end method

.method private final setPhoneNumberNullIfNeeded(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncUserBase;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_USER_URI:Landroid/net/Uri;

    if-ne v0, v1, :cond_1

    const-string v0, "family"

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "friend"

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_USER_URI:Landroid/net/Uri;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%s=\'%s\' and %s=\'%s\' and %s=\'%s\' and %s=\'%s\'"

    const/16 v4, 0x8

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "albumId"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    iget-object v6, p0, Lcom/miui/gallery/cloud/SyncUserBase;->mAlbumId:Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "relation"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    aput-object p1, v4, v5

    const/4 p1, 0x4

    const-string v5, "relationText"

    aput-object v5, v4, p1

    const/4 p1, 0x5

    aput-object p2, v4, p1

    const/4 p1, 0x6

    const-string p2, "serverStatus"

    aput-object p2, v4, p1

    const/4 p1, 0x7

    const-string p2, "invited"

    aput-object p2, v4, p1

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {v1, v0, p1, p2}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_1
    return-void
.end method


# virtual methods
.method protected final addUsers(Lorg/json/JSONObject;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "list"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-gtz v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_2

    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/miui/gallery/cloud/SyncUserBase;->handleUser(Lorg/json/JSONObject;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return v1

    :cond_3
    :goto_1
    const-string p1, "SyncUserBase"

    const-string v1, "changedUserList is empty, return."

    invoke-static {p1, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method protected final getSyncItemLimit()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected handleUser(Lorg/json/JSONObject;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "status"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "userId"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "tag"

    invoke-static {p1, v2}, Lcom/miui/gallery/cloud/CloudUtils;->getLongAttributeFromJson(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncUserBase;->getBaseUri()Landroid/net/Uri;

    move-result-object v4

    monitor-enter v4

    :try_start_0
    iget-object v5, p0, Lcom/miui/gallery/cloud/SyncUserBase;->mContext:Landroid/content/Context;

    invoke-direct {p0, v5, v1}, Lcom/miui/gallery/cloud/SyncUserBase;->getShareUserById(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/data/DBShareUser;

    move-result-object v5

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-nez v5, :cond_3

    const-string v2, "relation"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    const-string v2, "relation"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v2, "relationText"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    move-object v2, v3

    :goto_0
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-direct {p0, v3, v2}, Lcom/miui/gallery/cloud/SyncUserBase;->setPhoneNumberNullIfNeeded(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v1, v3, v2}, Lcom/miui/gallery/cloud/SyncUserBase;->getInvitedShareUserByRelation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBShareUser;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-direct {p0, p1, v1, v0}, Lcom/miui/gallery/cloud/SyncUserBase;->handleUserInvited(Lorg/json/JSONObject;Lcom/miui/gallery/data/DBShareUser;Ljava/lang/String;)Z

    move-result p1

    monitor-exit v4

    return p1

    :cond_1
    const-string v1, "normal"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p1}, Lcom/miui/gallery/data/DBShareUser;->getContentValues(Lorg/json/JSONObject;)Landroid/content/ContentValues;

    move-result-object p1

    const-string v0, "albumId"

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncUserBase;->mAlbumId:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncUserBase;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/util/GalleryUtils;->safeInsert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    monitor-exit v4

    return v6

    :cond_2
    monitor-exit v4

    return v7

    :cond_3
    const-string v1, "SyncUserBase"

    const-string v8, "find this user in local, update"

    invoke-static {v1, v8}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5}, Lcom/miui/gallery/data/DBShareUser;->getServerTag()J

    move-result-wide v8

    cmp-long v1, v8, v2

    if-ltz v1, :cond_4

    const-string p1, "SyncUserBase"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "shareUser:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Lcom/miui/gallery/data/DBShareUser;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " local tag:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Lcom/miui/gallery/data/DBShareUser;->getServerTag()J

    move-result-wide v5

    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " >= server tag:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", don\'t update local."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v4

    return v7

    :cond_4
    const-string v1, "normal"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncUserBase;->getBaseUri()Landroid/net/Uri;

    move-result-object p1

    const-string v0, "_id = ? "

    new-array v1, v6, [Ljava/lang/String;

    invoke-virtual {v5}, Lcom/miui/gallery/data/DBShareUser;->getId()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v7

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/GalleryUtils;->safeDelete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    const-string p1, "SyncUserBase"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "delete share user:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Lcom/miui/gallery/data/DBShareUser;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v4

    return v7

    :cond_5
    invoke-static {p1}, Lcom/miui/gallery/data/DBShareUser;->getContentValues(Lorg/json/JSONObject;)Landroid/content/ContentValues;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/SyncUserBase;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "_id = ? "

    new-array v2, v6, [Ljava/lang/String;

    invoke-virtual {v5}, Lcom/miui/gallery/data/DBShareUser;->getId()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-static {v0, p1, v1, v2}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    monitor-exit v4

    return v7

    :catchall_0
    move-exception p1

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method protected final updateSyncTagAndShouldContinue(Lorg/json/JSONObject;Ljava/util/ArrayList;)Z
    .locals 5
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

    const-string v0, "tag"

    invoke-static {p1, v0}, Lcom/miui/gallery/cloud/CloudUtils;->getLongAttributeFromJson(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    iget-wide v2, v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->currentValue:J

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const-string v2, "SyncUserBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "update the syncTag:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    iput-wide v0, v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->serverValue:J

    invoke-virtual {p0, p2}, Lcom/miui/gallery/cloud/SyncUserBase;->updateSyncTag(Ljava/util/ArrayList;)V

    :cond_0
    return p1
.end method
