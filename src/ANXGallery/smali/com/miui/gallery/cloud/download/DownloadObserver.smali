.class final Lcom/miui/gallery/cloud/download/DownloadObserver;
.super Ljava/lang/Object;
.source "DownloadObserver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/download/DownloadObserver$OnConditionChangeListener;,
        Lcom/miui/gallery/cloud/download/DownloadObserver$DeviceStorageStateReceiver;,
        Lcom/miui/gallery/cloud/download/DownloadObserver$PowerChangedReceiver;,
        Lcom/miui/gallery/cloud/download/DownloadObserver$NetworkReceiver;,
        Lcom/miui/gallery/cloud/download/DownloadObserver$CTAReceiver;,
        Lcom/miui/gallery/cloud/download/DownloadObserver$SingletonHolder;
    }
.end annotation


# instance fields
.field private mCtaReceiver:Landroid/content/BroadcastReceiver;

.field private mDeviceStorageReceiver:Landroid/content/BroadcastReceiver;

.field private final mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet<",
            "Lcom/miui/gallery/cloud/download/DownloadObserver$OnConditionChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private mNetworkReceiver:Landroid/content/BroadcastReceiver;

.field private mPowerStatusReceiver:Landroid/content/BroadcastReceiver;

.field private final mRegisterCount:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mRegisterCount:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/download/DownloadObserver$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/DownloadObserver;-><init>()V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/cloud/download/DownloadObserver;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/download/DownloadObserver;->doRegister(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/cloud/download/DownloadObserver;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/download/DownloadObserver;->doUnregister(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/cloud/download/DownloadObserver;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/download/DownloadObserver;->notifyConditionChanged(Landroid/content/Context;)V

    return-void
.end method

.method private doRegister(Landroid/content/Context;)V
    .locals 4

    invoke-direct {p0}, Lcom/miui/gallery/cloud/download/DownloadObserver;->ensureObservers()V

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.miui.gallery.action.CTA_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mCtaReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE_IMMEDIATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mNetworkReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v0, v3, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mPowerStatusReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v2

    invoke-virtual {p1, v1, v0, v3, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.DEVICE_STORAGE_LOW"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.action.DEVICE_STORAGE_OK"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mDeviceStorageReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v2

    invoke-virtual {p1, v1, v0, v3, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    return-void
.end method

.method private doUnregister(Landroid/content/Context;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mCtaReceiver:Landroid/content/BroadcastReceiver;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mCtaReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v2}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mCtaReceiver:Landroid/content/BroadcastReceiver;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mNetworkReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mNetworkReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mNetworkReceiver:Landroid/content/BroadcastReceiver;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mPowerStatusReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mPowerStatusReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mPowerStatusReceiver:Landroid/content/BroadcastReceiver;

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mDeviceStorageReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mDeviceStorageReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mDeviceStorageReceiver:Landroid/content/BroadcastReceiver;

    :cond_3
    return-void
.end method

.method private ensureObservers()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/cloud/download/DownloadObserver$CTAReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/cloud/download/DownloadObserver$CTAReceiver;-><init>(Lcom/miui/gallery/cloud/download/DownloadObserver;Lcom/miui/gallery/cloud/download/DownloadObserver$1;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mCtaReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/miui/gallery/cloud/download/DownloadObserver$NetworkReceiver;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/download/DownloadObserver$NetworkReceiver;-><init>(Lcom/miui/gallery/cloud/download/DownloadObserver;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mNetworkReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/miui/gallery/cloud/download/DownloadObserver$PowerChangedReceiver;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/download/DownloadObserver$PowerChangedReceiver;-><init>(Lcom/miui/gallery/cloud/download/DownloadObserver;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mPowerStatusReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/miui/gallery/cloud/download/DownloadObserver$DeviceStorageStateReceiver;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/cloud/download/DownloadObserver$DeviceStorageStateReceiver;-><init>(Lcom/miui/gallery/cloud/download/DownloadObserver;Lcom/miui/gallery/cloud/download/DownloadObserver$1;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mDeviceStorageReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static getInstance()Lcom/miui/gallery/cloud/download/DownloadObserver;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/download/DownloadObserver$SingletonHolder;->access$000()Lcom/miui/gallery/cloud/download/DownloadObserver;

    move-result-object v0

    return-object v0
.end method

.method private notifyConditionChanged(Landroid/content/Context;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloud/download/DownloadObserver$OnConditionChangeListener;

    invoke-interface {v1, p1}, Lcom/miui/gallery/cloud/download/DownloadObserver$OnConditionChangeListener;->onConditionChanged(Landroid/content/Context;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method register(Landroid/content/Context;Lcom/miui/gallery/cloud/download/DownloadObserver$OnConditionChangeListener;)V
    .locals 2

    const-string v0, "DownloadObserver"

    const-string v1, "register %s"

    invoke-static {v0, v1, p2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p2}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mRegisterCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result p2

    if-nez p2, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object p2

    new-instance v0, Lcom/miui/gallery/cloud/download/DownloadObserver$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/cloud/download/DownloadObserver$1;-><init>(Lcom/miui/gallery/cloud/download/DownloadObserver;Landroid/content/Context;)V

    invoke-virtual {p2, v0}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method unregister(Landroid/content/Context;Lcom/miui/gallery/cloud/download/DownloadObserver$OnConditionChangeListener;)V
    .locals 2

    const-string v0, "DownloadObserver"

    const-string v1, "unregister %s"

    invoke-static {v0, v1, p2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p2}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/cloud/download/DownloadObserver;->mRegisterCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result p2

    if-gtz p2, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object p2

    new-instance v0, Lcom/miui/gallery/cloud/download/DownloadObserver$2;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/cloud/download/DownloadObserver$2;-><init>(Lcom/miui/gallery/cloud/download/DownloadObserver;Landroid/content/Context;)V

    invoke-virtual {p2, v0}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
