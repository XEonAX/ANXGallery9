.class public Lcom/miui/gallery/ui/SyncBar;
.super Lcom/miui/gallery/ui/HomePageTopBarController$HomePageBar;
.source "SyncBar.java"

# interfaces
.implements Lcom/miui/gallery/util/OnAppFocusedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/SyncBar$PanelData;,
        Lcom/miui/gallery/ui/SyncBar$DownloadManager;,
        Lcom/miui/gallery/ui/SyncBar$SyncManager;,
        Lcom/miui/gallery/ui/SyncBar$ChildManager;
    }
.end annotation


# static fields
.field private static sDownloadOverlayStatus:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/cloud/syncstate/SyncStatus;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mDesc:Landroid/widget/TextView;

.field private mDownloadManager:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

.field private mDownloadPanelData:Lcom/miui/gallery/ui/SyncBar$PanelData;

.field private mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

.field private mSyncManager:Lcom/miui/gallery/ui/SyncBar$SyncManager;

.field private mSyncPanelData:Lcom/miui/gallery/ui/SyncBar$PanelData;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/miui/gallery/ui/SyncBar;->sDownloadOverlayStatus:Ljava/util/LinkedList;

    sget-object v0, Lcom/miui/gallery/ui/SyncBar;->sDownloadOverlayStatus:Ljava/util/LinkedList;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->MASTER_SYNC_OFF:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar;->sDownloadOverlayStatus:Ljava/util/LinkedList;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNC_OFF:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/SyncBar;->sDownloadOverlayStatus:Ljava/util/LinkedList;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNCED:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILcom/miui/gallery/widget/PanelManager;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/ui/HomePageTopBarController$HomePageBar;-><init>(Landroid/content/Context;ILcom/miui/gallery/widget/PanelManager;)V

    new-instance p1, Lcom/miui/gallery/ui/SyncBar$SyncManager;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/ui/SyncBar$SyncManager;-><init>(Lcom/miui/gallery/ui/SyncBar;I)V

    iput-object p1, p0, Lcom/miui/gallery/ui/SyncBar;->mSyncManager:Lcom/miui/gallery/ui/SyncBar$SyncManager;

    new-instance p1, Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;-><init>(Lcom/miui/gallery/ui/SyncBar;I)V

    iput-object p1, p0, Lcom/miui/gallery/ui/SyncBar;->mDownloadManager:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    return-void
.end method

.method private ensureView()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/widget/PanelItemLayout;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/widget/PanelItemLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/SyncBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/SyncBar;->mDesc:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar;->mDesc:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f05007c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar;->mDesc:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SyncBar;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f060102

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    iget-object v1, p0, Lcom/miui/gallery/ui/SyncBar;->mDesc:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/PanelItemLayout;->addDetail(Landroid/view/View;)Landroid/view/View;

    :cond_0
    return-void
.end method


# virtual methods
.method public getView()Landroid/view/View;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/SyncBar;->ensureView()V

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/PanelItemLayout;->getView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onAppFocused()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar;->mSyncManager:Lcom/miui/gallery/ui/SyncBar$SyncManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->onAppFocused()V

    return-void
.end method

.method public onDestroy()V
    .locals 0

    return-void
.end method

.method public onPause()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar;->mSyncManager:Lcom/miui/gallery/ui/SyncBar$SyncManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->onPause()V

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar;->mDownloadManager:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar;->mSyncManager:Lcom/miui/gallery/ui/SyncBar$SyncManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar;->mDownloadManager:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->onResume()V

    return-void
.end method

