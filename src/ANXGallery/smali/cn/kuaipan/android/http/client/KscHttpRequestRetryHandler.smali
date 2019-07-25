.class public Lcn/kuaipan/android/http/client/KscHttpRequestRetryHandler;
.super Ljava/lang/Object;
.source "KscHttpRequestRetryHandler.java"

# interfaces
.implements Lorg/apache/http/client/HttpRequestRetryHandler;


# instance fields
.field private final errorTimeOut:I

.field private final requestSentRetryEnabled:Z

.field private final retryCount:I


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-direct {p0, v1, v0, v0}, Lcn/kuaipan/android/http/client/KscHttpRequestRetryHandler;-><init>(IZI)V

    return-void
.end method

.method public constructor <init>(IZI)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcn/kuaipan/android/http/client/KscHttpRequestRetryHandler;->retryCount:I

    iput-boolean p2, p0, Lcn/kuaipan/android/http/client/KscHttpRequestRetryHandler;->requestSentRetryEnabled:Z

    iput p3, p0, Lcn/kuaipan/android/http/client/KscHttpRequestRetryHandler;->errorTimeOut:I

    return-void
.end method


# virtual methods
.method public retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z
    .locals 9

    if-eqz p1, :cond_c

    if-eqz p3, :cond_b

    iget v0, p0, Lcn/kuaipan/android/http/client/KscHttpRequestRetryHandler;->retryCount:I

    const/4 v1, 0x0

    if-le p2, v0, :cond_0

    return v1

    :cond_0
    instance-of p2, p1, Lorg/apache/http/NoHttpResponseException;

    const/4 v0, 0x1

    if-eqz p2, :cond_1

    return v0

    :cond_1
    instance-of p2, p1, Ljava/io/InterruptedIOException;

    if-eqz p2, :cond_2

    return v1

    :cond_2
    instance-of p2, p1, Ljava/net/UnknownHostException;

    if-eqz p2, :cond_3

    return v1

    :cond_3
    instance-of p2, p1, Ljavax/net/ssl/SSLHandshakeException;

    if-eqz p2, :cond_4

    return v1

    :cond_4
    const-string p2, "http.request_sent"

    invoke-interface {p3, p2}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    const-string v2, "ksc.connect_start"

    invoke-interface {p3, v2}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    const-string v3, "http.request"

    invoke-interface {p3, v3}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/impl/client/RequestWrapper;

    const-string v4, "ksc.connect_redirector"

    invoke-interface {p3, v4}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcn/kuaipan/android/http/client/URIRedirector;

    if-eqz p2, :cond_5

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_5

    const/4 p2, 0x1

    goto :goto_0

    :cond_5
    const/4 p2, 0x0

    :goto_0
    if-eqz v2, :cond_6

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    goto :goto_1

    :cond_6
    const-wide/16 v5, 0x0

    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    if-eqz p2, :cond_9

    iget-boolean p2, p0, Lcn/kuaipan/android/http/client/KscHttpRequestRetryHandler;->requestSentRetryEnabled:Z

    if-eqz p2, :cond_7

    invoke-virtual {v3}, Lorg/apache/http/impl/client/RequestWrapper;->isRepeatable()Z

    move-result p2

    if-nez p2, :cond_9

    :cond_7
    instance-of p1, p1, Ljava/net/SocketException;

    if-eqz p1, :cond_8

    sub-long/2addr v7, v5

    iget p1, p0, Lcn/kuaipan/android/http/client/KscHttpRequestRetryHandler;->errorTimeOut:I

    int-to-long p1, p1

    cmp-long v2, v7, p1

    if-gtz v2, :cond_8

    goto :goto_2

    :cond_8
    return v1

    :cond_9
    :goto_2
    if-eqz v4, :cond_a

    invoke-interface {v4, p3}, Lcn/kuaipan/android/http/client/URIRedirector;->redirect(Lorg/apache/http/protocol/HttpContext;)Z

    move-result p1

    return p1

    :cond_a
    return v0

    :cond_b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "HTTP context may not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_c
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Exception parameter may not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
