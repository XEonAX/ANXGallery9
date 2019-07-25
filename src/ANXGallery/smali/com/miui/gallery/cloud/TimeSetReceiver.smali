.class public Lcom/miui/gallery/cloud/TimeSetReceiver;
.super Landroid/content/BroadcastReceiver;
.source "TimeSetReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "android.intent.action.TIME_SET"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "TimeSetReceiver"

    const-string p2, "time is set, invalidate all cache of invitation"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/cloud/TimeSetReceiver$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/cloud/TimeSetReceiver$1;-><init>(Lcom/miui/gallery/cloud/TimeSetReceiver;)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    :cond_0
    return-void
.end method
