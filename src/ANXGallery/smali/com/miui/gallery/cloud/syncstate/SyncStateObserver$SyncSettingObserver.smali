.class Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncSettingObserver;
.super Ljava/lang/Object;
.source "SyncStateObserver.java"

# interfaces
.implements Landroid/content/SyncStatusObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SyncSettingObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncSettingObserver;->this$0:Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$SyncSettingObserver;-><init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;)V

    return-void
.end method


# virtual methods
.method public onStatusChanged(I)V
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const-string p1, "SyncStateObserver"

    const-string v0, "SyncSettingObserver"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->updateSyncStatus()V

    :cond_0
    return-void
.end method
