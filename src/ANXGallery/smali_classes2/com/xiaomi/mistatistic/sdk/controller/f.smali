.class public Lcom/xiaomi/mistatistic/sdk/controller/f;
.super Ljava/lang/Object;
.source "ConfigProvider.java"


# static fields
.field private static volatile a:Lcom/xiaomi/mistatistic/sdk/controller/f; = null

.field private static d:I = 0x1


# instance fields
.field private b:I

.field private c:Landroid/content/Context;

.field private e:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->b:I

    new-instance v0, Lcom/xiaomi/mistatistic/sdk/controller/f$1;

    invoke-direct {v0, p0}, Lcom/xiaomi/mistatistic/sdk/controller/f$1;-><init>(Lcom/xiaomi/mistatistic/sdk/controller/f;)V

    iput-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->e:Landroid/content/BroadcastReceiver;

    iput-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    iget-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v0, "sessionMgr"

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;I)I

    move-result p1

    sput p1, Lcom/xiaomi/mistatistic/sdk/controller/f;->d:I

    return-void
.end method

.method static synthetic a(Lcom/xiaomi/mistatistic/sdk/controller/f;)I
    .locals 0

    iget p0, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->b:I

    return p0
.end method

.method public static a(Landroid/content/Context;)Lcom/xiaomi/mistatistic/sdk/controller/f;
    .locals 2

    sget-object v0, Lcom/xiaomi/mistatistic/sdk/controller/f;->a:Lcom/xiaomi/mistatistic/sdk/controller/f;

    if-nez v0, :cond_1

    const-class v0, Lcom/xiaomi/mistatistic/sdk/controller/f;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/mistatistic/sdk/controller/f;->a:Lcom/xiaomi/mistatistic/sdk/controller/f;

    if-nez v1, :cond_0

    new-instance v1, Lcom/xiaomi/mistatistic/sdk/controller/f;

    invoke-direct {v1, p0}, Lcom/xiaomi/mistatistic/sdk/controller/f;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/xiaomi/mistatistic/sdk/controller/f;->a:Lcom/xiaomi/mistatistic/sdk/controller/f;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->a:Lcom/xiaomi/mistatistic/sdk/controller/f;

    return-object p0
.end method

