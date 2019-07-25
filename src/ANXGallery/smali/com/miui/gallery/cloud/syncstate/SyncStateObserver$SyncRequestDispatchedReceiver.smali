.class Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncRequestDispatchedReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SyncStateObserver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SyncRequestDispatchedReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncRequestDispatchedReceiver;->this$0:Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncRequestDispatchedReceiver;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    const-string p1, "SyncStateObserver"

    const-string v0, "SyncRequestDispatchedReceiver: %s"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string p1, "com.miui.gallery.SYNC_COMMAND_DISPATCHED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->onSyncCommandDispatched()V

    :cond_0
    return-void
.end method
