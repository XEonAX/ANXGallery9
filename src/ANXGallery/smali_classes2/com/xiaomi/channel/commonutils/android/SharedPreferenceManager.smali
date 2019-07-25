.class public Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;
.super Ljava/lang/Object;
.source "SharedPreferenceManager.java"


# static fields
.field private static volatile sInstance:Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;


# instance fields
.field private mCaches:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->mContext:Landroid/content/Context;

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->mHandler:Landroid/os/Handler;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->mCaches:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method private declared-synchronized getDataFromCache(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->mCaches:Ljava/util/Map;

    if-eqz v0, :cond_2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->mCaches:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    if-eqz p1, :cond_1

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_1
    :try_start_2
    const-string p1, ""
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object p1

    :catch_0
    :try_start_3
    const-string p1, ""
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_2
    :goto_0
    :try_start_4
    const-string p1, ""
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;
    .locals 2

    sget-object v0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->sInstance:Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;

    if-nez v0, :cond_1

    const-class v0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->sInstance:Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;

    invoke-direct {v1, p0}, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->sInstance:Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;

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
    sget-object p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->sInstance:Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;

    return-object p0
.end method

.method private declared-synchronized putData2Cache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->mCaches:Ljava/util/Map;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->mCaches:Ljava/util/Map;

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->mCaches:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :cond_1
    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->mCaches:Ljava/util/Map;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method public declared-synchronized getStringValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->getDataFromCache(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->mContext:Landroid/content/Context;

    const/4 v1, 0x4

    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setStringnValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->putData2Cache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager$2;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager$2;-><init>(Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
