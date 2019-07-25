.class public abstract Lcom/miui/gallery/editor/photo/core/imports/net/BaseResourceRequest;
.super Lcom/miui/gallery/net/BaseGalleryRequest;
.source "BaseResourceRequest.java"


# direct methods
.method public constructor <init>()V
    .locals 4

    const-string v0, "https://i.mi.com/gallery/public/resource/info"

    const/4 v1, 0x0

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/net/BaseGalleryRequest;-><init>(ILjava/lang/String;)V

    const-string v0, "id"

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/net/BaseResourceRequest;->getParentId()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/net/BaseResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/net/base/BaseRequest;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/net/BaseResourceRequest;->setUseCache(Z)Lcom/miui/gallery/net/base/BaseRequest;

    const-wide v0, 0x9a7ec800L

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/net/BaseResourceRequest;->setCacheExpires(J)Lcom/miui/gallery/net/base/BaseRequest;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0x5265c00

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/net/BaseResourceRequest;->setCacheSoftTtl(J)Lcom/miui/gallery/net/base/BaseRequest;

    return-void
.end method

.method private filterJsonString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, ""

    return-object p1

    :cond_0
    const-string v0, "\"{"

    const-string v1, "{"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "}\""

    const-string v1, "}"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "\\"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method protected abstract getParentId()J
.end method

.method protected onRequestSuccess(Lorg/json/JSONObject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "galleryResourceInfoList"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/net/BaseResourceRequest;->filterJsonString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "expireAt"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-eqz p1, :cond_0

    invoke-virtual {p0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/net/BaseResourceRequest;->setCacheSoftTtl(J)Lcom/miui/gallery/net/base/BaseRequest;

    :cond_0
    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/net/BaseResourceRequest$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/core/imports/net/BaseResourceRequest$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/net/BaseResourceRequest;)V

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/net/BaseResourceRequest$1;->getType()Ljava/lang/reflect/Type;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/GsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/net/BaseResourceRequest;->deliverResponse([Ljava/lang/Object;)V

    return-void
.end method
