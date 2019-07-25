.class public abstract Lcom/xiaomi/mipush/sdk/BaseService;
.super Landroid/app/Service;
.source "BaseService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/mipush/sdk/BaseService$TimeoutHandler;
    }
.end annotation


# instance fields
.field private mHandler:Lcom/xiaomi/mipush/sdk/BaseService$TimeoutHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract hasJob()Z
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/BaseService;->mHandler:Lcom/xiaomi/mipush/sdk/BaseService$TimeoutHandler;

    if-nez p1, :cond_0

    new-instance p1, Lcom/xiaomi/mipush/sdk/BaseService$TimeoutHandler;

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {p1, p2}, Lcom/xiaomi/mipush/sdk/BaseService$TimeoutHandler;-><init>(Ljava/lang/ref/WeakReference;)V

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/BaseService;->mHandler:Lcom/xiaomi/mipush/sdk/BaseService$TimeoutHandler;

    :cond_0
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/BaseService;->mHandler:Lcom/xiaomi/mipush/sdk/BaseService$TimeoutHandler;

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/BaseService$TimeoutHandler;->reSendTimeoutMessage()V

    return-void
.end method
