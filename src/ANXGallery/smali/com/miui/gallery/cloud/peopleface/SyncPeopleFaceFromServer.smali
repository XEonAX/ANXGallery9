.class public Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;
.super Ljava/lang/Object;
.source "SyncPeopleFaceFromServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer$ErrorHandler;
    }
.end annotation


# instance fields
.field protected mAccount:Landroid/accounts/Account;

.field protected mContext:Landroid/content/Context;

.field protected mExtendedAuthToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

.field private mRunnable:Ljava/lang/Runnable;

.field private mShouldFlatPeopleRelationshipInDB:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mShouldFlatPeopleRelationshipInDB:Z

    new-instance v0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer$2;-><init>(Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mRunnable:Ljava/lang/Runnable;

    iput-object p1, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mAccount:Landroid/accounts/Account;

    iput-object p3, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mExtendedAuthToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;I)Lorg/json/JSONObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Ljava/net/URISyntaxException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;,
            Lcom/miui/gallery/cloud/GalleryMiCloudServerException;
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->getPeopleFaceList(I)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Ljava/net/URISyntaxException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;,
            Lcom/miui/gallery/cloud/GalleryMiCloudServerException;
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->getFaceConcreteInfoListOneBatch(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method private flatDBAndCheckBabyAlbumAfterSync()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mShouldFlatPeopleRelationshipInDB:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mRunnable:Ljava/lang/Runnable;

    const/16 v1, 0xfa0

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GalleryUtils;->runOnMainThreadPostDelay(Ljava/lang/Runnable;I)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mShouldFlatPeopleRelationshipInDB:Z

    :cond_0
    return-void
.end method

.method private final getFaceConcreteInfoList(Ljava/util/ArrayList;)Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Ljava/net/URISyntaxException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;,
            Lcom/miui/gallery/cloud/GalleryMiCloudServerException;
        }
    .end annotation

    const-string v0, "syncface"

    const-string v1, "getFaceConcreteInfoList begin"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v5, v3

    const/4 v4, 0x0

    move-object v3, v1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_4

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    const/16 v6, 0x28

    if-ge v4, v6, :cond_0

    add-int/lit8 v7, v0, -0x1

    if-ge v1, v7, :cond_0

    const-string v7, ","

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    if-eq v4, v6, :cond_1

    add-int/lit8 v6, v0, -0x1

    if-ne v1, v6, :cond_3

    :cond_1
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer$3;

    invoke-direct {v4, p0, v3}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer$3;-><init>(Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;Ljava/lang/String;)V

    invoke-static {v4}, Lcom/miui/gallery/cloud/base/RetryRequestHelper;->retryTask(Lcom/miui/gallery/cloud/base/SyncTask;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v5

    iget-object v3, v5, Lcom/miui/gallery/cloud/base/GallerySyncResult;->data:Ljava/lang/Object;

    if-nez v3, :cond_2

    goto :goto_1

    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    :goto_1
    const-string p1, "syncface"

    const-string v0, "getFaceConcreteInfoList end"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v5
.end method

.method private final getFaceConcreteInfoListOneBatch(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Ljava/net/URISyntaxException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;,
            Lcom/miui/gallery/cloud/GalleryMiCloudServerException;
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/Log2File;->getInstance()Lcom/miui/gallery/util/Log2File;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/Log2File;->canLog()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/Log2File;->getInstance()Lcom/miui/gallery/util/Log2File;

    move-result-object v0

    const-string v2, "syncface"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getPeopleFaceInfo  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3, v1}, Lcom/miui/gallery/util/Log2File;->flushLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "newFaceInfos"

    invoke-direct {v0, v2, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->getSyncFaceConcreteInfoUrl()Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mAccount:Landroid/accounts/Account;

    iget-object v8, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mExtendedAuthToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static/range {v4 .. v10}, Lcom/miui/gallery/cloud/CloudUtils;->postToXiaomi(Ljava/lang/String;Ljava/util/List;Lorg/json/JSONObject;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;IZ)Lorg/json/JSONObject;

    move-result-object p1

    :try_start_0
    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->handleFaceInfosDataJson(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    invoke-static {}, Lcom/miui/gallery/util/Log2File;->getInstance()Lcom/miui/gallery/util/Log2File;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/Log2File;->canLog()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/Log2File;->getInstance()Lcom/miui/gallery/util/Log2File;

    move-result-object v0

    const-string v2, "syncface"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getFaceConcreteInfoListOneBatch end,allJson="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3, v1}, Lcom/miui/gallery/util/Log2File;->flushLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    return-object p1
.end method

.method private final getPeopleFaceList(I)Lorg/json/JSONObject;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Ljava/net/URISyntaxException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;,
            Lcom/miui/gallery/cloud/GalleryMiCloudServerException;
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/Log2File;->getInstance()Lcom/miui/gallery/util/Log2File;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/Log2File;->canLog()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/Log2File;->getInstance()Lcom/miui/gallery/util/Log2File;

    move-result-object v0

    const-string v2, "syncface"

    const-string v3, "getPeopleFaceList :"

    invoke-virtual {v0, v2, v3, v1}, Lcom/miui/gallery/util/Log2File;->flushLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "syncToken"

    iget-object v3, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mAccount:Landroid/accounts/Account;

    invoke-static {v3}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getFaceSyncToken(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-lez p1, :cond_1

    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "limit"

    int-to-long v3, p1

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v2, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->getPeopleFaceSyncUrl()Ljava/lang/String;

    move-result-object v4

    iget-object v6, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mAccount:Landroid/accounts/Account;

    iget-object v7, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mExtendedAuthToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v4 .. v9}, Lcom/miui/gallery/cloud/CloudUtils;->getFromXiaomi(Ljava/lang/String;Ljava/util/List;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;IZ)Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/util/Log2File;->getInstance()Lcom/miui/gallery/util/Log2File;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/Log2File;->canLog()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/miui/gallery/util/Log2File;->getInstance()Lcom/miui/gallery/util/Log2File;

    move-result-object v0

    const-string v2, "syncface"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getPeopleFaceList allJson="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3, v1}, Lcom/miui/gallery/util/Log2File;->flushLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    const-string v0, "syncface"

    const-string v1, "getPeopleFaceList success\n"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method

.method private final handleCustom(Landroid/content/ContentValues;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->PEOPLE_FACE_URI:Landroid/net/Uri;

    const-string v1, "serverId"

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/cloud/CloudUtils;->updateToPeopleFaceDBForSync(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;)V

    return-void
.end method

.method private final handleDelete(Landroid/content/ContentValues;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->PEOPLE_FACE_URI:Landroid/net/Uri;

    const-string v1, "serverId"

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/cloud/CloudUtils;->updateToPeopleFaceDBForDeleteItem(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;)V

    return-void
.end method

.method private handleFaceInfosDataJson(Lorg/json/JSONObject;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    if-nez p1, :cond_0

    return-void

    :cond_0
    const-string v0, "faceInfoRecords"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-gtz v0, :cond_1

    goto :goto_1

    :cond_1
    const-string v0, "syncface"

    const-string v1, "handleFaceInfosDataJson one batch:"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "faceId"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "faceInfo"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "imageIds"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const-string v5, "faceCoverScore"

    const-wide/high16 v6, -0x4010000000000000L    # -1.0

    invoke-virtual {v1, v5, v6, v7}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v5

    invoke-direct {p0, v3, v2, v5, v6}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->putFaceInfo2Db(Lorg/json/JSONObject;Ljava/lang/String;D)V

    invoke-direct {p0, v4, v2}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->putFaceImageIdsInfo2Db(Lorg/json/JSONArray;Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void

    :cond_3
    :goto_1
    const-string p1, "syncface"

    const-string v0, "response face info is empty"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private handlePeopleFaceDataJson(Lorg/json/JSONObject;)Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    const-string v1, "records"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    return-object v0

    :cond_1
    const-string v1, "newFaceInfos"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "records"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_4

    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "id"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    if-nez v0, :cond_2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :cond_2
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    invoke-virtual {p0, v3}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->handleItem(Lorg/json/JSONObject;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    return-object v0
.end method

.method private putFaceImageIdsInfo2Db(Lorg/json/JSONArray;Ljava/lang/String;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Long;

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    array-length p1, v0

    :goto_1
    if-ge v1, p1, :cond_1

    aget-object v2, v0, v1

    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string v4, "faceId"

    invoke-virtual {v3, v4, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "imageServerId"

    invoke-virtual {v2}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v3}, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->safeInsertFace2Image(Landroid/content/ContentValues;)Landroid/net/Uri;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method

.method private putFaceInfo2Db(Lorg/json/JSONObject;Ljava/lang/String;D)V
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    move-object/from16 v0, p1

    const-string v1, "faceXScale"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v1

    const-string v3, "faceYScale"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    const-string v5, "faceWScale"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v5

    const-string v7, "faceHScale"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v7

    const-string v9, "eyeLeftXScale"

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v9

    const-string v11, "eyeLeftYScale"

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v11

    const-string v13, "eyeRightXScale"

    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v13

    const-string v15, "eyeRightYScale"

    invoke-virtual {v0, v15}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v15

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    move-wide/from16 v17, v15

    const-string v15, "faceXScale"

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v15, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v1, "faceYScale"

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v1, "faceWScale"

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v1, "faceHScale"

    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v1, "leftEyeXScale"

    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v1, "leftEyeYScale"

    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v1, "RightEyeXScale"

    invoke-static {v13, v14}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v1, "RightEyeYScale"

    invoke-static/range {v17 .. v18}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v1, "faceCoverScore"

    invoke-static/range {p3 .. p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "(%s = \"%s\")"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "serverId"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/4 v4, 0x1

    aput-object p2, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2, v4}, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->safeUpdateFace(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;Z)J

    return-void
.end method

.method private setShouldFlatPeopleRelationshipInDB(Landroid/content/ContentValues;Lcom/miui/gallery/cloud/peopleface/PeopleFace;)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mShouldFlatPeopleRelationshipInDB:Z

    if-nez v0, :cond_1

    const-string v0, ""

    const-string v1, "groupId"

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v0, "groupId"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    iget-object p1, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->groupId:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mShouldFlatPeopleRelationshipInDB:Z

    :cond_1
    return-void
.end method

.method private shouldContinue(Lorg/json/JSONObject;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const-string v0, "hasMore"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method private updateSyncInfo(Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mAccount:Landroid/accounts/Account;

    const-string v1, "watermark"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->setFaceSyncWatermark(Landroid/accounts/Account;J)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mAccount:Landroid/accounts/Account;

    const-string v1, "syncToken"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->setFaceSyncToken(Landroid/accounts/Account;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected getPeopleFaceSyncUrl()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$PeopleFace;->getPeopleFaceSyncUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSyncFaceConcreteInfoUrl()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$PeopleFace;->getFaceInfoSyncUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSyncItemLimit()I
    .locals 1

    const/16 v0, 0x64

    return v0
.end method

.method protected final handleItem(Lorg/json/JSONObject;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    const-string v1, "type"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "status"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2}, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->getItem(Ljava/lang/String;)Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    move-result-object v2

    invoke-static {p1}, Lcom/miui/gallery/cloud/peopleface/FaceAlbumUtil;->getContentValuesForPeopleFace(Lorg/json/JSONObject;)Landroid/content/ContentValues;

    move-result-object v4

    if-nez v2, :cond_3

    const-string v2, "PEOPLE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    invoke-static {p1}, Lcom/miui/gallery/cloud/peopleface/FaceAlbumUtil;->getPeopleName(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mContext:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->getGroupByPeopleName(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-direct {p0, v4, p1}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->setShouldFlatPeopleRelationshipInDB(Landroid/content/ContentValues;Lcom/miui/gallery/cloud/peopleface/PeopleFace;)V

    sget-object v1, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->PEOPLE_FACE_URI:Landroid/net/Uri;

    iget-object p1, p1, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->_id:Ljava/lang/String;

    invoke-static {v1, v4, p1}, Lcom/miui/gallery/cloud/CloudUtils;->updateToLocalDBForSync(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v4}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->handleNewPeopleFace(Landroid/content/ContentValues;)V

    iput-boolean v2, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mShouldFlatPeopleRelationshipInDB:Z

    :goto_0
    return v0

    :cond_2
    invoke-virtual {p0, v4}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->handleNewPeopleFace(Landroid/content/ContentValues;)V

    return v2

    :cond_3
    iget-wide v5, v2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->serverTag:J

    const-string v1, "eTag"

    invoke-static {p1, v1}, Lcom/miui/gallery/cloud/CloudUtils;->getLongAttributeFromJson(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v7

    cmp-long p1, v5, v7

    if-ltz p1, :cond_4

    return v0

    :cond_4
    const-string p1, "normal"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-direct {p0, v4, v2}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->setShouldFlatPeopleRelationshipInDB(Landroid/content/ContentValues;Lcom/miui/gallery/cloud/peopleface/PeopleFace;)V

    invoke-direct {p0, v4}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->handleCustom(Landroid/content/ContentValues;)V

    goto :goto_1

    :cond_5
    const-string p1, "deleted"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-direct {p0, v4}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->handleDelete(Landroid/content/ContentValues;)V

    :cond_6
    :goto_1
    return v0
.end method

.method protected handleNewPeopleFace(Landroid/content/ContentValues;)V
    .locals 2

    const-string v0, "localFlag"

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->safeInsertFace(Landroid/content/ContentValues;Z)Landroid/net/Uri;

    return-void
.end method

.method public final sync()Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Ljava/net/URISyntaxException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;,
            Lcom/miui/gallery/cloud/GalleryMiCloudServerException;
        }
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    :cond_0
    :goto_0
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/miui/gallery/cloud/SyncConditionManager;->check(I)I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->CONDITION_INTERRUPTED:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v0

    return-object v0

    :cond_1
    new-instance v2, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer$1;-><init>(Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;)V

    invoke-static {v2}, Lcom/miui/gallery/cloud/base/RetryRequestHelper;->retryTask(Lcom/miui/gallery/cloud/base/SyncTask;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v2

    iget-object v3, v2, Lcom/miui/gallery/cloud/base/GallerySyncResult;->data:Ljava/lang/Object;

    check-cast v3, Lorg/json/JSONObject;

    iget-object v4, p0, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->mAccount:Landroid/accounts/Account;

    invoke-static {v3, v4}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer$ErrorHandler;->simpleCheckWhetherNeedCleanTables(Lorg/json/JSONObject;Landroid/accounts/Account;)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_0

    :cond_2
    if-eqz v3, :cond_4

    const-string v4, "data"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->handlePeopleFaceDataJson(Lorg/json/JSONObject;)Ljava/util/ArrayList;

    move-result-object v4

    if-eqz v4, :cond_3

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_3

    invoke-direct {p0, v4}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->getFaceConcreteInfoList(Ljava/util/ArrayList;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v2

    iget-object v4, v2, Lcom/miui/gallery/cloud/base/GallerySyncResult;->data:Ljava/lang/Object;

    if-nez v4, :cond_3

    goto :goto_1

    :cond_3
    invoke-direct {p0, v3}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->updateSyncInfo(Lorg/json/JSONObject;)V

    if-eqz v3, :cond_4

    invoke-virtual {v3}, Lorg/json/JSONObject;->length()I

    move-result v4

    if-eqz v4, :cond_4

    invoke-direct {p0, v3}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->shouldContinue(Lorg/json/JSONObject;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_4
    :goto_1
    invoke-direct {p0}, Lcom/miui/gallery/cloud/peopleface/SyncPeopleFaceFromServer;->flatDBAndCheckBabyAlbumAfterSync()V

    const-string v3, "syncface"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sync people face from server finish, cost time: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v0

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Face;->isFirstSyncCompleted()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Face;->setFirstSyncCompleted()V

    :cond_5
    return-object v2
.end method
