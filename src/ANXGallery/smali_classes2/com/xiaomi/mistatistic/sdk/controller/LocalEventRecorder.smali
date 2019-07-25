.class public Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;
.super Ljava/lang/Object;
.source "LocalEventRecorder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder$a;
    }
.end annotation


# static fields
.field private static volatile a:Lcom/xiaomi/xmsf/push/service/b; = null

.field private static volatile b:Z = false

.field private static c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/xiaomi/mistatistic/sdk/data/AbstractEvent;",
            ">;"
        }
    .end annotation
.end field

.field private static d:Ljava/lang/Object;

.field private static e:Landroid/content/ServiceConnection;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->c:Ljava/util/List;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->d:Ljava/lang/Object;

    new-instance v0, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder$4;

    invoke-direct {v0}, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder$4;-><init>()V

    sput-object v0, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->e:Landroid/content/ServiceConnection;

    return-void
.end method

.method static synthetic a()Lcom/xiaomi/xmsf/push/service/b;
    .locals 1

    sget-object v0, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->a:Lcom/xiaomi/xmsf/push/service/b;

    return-object v0
.end method

.method static synthetic a(Lcom/xiaomi/xmsf/push/service/b;)Lcom/xiaomi/xmsf/push/service/b;
    .locals 0

    sput-object p0, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->a:Lcom/xiaomi/xmsf/push/service/b;

    return-object p0
.end method

.method static synthetic a(Landroid/content/Context;)V
    .locals 0

    invoke-static {p0}, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->c(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic a(Lcom/xiaomi/mistatistic/sdk/data/AbstractEvent;)V
    .locals 0

    invoke-static {p0}, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->b(Lcom/xiaomi/mistatistic/sdk/data/AbstractEvent;)V

    return-void
.end method

.method static synthetic a(Z)Z
    .locals 0

    sput-boolean p0, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->b:Z

    return p0
.end method

.method private static b(Landroid/content/Context;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    sget-boolean v0, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->b:Z

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.xiaomi.xmsf"

    const-string v2, "com.xiaomi.xmsf.push.service.StatService"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object v1, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->e:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result p0

    sput-boolean p0, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->b:Z

    const-string p0, "LER"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "bind StatSystemService: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->b:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private static b(Lcom/xiaomi/mistatistic/sdk/data/AbstractEvent;)V
    .locals 2

    :try_start_0
    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->a()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->b(Landroid/content/Context;)V

    sget-object v0, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->a:Lcom/xiaomi/xmsf/push/service/b;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/xiaomi/mistatistic/sdk/controller/r;->b:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder$2;

    invoke-direct {v1, p0}, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder$2;-><init>(Lcom/xiaomi/mistatistic/sdk/data/AbstractEvent;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    const-string p0, "LER"

    const-string v0, "StatSystemService is not null, insert a event"

    invoke-static {p0, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string v0, "LER"

    const-string v1, "StatSystemService is null, insert event into eventList"

    invoke-static {v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->d:Ljava/lang/Object;

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    sget-object v1, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->c:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p0
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p0

    const-string v0, "LER"

    const-string v1, "insertEventUseSystemService exception: "

    invoke-static {v0, v1, p0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic b()Z
    .locals 1

    sget-boolean v0, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->b:Z

    return v0
.end method

.method static synthetic c()Landroid/content/ServiceConnection;
    .locals 1

    sget-object v0, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->e:Landroid/content/ServiceConnection;

    return-object v0
.end method

.method private static c(Landroid/content/Context;)V
    .locals 4

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/e;->a()Lcom/xiaomi/mistatistic/sdk/controller/e;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder$3;

    invoke-direct {v1, p0}, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder$3;-><init>(Landroid/content/Context;)V

    const-wide/32 v2, 0x2bf20

    invoke-virtual {v0, v1, v2, v3}, Lcom/xiaomi/mistatistic/sdk/controller/e;->a(Lcom/xiaomi/mistatistic/sdk/controller/e$a;J)V

    return-void
.end method

.method static synthetic d()Ljava/lang/Object;
    .locals 1

    sget-object v0, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->d:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic e()Ljava/util/List;
    .locals 1

    sget-object v0, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->c:Ljava/util/List;

    return-object v0
.end method

.method public static insertEvent(Lcom/xiaomi/mistatistic/sdk/data/AbstractEvent;)V
    .locals 3

    :try_start_0
    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->a()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p0, "LER"

    const-string v0, "mistats is not initialized properly."

    invoke-static {p0, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v1, "c"

    invoke-static {v1, p0}, Lcom/xiaomi/mistatistic/sdk/controller/n;->a(Ljava/lang/String;Lcom/xiaomi/mistatistic/sdk/data/AbstractEvent;)V

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/BuildSetting;->isCTABuild()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string p0, "LER"

    const-string v0, "disable local event upload for CTA build"

    invoke-static {p0, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/CustomSettings;->isUseSystemStatService()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v0, "LER"

    const-string v1, "insert event use SystemStatService."

    invoke-static {v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/e;->a()Lcom/xiaomi/mistatistic/sdk/controller/e;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder$1;

    invoke-direct {v1, p0}, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder$1;-><init>(Lcom/xiaomi/mistatistic/sdk/data/AbstractEvent;)V

    invoke-virtual {v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/e;->a(Lcom/xiaomi/mistatistic/sdk/controller/e$a;)V

    return-void

    :cond_2
    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/BuildSetting;->isDisabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/xiaomi/mistatistic/sdk/data/AbstractEvent;->getCategory()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/t;->e(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/xiaomi/mistatistic/sdk/data/AbstractEvent;->getAnonymous()I

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "LER"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "disabled local event upload, event category:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/xiaomi/mistatistic/sdk/data/AbstractEvent;->getCategory()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/e;->a()Lcom/xiaomi/mistatistic/sdk/controller/e;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder$a;

    invoke-direct {v1, p0}, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder$a;-><init>(Lcom/xiaomi/mistatistic/sdk/data/AbstractEvent;)V

    invoke-virtual {v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/e;->a(Lcom/xiaomi/mistatistic/sdk/controller/e$a;)V

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/s;->a()Lcom/xiaomi/mistatistic/sdk/controller/s;

    move-result-object p0

    invoke-virtual {p0}, Lcom/xiaomi/mistatistic/sdk/controller/s;->c()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "LER"

    const-string v1, "insertEvent exception"

    invoke-static {v0, v1, p0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
