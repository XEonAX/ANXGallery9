.class Lcom/miui/gallery/net/GalleryNetwork;
.super Lcom/android/volley/toolbox/BasicNetwork;
.source "GalleryNetwork.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    new-instance v0, Lcom/android/volley/toolbox/HurlStack;

    invoke-direct {v0}, Lcom/android/volley/toolbox/HurlStack;-><init>()V

    invoke-direct {p0, v0}, Lcom/android/volley/toolbox/BasicNetwork;-><init>(Lcom/android/volley/toolbox/BaseHttpStack;)V

    return-void
.end method


# virtual methods
.method public performRequest(Lcom/android/volley/Request;)Lcom/android/volley/NetworkResponse;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;)",
            "Lcom/android/volley/NetworkResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/VolleyError;
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/BaseNetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Lcom/android/volley/Request;->getMethod()I

    move-result v0

    const/16 v1, 0x3e9

    if-lt v0, v1, :cond_3

    :try_start_0
    instance-of v2, p1, Lcom/miui/gallery/net/json/JsonObjectRequest;

    if-eqz v2, :cond_2

    move-object v2, p1

    check-cast v2, Lcom/miui/gallery/net/json/JsonObjectRequest;

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/android/volley/Request;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2}, Lcom/miui/gallery/net/json/JsonObjectRequest;->getParams()Ljava/util/Map;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/xiaomi/micloudsdk/request/utils/Request;->secureGet(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/16 v1, 0x3ea

    if-ne v0, v1, :cond_1

    invoke-virtual {p1}, Lcom/android/volley/Request;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2}, Lcom/miui/gallery/net/json/JsonObjectRequest;->getParams()Ljava/util/Map;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/xiaomi/micloudsdk/request/utils/Request;->securePost(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    new-instance v0, Lcom/android/volley/NetworkResponse;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/android/volley/NetworkResponse;-><init>([B)V

    return-object v0

    :cond_1
    new-instance p1, Lcom/android/volley/VolleyError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No such method "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/android/volley/VolleyError;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Lcom/android/volley/VolleyError;

    const-string v0, "Not support this request type"

    invoke-direct {p1, v0}, Lcom/android/volley/VolleyError;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Lcom/xiaomi/micloudsdk/exception/CloudServerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    new-instance v0, Lcom/android/volley/VolleyError;

    invoke-direct {v0, p1}, Lcom/android/volley/VolleyError;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :catch_1
    move-exception p1

    new-instance v0, Lcom/android/volley/VolleyError;

    invoke-direct {v0, p1}, Lcom/android/volley/VolleyError;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :cond_3
    invoke-super {p0, p1}, Lcom/android/volley/toolbox/BasicNetwork;->performRequest(Lcom/android/volley/Request;)Lcom/android/volley/NetworkResponse;

    move-result-object p1

    return-object p1

    :cond_4
    new-instance p1, Lcom/miui/gallery/net/base/RequestError;

    sget-object v0, Lcom/miui/gallery/net/base/ErrorCode;->NETWORK_NOT_CONNECTED:Lcom/miui/gallery/net/base/ErrorCode;

    const/4 v1, 0x0

    const-string v2, "Network not connected."

    invoke-direct {p1, v0, v2, v1}, Lcom/miui/gallery/net/base/RequestError;-><init>(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    throw p1
.end method
