.class Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncContentObserver;
.super Landroid/database/ContentObserver;
.source "SyncStateObserver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SyncContentObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncContentObserver;->this$0:Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->updateSyncStatus()V

    return-void
.end method

.method public onChange(ZLandroid/net/Uri;)V
    .locals 2

    const-string v0, "SyncStateObserver"

    const-string v1, "SyncContentObserver %s"

    invoke-static {v0, v1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-super {p0, p1, p2}, Landroid/database/ContentObserver;->onChange(ZLandroid/net/Uri;)V

    return-void
.end method
