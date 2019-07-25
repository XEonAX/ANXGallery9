.class public Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;
.super Lcom/miui/gallery/net/BaseGalleryRequest;
.source "ServerSearchRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;,
        Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;
    }
.end annotation


# instance fields
.field private mReportError:Z

.field private mRequestCreateTime:J

.field private mResponseResult:Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;)V
    .locals 3

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->getMethod()I

    move-result v0

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->getQueryPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/net/BaseGalleryRequest;-><init>(ILjava/lang/String;)V

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->getUserId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, "userId"

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->getUserId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/net/base/BaseRequest;

    :cond_0
    const-string v0, "clientVersion"

    invoke-static {}, Lcom/miui/gallery/util/MiscUtil;->getAppVersionCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/net/base/BaseRequest;

    const-string v0, "language"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/net/base/BaseRequest;

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->getQueryParams()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->getQueryParams()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/net/base/BaseRequest;

    goto :goto_0

    :cond_1
    invoke-static {p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->access$000(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;)Lcom/miui/gallery/net/base/ResponseListener;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->setOnResponseListener(Lcom/miui/gallery/net/base/ResponseListener;)Lcom/miui/gallery/net/base/BaseRequest;

    invoke-static {p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->access$100(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->setUseCache(Z)Lcom/miui/gallery/net/base/BaseRequest;

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->reportError()Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->mReportError:Z

    new-instance v0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;

    invoke-static {p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->access$200(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;)Ljava/lang/reflect/Type;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;-><init>(Ljava/lang/reflect/Type;)V

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->mResponseResult:Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->mRequestCreateTime:J

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;-><init>(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;)V

    return-void
.end method


# virtual methods
.method protected deliverError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->mReportError:Z

    if-eqz v0, :cond_0

    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/search/core/source/server/HttpUtils;->reportRequestError(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/net/BaseGalleryRequest;->deliverError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method protected varargs deliverResponse([Ljava/lang/Object;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/net/BaseGalleryRequest;->deliverResponse([Ljava/lang/Object;)V

    return-void
.end method

.method public getResponseData()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->mResponseResult:Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->getData()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getResponseRawData()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->mResponseResult:Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->getRawData()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onRequestError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->deliverError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method protected onRequestSuccess(Lorg/json/JSONObject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-super {p0, p1}, Lcom/miui/gallery/net/BaseGalleryRequest;->onRequestSuccess(Lorg/json/JSONObject;)V

    iget-wide v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->mRequestCreateTime:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->mReportError:Z

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->mRequestCreateTime:J

    sub-long/2addr v0, v2

    invoke-static {p0, v0, v1}, Lcom/miui/gallery/search/core/source/server/HttpUtils;->reportTimeoutIfNeeded(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;J)V

    :cond_0
    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->mResponseResult:Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->setData(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->mResponseResult:Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->getData()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->mResponseResult:Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->getData()Ljava/lang/Object;

    move-result-object p1

    instance-of p1, p1, Lcom/miui/gallery/search/core/source/server/Cacheable;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->mResponseResult:Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->getData()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/search/core/source/server/Cacheable;

    invoke-interface {p1}, Lcom/miui/gallery/search/core/source/server/Cacheable;->getExpireMills()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->setCacheExpires(J)Lcom/miui/gallery/net/base/BaseRequest;

    const-string p1, "ServerSearchRequest"

    const-string v0, "set expire time %dms for request %s"

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->mResponseResult:Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;

    invoke-virtual {v1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->getData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/search/core/source/server/Cacheable;

    invoke-interface {v1}, Lcom/miui/gallery/search/core/source/server/Cacheable;->getExpireMills()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v0, v1, v2}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->mResponseResult:Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;

    invoke-virtual {v1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$ResponseResult;->getData()Ljava/lang/Object;

    move-result-object v1

    aput-object v1, p1, v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->deliverResponse([Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    sget-object p1, Lcom/miui/gallery/net/base/ErrorCode;->BODY_EMPTY:Lcom/miui/gallery/net/base/ErrorCode;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->deliverError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
