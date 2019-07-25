.class public Lcom/miui/gallery/projection/RemoteController;
.super Ljava/lang/Object;
.source "RemoteController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;
    }
.end annotation


# static fields
.field private static sDisableRemoteControlRunnable:Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;


# instance fields
.field private final mListener:Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;

.field private mRemoteControlReceiver:Lcom/miui/gallery/projection/RemoteControlReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;-><init>(Lcom/miui/gallery/projection/RemoteController$1;)V

    sput-object v0, Lcom/miui/gallery/projection/RemoteController;->sDisableRemoteControlRunnable:Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/projection/RemoteControlReceiver;

    invoke-direct {v0}, Lcom/miui/gallery/projection/RemoteControlReceiver;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/projection/RemoteController;->mRemoteControlReceiver:Lcom/miui/gallery/projection/RemoteControlReceiver;

    iput-object p1, p0, Lcom/miui/gallery/projection/RemoteController;->mListener:Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/projection/RemoteController;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/RemoteController;->disableRemoteControlWhenOnPause(Landroid/content/Context;)V

    return-void
.end method

.method private disableRemoteControl(Landroid/content/Context;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/projection/RemoteController;->mRemoteControlReceiver:Lcom/miui/gallery/projection/RemoteControlReceiver;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/projection/RemoteControlReceiver;->setListener(Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;)V

    iget-object v0, p0, Lcom/miui/gallery/projection/RemoteController;->mRemoteControlReceiver:Lcom/miui/gallery/projection/RemoteControlReceiver;

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ReceiverUtils;->safeUnregisterReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)Z

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "remote_control_pkg_name"

    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "remote_control_proc_name"

    invoke-static {p1, v0, v1}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    return-void
.end method

.method private disableRemoteControlWhenOnPause(Landroid/content/Context;)V
    .locals 1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isKeyGuardLocked(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/RemoteController;->disableRemoteControl(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method private enableRemoteControl(Landroid/content/Context;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/projection/RemoteController;->mRemoteControlReceiver:Lcom/miui/gallery/projection/RemoteControlReceiver;

    const-string v1, "miui.intent.action.REMOTE_CONTROL"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/ReceiverUtils;->registerReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;[Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "remote_control_pkg_name"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "remote_control_proc_name"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    iget-object p1, p0, Lcom/miui/gallery/projection/RemoteController;->mRemoteControlReceiver:Lcom/miui/gallery/projection/RemoteControlReceiver;

    iget-object v0, p0, Lcom/miui/gallery/projection/RemoteController;->mListener:Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/projection/RemoteControlReceiver;->setListener(Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;)V

    return-void
.end method


# virtual methods
.method public disable(Landroid/content/Context;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/projection/RemoteController;->sDisableRemoteControlRunnable:Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/RemoteController;->disableRemoteControl(Landroid/content/Context;)V

    return-void
.end method

.method public disableDelay(Landroid/content/Context;)V
    .locals 3

    sget-object v0, Lcom/miui/gallery/projection/RemoteController;->sDisableRemoteControlRunnable:Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;

    invoke-virtual {v0, p1, p0}, Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;->setParent(Landroid/content/Context;Lcom/miui/gallery/projection/RemoteController;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/projection/RemoteController;->sDisableRemoteControlRunnable:Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;

    const-wide/16 v1, 0x7d0

    invoke-virtual {p1, v0, v1, v2}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public enable(Landroid/content/Context;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/projection/RemoteController;->sDisableRemoteControlRunnable:Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/projection/ConnectController;->getCurConnectedDevice()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/RemoteController;->enableRemoteControl(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method public onConnectStateChange(Landroid/content/Context;Z)V
    .locals 0

    if-eqz p2, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/RemoteController;->enableRemoteControl(Landroid/content/Context;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/RemoteController;->disableRemoteControl(Landroid/content/Context;)V

    :goto_0
    return-void
.end method

.method public release(Landroid/content/Context;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/projection/RemoteController;->sDisableRemoteControlRunnable:Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/RemoteController;->disableRemoteControl(Landroid/content/Context;)V

    return-void
.end method
