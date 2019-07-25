.class public Lcom/miui/gallery/ui/HomePageTopBarController;
.super Ljava/lang/Object;
.source "HomePageTopBarController.java"

# interfaces
.implements Lcom/miui/gallery/util/OnAppFocusedListener;
.implements Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/HomePageTopBarController$HomePageBar;,
        Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;
    }
.end annotation


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mDelayShowBarRunnable:Ljava/lang/Runnable;

.field private mDiscoveryBar:Lcom/miui/gallery/ui/DiscoveryBar;

.field private mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

.field private mItemManager:Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;

.field private mSyncBar:Lcom/miui/gallery/ui/SyncBar;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/miui/gallery/widget/TwoStageDrawer;I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mActivity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {p2, p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->setDrawerListener(Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;)V

    new-instance p2, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {v0, p3}, Lcom/miui/gallery/widget/TwoStageDrawer;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/widget/PanelBar;

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;-><init>(Lcom/miui/gallery/ui/HomePageTopBarController;Lcom/miui/gallery/widget/PanelBar;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mItemManager:Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    new-instance p3, Lcom/miui/gallery/ui/HomePageTopBarController$1;

    invoke-direct {p3, p0}, Lcom/miui/gallery/ui/HomePageTopBarController$1;-><init>(Lcom/miui/gallery/ui/HomePageTopBarController;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/TwoStageDrawer;->post(Ljava/lang/Runnable;)Z

    new-instance p2, Lcom/miui/gallery/ui/SyncBar;

    iget-object p3, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mItemManager:Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;

    const/4 v0, 0x0

    invoke-direct {p2, p1, v0, p3}, Lcom/miui/gallery/ui/SyncBar;-><init>(Landroid/content/Context;ILcom/miui/gallery/widget/PanelManager;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mSyncBar:Lcom/miui/gallery/ui/SyncBar;

    new-instance p2, Lcom/miui/gallery/ui/DiscoveryBar;

    iget-object p3, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mItemManager:Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;

    const/4 v0, 0x1

    invoke-direct {p2, p1, v0, p3}, Lcom/miui/gallery/ui/DiscoveryBar;-><init>(Landroid/content/Context;ILcom/miui/gallery/widget/PanelManager;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDiscoveryBar:Lcom/miui/gallery/ui/DiscoveryBar;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/HomePageTopBarController;)Lcom/miui/gallery/widget/TwoStageDrawer;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/HomePageTopBarController;ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/HomePageTopBarController;->showPanelBar(ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/HomePageTopBarController;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageTopBarController;->isPanelBarOpened()Z

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/HomePageTopBarController;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageTopBarController;->isPanelBarAniming()Z

    move-result p0

    return p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/HomePageTopBarController;ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/HomePageTopBarController;->closePanelBar(ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/HomePageTopBarController;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/HomePageTopBarController;->delayShowPanelBar(I)V

    return-void
.end method

.method private closePanelBar(ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageTopBarController;->removeShowPanelBarMessage()V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->isDrawerOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/widget/TwoStageDrawer;->halfCloseDrawer(ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V

    :cond_0
    return-void
.end method

.method private delayShowPanelBar(I)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDelayShowBarRunnable:Ljava/lang/Runnable;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/HomePageTopBarController$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/HomePageTopBarController$2;-><init>(Lcom/miui/gallery/ui/HomePageTopBarController;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDelayShowBarRunnable:Ljava/lang/Runnable;

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageTopBarController;->removeShowPanelBarMessage()V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDelayShowBarRunnable:Ljava/lang/Runnable;

    int-to-long v2, p1

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private isPanelBarAniming()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->isAnimating()Z

    move-result v0

    return v0
.end method

.method private isPanelBarOpened()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->isDrawerOpen()Z

    move-result v0

    return v0
.end method

.method private removeShowPanelBarMessage()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDelayShowBarRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method private showPanelBar(ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageTopBarController;->removeShowPanelBarMessage()V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/widget/TwoStageDrawer;->openDrawer(ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V

    return-void
.end method


# virtual methods
.method public onAppFocused()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mSyncBar:Lcom/miui/gallery/ui/SyncBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar;->onAppFocused()V

    return-void
.end method

.method public onDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mSyncBar:Lcom/miui/gallery/ui/SyncBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDiscoveryBar:Lcom/miui/gallery/ui/DiscoveryBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/DiscoveryBar;->onDestroy()V

    return-void
.end method

.method public onDrawerClose(Lcom/miui/gallery/widget/TwoStageDrawer;)V
    .locals 0

    return-void
.end method

.method public onDrawerHalfOpen(Lcom/miui/gallery/widget/TwoStageDrawer;)V
    .locals 0

    return-void
.end method

.method public onDrawerOpen(Lcom/miui/gallery/widget/TwoStageDrawer;)V
    .locals 0

    return-void
.end method

.method public onDrawerSlide(Lcom/miui/gallery/widget/TwoStageDrawer;F)V
    .locals 0

    return-void
.end method

.method public onPause()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mSyncBar:Lcom/miui/gallery/ui/SyncBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar;->onPause()V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDiscoveryBar:Lcom/miui/gallery/ui/DiscoveryBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/DiscoveryBar;->onPause()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageTopBarController;->removeShowPanelBarMessage()V

    return-void
.end method

.method public onResume()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mSyncBar:Lcom/miui/gallery/ui/SyncBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDiscoveryBar:Lcom/miui/gallery/ui/DiscoveryBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/DiscoveryBar;->onResume()V

    return-void
.end method

.method public setDiscoveryMessage(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/model/DiscoveryMessage;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDiscoveryBar:Lcom/miui/gallery/ui/DiscoveryBar;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/DiscoveryBar;->setMessage(Ljava/util/List;)V

    return-void
.end method

.method public setEnable(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mItemManager:Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->setItemEnable(Z)V

    return-void
.end method

.method public setPermanent(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mSyncBar:Lcom/miui/gallery/ui/SyncBar;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/SyncBar;->setPermanent(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mDiscoveryBar:Lcom/miui/gallery/ui/DiscoveryBar;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/DiscoveryBar;->setPermanent(Z)V

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageTopBarController;->mItemManager:Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->hasItem()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/HomePageTopBarController;->showPanelBar(ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V

    :cond_0
    return-void
.end method
