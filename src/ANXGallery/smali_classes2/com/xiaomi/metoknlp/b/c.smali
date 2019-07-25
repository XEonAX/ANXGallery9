.class public Lcom/xiaomi/metoknlp/b/c;
.super Ljava/lang/Object;
.source "ConnectivityMonitor.java"


# static fields
.field private static Y:Lcom/xiaomi/metoknlp/b/c;


# instance fields
.field private j:Ljava/util/List;

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/metoknlp/b/c;->mContext:Landroid/content/Context;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/metoknlp/b/c;->j:Ljava/util/List;

    new-instance p1, Lcom/xiaomi/metoknlp/b/d;

    invoke-static {}, Lcom/xiaomi/metoknlp/MetokApplication;->get()Lcom/xiaomi/metoknlp/MetokApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/metoknlp/MetokApplication;->getAppHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/xiaomi/metoknlp/b/d;-><init>(Lcom/xiaomi/metoknlp/b/c;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/xiaomi/metoknlp/b/c;->mHandler:Landroid/os/Handler;

    new-instance p1, Lcom/xiaomi/metoknlp/b/e;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/xiaomi/metoknlp/b/e;-><init>(Lcom/xiaomi/metoknlp/b/c;Lcom/xiaomi/metoknlp/b/b;)V

    iput-object p1, p0, Lcom/xiaomi/metoknlp/b/c;->mReceiver:Landroid/content/BroadcastReceiver;

    new-instance p1, Landroid/content/IntentFilter;

    const-string v0, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {p1, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/metoknlp/b/c;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/xiaomi/metoknlp/b/c;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public static M()Lcom/xiaomi/metoknlp/b/c;
    .locals 1

    sget-object v0, Lcom/xiaomi/metoknlp/b/c;->Y:Lcom/xiaomi/metoknlp/b/c;

    return-object v0
.end method

.method static synthetic a(Lcom/xiaomi/metoknlp/b/c;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/metoknlp/b/c;->j:Ljava/util/List;

    return-object p0
.end method

.method static synthetic b(Lcom/xiaomi/metoknlp/b/c;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/metoknlp/b/c;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 1

    sget-object v0, Lcom/xiaomi/metoknlp/b/c;->Y:Lcom/xiaomi/metoknlp/b/c;

    if-nez v0, :cond_0

    new-instance v0, Lcom/xiaomi/metoknlp/b/c;

    invoke-direct {v0, p0}, Lcom/xiaomi/metoknlp/b/c;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/xiaomi/metoknlp/b/c;->Y:Lcom/xiaomi/metoknlp/b/c;

    :cond_0
    return-void
.end method


# virtual methods
.method public a(Lcom/xiaomi/metoknlp/b/a;)V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/metoknlp/b/c;->j:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/metoknlp/b/c;->j:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
