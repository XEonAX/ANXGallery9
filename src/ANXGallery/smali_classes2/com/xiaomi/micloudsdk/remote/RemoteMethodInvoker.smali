.class public abstract Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker;
.super Ljava/lang/Object;
.source "RemoteMethodInvoker.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker$AsyncFuture;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/content/ServiceConnection;"
    }
.end annotation


# instance fields
.field private final future:Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker$AsyncFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker$AsyncFuture<",
            "Landroid/os/IBinder;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker$AsyncFuture;

    invoke-direct {v0}, Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker$AsyncFuture;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker;->future:Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker$AsyncFuture;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker;->mContext:Landroid/content/Context;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "context can\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method protected abstract bindService(Landroid/content/Context;Landroid/content/ServiceConnection;)Z
.end method

.method public invoke()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
        }
    .end annotation

    invoke-static {}, Lcom/xiaomi/micloudsdk/utils/ThreadUtil;->ensureWorkerThread()V

    iget-object v0, p0, Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v0, p0}, Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker;->bindService(Landroid/content/Context;Landroid/content/ServiceConnection;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker;->future:Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker$AsyncFuture;

    invoke-virtual {v0}, Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker$AsyncFuture;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/IBinder;

    invoke-virtual {p0, v0}, Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker;->invokeRemoteMethod(Landroid/os/IBinder;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v1, p0, Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker;->mContext:Landroid/content/Context;

    invoke-virtual {v1, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_1
    const-string v2, "RemoteMethodInvoker"

    const-string v3, "error while invoking service methods"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catch_1
    :goto_0
    iget-object v0, p0, Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    return-object v1

    :catch_2
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :goto_1
    iget-object v1, p0, Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker;->mContext:Landroid/content/Context;

    invoke-virtual {v1, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    throw v0

    :cond_0
    const-string v0, "RemoteMethodInvoker"

    const-string v2, "Cannot bind remote service."

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1
.end method

.method protected abstract invokeRemoteMethod(Landroid/os/IBinder;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/IBinder;",
            ")TR;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3

    const-string v0, "RemoteMethodInvoker"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "RemoteMethodInvoker connects remote service "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/content/ComponentName;->getShortClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker;->future:Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker$AsyncFuture;

    invoke-virtual {p1, p2}, Lcom/xiaomi/micloudsdk/remote/RemoteMethodInvoker$AsyncFuture;->setResult(Ljava/lang/Object;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    return-void
.end method
