.class public Lcom/xiaomi/metoknlp/c;
.super Ljava/lang/Object;
.source "MetokService.java"


# static fields
.field private static Q:Lcom/xiaomi/metoknlp/c;


# instance fields
.field private O:Lcom/xiaomi/metoknlp/f;

.field private P:Z

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mHandlerThread:Landroid/os/HandlerThread;

.field private mStarted:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static G()Lcom/xiaomi/metoknlp/c;
    .locals 1

    sget-object v0, Lcom/xiaomi/metoknlp/c;->Q:Lcom/xiaomi/metoknlp/c;

    if-nez v0, :cond_0

    new-instance v0, Lcom/xiaomi/metoknlp/c;

    invoke-direct {v0}, Lcom/xiaomi/metoknlp/c;-><init>()V

    sput-object v0, Lcom/xiaomi/metoknlp/c;->Q:Lcom/xiaomi/metoknlp/c;

    :cond_0
    sget-object v0, Lcom/xiaomi/metoknlp/c;->Q:Lcom/xiaomi/metoknlp/c;

    return-object v0
.end method

.method private H()V
    .locals 2

    invoke-static {}, Lcom/xiaomi/metoknlp/devicediscover/m;->O()Lcom/xiaomi/metoknlp/devicediscover/m;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/metoknlp/c;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/xiaomi/metoknlp/devicediscover/m;->a(Landroid/content/Context;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/metoknlp/c;->P:Z

    return-void
.end method

.method private I()V
    .locals 1

    invoke-static {}, Lcom/xiaomi/metoknlp/devicediscover/m;->O()Lcom/xiaomi/metoknlp/devicediscover/m;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/metoknlp/devicediscover/m;->onDestroy()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/metoknlp/c;->P:Z

    return-void
.end method

.method static synthetic a(Lcom/xiaomi/metoknlp/c;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/metoknlp/c;->H()V

    return-void
.end method

.method static synthetic b(Lcom/xiaomi/metoknlp/c;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/metoknlp/c;->I()V

    return-void
.end method


# virtual methods
.method public J()V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/metoknlp/c;->mHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/metoknlp/c;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/xiaomi/metoknlp/d;

    invoke-direct {v1, p0}, Lcom/xiaomi/metoknlp/d;-><init>(Lcom/xiaomi/metoknlp/c;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public a(Landroid/content/Context;)V
    .locals 1

    iput-object p1, p0, Lcom/xiaomi/metoknlp/c;->mContext:Landroid/content/Context;

    iget-object p1, p0, Lcom/xiaomi/metoknlp/c;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/xiaomi/metoknlp/a;->init(Landroid/content/Context;)V

    iget-boolean p1, p0, Lcom/xiaomi/metoknlp/c;->mStarted:Z

    if-nez p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/xiaomi/metoknlp/c;->mStarted:Z

    new-instance p1, Landroid/os/HandlerThread;

    const-string v0, "metoknlp_cl"

    invoke-direct {p1, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/xiaomi/metoknlp/c;->mHandlerThread:Landroid/os/HandlerThread;

    iget-object p1, p0, Lcom/xiaomi/metoknlp/c;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    new-instance p1, Landroid/os/Handler;

    iget-object v0, p0, Lcom/xiaomi/metoknlp/c;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/xiaomi/metoknlp/c;->mHandler:Landroid/os/Handler;

    new-instance p1, Lcom/xiaomi/metoknlp/e;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/xiaomi/metoknlp/e;-><init>(Lcom/xiaomi/metoknlp/c;Lcom/xiaomi/metoknlp/d;)V

    iput-object p1, p0, Lcom/xiaomi/metoknlp/c;->O:Lcom/xiaomi/metoknlp/f;

    invoke-static {}, Lcom/xiaomi/metoknlp/a;->g()Lcom/xiaomi/metoknlp/a;

    move-result-object p1

    iget-object v0, p0, Lcom/xiaomi/metoknlp/c;->O:Lcom/xiaomi/metoknlp/f;

    invoke-virtual {p1, v0}, Lcom/xiaomi/metoknlp/a;->a(Lcom/xiaomi/metoknlp/f;)V

    invoke-static {}, Lcom/xiaomi/metoknlp/MetokApplication;->get()Lcom/xiaomi/metoknlp/MetokApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/xiaomi/metoknlp/MetokApplication;->isReady()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/xiaomi/metoknlp/c;->J()V

    :cond_0
    return-void
.end method

.method public fecthDeviceImmediately()V
    .locals 1

    invoke-static {}, Lcom/xiaomi/metoknlp/devicediscover/m;->O()Lcom/xiaomi/metoknlp/devicediscover/m;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/metoknlp/devicediscover/m;->fecthDeviceImmediately()V

    return-void
.end method