.method public refresh(Lcom/miui/gallery/ui/SyncBar$PanelData;ZI)Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar;->mSyncManager:Lcom/miui/gallery/ui/SyncBar$SyncManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->needShow()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar;->mDownloadManager:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->needShow()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/SyncBar;->mPanelManager:Lcom/miui/gallery/widget/PanelManager;

    invoke-interface {p1, p0, v1}, Lcom/miui/gallery/widget/PanelManager;->removeItem(Lcom/miui/gallery/widget/PanelItem;Z)Z

    return v1

    :cond_0
    const/4 v0, 0x1

    if-ne p3, v0, :cond_4

    iput-object p1, p0, Lcom/miui/gallery/ui/SyncBar;->mDownloadPanelData:Lcom/miui/gallery/ui/SyncBar$PanelData;

    iget-object v2, p0, Lcom/miui/gallery/ui/SyncBar;->mDownloadManager:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->needShow()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/ui/SyncBar;->mSyncManager:Lcom/miui/gallery/ui/SyncBar$SyncManager;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->needShow()Z

    move-result v2

    if-eqz v2, :cond_1

    sget-object v2, Lcom/miui/gallery/ui/SyncBar;->sDownloadOverlayStatus:Ljava/util/LinkedList;

    iget-object v3, p0, Lcom/miui/gallery/ui/SyncBar;->mSyncManager:Lcom/miui/gallery/ui/SyncBar$SyncManager;

    invoke-virtual {v3}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->getCurSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_0
    if-nez v2, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/SyncBar;->mSyncManager:Lcom/miui/gallery/ui/SyncBar$SyncManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->needShow()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/SyncBar;->mSyncPanelData:Lcom/miui/gallery/ui/SyncBar$PanelData;

    if-eqz p1, :cond_3

    const/4 p1, 0x1

    goto :goto_1

    :cond_3
    const/4 p1, 0x0

    :goto_1
    iget-object p2, p0, Lcom/miui/gallery/ui/SyncBar;->mSyncManager:Lcom/miui/gallery/ui/SyncBar$SyncManager;

    iget-object v2, p0, Lcom/miui/gallery/ui/SyncBar;->mSyncManager:Lcom/miui/gallery/ui/SyncBar$SyncManager;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->getCurSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object v2

    invoke-static {p2, v2}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->access$000(Lcom/miui/gallery/ui/SyncBar$SyncManager;Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z

    move-result p2

    iget-object v2, p0, Lcom/miui/gallery/ui/SyncBar;->mSyncPanelData:Lcom/miui/gallery/ui/SyncBar$PanelData;

    move-object v4, v2

    move v2, p1

    move-object p1, v4

    goto :goto_2

    :cond_4
    const/4 v2, 0x0

    :cond_5
    :goto_2
    if-nez p3, :cond_a

    iput-object p1, p0, Lcom/miui/gallery/ui/SyncBar;->mSyncPanelData:Lcom/miui/gallery/ui/SyncBar$PanelData;

    iget-object p3, p0, Lcom/miui/gallery/ui/SyncBar;->mSyncManager:Lcom/miui/gallery/ui/SyncBar$SyncManager;

    invoke-virtual {p3}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->needShow()Z

    move-result p3

    if-eqz p3, :cond_8

    iget-object p3, p0, Lcom/miui/gallery/ui/SyncBar;->mDownloadManager:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    invoke-virtual {p3}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->needShow()Z

    move-result p3

    if-eqz p3, :cond_7

    sget-object p3, Lcom/miui/gallery/ui/SyncBar;->sDownloadOverlayStatus:Ljava/util/LinkedList;

    iget-object v2, p0, Lcom/miui/gallery/ui/SyncBar;->mSyncManager:Lcom/miui/gallery/ui/SyncBar$SyncManager;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/SyncBar$SyncManager;->getCurSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_6

    goto :goto_3

    :cond_6
    const/4 v2, 0x0

    goto :goto_4

    :cond_7
    :goto_3
    const/4 v2, 0x1

    :cond_8
    :goto_4
    if-nez v2, :cond_a

    iget-object p1, p0, Lcom/miui/gallery/ui/SyncBar;->mDownloadManager:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->needShow()Z

    move-result p1

    if-eqz p1, :cond_9

    iget-object p1, p0, Lcom/miui/gallery/ui/SyncBar;->mDownloadPanelData:Lcom/miui/gallery/ui/SyncBar$PanelData;

    if-eqz p1, :cond_9

    const/4 v2, 0x1

    goto :goto_5

    :cond_9
    const/4 v2, 0x0

    :goto_5
    iget-object p1, p0, Lcom/miui/gallery/ui/SyncBar;->mDownloadPanelData:Lcom/miui/gallery/ui/SyncBar$PanelData;

    :cond_a
    if-eqz v2, :cond_b

    invoke-direct {p0}, Lcom/miui/gallery/ui/SyncBar;->ensureView()V

    iget-object p3, p0, Lcom/miui/gallery/ui/SyncBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    iget-object v0, p1, Lcom/miui/gallery/ui/SyncBar$PanelData;->title:Ljava/lang/String;

    invoke-virtual {p3, v0}, Lcom/miui/gallery/widget/PanelItemLayout;->setTitle(Ljava/lang/CharSequence;)V

    iget-object p3, p0, Lcom/miui/gallery/ui/SyncBar;->mDesc:Landroid/widget/TextView;

    iget-object v0, p1, Lcom/miui/gallery/ui/SyncBar$PanelData;->desc:Ljava/lang/String;

    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p3, p0, Lcom/miui/gallery/ui/SyncBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    iget-object v0, p1, Lcom/miui/gallery/ui/SyncBar$PanelData;->titleDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p3, v0}, Lcom/miui/gallery/widget/PanelItemLayout;->setTitleDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p3, p0, Lcom/miui/gallery/ui/SyncBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    iget-boolean v0, p1, Lcom/miui/gallery/ui/SyncBar$PanelData;->showArrow:Z

    invoke-virtual {p3, v0}, Lcom/miui/gallery/widget/PanelItemLayout;->showArrow(Z)V

    iget-object p3, p0, Lcom/miui/gallery/ui/SyncBar;->mPanelItem:Lcom/miui/gallery/widget/PanelItemLayout;

    iget-object p1, p1, Lcom/miui/gallery/ui/SyncBar$PanelData;->listener:Landroid/view/View$OnClickListener;

    invoke-virtual {p3, p1}, Lcom/miui/gallery/widget/PanelItemLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SyncBar;->mPanelManager:Lcom/miui/gallery/widget/PanelManager;

    invoke-interface {p1, p0, p2}, Lcom/miui/gallery/widget/PanelManager;->addItem(Lcom/miui/gallery/widget/PanelItem;Z)Z

    :cond_b
    return v2
.end method
