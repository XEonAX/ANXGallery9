.class public Lcom/xiaomi/micloudsdk/request/utils/Request;
.super Ljava/lang/Object;
.source "Request.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;
    }
.end annotation


# static fields
.field private static sContext:Landroid/content/Context;

.field private static sRegion:Ljava/lang/String;

.field private static sRequestEnv:Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/xiaomi/micloudsdk/request/utils/DefaultRequestEnv;

    invoke-direct {v0}, Lcom/xiaomi/micloudsdk/request/utils/DefaultRequestEnv;-><init>()V

    sput-object v0, Lcom/xiaomi/micloudsdk/request/utils/Request;->sRequestEnv:Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;

    return-void
.end method

.method public static addFilterTagsToParams(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Set;J)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;J)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    move-object v0, p0

    move-object v1, p2

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {v5, v6, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface/range {p3 .. p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v9

    cmp-long v11, v9, p4

    if-gtz v11, :cond_2

    goto :goto_1

    :cond_2
    const/16 v9, 0x64

    if-ge v7, v9, :cond_4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    if-lez v10, :cond_3

    const-string v10, ","

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v7, v7, 0x1

    rem-int/lit8 v8, v7, 0xa

    if-eqz v8, :cond_4

    invoke-interface/range {p3 .. p3}, Ljava/util/Set;->size()I

    move-result v8

    if-eq v7, v8, :cond_4

    goto :goto_1

    :cond_4
    new-instance v8, Lorg/apache/http/message/BasicNameValuePair;

    const-string v10, "filterTag"

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    if-nez v11, :cond_5

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    goto :goto_2

    :cond_5
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v12, ","

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    :goto_2
    invoke-static {p0, p2, v11}, Lcom/xiaomi/micloudsdk/request/utils/CloudRequestHelper;->encodeData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v8, v10, v11}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v10, Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;->GET:Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;

    invoke-static {v10, p0, v2, p2}, Lcom/xiaomi/micloudsdk/request/utils/HttpUtils;->getSignature(Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Lorg/apache/http/message/BasicNameValuePair;

    const-string v12, "signature"

    invoke-direct {v11, v12, v10}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p0, v2}, Lcom/xiaomi/micloudsdk/request/utils/HttpUtils;->appendUrl(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    const/16 v8, 0x400

    if-lt v10, v8, :cond_6

    goto :goto_3

    :cond_6
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    if-lez v8, :cond_7

    const-string v8, ","

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_7
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    if-lt v7, v9, :cond_1

    :cond_8
    :goto_3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Request"

    const/4 v2, 0x3

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_9

    const-string v1, "Request"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The filterTag is :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_9
    const-string v1, "filterTag"

    move-object v2, p1

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static addSignatureParam(Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    invoke-static {p0, p1, p2, p3}, Lcom/xiaomi/micloudsdk/request/utils/HttpUtils;->getSignature(Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Lorg/apache/http/message/BasicNameValuePair;

    const-string p3, "signature"

    invoke-direct {p1, p3, p0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private static checkHostLocation(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/micloudsdk/exception/CloudServerException;
        }
    .end annotation

    sget-object v0, Lcom/xiaomi/micloudsdk/request/utils/RequestConstants$URL;->URL_RELOCATION_BASE:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->updateRequestHost(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method private static checkResponse(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    const-string v0, "Request"

    const-string v1, "checkResponse"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Lcom/xiaomi/micloudsdk/request/utils/Request;->isPrivacyError(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {p0}, Lcom/xiaomi/micloudsdk/provider/GdprUtils;->isGdprAvailable(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "Request"

    const-string v0, "notify privacy denied!"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0}, Lcom/xiaomi/micloudsdk/request/utils/Request;->notifyMiCloudPrivacyDenied(Landroid/content/Context;)V

    :cond_1
    return-void
.end method

.method private static encodeParameters(Lcom/xiaomi/micloudsdk/utils/CryptCoder;Ljava/lang/String;Ljava/util/Map;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/xiaomi/micloudsdk/utils/CryptCoder;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/micloudsdk/exception/CipherException;
        }
    .end annotation

    if-nez p2, :cond_0

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    :cond_0
    if-eqz p1, :cond_1

    const-string v0, "_nonce"

    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "_nonce"

    invoke-direct {v1, v2, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result p1

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    :goto_0
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map$Entry;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    if-eqz p2, :cond_2

    goto :goto_2

    :cond_2
    const-string p2, ""

    :goto_2
    invoke-interface {p0, p2}, Lcom/xiaomi/micloudsdk/utils/CryptCoder;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v2, v1, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v2, v1, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    return-object v0
.end method

.method private static execute(Ljava/lang/String;Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/xiaomi/micloudsdk/exception/CloudServerException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0}, Lcom/xiaomi/micloudsdk/request/utils/Request;->checkHostLocation(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v1, ""

    invoke-static {p0}, Lcom/xiaomi/micloudsdk/request/utils/CloudRequestHelper;->isV4Url(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    :goto_0
    const/4 v4, 0x2

    const/4 v5, 0x1

    if-ge v3, v4, :cond_8

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->queryAuthToken()Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;

    move-result-object v4

    iget-object v6, v4, Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;->security:Ljava/lang/String;

    invoke-static {p0, v6}, Lcom/xiaomi/micloudsdk/request/utils/CloudRequestHelper;->getCryptCoder(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/micloudsdk/utils/CryptCoder;

    move-result-object v6

    if-eqz v2, :cond_0

    invoke-static {}, Lcom/xiaomi/micloudsdk/utils/CloudCoder;->generateNonce()Ljava/lang/String;

    move-result-object v7
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    goto :goto_1

    :cond_0
    const/4 v7, 0x0

    :goto_1
    :try_start_1
    invoke-static {v6, v7, p2}, Lcom/xiaomi/micloudsdk/request/utils/Request;->encodeParameters(Lcom/xiaomi/micloudsdk/utils/CryptCoder;Ljava/lang/String;Ljava/util/Map;)Ljava/util/ArrayList;

    move-result-object v7
    :try_end_1
    .catch Lcom/xiaomi/micloudsdk/exception/CipherException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    :try_start_2
    iget-object v8, v4, Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;->security:Ljava/lang/String;

    invoke-static {p1, p0, v7, v8}, Lcom/xiaomi/micloudsdk/request/utils/Request;->addSignatureParam(Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    sget-object v8, Lcom/xiaomi/micloudsdk/request/utils/Request;->sRequestEnv:Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;

    invoke-interface {v8}, Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;->getAccountName()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lcom/xiaomi/micloudsdk/request/utils/Request;->sRequestEnv:Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;

    invoke-interface {v9}, Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;->queryEncryptedAccountName()Ljava/lang/String;

    move-result-object v9

    iget-object v4, v4, Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;->authToken:Ljava/lang/String;

    invoke-static {v8, v9, v4, p3}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getCookies(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lorg/apache/http/Header;

    move-result-object v4
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    :try_start_3
    sget-object v8, Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;->GET:Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;

    invoke-virtual {v8, p1}, Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-static {p0, v7}, Lcom/xiaomi/micloudsdk/request/utils/HttpUtils;->appendUrl(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v4, v6}, Lcom/xiaomi/micloudsdk/request/utils/CloudRequestHelper;->httpGetRequestWithDecodeData(Ljava/lang/String;Lorg/apache/http/Header;Lcom/xiaomi/micloudsdk/utils/CryptCoder;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_4

    :cond_1
    sget-object v8, Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;->POST:Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;

    invoke-virtual {v8, p1}, Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    new-instance v8, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v9, "UTF-8"

    invoke-direct {v8, v7, v9}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-static {p0, v8, v4, v6}, Lcom/xiaomi/micloudsdk/request/utils/CloudRequestHelper;->httpPostRequestWithDecodeData(Ljava/lang/String;Lorg/apache/http/client/entity/UrlEncodedFormEntity;Lorg/apache/http/Header;Lcom/xiaomi/micloudsdk/utils/CryptCoder;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_4

    :cond_2
    sget-object v8, Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;->POST_JSON:Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;

    invoke-virtual {v8, p1}, Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V
    :try_end_3
    .catch Lcom/xiaomi/micloudsdk/exception/CloudServerException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    const/4 v9, 0x0

    :goto_2
    :try_start_4
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v9, v10, :cond_3

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/apache/http/NameValuePair;

    invoke-interface {v10}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/apache/http/NameValuePair;

    invoke-interface {v11}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lcom/xiaomi/micloudsdk/exception/CloudServerException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    :cond_3
    :try_start_5
    new-instance v7, Lorg/apache/http/entity/StringEntity;

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "utf-8"

    invoke-direct {v7, v8, v9}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0, v7, v4, v6}, Lcom/xiaomi/micloudsdk/request/utils/CloudRequestHelper;->httpPostJSONRequestWithDecodeData(Ljava/lang/String;Lorg/apache/http/entity/StringEntity;Lorg/apache/http/Header;Lcom/xiaomi/micloudsdk/utils/CryptCoder;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_4

    :catch_0
    move-exception v4

    new-instance v6, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-virtual {v4}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v6, v0, v4}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(ILjava/lang/String;)V

    throw v6

    :cond_4
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v6, "http method not supported."

    invoke-direct {v4, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_5
    .catch Lcom/xiaomi/micloudsdk/exception/CloudServerException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    :catch_1
    move-exception v4

    :try_start_6
    const-string v6, "Request"

    const-string v7, "CloudServer Exception: "

    invoke-static {v6, v7, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {v4}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->getStatusCode()I

    move-result v6

    const/16 v7, 0x191

    if-ne v6, v7, :cond_7

    if-nez v3, :cond_5

    const-string v5, "Request"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "CloudServer 401 Exception: retry="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    sget-object v5, Lcom/xiaomi/micloudsdk/request/utils/Request;->sRequestEnv:Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;

    invoke-interface {v5}, Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;->invalidateAuthToken()V

    iget-wide v4, v4, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->serverDate:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const/4 v8, 0x0

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Lcom/xiaomi/micloudsdk/utils/CloudCoder;->setServerDateOffset(J)V

    goto :goto_3

    :cond_5
    if-eq v3, v5, :cond_6

    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :cond_6
    const-string p0, "Request"

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "CloudServer 401 Exception: retry="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    throw v4

    :cond_7
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v4}, Lcom/xiaomi/micloudsdk/request/utils/Request;->handleCloudServerException(Landroid/content/Context;Lcom/xiaomi/micloudsdk/exception/CloudServerException;)V

    throw v4

    :catch_2
    move-exception p0

    const-string p1, "Request"

    const-string p2, "CipherException"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance p1, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-virtual {p0}, Lcom/xiaomi/micloudsdk/exception/CipherException;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, v0, p0}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(ILjava/lang/String;)V

    throw p1

    :cond_8
    move-object v4, v1

    :goto_4
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v4}, Lcom/xiaomi/micloudsdk/request/utils/Request;->checkResponse(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v5}, Lcom/xiaomi/micloudsdk/request/utils/CloudNetworkAvailabilityManager;->setRequestResult(Landroid/content/Context;Z)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    return-object v4

    :catch_3
    move-exception p0

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v0}, Lcom/xiaomi/micloudsdk/request/utils/CloudNetworkAvailabilityManager;->setRequestResult(Landroid/content/Context;Z)V

    throw p0
.end method

.method public static getContext()Landroid/content/Context;
    .locals 2

    sget-object v0, Lcom/xiaomi/micloudsdk/request/utils/Request;->sContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/xiaomi/micloudsdk/request/utils/Request;->sContext:Landroid/content/Context;

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "sContext=null! Please call Request.init(Context) at Application onCreate"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static getCookies(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lorg/apache/http/Header;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/apache/http/Header;"
        }
    .end annotation

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "serviceToken="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_0

    const-string p2, "; cUserId="

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    if-eqz p3, :cond_3

    invoke-interface {p3}, Ljava/util/Map;->size()I

    move-result p1

    if-lez p1, :cond_3

    invoke-interface {p3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    const-string v0, "cUserId"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "userId"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "serviceToken"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_3
    new-instance p1, Lorg/apache/http/message/BasicHeader;

    const-string p2, "Cookie"

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p2, p0}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method

.method public static getRegion()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/xiaomi/micloudsdk/request/utils/Request;->sRegion:Ljava/lang/String;

    return-object v0
.end method

.method public static getRequestEnv()Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;
    .locals 1

    sget-object v0, Lcom/xiaomi/micloudsdk/request/utils/Request;->sRequestEnv:Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;

    return-object v0
.end method

.method private static handleCloudServerException(Landroid/content/Context;Lcom/xiaomi/micloudsdk/exception/CloudServerException;)V
    .locals 2

    iget v0, p1, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->code:I

    const/16 v1, 0x1f7

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->retryTime:I

    if-lez v0, :cond_0

    const-string v0, "com.xiaomi.action.DATA_IN_TRANSFER"

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "retryTime"

    iget p1, p1, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->retryTime:I

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.miui.cloudservice"

    invoke-virtual {v1, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0

    :cond_0
    iget p1, p1, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->code:I

    const v0, 0xcb23

    if-ne p1, v0, :cond_1

    invoke-static {p0}, Lcom/xiaomi/micloudsdk/provider/GdprUtils;->isGdprAvailable(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {p0}, Lcom/xiaomi/micloudsdk/request/utils/Request;->notifyMiCloudPrivacyDenied(Landroid/content/Context;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public static init(Landroid/content/Context;)V
    .locals 0

    sput-object p0, Lcom/xiaomi/micloudsdk/request/utils/Request;->sContext:Landroid/content/Context;

    return-void
.end method

.method private static isPrivacyError(Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "code"

    invoke-virtual {v1, p0, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const v1, 0xcb23

    if-ne p0, v1, :cond_0

    const/4 p0, 0x1

    return p0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_0
    return v0
.end method

.method private static notifyMiCloudPrivacyDenied(Landroid/content/Context;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.xiaomi.action.PRIVACY_DENIED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.miui.cloudservice"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "Request"

    const-string v0, "startservice error possibly due to backgroundservice limitation"

    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :goto_0
    return-void
.end method

.method public static queryAuthToken()Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/micloudsdk/exception/CloudServerException;
        }
    .end annotation

    sget-object v0, Lcom/xiaomi/micloudsdk/request/utils/Request;->sRequestEnv:Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;

    invoke-interface {v0}, Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;->queryAuthToken()Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    const/4 v1, 0x0

    const-string v2, "execute() : queryAuthToken == null"

    invoke-direct {v0, v1, v2}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(ILjava/lang/String;)V

    throw v0
.end method

.method public static secureGet(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;,
            Ljava/io/IOException;,
            Lcom/xiaomi/micloudsdk/exception/CloudServerException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/xiaomi/micloudsdk/request/utils/Request;->secureGet(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static secureGet(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;,
            Ljava/io/IOException;,
            Lcom/xiaomi/micloudsdk/exception/CloudServerException;
        }
    .end annotation

    sget-object v0, Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;->GET:Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;

    invoke-static {p0, v0, p1, p2}, Lcom/xiaomi/micloudsdk/request/utils/Request;->execute(Ljava/lang/String;Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static securePost(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;,
            Ljava/io/IOException;,
            Lcom/xiaomi/micloudsdk/exception/CloudServerException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/xiaomi/micloudsdk/request/utils/Request;->securePost(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static securePost(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;,
            Ljava/io/IOException;,
            Lcom/xiaomi/micloudsdk/exception/CloudServerException;
        }
    .end annotation

    sget-object v0, Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;->POST:Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;

    invoke-static {p0, v0, p1, p2}, Lcom/xiaomi/micloudsdk/request/utils/Request;->execute(Ljava/lang/String;Lcom/xiaomi/micloudsdk/request/utils/HttpUtils$HttpMethod;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static setRegion(Ljava/lang/String;)V
    .locals 0

    sput-object p0, Lcom/xiaomi/micloudsdk/request/utils/Request;->sRegion:Ljava/lang/String;

    return-void
.end method
