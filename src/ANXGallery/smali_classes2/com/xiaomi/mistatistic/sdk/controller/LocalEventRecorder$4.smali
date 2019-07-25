.class final Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder$4;
.super Ljava/lang/Object;
.source "LocalEventRecorder.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    const-string p1, "LER"

    const-string v0, "IStatService connected"

    invoke-static {p1, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p2}, Lcom/xiaomi/xmsf/push/service/b$a;->a(Landroid/os/IBinder;)Lcom/xiaomi/xmsf/push/service/b;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->a(Lcom/xiaomi/xmsf/push/service/b;)Lcom/xiaomi/xmsf/push/service/b;

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->a()Lcom/xiaomi/xmsf/push/service/b;

    move-result-object p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/xiaomi/mistatistic/sdk/controller/r;->b:Ljava/util/concurrent/ExecutorService;

    new-instance p2, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder$4$1;

    invoke-direct {p2, p0}, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder$4$1;-><init>(Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder$4;)V

    invoke-interface {p1, p2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    const-string p1, "LER"

    const-string v0, "IStatService has unexpectedly disconnected"

    invoke-static {p1, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->a(Lcom/xiaomi/xmsf/push/service/b;)Lcom/xiaomi/xmsf/push/service/b;

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->a(Z)Z

    return-void
.end method
