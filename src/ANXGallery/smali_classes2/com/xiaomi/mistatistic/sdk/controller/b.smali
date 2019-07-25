.class public Lcom/xiaomi/mistatistic/sdk/controller/b;
.super Ljava/lang/Object;
.source "ActivityLifecycleMonitor.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation


# static fields
.field private static a:Ljava/lang/Integer;


# instance fields
.field private final b:Ljava/lang/Object;

.field private c:Z

.field private d:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/mistatistic/sdk/controller/b;->a:Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/b;->b:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/b;->c:Z

    iput v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/b;->d:I

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 3

    :try_start_0
    iget-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/b;->b:Ljava/lang/Object;

    monitor-enter p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    sget-object v0, Lcom/xiaomi/mistatistic/sdk/controller/b;->a:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/b;->c:Z

    if-eqz v0, :cond_0

    const-string v0, "ALM"

    const-string v2, "The App enters foreground from the background."

    invoke-static {v0, v2}, Lcom/xiaomi/mistatistic/sdk/controller/j;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string v0, "ALM"

    const-string v2, "The App enters foreground for the first time."

    invoke-static {v0, v2}, Lcom/xiaomi/mistatistic/sdk/controller/j;->b(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/e;->a()Lcom/xiaomi/mistatistic/sdk/controller/e;

    move-result-object v0

    new-instance v2, Lcom/xiaomi/mistatistic/sdk/controller/b$1;

    invoke-direct {v2, p0}, Lcom/xiaomi/mistatistic/sdk/controller/b$1;-><init>(Lcom/xiaomi/mistatistic/sdk/controller/b;)V

    invoke-virtual {v0, v2}, Lcom/xiaomi/mistatistic/sdk/controller/e;->a(Lcom/xiaomi/mistatistic/sdk/controller/e$a;)V

    iput-boolean v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/b;->c:Z

    :cond_1
    iget v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/b;->d:I

    if-gez v0, :cond_2

    iget v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/b;->d:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/b;->d:I

    goto :goto_1

    :cond_2
    sget-object v0, Lcom/xiaomi/mistatistic/sdk/controller/b;->a:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/mistatistic/sdk/controller/b;->a:Ljava/lang/Integer;

    :goto_1
    monitor-exit p1

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p1

    const-string v0, "ALM"

    const-string v1, "onActivityStarted exception"

    invoke-static {v0, v1, p1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/b;->b:Ljava/lang/Object;

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-virtual {p1}, Landroid/app/Activity;->isChangingConfigurations()Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "ALM"

    const-string v1, "Activity is changing configuration."

    invoke-static {p1, v1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/b;->d:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/b;->d:I

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/xiaomi/mistatistic/sdk/controller/b;->a:Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    sput-object p1, Lcom/xiaomi/mistatistic/sdk/controller/b;->a:Ljava/lang/Integer;

    sget-object p1, Lcom/xiaomi/mistatistic/sdk/controller/b;->a:Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "ALM"

    const-string v1, "The App enters background."

    invoke-static {p1, v1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->b(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/e;->a()Lcom/xiaomi/mistatistic/sdk/controller/e;

    move-result-object p1

    new-instance v1, Lcom/xiaomi/mistatistic/sdk/controller/b$2;

    invoke-direct {v1, p0}, Lcom/xiaomi/mistatistic/sdk/controller/b$2;-><init>(Lcom/xiaomi/mistatistic/sdk/controller/b;)V

    invoke-virtual {p1, v1}, Lcom/xiaomi/mistatistic/sdk/controller/e;->a(Lcom/xiaomi/mistatistic/sdk/controller/e$a;)V

    :cond_1
    :goto_0
    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p1

    const-string v0, "ALM"

    const-string v1, "onActivityStopped exception"

    invoke-static {v0, v1, p1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return-void
.end method
