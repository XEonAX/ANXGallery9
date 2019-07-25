.class public Lcom/miui/gallery/cloudcontrol/CloudControlRequest;
.super Lcom/miui/gallery/net/BaseGalleryRequest;
.source "CloudControlRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;
    }
.end annotation


# direct methods
.method private constructor <init>(Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;)V
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;->getMethod()I

    move-result v0

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/net/BaseGalleryRequest;-><init>(ILjava/lang/String;)V

    const-string v0, "data"

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;->getDataParam()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest;->ensureNotNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/net/base/BaseRequest;

    const-string v0, "syncToken"

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;->getSyncToken()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest;->ensureNotNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/net/base/BaseRequest;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;Lcom/miui/gallery/cloudcontrol/CloudControlRequest$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest;-><init>(Lcom/miui/gallery/cloudcontrol/CloudControlRequest$Builder;)V

    return-void
.end method

.method static synthetic access$000()V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest;->reportImeiIsNull()V

    return-void
.end method

.method private ensureNotNull(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    return-object p1
.end method

.method private static reportImeiIsNull()V
    .locals 7

    const-string v0, "cloud_control"

    const-string v1, "imei_is_null"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%s_%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    sget-object v5, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected onRequestSuccess(Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cloudcontrol/CloudControlRequest$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest$1;-><init>(Lcom/miui/gallery/cloudcontrol/CloudControlRequest;)V

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/CloudControlResponse;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-virtual {p0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest;->deliverResponse([Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/gson/JsonParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    sget-object v1, Lcom/miui/gallery/net/base/ErrorCode;->HANDLE_ERROR:Lcom/miui/gallery/net/base/ErrorCode;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0, p1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest;->deliverError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Lcom/google/gson/JsonParseException;->printStackTrace()V

    sget-object v1, Lcom/miui/gallery/net/base/ErrorCode;->PARSE_ERROR:Lcom/miui/gallery/net/base/ErrorCode;

    invoke-virtual {v0}, Lcom/google/gson/JsonParseException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0, p1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequest;->deliverError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
