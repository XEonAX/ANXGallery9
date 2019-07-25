.class public Lcom/miui/gallery/ui/AIAlbumDisplayHelper;
.super Ljava/lang/Object;
.source "AIAlbumDisplayHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;,
        Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayHelperHolder;,
        Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;,
        Lcom/miui/gallery/ui/AIAlbumDisplayHelper$DisplayStatusCallback;
    }
.end annotation


# instance fields
.field private mAIAlbumSwitchObserver:Landroid/content/BroadcastReceiver;

.field private mObservable:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;

.field private mSearchCloudControlStatusObserver:Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;

.field private mStatusValueCache:Landroid/util/SparseBooleanArray;


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mStatusValueCache:Landroid/util/SparseBooleanArray;

    new-instance v0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$1;-><init>(Lcom/miui/gallery/ui/AIAlbumDisplayHelper;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mSearchCloudControlStatusObserver:Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;

    new-instance v0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$2;-><init>(Lcom/miui/gallery/ui/AIAlbumDisplayHelper;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mAIAlbumSwitchObserver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/AIAlbumDisplayHelper$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;-><init>()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/AIAlbumDisplayHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->requeryStatusAndNotifyStatusChange()V

    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/ui/AIAlbumDisplayHelper;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayHelperHolder;->access$100()Lcom/miui/gallery/ui/AIAlbumDisplayHelper;

    move-result-object v0

    return-object v0
.end method

.method private requeryStatusAndNotifyStatusChange()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mStatusValueCache:Landroid/util/SparseBooleanArray;

    if-nez v0, :cond_0

    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mStatusValueCache:Landroid/util/SparseBooleanArray;

    :goto_0
    new-instance v1, Landroid/util/SparseBooleanArray;

    invoke-direct {v1}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mStatusValueCache:Landroid/util/SparseBooleanArray;

    const/4 v1, 0x1

    invoke-static {v1}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isLocalSearchOpen(Z)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isCloudControlSearchBarOpen()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->updateNewValue(Landroid/util/SparseBooleanArray;IZ)V

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->useNewAIAlbumSwitch()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isFaceAlbumEnabled()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-static {v1}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isLocalSearchOpen(Z)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    :cond_3
    :goto_2
    const/4 v2, 0x2

    invoke-direct {p0, v0, v2, v1}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->updateNewValue(Landroid/util/SparseBooleanArray;IZ)V

    iget-object v1, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mObservable:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;

    if-eqz v1, :cond_4

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v1

    if-lez v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mObservable:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;->onUpdateStatus(Landroid/util/SparseBooleanArray;)V

    :cond_4
    return-void
.end method

.method private updateNewValue(Landroid/util/SparseBooleanArray;IZ)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mStatusValueCache:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p2, p3}, Landroid/util/SparseBooleanArray;->put(IZ)V

    invoke-virtual {p1, p2}, Landroid/util/SparseBooleanArray;->indexOfKey(I)I

    move-result v0

    if-ltz v0, :cond_1

    invoke-virtual {p1, p2}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v0

    if-eq v0, p3, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1, p2}, Landroid/util/SparseBooleanArray;->delete(I)V

    goto :goto_1

    :cond_1
    :goto_0
    invoke-virtual {p1, p2, p3}, Landroid/util/SparseBooleanArray;->put(IZ)V

    :goto_1
    return-void
.end method


# virtual methods
.method public registerAIAlbumDisplayStatusObserver(Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;)Landroid/util/SparseBooleanArray;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mObservable:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;-><init>(Lcom/miui/gallery/ui/AIAlbumDisplayHelper;Lcom/miui/gallery/ui/AIAlbumDisplayHelper$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mObservable:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->requeryStatusAndNotifyStatusChange()V

    iget-object v0, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mObservable:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;->countObservers()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mObservable:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;->addObserver(Ljava/util/Observer;)V

    if-gtz v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mObservable:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;->countObservers()I

    move-result p1

    if-lez p1, :cond_1

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object p1

    const-string v0, "search"

    iget-object v1, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mSearchCloudControlStatusObserver:Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->registerStatusObserver(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;)Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    new-instance p1, Landroid/content/IntentFilter;

    const-string v0, "com.miui.gallery.action.AI_ALBUM_SWITCH_CHANGE"

    invoke-direct {p1, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mAIAlbumSwitchObserver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1, p1}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mStatusValueCache:Landroid/util/SparseBooleanArray;

    invoke-virtual {p1}, Landroid/util/SparseBooleanArray;->clone()Landroid/util/SparseBooleanArray;

    move-result-object p1

    return-object p1
.end method

.method public unregisterAIAlbumDisplayStatusObserver(Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mObservable:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mObservable:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;->deleteObserver(Ljava/util/Observer;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mObservable:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;->countObservers()I

    move-result p1

    if-gtz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mSearchCloudControlStatusObserver:Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->unregisterStatusObserver(Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->mAIAlbumSwitchObserver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_0
    return-void
.end method
