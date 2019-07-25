.class public Lcom/miui/gallery/cloud/CheckResult;
.super Ljava/lang/Object;
.source "CheckResult.java"


# direct methods
.method private static checkErrorCode(ILorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestItemBase;Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;)Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    if-nez p0, :cond_1

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string p2, "function"

    const-string p3, "checkErrorCode"

    invoke-interface {p0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "unknow error"

    if-nez p1, :cond_0

    const-string p3, "null"

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p3

    :goto_0
    invoke-interface {p0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "Sync"

    const-string p3, "check_result"

    invoke-static {p2, p3, p0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    sget-object p0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;->errorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;->errorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-interface {v1, p1, p2, p3}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;->onError(Lorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestItemBase;Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;)V

    :cond_2
    const-string p2, "data"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    if-eqz p2, :cond_3

    const-string p3, "retryAfter"

    invoke-virtual {p2, p3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_3

    const-string p3, "retryAfter"

    invoke-static {p2, p3}, Lcom/miui/gallery/cloud/CloudUtils;->getLongAttributeFromJson(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide p2

    invoke-virtual {v0, p2, p3}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setRetryAfter(J)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    :cond_3
    iget-object p0, p0, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;->result:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    :goto_1
    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setData(Ljava/lang/Object;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p0

    return-object p0
.end method

.method public static checkKSSThumbnailResult(I)Lcom/miui/gallery/cloud/base/GallerySyncCode;
    .locals 1

    const/16 v0, 0x194

    if-eq p0, v0, :cond_0

    const/16 v0, 0x204

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    sget-object p0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    return-object p0

    :cond_0
    :pswitch_0
    sget-object p0, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x207
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static checkXMResultCode(Lorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestItemBase;Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;)Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Lcom/miui/gallery/cloud/RequestItemBase;",
            "Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;",
            ")",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    if-nez p0, :cond_0

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p2, "function"

    const-string v1, "checkXMResultCode"

    invoke-interface {p1, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "message"

    const-string v1, "result is null"

    invoke-interface {p1, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "Sync"

    const-string v1, "check_result"

    invoke-static {p2, v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    goto :goto_0

    :cond_0
    const-string v1, "code"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p2, "function"

    const-string v1, "checkXMResultCode"

    invoke-interface {p1, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "message"

    const-string v1, "result has no code"

    invoke-interface {p1, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "Sync"

    const-string v1, "check_result"

    invoke-static {p2, v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    const-wide/16 v1, 0x0

    invoke-virtual {p1, v1, v2}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setRetryAfter(J)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    goto :goto_0

    :cond_1
    const-string v1, "code"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1, p0, p1, p2}, Lcom/miui/gallery/cloud/CheckResult;->checkErrorCode(ILorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestItemBase;Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->clone(Lcom/miui/gallery/cloud/base/GallerySyncResult;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    :goto_0
    invoke-virtual {v0, p0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setData(Ljava/lang/Object;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p0

    return-object p0
.end method

.method public static checkXMResultCodeForFaceRequest(Lorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestItemBase;)Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Lcom/miui/gallery/cloud/RequestItemBase;",
            ")",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    if-nez p0, :cond_0

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    goto :goto_0

    :cond_0
    const-string v1, "code"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    goto :goto_0

    :cond_1
    const-string v1, "code"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    const v2, 0xcb20

    if-ne v1, v2, :cond_2

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RESET_FACE_TAG:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    invoke-static {v1, p0, p1, v2}, Lcom/miui/gallery/cloud/CheckResult;->checkErrorCode(ILorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestItemBase;Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->clone(Lcom/miui/gallery/cloud/base/GallerySyncResult;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    :goto_0
    invoke-virtual {v0, p0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setData(Ljava/lang/Object;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p0

    return-object p0
.end method

.method public static isNotRetryCode(I)Z
    .locals 1

    div-int/lit8 p0, p0, 0x64

    const/4 v0, 0x4

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static parseErrorCode(Lorg/json/JSONObject;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    if-nez p0, :cond_0

    const/4 v0, -0x6

    goto :goto_0

    :cond_0
    const-string v0, "code"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    :goto_0
    if-eqz v0, :cond_2

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "function"

    const-string v3, "parseErrorCode"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "code"

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "message"

    if-nez p0, :cond_1

    const-string p0, "null"

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_1
    invoke-interface {v1, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "Sync"

    const-string v2, "check_result"

    invoke-static {p0, v2, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_2
    return v0
.end method
