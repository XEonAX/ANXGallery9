.class final Lcom/xiaomi/mistatistic/sdk/controller/l$1;
.super Ljava/lang/Object;
.source "NetworkUtils.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mistatistic/sdk/controller/l;->b(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/xiaomi/mistatistic/sdk/controller/l$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/mistatistic/sdk/controller/l$b;

.field final synthetic b:Landroid/content/Context;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Ljava/util/Map;

.field private e:Z


# direct methods
.method constructor <init>(Lcom/xiaomi/mistatistic/sdk/controller/l$b;Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/l$1;->a:Lcom/xiaomi/mistatistic/sdk/controller/l$b;

    iput-object p2, p0, Lcom/xiaomi/mistatistic/sdk/controller/l$1;->b:Landroid/content/Context;

    iput-object p3, p0, Lcom/xiaomi/mistatistic/sdk/controller/l$1;->c:Ljava/lang/String;

    iput-object p4, p0, Lcom/xiaomi/mistatistic/sdk/controller/l$1;->d:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/l$1;->e:Z

    return-void
.end method

.method static synthetic a(Lcom/xiaomi/mistatistic/sdk/controller/l$1;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/l$1;->e:Z

    return p1
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    sget-object p1, Lcom/xiaomi/mistatistic/sdk/controller/r;->b:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/xiaomi/mistatistic/sdk/controller/l$1$1;

    invoke-direct {v0, p0, p2, p0}, Lcom/xiaomi/mistatistic/sdk/controller/l$1$1;-><init>(Lcom/xiaomi/mistatistic/sdk/controller/l$1;Landroid/os/IBinder;Landroid/content/ServiceConnection;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    const-string p1, "NET"

    const-string v0, "error while perform IPC connection."

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-boolean p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/l$1;->e:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/l$1;->a:Lcom/xiaomi/mistatistic/sdk/controller/l$b;

    invoke-interface {p1, v1}, Lcom/xiaomi/mistatistic/sdk/controller/l$b;->a(Ljava/lang/String;)V

    const-string p1, "NET"

    const-string v0, "disconnected, remote http post hasn\'t not processed"

    invoke-static {p1, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
