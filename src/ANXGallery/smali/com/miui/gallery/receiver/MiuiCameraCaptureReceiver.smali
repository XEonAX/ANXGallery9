.class public Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MiuiCameraCaptureReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;
    }
.end annotation


# static fields
.field private static sLastPreloadTime:J

.field private static sPreloadBigPhotoRunnable:Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;-><init>(Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$1;)V

    sput-object v0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver;->sPreloadBigPhotoRunnable:Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 12

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.miui.gallery.SAVE_TO_CLOUD"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v0, "extra_file_path"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "extra_media_store_id"

    const-wide/16 v2, -0x1

    invoke-virtual {p2, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    const-string v3, "extra_is_temp_file"

    const/4 v4, 0x0

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v4

    invoke-virtual {v4, p2}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    const-string v4, "extra_is_temp_file"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    if-eqz v3, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/ProcessingMediaHelper;->getInstance()Lcom/miui/gallery/util/ProcessingMediaHelper;

    move-result-object v4

    invoke-virtual {v4, v1, v2, v0}, Lcom/miui/gallery/util/ProcessingMediaHelper;->addProcessingItem(JLjava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/ProcessingMediaHelper;->getInstance()Lcom/miui/gallery/util/ProcessingMediaHelper;

    move-result-object v4

    invoke-virtual {v4, v1, v2, v0}, Lcom/miui/gallery/util/ProcessingMediaHelper;->removeProcessingItem(JLjava/lang/String;)V

    :cond_1
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    const-string v4, "MiuiCameraCaptureReceiver"

    const-string v5, "ACTION_SAVE_TO_CLOUD start, path: [%s] mediaId: [%d], temp: [%b]"

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-static {v4, v5, v0, v6, v7}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v4

    new-instance v5, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$1;

    invoke-direct {v5, p0, v0, p2, p1}, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$1;-><init>(Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver;Ljava/lang/String;Landroid/content/Intent;Landroid/content/Context;)V

    invoke-virtual {v4, v5}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver;->sPreloadBigPhotoRunnable:Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const-wide/16 v4, 0x0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sget-wide v8, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver;->sLastPreloadTime:J

    sub-long v8, v6, v8

    const-wide/16 v10, 0x190

    cmp-long p2, v8, v10

    if-gez p2, :cond_2

    move-wide v4, v10

    :cond_2
    sput-wide v6, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver;->sLastPreloadTime:J

    sget-object p2, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver;->sPreloadBigPhotoRunnable:Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;

    invoke-virtual {p2, v0, v1, v2, v3}, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->setData(Ljava/lang/String;JZ)V

    sget-object p2, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver;->sPreloadBigPhotoRunnable:Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;

    invoke-virtual {p1, p2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1

    :cond_3
    const-string v1, "com.miui.gallery.DELETE_FROM_CLOUD"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "extra_file_path"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "MiuiCameraCaptureReceiver"

    const-string v1, "ACTION_DELETE_FROM_CLOUD start %s"

    invoke-static {v0, v1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$2;-><init>(Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    :cond_4
    :goto_1
    return-void
.end method
