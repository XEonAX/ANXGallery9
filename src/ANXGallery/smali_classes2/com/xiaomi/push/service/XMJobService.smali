.class public Lcom/xiaomi/push/service/XMJobService;
.super Landroid/app/Service;
.source "XMJobService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/XMJobService$JobServiceImpl;
    }
.end annotation


# static fields
.field static sServiceInstance:Landroid/app/Service;


# instance fields
.field private mJobBinder:Landroid/os/IBinder;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/push/service/XMJobService;->mJobBinder:Landroid/os/IBinder;

    return-void
.end method

.method static getRunningService()Landroid/app/Service;
    .locals 1

    sget-object v0, Lcom/xiaomi/push/service/XMJobService;->sServiceInstance:Landroid/app/Service;

    return-object v0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    iget-object p1, p0, Lcom/xiaomi/push/service/XMJobService;->mJobBinder:Landroid/os/IBinder;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/push/service/XMJobService;->mJobBinder:Landroid/os/IBinder;

    return-object p1

    :cond_0
    new-instance p1, Landroid/os/Binder;

    invoke-direct {p1}, Landroid/os/Binder;-><init>()V

    return-object p1
.end method

.method public onCreate()V
    .locals 2

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    new-instance v0, Lcom/xiaomi/push/service/XMJobService$JobServiceImpl;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/XMJobService$JobServiceImpl;-><init>(Landroid/app/Service;)V

    iget-object v0, v0, Lcom/xiaomi/push/service/XMJobService$JobServiceImpl;->binder:Landroid/os/Binder;

    iput-object v0, p0, Lcom/xiaomi/push/service/XMJobService;->mJobBinder:Landroid/os/IBinder;

    :cond_0
    sput-object p0, Lcom/xiaomi/push/service/XMJobService;->sServiceInstance:Landroid/app/Service;

    return-void
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    const/4 v0, 0x0

    sput-object v0, Lcom/xiaomi/push/service/XMJobService;->sServiceInstance:Landroid/app/Service;

    return-void
.end method
