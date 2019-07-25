.class public Lcn/kuaipan/android/http/KscHttpResponse;
.super Ljava/lang/Object;
.source "KscHttpResponse.java"


# instance fields
.field private final mCache:Lcn/kuaipan/android/http/NetCacheManager;

.field private mError:Ljava/lang/Throwable;

.field private mMessages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/apache/http/HttpMessage;",
            ">;"
        }
    .end annotation
.end field

.field private mOrigRequest:Lorg/apache/http/client/methods/HttpUriRequest;

.field private mResponse:Lorg/apache/http/HttpResponse;


# direct methods
.method public constructor <init>(Lcn/kuaipan/android/http/NetCacheManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mCache:Lcn/kuaipan/android/http/NetCacheManager;

    return-void
.end method


# virtual methods
.method public dump()Ljava/lang/String;
    .locals 7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mMessages:Ljava/util/List;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mMessages:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v3, 0x0

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/HttpMessage;

    instance-of v5, v4, Lorg/apache/http/HttpRequest;

    if-eqz v5, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[Request "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v3, 0x1

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "]\n"

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    check-cast v4, Lorg/apache/http/HttpRequest;

    invoke-static {v4}, Lcn/kuaipan/android/utils/HttpUtils;->toString(Lorg/apache/http/HttpRequest;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuilder;

    move v3, v6

    goto :goto_0

    :cond_1
    instance-of v5, v4, Lorg/apache/http/HttpResponse;

    if-eqz v5, :cond_0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[Response "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v2, 0x1

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]\n"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    check-cast v4, Lorg/apache/http/HttpResponse;

    invoke-static {v4}, Lcn/kuaipan/android/utils/HttpUtils;->toString(Lorg/apache/http/HttpResponse;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuilder;

    move v2, v6

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-gtz v1, :cond_3

    const-string v1, "[Origin Request]\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mOrigRequest:Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-static {v1}, Lcn/kuaipan/android/utils/HttpUtils;->toString(Lorg/apache/http/HttpRequest;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuilder;

    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\n[Response "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mResponse:Lorg/apache/http/HttpResponse;

    invoke-static {v1}, Lcn/kuaipan/android/utils/HttpUtils;->toString(Lorg/apache/http/HttpResponse;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mError:Ljava/lang/Throwable;

    if-eqz v1, :cond_4

    const-string v1, "\n[Error]\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mError:Ljava/lang/Throwable;

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "password=.*&"

    const-string v2, "password=[secData]&"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContent()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mResponse:Lorg/apache/http/HttpResponse;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mResponse:Lorg/apache/http/HttpResponse;

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    :goto_0
    if-nez v0, :cond_1

    return-object v1

    :cond_1
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v2

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentEncoding()Lorg/apache/http/Header;

    move-result-object v0

    if-nez v0, :cond_2

    goto :goto_1

    :cond_2
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    :goto_1
    if-eqz v1, :cond_3

    const-string v0, "gzip"

    invoke-virtual {v1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v0, v2}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_2

    :cond_3
    move-object v0, v2

    :goto_2
    return-object v0
.end method

.method public getError()Ljava/lang/Throwable;
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mError:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getResponse()Lorg/apache/http/HttpResponse;
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mResponse:Lorg/apache/http/HttpResponse;

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mResponse:Lorg/apache/http/HttpResponse;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mResponse:Lorg/apache/http/HttpResponse;

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method handleResponse(Lcn/kuaipan/android/http/KscHttpRequest;Lorg/apache/http/HttpResponse;Z)V
    .locals 1

    invoke-virtual {p1}, Lcn/kuaipan/android/http/KscHttpRequest;->getRequest()Lorg/apache/http/client/methods/HttpUriRequest;

    move-result-object v0

    iput-object v0, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mOrigRequest:Lorg/apache/http/client/methods/HttpUriRequest;

    iput-object p2, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mResponse:Lorg/apache/http/HttpResponse;

    invoke-virtual {p1}, Lcn/kuaipan/android/http/KscHttpRequest;->getDecoder()Lcn/kuaipan/android/http/IKscDecoder;

    move-result-object p1

    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    if-eqz v0, :cond_1

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mCache:Lcn/kuaipan/android/http/NetCacheManager;

    invoke-static {v0, p1, p3}, Lcn/kuaipan/android/http/KscHttpEntity;->getRepeatableEntity(Lorg/apache/http/HttpEntity;Lcn/kuaipan/android/http/IKscDecoder;Lcn/kuaipan/android/http/NetCacheManager;)Lcn/kuaipan/android/http/KscHttpEntity;

    move-result-object p1

    invoke-interface {p2, p1}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_1

    new-instance p3, Lcn/kuaipan/android/http/KscHttpEntity;

    invoke-direct {p3, v0, p1}, Lcn/kuaipan/android/http/KscHttpEntity;-><init>(Lorg/apache/http/HttpEntity;Lcn/kuaipan/android/http/IKscDecoder;)V

    invoke-interface {p2, p3}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public release()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mResponse:Lorg/apache/http/HttpResponse;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mResponse:Lorg/apache/http/HttpResponse;

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mResponse:Lorg/apache/http/HttpResponse;

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    iput-object v0, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mResponse:Lorg/apache/http/HttpResponse;

    goto :goto_2

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    const-string v2, "KscHttpResponse"

    const-string v3, "Meet exception when release a KscHttpResponse."

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_1
    move-exception v1

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    iput-object v0, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mResponse:Lorg/apache/http/HttpResponse;

    throw v1

    :cond_0
    :goto_2
    return-void
.end method

.method setError(Ljava/lang/Throwable;)V
    .locals 0

    iput-object p1, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mError:Ljava/lang/Throwable;

    return-void
.end method

.method setMessage(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/apache/http/HttpMessage;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mMessages:Ljava/util/List;

    return-void
.end method

.method setOrigRequest(Lorg/apache/http/client/methods/HttpUriRequest;)V
    .locals 0

    iput-object p1, p0, Lcn/kuaipan/android/http/KscHttpResponse;->mOrigRequest:Lorg/apache/http/client/methods/HttpUriRequest;

    return-void
.end method
