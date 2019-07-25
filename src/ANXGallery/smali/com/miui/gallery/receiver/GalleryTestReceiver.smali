.class public Lcom/miui/gallery/receiver/GalleryTestReceiver;
.super Landroid/content/BroadcastReceiver;
.source "GalleryTestReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    const-string p1, "com.miui.gallery.action.REQUEST_CLOUD_CONTROL_DATA"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/receiver/GalleryTestReceiver$1;

    invoke-direct {v0, p0, p2}, Lcom/miui/gallery/receiver/GalleryTestReceiver$1;-><init>(Lcom/miui/gallery/receiver/GalleryTestReceiver;Landroid/content/Intent;)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    goto :goto_0

    :cond_0
    const-string p1, "com.miui.gallery.action.REQUEST_SYNC_SETTINGS"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/receiver/GalleryTestReceiver$2;

    invoke-direct {p2, p0}, Lcom/miui/gallery/receiver/GalleryTestReceiver$2;-><init>(Lcom/miui/gallery/receiver/GalleryTestReceiver;)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    :cond_1
    :goto_0
    return-void
.end method
