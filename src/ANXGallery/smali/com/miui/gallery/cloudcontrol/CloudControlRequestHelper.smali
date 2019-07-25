.class public Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;
.super Ljava/lang/Object;
.source "CloudControlRequestHelper.java"


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->mContext:Landroid/content/Context;

    return-void
.end method

.method private doPostJobs()V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->doPostCloudControlJob()V

    return-void
.end method

.method private execRequestSyncInternal(Z)Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/miui/gallery/util/PrivacyAgreementUtils;->isCloudServiceAgreementEnable(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string p1, "CloudControlRequestHelper"

    const-string v0, "Request failed: privacy agreement disabled"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/agreement/AgreementsUtils;->isNetworkingAgreementAccepted()Z

    move-result v0

    if-nez v0, :cond_1

    const-string p1, "CloudControlRequestHelper"

    const-string v0, "Request failed: CTA not confirmed."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    new-instance v0, Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;-><init>()V

    const/4 v2, 0x1

    if-eqz p1, :cond_2

    const/16 v3, 0x3ea

    goto :goto_0

    :cond_2
    const/4 v3, 0x1

    :goto_0
    invoke-virtual {v0, v3}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;->setMethod(I)Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;

    move-result-object v0

    if-eqz p1, :cond_3

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$CloudControl;->getUrl()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_3
    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$CloudControl;->getAnonymousUrl()Ljava/lang/String;

    move-result-object v3

    :goto_1
    invoke-virtual {v0, v3}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;->setUrl(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CloudControl;->getSyncToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;->setSyncToken(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;->build()Lcom/miui/gallery/cloudcontrol/CloudControlRequest;

    move-result-object v0

    :try_start_0
    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest;->simpleExecuteSync()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/CloudControlResponse;

    if-nez v0, :cond_4

    sget-object v0, Lcom/miui/gallery/net/base/ErrorCode;->BODY_EMPTY:Lcom/miui/gallery/net/base/ErrorCode;

    const-string v2, "Response is empty"

    const-string v3, "Response is empty"

    invoke-direct {p0, v0, v2, v3, p1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->handleError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;Z)V
    :try_end_0
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/miui/gallery/preference/GalleryPreferences$CloudControl;->setLastRequestTime(J)V

    return v1

    :cond_4
    :try_start_1
    invoke-direct {p0, v0}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->handleResponse(Lcom/miui/gallery/cloudcontrol/CloudControlResponse;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/miui/gallery/preference/GalleryPreferences$CloudControl;->setLastRequestSucceedTime(J)V
    :try_end_1
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/GalleryPreferences$CloudControl;->setLastRequestTime(J)V

    return v2

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_0
    move-exception v0

    :try_start_2
    invoke-virtual {v0}, Lcom/miui/gallery/net/base/RequestError;->getErrorCode()Lcom/miui/gallery/net/base/ErrorCode;

    move-result-object v2

    invoke-virtual {v0}, Lcom/miui/gallery/net/base/RequestError;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/miui/gallery/net/base/RequestError;->getResponseData()Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v2, v3, v0, p1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->handleError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :goto_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/GalleryPreferences$CloudControl;->setLastRequestTime(J)V

    throw p1
.end method

.method private getRequestIntervalMinutes()I
    .locals 5

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CloudControl;->getLastRequestTime()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const v0, 0x7fffffff

    return v0

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    const-wide/16 v0, 0x3e8

    div-long/2addr v2, v0

    const-wide/16 v0, 0x3c

    div-long/2addr v2, v0

    long-to-int v0, v2

    return v0
.end method

.method private handleError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;Z)V
    .locals 5

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/net/base/ErrorCode;->name()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, "UNKNOWN"

    :goto_0
    const-string v0, "CloudControlRequestHelper"

    const-string v1, "Request failed, errorCode: %s, errorMessage: %s, responseData: %s, isLoggedIn: %b."

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    const/4 v3, 0x2

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v0

    const-string v1, "request_interval(minutes)"

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->getRequestIntervalMinutes()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "error_code"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "error_message"

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "response"

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "cloud_control"

    if-eqz p4, :cond_1

    const-string p2, "cloud_control_real_name_request_error"

    goto :goto_1

    :cond_1
    const-string p2, "cloud_control_anonymous_request_error"

    :goto_1
    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private handleResponse(Lcom/miui/gallery/cloudcontrol/CloudControlResponse;)V
    .locals 5

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/CloudControlResponse;->getFeatureProfiles()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/CloudControlResponse;->getFeatureProfiles()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloudcontrol/FeatureProfile;

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->insertToCache(Lcom/miui/gallery/cloudcontrol/FeatureProfile;)V

    iget-object v3, p0, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->mContext:Landroid/content/Context;

    invoke-static {v3, v2}, Lcom/miui/gallery/cloudcontrol/CloudControlDBHelper;->tryInsertToDB(Landroid/content/Context;Lcom/miui/gallery/cloudcontrol/FeatureProfile;)I

    move-result v3

    if-nez v3, :cond_0

    const/4 v0, 0x1

    const-string v3, "CloudControlRequestHelper"

    const-string v4, "Persist error: %s"

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v4, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    if-eqz v0, :cond_2

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v0

    const-string v1, "response"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "cloud_control"

    const-string v2, "cloud_control_persist_error"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_2
    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/CloudControlResponse;->getSyncToken()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/CloudControlResponse;->getSyncToken()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$CloudControl;->setSyncToken(Ljava/lang/String;)V

    :cond_3
    return-void
.end method


# virtual methods
.method public execRequestSync()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->execRequestSync(Z)Z

    move-result v0

    return v0
.end method

.method public execRequestSync(Z)Z
    .locals 3

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->execRequestSyncInternal(Z)Z

    move-result p1

    if-eqz p1, :cond_0

    :try_start_0
    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->doPostJobs()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CloudControlRequestHelper"

    const-string v2, "Error occurred while executing post cloud control request job, %s"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    :goto_0
    return p1
.end method
