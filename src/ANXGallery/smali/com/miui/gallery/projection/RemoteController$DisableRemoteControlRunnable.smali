.class Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;
.super Ljava/lang/Object;
.source "RemoteController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/projection/RemoteController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DisableRemoteControlRunnable"
.end annotation


# instance fields
.field private mContextRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private mParentRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/miui/gallery/projection/RemoteController;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/projection/RemoteController$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;->mParentRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;->mParentRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/projection/RemoteController;

    iget-object v1, p0, Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;->mContextRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    invoke-static {v0, v1}, Lcom/miui/gallery/projection/RemoteController;->access$100(Lcom/miui/gallery/projection/RemoteController;Landroid/content/Context;)V

    goto :goto_0

    :cond_0
    const-string v0, "RemoteController"

    const-string v1, "parent is null"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setParent(Landroid/content/Context;Lcom/miui/gallery/projection/RemoteController;)V
    .locals 1

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;->mParentRef:Ljava/lang/ref/WeakReference;

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/miui/gallery/projection/RemoteController$DisableRemoteControlRunnable;->mContextRef:Ljava/lang/ref/WeakReference;

    return-void
.end method
