.class Lcom/miui/gallery/cloud/control/SyncMonitor$2;
.super Landroid/content/BroadcastReceiver;
.source "SyncMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/cloud/control/SyncMonitor;->monitorNetworkingAccepted()V
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

    iput-object p1, p0, Lcom/miui/gallery/cloud/control/SyncMonitor$2;->this$0:Lcom/miui/gallery/cloud/control/SyncMonitor;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/cloud/control/SyncMonitor$2;->this$0:Lcom/miui/gallery/cloud/control/SyncMonitor;

    invoke-static {}, Lcom/miui/gallery/agreement/AgreementsUtils;->isNetworkingAgreementAccepted()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/control/SyncMonitor;->onNetworkingAcceptedToggled(Z)V

    return-void
.end method
