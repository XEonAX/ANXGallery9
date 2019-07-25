.class final Lcom/miui/gallery/ui/SyncBar$SyncManager;
.super Lcom/miui/gallery/ui/SyncBar$ChildManager;
.source "SyncBar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/miui/gallery/cloud/syncstate/OnSyncStateChangeObserver;
.implements Lcom/miui/gallery/util/OnAppFocusedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SyncBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SyncManager"
.end annotation


# static fields
.field private static sInstanceAutoShowStatus:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/syncstate/SyncStatus;",
            ">;"
        }
    .end annotation
.end field

.field private static sPersistentAutoShowStatus:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/syncstate/SyncStatus;",
            ">;"
        }
    .end annotation
.end field

.field private static sProcessAutoShowStatus:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/syncstate/SyncStatus;",
            ">;"
        }
    .end annotation
.end field

.field private static sWarnStatus:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/syncstate/SyncStatus;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mCurSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sInstanceAutoShowStatus:Ljava/util/List;

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sInstanceAutoShowStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNCING_METADATA:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sInstanceAutoShowStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNC_ERROR:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sInstanceAutoShowStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->CTA_NOT_ALLOW:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sProcessAutoShowStatus:Ljava/util/List;

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sProcessAutoShowStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNCED_WITH_OVERSIZED_FILE:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sProcessAutoShowStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->DISCONNECTED:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sProcessAutoShowStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->NO_WIFI:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sProcessAutoShowStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->BATTERY_LOW:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sProcessAutoShowStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->UNKNOWN_ERROR:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sPersistentAutoShowStatus:Ljava/util/List;

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sPersistentAutoShowStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->NO_ACCOUNT:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sPersistentAutoShowStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->MASTER_SYNC_OFF:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sPersistentAutoShowStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNC_OFF:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sPersistentAutoShowStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYSTEM_SPACE_LOW:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sPersistentAutoShowStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->CLOUD_SPACE_FULL:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sWarnStatus:Ljava/util/List;

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sWarnStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNC_ERROR:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sWarnStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->CTA_NOT_ALLOW:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sWarnStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYSTEM_SPACE_LOW:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sWarnStatus:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->CLOUD_SPACE_FULL:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/ui/SyncBar;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/SyncBar$ChildManager;-><init>(Lcom/miui/gallery/ui/SyncBar;I)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/SyncBar$SyncManager;Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->canAutoOpenDrawer(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z

    move-result p0

    return p0
.end method

.method private canAutoOpenDrawer(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->isPermanent()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sInstanceAutoShowStatus:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->mCurSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-eq v0, p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_2
    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sProcessAutoShowStatus:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$TopBar;->getLastSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object v0

    if-eq v0, p1, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :goto_1
    return v1

    :cond_4
    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sPersistentAutoShowStatus:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->hasShowSyncStatusPersistent(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z

    move-result p1

    xor-int/2addr p1, v1

    return p1

    :cond_5
    return v2
.end method

.method private getTitleDrawable(Z)Landroid/graphics/drawable/Drawable;
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f070283

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method private hasShowSyncStatusPersistent()Z
    .locals 2

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sPersistentAutoShowStatus:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-static {v1}, Lcom/miui/gallery/preference/GalleryPreferences$TopBar;->hasShowedSyncStatusTip(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private hasShowSyncStatusPersistent(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z
    .locals 2

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$TopBar;->hasShowedSyncStatusTip(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/miui/gallery/preference/GalleryPreferences$TopBar;->setHasShowedSyncStatusTip(Lcom/miui/gallery/cloud/syncstate/SyncStatus;Z)V

    :cond_0
    return v0
.end method

.method private needShowSyncBar(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z
    .locals 1

    sget-boolean v0, Lcom/miui/os/Rom;->IS_INTERNATIONAL:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->NO_ACCOUNT:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-eq p1, v0, :cond_0

    sget-object v0, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->MASTER_SYNC_OFF:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-eq p1, v0, :cond_0

    sget-object v0, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNC_OFF:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-ne p1, v0, :cond_1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getSyncStrategy()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isGuideCloudInternational()Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method private needShowWarning(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sWarnStatus:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method private refreshSyncBar(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V
    .locals 13

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getDirtyCount()[I

    move-result-object v1

    const/4 v2, 0x0

    aget v3, v1, v2

    const/4 v4, 0x1

    aget v1, v1, v4

    add-int/2addr v3, v1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object v1

    sget-object v5, Lcom/miui/gallery/ui/SyncBar$1;->$SwitchMap$com$miui$gallery$cloud$syncstate$SyncStatus:[I

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->ordinal()I

    move-result v6

    aget v5, v5, v6

    const/4 v6, 0x0

    packed-switch v5, :pswitch_data_0

    if-lez v3, :cond_8

    const v5, 0x7f0e004a

    new-array v7, v4, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v2

    invoke-virtual {v0, v5, v3, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_4

    :pswitch_0
    const v5, 0x7f0e004b

    new-array v7, v4, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v2

    invoke-virtual {v0, v5, v3, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_4

    :pswitch_1
    const v2, 0x7f1006c5

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_4

    :pswitch_2
    const v3, 0x7f1006cb

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncedCount()[I

    move-result-object v3

    aget v5, v3, v2

    aget v3, v3, v4

    add-int/2addr v5, v3

    if-lez v5, :cond_0

    const-string v3, "%d"

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_0
    move-object v3, v6

    :goto_0
    move-object v8, v0

    move-object v9, v3

    const/4 v11, 0x0

    goto/16 :goto_6

    :pswitch_3
    if-lez v3, :cond_1

    const v5, 0x7f1006c7

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    :cond_1
    :pswitch_4
    move-object v5, v6

    :goto_1
    if-nez v5, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v5

    sget-object v7, Lcom/miui/gallery/cloud/base/SyncType;->GPRS_FORCE:Lcom/miui/gallery/cloud/base/SyncType;

    if-ne v5, v7, :cond_2

    const v5, 0x7f1006ca

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_2
    const v5, 0x7f1006cc

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_3
    move-object v0, v5

    :goto_2
    if-lez v3, :cond_4

    const-string v5, "%d"

    new-array v7, v4, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v2

    invoke-static {v5, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->hasShowSyncStatusPersistent()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-direct {p0}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->removeSyncStatusPersistent()V

    goto :goto_3

    :cond_4
    move-object v5, v6

    :cond_5
    :goto_3
    if-lez v3, :cond_6

    const/4 v2, 0x1

    :cond_6
    move-object v8, v0

    move v11, v2

    move-object v9, v5

    goto :goto_6

    :pswitch_5
    const v2, 0x7f1006c6

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :pswitch_6
    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncedCount()[I

    move-result-object v3

    aget v5, v3, v2

    aget v3, v3, v4

    add-int/2addr v5, v3

    const v3, 0x7f1006c9

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-lez v5, :cond_7

    const-string v3, "%d"

    new-array v7, v4, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v7, v2

    invoke-static {v3, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    move-object v8, v0

    move-object v9, v2

    goto :goto_5

    :cond_7
    :goto_4
    move-object v8, v0

    move-object v9, v6

    :goto_5
    const/4 v11, 0x1

    goto :goto_6

    :cond_8
    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sIsFirstSynced()Z

    move-result v2

    if-nez v2, :cond_9

    const v2, 0x7f1006c4

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :cond_9
    const v2, 0x7f1006c8

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :goto_6
    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->canAutoOpenDrawer(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z

    move-result v0

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->needShowWarning(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z

    move-result v2

    new-instance v3, Lcom/miui/gallery/ui/SyncBar$PanelData;

    invoke-direct {p0, v2}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->getTitleDrawable(Z)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    if-eqz v11, :cond_a

    move-object v12, p0

    goto :goto_7

    :cond_a
    move-object v12, v6

    :goto_7
    move-object v7, v3

    invoke-direct/range {v7 .. v12}, Lcom/miui/gallery/ui/SyncBar$PanelData;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;ZLandroid/view/View$OnClickListener;)V

    invoke-virtual {p0, v3, v0}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->refresh(Lcom/miui/gallery/ui/SyncBar$PanelData;Z)Z

    move-result v2

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->needShowSyncBar(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z

    move-result v3

    if-eqz v3, :cond_b

    if-eqz v2, :cond_c

    iput-object v1, p0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->mCurSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-eqz v0, :cond_c

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->name()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->statSyncBarAutoShowEvent(Ljava/lang/String;)V

    goto :goto_8

    :cond_b
    iput-object v1, p0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->mCurSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    :cond_c
    :goto_8
    invoke-static {v1}, Lcom/miui/gallery/preference/GalleryPreferences$TopBar;->saveLastSyncStatus(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)V

    const-string v1, "SyncBar"

    const-string v2, "refresh sync bar: %s, showBar: %s"

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v1, v2, p1, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private removeSyncStatusPersistent()V
    .locals 3

    sget-object v0, Lcom/miui/gallery/ui/SyncBar$SyncManager;->sPersistentAutoShowStatus:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/miui/gallery/preference/GalleryPreferences$TopBar;->setHasShowedSyncStatusTip(Lcom/miui/gallery/cloud/syncstate/SyncStatus;Z)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private statSyncBarAutoShowEvent(Ljava/lang/String;)V
    .locals 4

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "sync_bar_show_%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "home_sync_bar"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private statSyncBarClickEvent(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "sync_bar_click_%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "home_sync_bar"

    invoke-static {v0, p1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public getCurSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getSyncState()Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object v0

    return-object v0
.end method

.method public needShow()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getSyncState()Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->needShowSyncBar(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z

    move-result v0

    return v0
.end method

.method public onAppFocused()V
    .locals 0

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getSyncState()Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sget-object v2, Lcom/miui/gallery/ui/SyncBar$1;->$SwitchMap$com$miui$gallery$cloud$syncstate$SyncStatus:[I

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/miui/gallery/activity/BackupDetailActivity;

    invoke-direct {v2, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_0
    invoke-static {p1}, Lcom/miui/gallery/util/IntentUtil;->gotoTurnOnSyncSwitch(Landroid/content/Context;)V

    goto :goto_0

    :pswitch_1
    const-string v2, "permanent"

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->isPermanent()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->TOPBAR:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    invoke-static {p1, v2}, Lcom/miui/gallery/util/IntentUtil;->guideToLoginXiaomiAccount(Landroid/content/Context;Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;)V

    goto :goto_0

    :pswitch_2
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/miui/gallery/activity/CloudSpaceStatusActivity;

    invoke-direct {v2, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :goto_0
    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->name()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, v1}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->statSyncBarClickEvent(Ljava/lang/String;Ljava/util/HashMap;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->unregisterSyncStateObserver(Landroid/content/Context;Lcom/miui/gallery/cloud/syncstate/OnSyncStateChangeObserver;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->registerSyncStateObserver(Landroid/content/Context;Lcom/miui/gallery/cloud/syncstate/OnSyncStateChangeObserver;)V

    return-void
.end method

.method public onSyncStateChanged(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->refreshSyncBar(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V

    return-void
.end method
