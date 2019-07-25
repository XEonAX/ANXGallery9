.class Lcom/miui/gallery/cloud/control/SyncMonitor$1;
.super Ljava/lang/Object;
.source "SyncMonitor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/cloud/control/SyncMonitor;->monitorProcessLifecycle()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cloud/control/SyncMonitor;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cloud/control/SyncMonitor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/control/SyncMonitor$1;->this$0:Lcom/miui/gallery/cloud/control/SyncMonitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    invoke-static {}, Landroid/arch/lifecycle/ProcessLifecycleOwner;->get()Landroid/arch/lifecycle/LifecycleOwner;

    move-result-object v0

    invoke-interface {v0}, Landroid/arch/lifecycle/LifecycleOwner;->getLifecycle()Landroid/arch/lifecycle/Lifecycle;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cloud/control/SyncMonitor$1$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/cloud/control/SyncMonitor$1$1;-><init>(Lcom/miui/gallery/cloud/control/SyncMonitor$1;)V

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/Lifecycle;->addObserver(Landroid/arch/lifecycle/LifecycleObserver;)V

    return-void
.end method