.method static synthetic a(Lcom/xiaomi/mistatistic/sdk/controller/f;Lcom/xiaomi/mistatistic/sdk/controller/l$b;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/mistatistic/sdk/controller/f;->a(Lcom/xiaomi/mistatistic/sdk/controller/l$b;)V

    return-void
.end method

.method static synthetic a(Lcom/xiaomi/mistatistic/sdk/controller/f;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/mistatistic/sdk/controller/f;->a(Ljava/lang/String;)V

    return-void
.end method

.method private a(Lcom/xiaomi/mistatistic/sdk/controller/l$b;)V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/l;->a(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "CP"

    const-string v0, "no internet connection"

    invoke-static {p1, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    iput p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->b:I

    invoke-direct {p0}, Lcom/xiaomi/mistatistic/sdk/controller/f;->d()V

    return-void

    :cond_0
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    const-string v1, "channel"

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->d()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "app_id"

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->b()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "sdk_version"

    const-string v2, "2.1.0"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "device_id"

    iget-object v2, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/mistatistic/sdk/controller/g;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "config_version"

    invoke-direct {p0}, Lcom/xiaomi/mistatistic/sdk/controller/f;->e()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "package_name"

    iget-object v2, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "app_version"

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->e()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v2, "http://data.mistat.xiaomi.com/getconfig"

    invoke-static {v1, v2, v0, p1}, Lcom/xiaomi/mistatistic/sdk/controller/l;->a(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/xiaomi/mistatistic/sdk/controller/l$b;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "CP"

    const-string v1, "requestConfig exception "

    invoke-static {v0, v1, p1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private a(Ljava/lang/String;)V
    .locals 9

    :try_start_0
    invoke-direct {p0}, Lcom/xiaomi/mistatistic/sdk/controller/f;->g()V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const-string v0, "CP"

    const-string v1, "config result:%s"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->b(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "errorCode"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    const-string p1, "result"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_7

    const-string v0, "configVersion"

    const-string v1, "0.0"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v3, "configVersion"

    const-string v4, "0.0"

    invoke-static {v1, v3, v4}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x2

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v3, "configVersion"

    const-string v4, "configVersion"

    const-string v5, "0.0"

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v3, v4}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v3, "configDelay"

    const-string v4, "configDelay"

    const-string v5, "0-0"

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v3, v4}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "monitor"

    const-wide/high16 v3, -0x4010000000000000L    # -1.0

    invoke-virtual {p1, v0, v3, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/xiaomi/mistatistic/sdk/controller/n;->a(D)V

    const-string v0, "uploadPolicy"

    const/4 v3, -0x1

    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    const-wide/16 v4, -0x1

    if-nez v0, :cond_2

    const-string v6, "uploadInterval"

    invoke-virtual {p1, v6, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v6

    invoke-static {v0, v6, v7}, Lcom/xiaomi/mistatistic/sdk/MiStatInterface;->setUploadPolicy(IJ)V

    goto :goto_0

    :cond_2
    if-ne v0, v2, :cond_3

    const-string v6, "uploadSize"

    invoke-virtual {p1, v6, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v6

    invoke-static {v0, v6, v7}, Lcom/xiaomi/mistatistic/sdk/MiStatInterface;->setUploadPolicy(IJ)V

    :cond_3
    :goto_0
    const-string v0, "configNetwork"

    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/MiStatInterface;->setUploadNetwork(I)V

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/s;->a()Lcom/xiaomi/mistatistic/sdk/controller/s;

    move-result-object v0

    const-string v6, "uploadIntervalBasic"

    invoke-virtual {p1, v6, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v6

    const-string v8, "uploadIntervalMin"

    invoke-virtual {p1, v8, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-virtual {v0, v6, v7, v4, v5}, Lcom/xiaomi/mistatistic/sdk/controller/s;->a(JJ)V

    const-string v0, "sessionMgr"

    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    if-eq p1, v2, :cond_4

    if-eq p1, v1, :cond_4

    const/4 v0, 0x3

    if-ne p1, v0, :cond_5

    :cond_4
    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v3, "sessionMgr"

    invoke-static {v0, v3, p1}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;I)V

    sput p1, Lcom/xiaomi/mistatistic/sdk/controller/f;->d:I

    :cond_5
    iget p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->b:I

    if-ne p1, v2, :cond_6

    iget-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->e:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_6
    iput v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->b:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string v0, "CP"

    const-string v1, "processResult exception"

    invoke-static {v0, v1, p1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_7
    :goto_1
    return-void
.end method

.method static synthetic b(Lcom/xiaomi/mistatistic/sdk/controller/f;)Landroid/content/BroadcastReceiver;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->e:Landroid/content/BroadcastReceiver;

    return-object p0
.end method

.method private c()V
    .locals 2

    sget-object v0, Lcom/xiaomi/mistatistic/sdk/controller/r;->b:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/xiaomi/mistatistic/sdk/controller/f$3;

    invoke-direct {v1, p0}, Lcom/xiaomi/mistatistic/sdk/controller/f$3;-><init>(Lcom/xiaomi/mistatistic/sdk/controller/f;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic c(Lcom/xiaomi/mistatistic/sdk/controller/f;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/mistatistic/sdk/controller/f;->c()V

    return-void
.end method

.method private d()V
    .locals 3

    :try_start_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    iget-object v2, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->e:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CP"

    const-string v2, "registerNetReceiver exception"

    invoke-static {v1, v2, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private e()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v1, "configVersion"

    const-string v2, "0.0"

    invoke-static {v0, v1, v2}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private f()Z
    .locals 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const/4 v2, 0x0

    :try_start_0
    iget-object v3, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v4, "config_request_time"

    invoke-static {v3, v4}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v5, "config_request_time"

    const-wide/16 v6, 0x0

    invoke-static {v3, v5, v6, v7}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;J)J

    move-result-wide v5

    invoke-static {v5, v6}, Landroid/text/format/DateUtils;->isToday(J)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v4, "config_request_time"

    invoke-static {v3, v4, v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;J)V

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v1, "config_request_count"

    invoke-static {v0, v1, v2}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v1, "config_request_count"

    invoke-static {v0, v1, v2}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    const/16 v1, 0xc

    if-lt v0, v1, :cond_2

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    iget-object v3, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v5, "config_request_time"

    invoke-static {v3, v5, v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;J)V

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v1, "config_request_count"

    invoke-static {v0, v1, v4}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CP"

    const-string v3, "reachConfigRequestMaxCount exception"

    invoke-static {v1, v3, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    return v2
.end method

.method private g()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v1, "config_request_count"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    iget-object v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v2, "config_request_count"

    add-int/lit8 v0, v0, 0x1

    invoke-static {v1, v2, v0}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CP"

    const-string v2, "accumulateConfigRequestCount exception"

    invoke-static {v1, v2, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 3

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/l;->b()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "CP"

    const-string v0, "Network connection is disabled."

    invoke-static {p1, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/xiaomi/mistatistic/sdk/controller/f;->f()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "CP"

    const-string v0, "config request to max count skip.."

    invoke-static {p1, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    if-nez p1, :cond_2

    :try_start_0
    invoke-direct {p0}, Lcom/xiaomi/mistatistic/sdk/controller/f;->c()V

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/f;->c:Landroid/content/Context;

    const-string v0, "configDelay"

    const-string v1, "0-0"

    invoke-static {p1, v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "-"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v0, p1

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-le v0, v1, :cond_3

    aget-object v0, p1, v2

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    aget-object p1, p1, v1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    if-le p1, v0, :cond_3

    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    sub-int/2addr p1, v0

    invoke-virtual {v1, p1}, Ljava/util/Random;->nextInt(I)I

    move-result p1

    add-int v2, p1, v0

    :cond_3
    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/e;->b()Lcom/xiaomi/mistatistic/sdk/controller/e;

    move-result-object p1

    new-instance v0, Lcom/xiaomi/mistatistic/sdk/controller/f$2;

    invoke-direct {v0, p0}, Lcom/xiaomi/mistatistic/sdk/controller/f$2;-><init>(Lcom/xiaomi/mistatistic/sdk/controller/f;)V

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v1, v2

    invoke-virtual {p1, v0, v1, v2}, Lcom/xiaomi/mistatistic/sdk/controller/e;->a(Lcom/xiaomi/mistatistic/sdk/controller/e$a;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :goto_0
    const-string v0, "CP"

    const-string v1, "updateConfig exception"

    invoke-static {v0, v1, p1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return-void
.end method

.method public a()Z
    .locals 3

    sget v0, Lcom/xiaomi/mistatistic/sdk/controller/f;->d:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    sget v0, Lcom/xiaomi/mistatistic/sdk/controller/f;->d:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method public b()Z
    .locals 2

    sget v0, Lcom/xiaomi/mistatistic/sdk/controller/f;->d:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    sget v0, Lcom/xiaomi/mistatistic/sdk/controller/f;->d:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
