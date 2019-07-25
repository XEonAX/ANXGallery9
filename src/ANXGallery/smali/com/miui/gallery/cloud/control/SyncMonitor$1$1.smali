.class Lcom/miui/gallery/cloud/control/SyncMonitor$1$1;
.super Ljava/lang/Object;
.source "SyncMonitor.java"

# interfaces
.implements Landroid/arch/lifecycle/DefaultLifecycleObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/cloud/control/SyncMonitor$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/cloud/control/SyncMonitor$1;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cloud/control/SyncMonitor$1;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/control/SyncMonitor$1$1;->this$1:Lcom/miui/gallery/cloud/control/SyncMonitor$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic onCreate(Landroid/arch/lifecycle/LifecycleOwner;)V
    .locals 0

    invoke-static {p0, p1}, Landroid/arch/lifecycle/DefaultLifecycleObserver$-CC;->$default$onCreate(Landroid/arch/lifecycle/DefaultLifecycleObserver;Landroid/arch/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public synthetic onDestroy(Landroid/arch/lifecycle/LifecycleOwner;)V
    .locals 0

    invoke-static {p0, p1}, Landroid/arch/lifecycle/DefaultLifecycleObserver$-CC;->$default$onDestroy(Landroid/arch/lifecycle/DefaultLifecycleObserver;Landroid/arch/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public synthetic onPause(Landroid/arch/lifecycle/LifecycleOwner;)V
    .locals 0

    invoke-static {p0, p1}, Landroid/arch/lifecycle/DefaultLifecycleObserver$-CC;->$default$onPause(Landroid/arch/lifecycle/DefaultLifecycleObserver;Landroid/arch/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public synthetic onResume(Landroid/arch/lifecycle/LifecycleOwner;)V
    .locals 0

    invoke-static {p0, p1}, Landroid/arch/lifecycle/DefaultLifecycleObserver$-CC;->$default$onResume(Landroid/arch/lifecycle/DefaultLifecycleObserver;Landroid/arch/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public onStart(Landroid/arch/lifecycle/LifecycleOwner;)V
    .locals 1

    invoke-static {}, Landroid/arch/lifecycle/ProcessLifecycleOwner;->get()Landroid/arch/lifecycle/LifecycleOwner;

    move-result-object v0

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/cloud/control/SyncMonitor$1$1;->this$1:Lcom/miui/gallery/cloud/control/SyncMonitor$1;

    iget-object p1, p1, Lcom/miui/gallery/cloud/control/SyncMonitor$1;->this$0:Lcom/miui/gallery/cloud/control/SyncMonitor;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/cloud/control/SyncMonitor;->onProcessLifecycleToggled(Z)V

    :cond_0
    return-void
.end method

.method public onStop(Landroid/arch/lifecycle/LifecycleOwner;)V
    .locals 1

    invoke-static {}, Landroid/arch/lifecycle/ProcessLifecycleOwner;->get()Landroid/arch/lifecycle/LifecycleOwner;

    move-result-object v0

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/cloud/control/SyncMonitor$1$1;->this$1:Lcom/miui/gallery/cloud/control/SyncMonitor$1;

    iget-object p1, p1, Lcom/miui/gallery/cloud/control/SyncMonitor$1;->this$0:Lcom/miui/gallery/cloud/control/SyncMonitor;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/cloud/control/SyncMonitor;->onProcessLifecycleToggled(Z)V

    :cond_0
    return-void
.end method
