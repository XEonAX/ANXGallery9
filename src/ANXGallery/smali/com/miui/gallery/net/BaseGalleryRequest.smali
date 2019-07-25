.class public Lcom/miui/gallery/net/BaseGalleryRequest;
.super Lcom/miui/gallery/net/json/BaseJsonRequest;
.source "BaseGalleryRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/net/json/BaseJsonRequest<",
        "Lcom/miui/gallery/net/GalleryResponse;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/net/json/BaseJsonRequest;-><init>(ILjava/lang/String;)V

    return-void
.end method

.method private checkExecuteCondition()Z
    .locals 4

    invoke-static {}, Lcom/miui/gallery/preference/BaseGalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/net/base/ErrorCode;->NETWORK_NOT_CONNECTED:Lcom/miui/gallery/net/base/ErrorCode;

    const-string v3, "CTA not confirmed."

    invoke-virtual {p0, v0, v3, v2}, Lcom/miui/gallery/net/BaseGalleryRequest;->handleError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    return v1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/net/BaseGalleryRequest;->isUseCache()Z

    move-result v0

    const/4 v3, 0x1

    if-eqz v0, :cond_1

    return v3

    :cond_1
    invoke-static {}, Lcom/miui/gallery/util/BaseNetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lcom/miui/gallery/net/base/ErrorCode;->NETWORK_NOT_CONNECTED:Lcom/miui/gallery/net/base/ErrorCode;

    const-string v3, "Network not connected."

    invoke-virtual {p0, v0, v3, v2}, Lcom/miui/gallery/net/BaseGalleryRequest;->handleError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    return v1

    :cond_2
    return v3
.end method


# virtual methods
.method public final execute()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/net/BaseGalleryRequest;->checkExecuteCondition()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-super {p0}, Lcom/miui/gallery/net/json/BaseJsonRequest;->execute()V

    :cond_0
    return-void
.end method

.method public final executeSync()[Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/miui/gallery/net/base/RequestError;
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/net/BaseGalleryRequest;->checkExecuteCondition()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-super {p0}, Lcom/miui/gallery/net/json/BaseJsonRequest;->executeSync()[Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/net/BaseGalleryRequest;->mRequestError:Lcom/miui/gallery/net/base/RequestError;

    throw v0
.end method

.method protected bridge synthetic handleResponse(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/net/BaseGalleryRequest;->handleResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method protected final handleResponse(Lorg/json/JSONObject;)V
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    :try_start_0
    const-string v1, "code"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "code"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    sget-object v2, Lcom/miui/gallery/net/base/ErrorCode;->SUCCESS:Lcom/miui/gallery/net/base/ErrorCode;

    iget v2, v2, Lcom/miui/gallery/net/base/ErrorCode;->CODE:I

    if-ne v1, v2, :cond_1

    const-string v1, "data"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v0, Lcom/miui/gallery/net/base/ErrorCode;->BODY_EMPTY:Lcom/miui/gallery/net/base/ErrorCode;

    const-string v1, "response empty data"

    invoke-virtual {p0, v0, v1, p1}, Lcom/miui/gallery/net/BaseGalleryRequest;->handleError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_0
    new-instance v1, Lcom/miui/gallery/net/GalleryResponse;

    invoke-direct {v1}, Lcom/miui/gallery/net/GalleryResponse;-><init>()V

    const-string v2, "data"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    iput-object v2, v1, Lcom/miui/gallery/net/GalleryResponse;->data:Lorg/json/JSONObject;

    const-string v2, "syncTag"

    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/miui/gallery/net/GalleryResponse;->syncTag:Ljava/lang/String;

    const-string v2, "syncToken"

    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/miui/gallery/net/GalleryResponse;->syncToken:Ljava/lang/String;

    const-string v0, "lastPage"

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, v1, Lcom/miui/gallery/net/GalleryResponse;->isLastPage:Z

    invoke-virtual {p0, v1}, Lcom/miui/gallery/net/BaseGalleryRequest;->onRequestSuccess(Lcom/miui/gallery/net/GalleryResponse;)V

    goto :goto_1

    :cond_1
    const-string v0, "description"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/net/base/ErrorCode;->SERVER_ERROR:Lcom/miui/gallery/net/base/ErrorCode;

    invoke-virtual {p0, v1, v0, p1}, Lcom/miui/gallery/net/BaseGalleryRequest;->handleError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :cond_2
    sget-object p1, Lcom/miui/gallery/net/base/ErrorCode;->PARSE_ERROR:Lcom/miui/gallery/net/base/ErrorCode;

    const-string v1, "response has no code"

    invoke-virtual {p0, p1, v1, v0}, Lcom/miui/gallery/net/BaseGalleryRequest;->handleError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :goto_0
    sget-object v0, Lcom/miui/gallery/net/base/ErrorCode;->HANDLE_ERROR:Lcom/miui/gallery/net/base/ErrorCode;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1, p1}, Lcom/miui/gallery/net/BaseGalleryRequest;->handleError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_1
    return-void
.end method

.method public onRequestError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/net/BaseGalleryRequest;->deliverError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "BaseGalleryRequest"

    const-string v1, "%s onRequestError:%s | %s "

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    instance-of p1, p3, Ljava/lang/Throwable;

    if-eqz p1, :cond_0

    const-string p1, "BaseGalleryRequest"

    check-cast p3, Ljava/lang/Throwable;

    invoke-static {p1, p3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    if-eqz p3, :cond_1

    const-string p1, "BaseGalleryRequest"

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected onRequestSuccess(Lcom/miui/gallery/net/GalleryResponse;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object p1, p1, Lcom/miui/gallery/net/GalleryResponse;->data:Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/net/BaseGalleryRequest;->onRequestSuccess(Lorg/json/JSONObject;)V

    return-void
.end method

.method protected onRequestSuccess(Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    return-void
.end method
