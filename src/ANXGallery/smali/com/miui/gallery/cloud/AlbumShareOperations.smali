.class public Lcom/miui/gallery/cloud/AlbumShareOperations;
.super Ljava/lang/Object;
.source "AlbumShareOperations.java"


# static fields
.field private static sSelf:Lcom/miui/gallery/cloud/UserInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/cloud/AlbumShareOperations;->readCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/cloud/AlbumShareOperations;->addNameValuePair(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    return-void
.end method

.method static synthetic access$200(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/miui/gallery/cloud/AlbumShareOperations;->persisitCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$300(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/util/Collection;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/cloud/AlbumShareOperations;->collectAllUserId(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/util/Collection;)V

    return-void
.end method

.method static synthetic access$400(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/util/List;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/cloud/AlbumShareOperations;->insertUserInfoToDB(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$500(Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/BadPaddingException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljava/io/IOException;,
            Lcom/miui/gallery/cloud/GalleryMiCloudServerException;,
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-static {p0}, Lcom/miui/gallery/cloud/AlbumShareOperations;->doRequestUserInfo(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Ljava/lang/String;ZLjava/lang/String;Z)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/cloud/AlbumShareOperations;->savePublicInfo(Ljava/lang/String;ZLjava/lang/String;Z)V

    return-void
.end method

.method private static addNameValuePair(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    new-instance p3, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {p3, p1, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private static collectAllUserId(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/util/Collection;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/cloud/CloudUtils;->getCloudDistinctUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v1

    const/4 p1, 0x1

    new-array v2, p1, [Ljava/lang/String;

    const/4 p1, 0x0

    aput-object p2, v2, p1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-nez p0, :cond_0

    return-void

    :cond_0
    :goto_0
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p3, p2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return-void

    :catchall_0
    move-exception p1

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    throw p1
.end method

.method private static doRequestUserInfo(Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/UserInfo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/BadPaddingException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljava/io/IOException;,
            Lcom/miui/gallery/cloud/GalleryMiCloudServerException;,
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v1

    if-nez v1, :cond_0

    return-object v0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v5

    if-nez v5, :cond_1

    return-object v0

    :cond_1
    invoke-static {v1, v5}, Lcom/miui/gallery/cloud/CloudUtils;->getExtToken(Landroid/content/Context;Landroid/accounts/Account;)Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    move-result-object v6

    if-nez v6, :cond_2

    return-object v0

    :cond_2
    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$AlbumShareOperation;->getRequestUserInfoUrl()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v4, "users"

    const-string v7, ","

    invoke-static {p0, v7}, Lcom/miui/gallery/util/GalleryUtils;->concatAll(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, v4, p0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v2 .. v8}, Lcom/miui/gallery/cloud/CloudUtils;->postToXiaomi(Ljava/lang/String;Ljava/util/List;Lorg/json/JSONObject;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;IZ)Lorg/json/JSONObject;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/cloud/CheckResult;->parseErrorCode(Lorg/json/JSONObject;)I

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "data"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "list"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_4

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "userId"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3

    new-instance v4, Lcom/miui/gallery/cloud/UserInfo;

    invoke-direct {v4, v3}, Lcom/miui/gallery/cloud/UserInfo;-><init>(Ljava/lang/String;)V

    const-string v3, "aliasNick"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/miui/gallery/cloud/UserInfo;->setAliasNick(Ljava/lang/String;)V

    const-string v3, "nickname"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/miui/gallery/cloud/UserInfo;->setMiliaoNick(Ljava/lang/String;)V

    const-string v3, "icon"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Lcom/miui/gallery/cloud/UserInfo;->setMiliaoIconUrl(Ljava/lang/String;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    return-object v0
.end method

.method private static execute(Ljava/util/concurrent/Callable;)Lcom/miui/gallery/util/AsyncResult;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "Lcom/miui/gallery/util/AsyncResult<",
            "TV;>;>;)",
            "Lcom/miui/gallery/util/AsyncResult<",
            "TV;>;"
        }
    .end annotation

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    new-instance v2, Ljava/lang/Throwable;

    invoke-direct {v2}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v2

    const/4 v3, 0x1

    aget-object v2, v2, v3

    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v2

    const-string v4, "AlbumShareOperations"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "start callable: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->supportShare()Z

    move-result v4

    if-nez v4, :cond_0

    const/4 p0, -0x1

    invoke-static {p0}, Lcom/miui/gallery/util/AsyncResult;->create(I)Lcom/miui/gallery/util/AsyncResult;

    move-result-object p0

    return-object p0

    :cond_0
    :try_start_0
    invoke-interface {p0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/util/AsyncResult;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v4, "AlbumShareOperations"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    :goto_0
    const-string v6, "end callable: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", cost time="

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v0

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :catch_0
    move-exception p0

    :try_start_1
    invoke-static {p0}, Lcom/miui/gallery/cloud/ServerErrorCode;->fromThrowable(Ljava/lang/Throwable;)I

    move-result v4

    const/16 v5, -0x69

    if-ne v4, v5, :cond_1

    move-object v5, p0

    check-cast v5, Lcom/miui/gallery/cloud/GalleryMiCloudServerException;

    invoke-virtual {v5}, Lcom/miui/gallery/cloud/GalleryMiCloudServerException;->getStatusCode()I

    move-result v5

    const/16 v6, 0x191

    if-ne v5, v6, :cond_1

    invoke-static {}, Lcom/miui/gallery/cloud/AlbumShareOperations;->requestSyncToHandleUnauthorized()V

    :cond_1
    const-string v5, "AlbumShareOperations"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error code="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, p0}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v4}, Lcom/miui/gallery/util/AsyncResult;->create(I)Lcom/miui/gallery/util/AsyncResult;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v4, "AlbumShareOperations"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    goto :goto_0

    :goto_1
    const-string v0, "AlbumShareOperations"

    const-string v1, "result error=%d"

    new-array v2, v3, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget v4, p0, Lcom/miui/gallery/util/AsyncResult;->mError:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0

    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "end callable: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", cost time="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AlbumShareOperations"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    throw p0
.end method

.method private static insertUserInfoToDB(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "Landroid/net/Uri;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/UserInfo;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object p1

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloud/UserInfo;

    sget-object v1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->USER_INFO_URI:Landroid/net/Uri;

    invoke-static {v1}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string v2, "user_id"

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/UserInfo;->getUserId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string v2, "alias_nick"

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/UserInfo;->getAliasNick()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string v2, "miliao_nick"

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/UserInfo;->getMiliaoNick()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string v2, "miliao_icon_url"

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/UserInfo;->getMiliaoIconUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x64

    if-le v0, v1, :cond_0

    :try_start_0
    const-string v0, "com.miui.gallery.cloud.provider"

    invoke-virtual {p0, v0, p1}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/content/OperationApplicationException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_2

    :catch_0
    move-exception v0

    :try_start_1
    invoke-virtual {v0}, Landroid/content/OperationApplicationException;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :goto_2
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    throw p0

    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_2

    :try_start_2
    const-string p2, "com.miui.gallery.cloud.provider"

    invoke-virtual {p0, p2, p1}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Landroid/content/OperationApplicationException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_3

    :catch_2
    move-exception p0

    invoke-virtual {p0}, Landroid/content/OperationApplicationException;->printStackTrace()V

    goto :goto_3

    :catch_3
    move-exception p0

    invoke-virtual {p0}, Landroid/os/RemoteException;->printStackTrace()V

    :cond_2
    :goto_3
    return-void
.end method

.method public static myName()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/AlbumShareOperations;->self()Lcom/miui/gallery/cloud/UserInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/UserInfo;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->getAccountName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static persisitCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 4

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    invoke-virtual {v1, p1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    int-to-long p3, p4

    add-long/2addr v2, p3

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v1, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    sget-object p1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_CACHE_URI:Landroid/net/Uri;

    const-string p2, "serverId=?"

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/String;

    const/4 p4, 0x0

    aput-object p0, p3, p4

    invoke-virtual {v0, p1, v1, p2, p3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "serverId"

    invoke-virtual {v1, p1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_CACHE_URI:Landroid/net/Uri;

    invoke-virtual {v0, p0, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    :cond_1
    return-void
.end method

.method private static readCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 12

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_CACHE_URI:Landroid/net/Uri;

    const/4 v4, 0x1

    invoke-static {v0, v4}, Lcom/miui/gallery/cloud/CloudUtils;->getLimitUri(Landroid/net/Uri;I)Landroid/net/Uri;

    move-result-object v0

    new-array v5, v4, [Ljava/lang/String;

    const/4 v9, 0x0

    aput-object p1, v5, v9

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "(%s=?) AND (%s<%d) AND (%s>%d) AND (%s)"

    const/4 v8, 0x6

    new-array v8, v8, [Ljava/lang/Object;

    const-string v10, "serverId"

    aput-object v10, v8, v9

    aput-object p2, v8, v4

    int-to-long v10, p3

    add-long/2addr v10, v1

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    const/4 v10, 0x2

    aput-object p3, v8, v10

    const/4 p3, 0x3

    aput-object p2, v8, p3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    const/4 p3, 0x4

    aput-object p2, v8, p3

    invoke-static {p1}, Lcom/miui/gallery/cloud/CloudUtils;->sqlNotEmptyStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x5

    aput-object p1, v8, p2

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    new-array v7, v4, [Ljava/lang/String;

    aput-object p0, v7, v9

    const/4 v8, 0x0

    move-object v4, v0

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    const/4 p1, 0x0

    if-nez p0, :cond_0

    return-object p1

    :cond_0
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p0, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return-object p1

    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    throw p1
.end method

.method public static requestPublicUrl(Ljava/lang/String;Z)Lcom/miui/gallery/util/AsyncResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/miui/gallery/util/AsyncResult<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/cloud/AlbumShareOperations$4;

    invoke-direct {v0, p1, p0}, Lcom/miui/gallery/cloud/AlbumShareOperations$4;-><init>(ZLjava/lang/String;)V

    invoke-static {v0}, Lcom/miui/gallery/cloud/AlbumShareOperations;->execute(Ljava/util/concurrent/Callable;)Lcom/miui/gallery/util/AsyncResult;

    move-result-object p0

    return-object p0
.end method

.method private static requestSyncToHandleUnauthorized()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object v1, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    const-wide/16 v1, 0x10

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    return-void
.end method

.method public static requestUrlForBarcode(Ljava/lang/String;)Lcom/miui/gallery/util/AsyncResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/miui/gallery/util/AsyncResult<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/cloud/AlbumShareOperations$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/AlbumShareOperations$1;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/miui/gallery/cloud/AlbumShareOperations;->execute(Ljava/util/concurrent/Callable;)Lcom/miui/gallery/util/AsyncResult;

    move-result-object p0

    return-object p0
.end method

.method public static requestUserInfo(Ljava/util/List;)Lcom/miui/gallery/util/AsyncResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/util/AsyncResult<",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/UserInfo;",
            ">;>;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/cloud/AlbumShareOperations$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/AlbumShareOperations$3;-><init>(Ljava/util/List;)V

    invoke-static {v0}, Lcom/miui/gallery/cloud/AlbumShareOperations;->execute(Ljava/util/concurrent/Callable;)Lcom/miui/gallery/util/AsyncResult;

    move-result-object p0

    return-object p0
.end method

.method public static resetAccountInfo()V
    .locals 2

    const-class v0, Lcom/miui/gallery/cloud/AlbumShareOperations;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    sput-object v1, Lcom/miui/gallery/cloud/AlbumShareOperations;->sSelf:Lcom/miui/gallery/cloud/UserInfo;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static savePublicInfo(Ljava/lang/String;ZLjava/lang/String;Z)V
    .locals 2

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "isPublic"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string p1, "publicUrl"

    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p3, :cond_0

    sget-object p1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_ALBUM_URI:Landroid/net/Uri;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p3, :cond_1

    const-string p3, "albumId"

    goto :goto_1

    :cond_1
    const-string p3, "serverId"

    :goto_1
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " = ? "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p0, p3, v1

    invoke-static {p1, v0, p2, p3}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method private static declared-synchronized self()Lcom/miui/gallery/cloud/UserInfo;
    .locals 8

    const-class v0, Lcom/miui/gallery/cloud/AlbumShareOperations;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/cloud/AlbumShareOperations;->sSelf:Lcom/miui/gallery/cloud/UserInfo;

    if-nez v1, :cond_1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v2

    iget-object v1, v1, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {v2}, Lcom/miui/gallery/cloud/AlbumShareOperations;->requestUserInfo(Ljava/util/List;)Lcom/miui/gallery/util/AsyncResult;

    move-result-object v1

    if-eqz v1, :cond_1

    iget v2, v1, Lcom/miui/gallery/util/AsyncResult;->mError:I

    if-nez v2, :cond_1

    iget-object v1, v1, Lcom/miui/gallery/util/AsyncResult;->mData:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloud/UserInfo;

    sput-object v1, Lcom/miui/gallery/cloud/AlbumShareOperations;->sSelf:Lcom/miui/gallery/cloud/UserInfo;

    if-eqz v1, :cond_1

    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string v4, "user_id"

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/UserInfo;->getUserId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "alias_nick"

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/UserInfo;->getAliasNick()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "miliao_nick"

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/UserInfo;->getMiliaoNick()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "miliao_icon_url"

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/UserInfo;->getMiliaoIconUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->USER_INFO_URI:Landroid/net/Uri;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    sget-object v4, Lcom/miui/gallery/cloud/GalleryCloudUtils;->USER_INFO_URI:Landroid/net/Uri;

    const-string v5, "user_id=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    sget-object v7, Lcom/miui/gallery/cloud/AlbumShareOperations;->sSelf:Lcom/miui/gallery/cloud/UserInfo;

    invoke-virtual {v7}, Lcom/miui/gallery/cloud/UserInfo;->getUserId()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-static {v4, v3, v5, v6}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    sget-object v2, Lcom/miui/gallery/cloud/GalleryCloudUtils;->USER_INFO_URI:Landroid/net/Uri;

    invoke-static {v2, v3}, Lcom/miui/gallery/util/GalleryUtils;->safeInsert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    :cond_0
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2

    :cond_1
    :goto_0
    sget-object v1, Lcom/miui/gallery/cloud/AlbumShareOperations;->sSelf:Lcom/miui/gallery/cloud/UserInfo;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit v0

    return-object v1

    :catchall_1
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static syncAllUserInfoFromNetwork()Lcom/miui/gallery/util/AsyncResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/miui/gallery/util/AsyncResult<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/cloud/AlbumShareOperations$2;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/AlbumShareOperations$2;-><init>()V

    invoke-static {v0}, Lcom/miui/gallery/cloud/AlbumShareOperations;->execute(Ljava/util/concurrent/Callable;)Lcom/miui/gallery/util/AsyncResult;

    move-result-object v0

    return-object v0
.end method
