.class public Lcom/miui/gallery/util/GalleryBackgroundService;
.super Landroid/app/Service;
.source "GalleryBackgroundService.java"


# instance fields
.field private mPreloadFuture:Lcom/miui/gallery/threadpool/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    const-string p1, "GalleryBackgroundService"

    const-string v0, "GalleryBackgroundService onBind"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {p0, p1}, Lcom/miui/gallery/permission/core/PermissionUtils;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/util/GalleryBackgroundService$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/util/GalleryBackgroundService$1;-><init>(Lcom/miui/gallery/util/GalleryBackgroundService;)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/util/GalleryBackgroundService;->mPreloadFuture:Lcom/miui/gallery/threadpool/Future;

    goto :goto_0

    :cond_0
    const-string p1, "GalleryBackgroundService"

    const-string v0, "Can\'t access external storage, relate permission is ungranted"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public onCreate()V
    .locals 2

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    const-string v0, "GalleryBackgroundService"

    const-string v1, "GalleryBackgroundService onCreate "

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    const-string v0, "GalleryBackgroundService"

    const-string v1, "GalleryBackgroundService onDestroy"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/util/GalleryBackgroundService;->mPreloadFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/GalleryBackgroundService;->mPreloadFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/util/GalleryBackgroundService;->mPreloadFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    return-void
.end method
