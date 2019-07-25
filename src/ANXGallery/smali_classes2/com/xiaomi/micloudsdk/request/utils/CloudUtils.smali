.class public Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;
.super Ljava/lang/Object;
.source "CloudUtils.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;
    }
.end annotation


# static fields
.field private static final SERVER_RETRY_INTERVALS:[I

.field private static final URL_RELOCATION_QUERY:Ljava/lang/String;

.field private static volatile sHostsCacheInner:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile sNeedUpdateHosts:Z

.field private static sUpdateMiCloudHostsLock:Ljava/lang/Object;

.field private static sUpdateStatus:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->SERVER_RETRY_INTERVALS:[I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/xiaomi/micloudsdk/request/utils/RequestConstants$URL;->URL_RELOCATION_BASE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/mic/relocation/v3/user/record"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->URL_RELOCATION_QUERY:Ljava/lang/String;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sHostsCacheInner:Ljava/util/Map;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sUpdateMiCloudHostsLock:Ljava/lang/Object;

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getHostList()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    sput-boolean v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sNeedUpdateHosts:Z

    return-void

    :array_0
    .array-data 4
        0x3e8
        0x7d0
        0x1388
        0x2710
    .end array-data
.end method

.method public static checkRedirect(Ljava/lang/String;I)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/micloudsdk/exception/CloudServerException;
        }
    .end annotation

    const/16 v0, 0x2732

    const/16 v1, 0x1f7

    const/16 v2, 0xf

    if-ge p1, v2, :cond_4

    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "code"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    const/16 v3, 0x134

    if-ne v2, v3, :cond_1

    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "isPermanent"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    sput-boolean v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sNeedUpdateHosts:Z

    :cond_0
    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "redirectUrl"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    const-string v2, "code"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v1, :cond_3

    const-string v2, "code"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v0, :cond_2

    goto :goto_0

    :cond_2
    const-string v2, "data"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v2, "retryAfter"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p1

    new-instance v2, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-direct {v2, v1, v0, p1}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(III)V

    throw v2

    :cond_3
    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "retryAfter"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p1

    new-instance v0, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-direct {v0, v1, v1, p1}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(III)V

    throw v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    const-string v0, "CloudUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "JSONException in checkRedirect():"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    const/4 p0, 0x0

    return-object p0

    :cond_4
    new-instance p0, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    const/16 p1, 0xa

    invoke-direct {p0, v1, v0, p1}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(III)V

    throw p0
.end method

.method private static getHostCache()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    sget-object v1, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sHostsCacheInner:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method private static getHostList()Ljava/lang/String;
    .locals 3

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getPersistHostsFromSp()Z

    move-result v0

    const/4 v1, 0x3

    if-eqz v0, :cond_1

    const-string v0, "CloudUtils"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "CloudUtils"

    const-string v1, "get hostlist from sp"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "pref_micloud_hosts_v2"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    const-string v0, "CloudUtils"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "CloudUtils"

    const-string v1, "get hostlist from settings"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "micloud_hosts_v2"

    invoke-static {v0, v1}, Lcom/xiaomi/micloudsdk/provider/MiCloudSettings;->getString(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getHostWithScheme(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    const-string v0, "CloudUtils"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "CloudUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Enter getHost key="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getHostCache()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    instance-of v3, v0, Ljava/lang/String;

    if-eqz v3, :cond_1

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_1
    move-object v0, v2

    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string p0, "CloudUtils"

    invoke-static {p0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_2

    const-string p0, "CloudUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Hit host cache directly return host = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    return-object v0

    :cond_3
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getHostList()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_5

    const-string p0, "CloudUtils"

    invoke-static {p0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_4

    const-string p0, "CloudUtils"

    const-string v0, "Hosts in SystemSettings/sp = null, return null"

    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    return-object v2

    :cond_5
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Lcom/xiaomi/micloudsdk/utils/JsonUtils;->jsonToMap(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v3

    invoke-static {v3}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->updateHostCache(Ljava/util/Map;)V

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getHostCache()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_6

    instance-of v3, p0, Ljava/lang/String;

    if-eqz v3, :cond_6

    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    :cond_6
    const-string p0, "CloudUtils"

    invoke-static {p0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_7

    const-string p0, "CloudUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "find host in SystemSettings/sp return host = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_7
    return-object v0

    :catch_0
    move-exception p0

    const-string v0, "CloudUtils"

    const-string v1, "JSONException in getHost, return null"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v2
.end method

.method private static getPersistHostsFromSp()Z
    .locals 3

    const-string v0, "true"

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "micloud_updatehosts_third_party"

    invoke-static {v1, v2}, Lcom/xiaomi/micloudsdk/provider/MiCloudSettings;->getString(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static getUserAgent()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getRequestEnv()Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;

    move-result-object v0

    invoke-interface {v0}, Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;->getUserAgent()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getXiaomiAccount()Landroid/accounts/Account;
    .locals 1

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v0

    return-object v0
.end method

.method public static getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;
    .locals 1

    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object p0

    const-string v0, "com.xiaomi"

    invoke-virtual {p0, v0}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object p0

    array-length v0, p0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    aget-object p0, p0, v0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method private static getXiaomiAccountName()Ljava/lang/String;
    .locals 3

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getPersistHostsFromSp()Z

    move-result v0

    const/4 v1, 0x3

    if-eqz v0, :cond_1

    const-string v0, "CloudUtils"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "CloudUtils"

    const-string v1, "get accountName from sp"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "pref_micloud_accountname_v2"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    const-string v0, "CloudUtils"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "CloudUtils"

    const-string v1, "get accountName from settings"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "micloud_accountname_v2"

    invoke-static {v0, v1}, Lcom/xiaomi/micloudsdk/provider/MiCloudSettings;->getString(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isInternationalAccount(Z)I
    .locals 5

    if-eqz p0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->updateHostCache(Ljava/util/Map;)V

    :cond_0
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getHostCache()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-eqz v0, :cond_1

    sput-boolean v1, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sNeedUpdateHosts:Z

    :try_start_0
    invoke-static {p0}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->updateMiCloudHosts(Z)V
    :try_end_0
    .catch Lcom/xiaomi/micloudsdk/exception/CloudServerException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getHostCache()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_1

    return v2

    :catch_0
    move-exception p0

    const-string v0, "CloudUtils"

    const-string v1, "CloudServerException in isInternationalAccount"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v2

    :cond_1
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getHostCache()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    instance-of v4, v0, Ljava/lang/String;

    if-nez v4, :cond_2

    goto :goto_0

    :cond_2
    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3

    goto :goto_0

    :cond_3
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    const/4 p0, 0x0

    return p0

    :cond_4
    return v1

    :cond_5
    return v2
.end method

.method private static setHostList(Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getPersistHostsFromSp()Z

    move-result v0

    const/4 v1, 0x3

    if-eqz v0, :cond_1

    const-string v0, "CloudUtils"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "CloudUtils"

    const-string v1, "set hostlist to sp"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "pref_micloud_hosts_v2"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0

    :cond_1
    const-string v0, "CloudUtils"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "CloudUtils"

    const-string v1, "set hostlist to settings"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "micloud_hosts_v2"

    invoke-static {v0, v1, p0}, Lcom/xiaomi/micloudsdk/provider/MiCloudSettings;->putString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    :goto_0
    return-void
.end method

.method private static setXiaomiAccountName(Ljava/lang/String;)V
    .locals 3

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getPersistHostsFromSp()Z

    move-result v0

    const/4 v1, 0x3

    if-eqz v0, :cond_1

    const-string v0, "CloudUtils"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "CloudUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "set accountName: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " to sp"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "pref_micloud_accountname_v2"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0

    :cond_1
    const-string v0, "CloudUtils"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "CloudUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "set accountName: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " to settings"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "micloud_accountname_v2"

    invoke-static {v0, v1, p0}, Lcom/xiaomi/micloudsdk/provider/MiCloudSettings;->putString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    :goto_0
    return-void
.end method

.method private static updateHostCache(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    sput-object v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sHostsCacheInner:Ljava/util/Map;

    return-void
.end method

.method private static updateMiCloudHosts(Z)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/micloudsdk/exception/CloudServerException;
        }
    .end annotation

    const-string v0, "CloudUtils"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "CloudUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "enter updateMiCloudHosts, sNeedUpdateHosts: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v2, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sNeedUpdateHosts:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getXiaomiAccountName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getXiaomiAccountName()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getRequestEnv()Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;

    move-result-object v2

    invoke-interface {v2}, Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;->getAccountName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sput-boolean v1, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sNeedUpdateHosts:Z

    :cond_1
    sget-boolean v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sNeedUpdateHosts:Z

    if-nez v0, :cond_2

    if-eqz p0, :cond_e

    :cond_2
    const/4 p0, 0x0

    :try_start_0
    sget-object v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sUpdateMiCloudHostsLock:Ljava/lang/Object;

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_6

    :goto_0
    const/4 v2, 0x1

    :goto_1
    :try_start_1
    sget-object v3, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sUpdateStatus:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    sget-object v4, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;->UPDATING:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    if-ne v3, v4, :cond_4

    const-string v2, "CloudUtils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Waiting for an existing updateMiCloudHosts to finish "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v2, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sUpdateMiCloudHostsLock:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V

    const-string v2, "CloudUtils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "The existing updateMiCloudHosts finished "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v2, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sUpdateStatus:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    sget-object v3, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;->SUCCESS:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    if-eq v2, v3, :cond_3

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    goto :goto_1

    :cond_4
    if-eqz v2, :cond_5

    sget-object v1, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;->UPDATING:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    sput-object v1, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sUpdateStatus:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    :cond_5
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    if-eqz v2, :cond_e

    :try_start_2
    const-string v0, "CloudUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateMiCloudHosts "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    const/4 v1, 0x0

    :try_start_3
    const-string v2, "miui.os.Build"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "getRegion"

    new-array v4, p0, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, p0, [Ljava/lang/Object;

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/xiaomi/micloudsdk/request/utils/Request;->setRegion(Ljava/lang/String;)V

    const-string v3, "romCountry"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_2

    :catch_0
    move-exception v2

    :try_start_4
    const-string v3, "CloudUtils"

    const-string v4, "Exception in updateMiCloudHosts()"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const-string v2, "romCountry"

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getRegion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2
    const-string v2, "romCountry"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_6

    const-string v2, "CloudUtils"

    const-string v3, "request romCountry null, thirdparty app"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "micloud_updatehosts_third_party"

    const-string v4, "true"

    invoke-static {v2, v3, v4}, Lcom/xiaomi/micloudsdk/provider/MiCloudSettings;->putString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_3

    :cond_6
    const-string v2, "CloudUtils"

    const-string v3, "request romCountry not null, system app"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "micloud_updatehosts_third_party"

    const-string v4, "false"

    invoke-static {v2, v3, v4}, Lcom/xiaomi/micloudsdk/provider/MiCloudSettings;->putString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    :goto_3
    const/4 v2, 0x0

    :goto_4
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    if-nez v3, :cond_d

    :try_start_5
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getRequestEnv()Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;

    move-result-object v3

    invoke-interface {v3}, Lcom/xiaomi/micloudsdk/request/utils/Request$RequestEnv;->getAccountName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljavax/crypto/BadPaddingException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    if-eqz v4, :cond_7

    :try_start_6
    sget-object v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sUpdateMiCloudHostsLock:Ljava/lang/Object;

    monitor-enter v0
    :try_end_6
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_6

    :try_start_7
    sget-object v1, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;->SUCCESS:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    sput-object v1, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sUpdateStatus:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    sget-object v1, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sUpdateMiCloudHostsLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :try_start_8
    throw v1
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_6

    :cond_7
    :try_start_9
    sget-object v4, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->URL_RELOCATION_QUERY:Ljava/lang/String;

    invoke-static {v4, v0}, Lcom/xiaomi/micloudsdk/request/utils/Request;->securePost(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v4, "code"

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_9

    const-string v4, "data"

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "hostList"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_8

    const-string v5, "CloudUtils"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "getHostList set sNeedUpdateHosts to false "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->setHostList(Ljava/lang/String;)V

    invoke-static {v4}, Lcom/xiaomi/micloudsdk/utils/JsonUtils;->jsonToMap(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v4

    invoke-static {v4}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->updateHostCache(Ljava/util/Map;)V

    sput-boolean p0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sNeedUpdateHosts:Z

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_8

    invoke-static {v3}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->setXiaomiAccountName(Ljava/lang/String;)V
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_5
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_9 .. :try_end_9} :catch_4
    .catch Ljavax/crypto/BadPaddingException; {:try_start_9 .. :try_end_9} :catch_3
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_9 .. :try_end_9} :catch_2
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :cond_8
    :try_start_a
    sget-object v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sUpdateMiCloudHostsLock:Ljava/lang/Object;

    monitor-enter v0
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_6

    :try_start_b
    sget-object v1, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;->SUCCESS:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    sput-object v1, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sUpdateStatus:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    sget-object v1, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sUpdateMiCloudHostsLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0

    goto/16 :goto_6

    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    :try_start_c
    throw v1
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_c} :catch_6

    :cond_9
    move-object v3, v1

    goto :goto_5

    :catch_1
    move-exception v3

    :try_start_d
    const-string v4, "CloudUtils"

    const-string v5, "IOException in updateMiCloudHosts"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/Request;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/xiaomi/micloudsdk/utils/NetworkUtils;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_c

    :goto_5
    sget-object v4, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->SERVER_RETRY_INTERVALS:[I

    array-length v4, v4

    if-ge v2, v4, :cond_a

    const-string v3, "CloudUtils"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Wait "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->SERVER_RETRY_INTERVALS:[I

    aget v5, v5, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " ms for retry"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v3, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->SERVER_RETRY_INTERVALS:[I

    aget v3, v3, v2

    int-to-long v3, v3

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_4

    :cond_a
    if-eqz v3, :cond_b

    new-instance v0, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-direct {v0, p0, v3}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(ILjava/lang/Throwable;)V

    throw v0

    :cond_b
    new-instance v0, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-direct {v0, p0}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(I)V

    throw v0

    :cond_c
    const-string v0, "CloudUtils"

    const-string v1, "No network in IOException"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-direct {v0, p0, v3}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(ILjava/lang/Throwable;)V

    throw v0

    :catch_2
    move-exception v0

    const-string v1, "CloudUtils"

    const-string v2, "ClientProtocolException in updateMiCloudHosts"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v1, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-direct {v1, p0, v0}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(ILjava/lang/Throwable;)V

    throw v1

    :catch_3
    move-exception v0

    const-string v1, "CloudUtils"

    const-string v2, "BadPaddingException in updateMiCloudHosts"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v1, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-direct {v1, p0, v0}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(ILjava/lang/Throwable;)V

    throw v1

    :catch_4
    move-exception v0

    const-string v1, "CloudUtils"

    const-string v2, "IllegalBlockSizeException in updateMiCloudHosts"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v1, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-direct {v1, p0, v0}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(ILjava/lang/Throwable;)V

    throw v1

    :catch_5
    move-exception v0

    const-string v1, "CloudUtils"

    const-string v2, "JSONException in updateMiCloudHosts"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v1, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-direct {v1, p0, v0}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(ILjava/lang/Throwable;)V

    throw v1

    :cond_d
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    :catchall_2
    move-exception v0

    :try_start_e
    sget-object v1, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sUpdateMiCloudHostsLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_e
    .catch Ljava/lang/InterruptedException; {:try_start_e .. :try_end_e} :catch_6

    :try_start_f
    sget-object v2, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;->FAILED:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    sput-object v2, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sUpdateStatus:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    sget-object v2, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->sUpdateMiCloudHostsLock:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    :try_start_10
    throw v0
    :try_end_10
    .catch Ljava/lang/InterruptedException; {:try_start_10 .. :try_end_10} :catch_6

    :catchall_3
    move-exception v0

    :try_start_11
    monitor-exit v1
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    :try_start_12
    throw v0
    :try_end_12
    .catch Ljava/lang/InterruptedException; {:try_start_12 .. :try_end_12} :catch_6

    :cond_e
    :goto_6
    return-void

    :catchall_4
    move-exception v1

    :try_start_13
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_4

    :try_start_14
    throw v1
    :try_end_14
    .catch Ljava/lang/InterruptedException; {:try_start_14 .. :try_end_14} :catch_6

    :catch_6
    move-exception v0

    const-string v1, "CloudUtils"

    const-string v2, "InterruptedException in updateMiCloudHosts"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v1, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-direct {v1, p0, v0}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(ILjava/lang/Throwable;)V

    throw v1
.end method

.method public static updateRequestHost(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/micloudsdk/exception/CloudServerException;
        }
    .end annotation

    invoke-static {p1}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->updateMiCloudHosts(Z)V

    :try_start_0
    const-string p1, "CloudUtils"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Original URL: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ". "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p1, Ljava/net/URL;

    invoke-direct {p1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getHostWithScheme(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "CloudUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "New URL: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ". "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v2, v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    move-object p0, p1

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "CloudUtils"

    const-string v1, "MalformedURLException in updateHost"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    const-string p1, "CloudUtils"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Final URL: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ". "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-object p0
.end method
