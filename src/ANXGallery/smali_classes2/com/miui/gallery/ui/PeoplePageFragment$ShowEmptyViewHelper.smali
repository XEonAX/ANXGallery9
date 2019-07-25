.class Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;
.super Ljava/lang/Object;
.source "PeoplePageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PeoplePageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ShowEmptyViewHelper"
.end annotation


# instance fields
.field mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

.field final synthetic this$0:Lcom/miui/gallery/ui/PeoplePageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PeoplePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PeoplePageFragment;Lcom/miui/gallery/ui/PeoplePageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment;)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->setupNetworkConnection()V

    return-void
.end method

.method static synthetic access$1700(Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;Landroid/view/ViewStub;Z)Landroid/view/View;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->initializeEmptyView(Landroid/view/ViewStub;Z)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->updateEmptyView()V

    return-void
.end method

.method private initializeEmptyView(Landroid/view/ViewStub;Z)Landroid/view/View;
    .locals 0

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    if-nez p2, :cond_0

    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/EmptyPage;

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    invoke-direct {p0}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->setupEmptyView()V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->updateEmptyView()V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    return-object p1
.end method

.method private setupEmptyView()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setActionButtonVisible(Z)V

    return-void
.end method

.method private setupNetworkConnection()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PeoplePageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method private showFaceEmptyTips()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const v1, 0x7f10038f

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setTitle(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setActionButtonVisible(Z)V

    return-void
.end method

.method private showNoWifiTips()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const v1, 0x7f100391

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setTitle(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const v1, 0x7f10066e

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setActionButtonText(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setActionButtonVisible(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    new-instance v1, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper$2;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setOnActionButtonClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private showSwitchClosedTips()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const v1, 0x7f100397

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setTitle(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const v1, 0x7f100696

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setActionButtonText(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setActionButtonVisible(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    new-instance v1, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper$3;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setOnActionButtonClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private showSyncOffTips()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const v1, 0x7f100397

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setTitle(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const v1, 0x7f10060b

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setActionButtonText(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setActionButtonVisible(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    new-instance v1, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper$1;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setOnActionButtonClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private showSyncingTips()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const v1, 0x7f100390

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setTitle(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setActionButtonVisible(Z)V

    return-void
.end method

.method private updateEmptyView()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sIsFirstSynced()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isFaceAlbumEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->showSwitchClosedTips()V

    return-void

    :cond_1
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Face;->isFirstSyncCompleted()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->showFaceEmptyTips()V

    return-void

    :cond_2
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->showNoWifiTips()V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-direct {p0}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->showSyncOffTips()V

    goto :goto_0

    :cond_4
    invoke-direct {p0}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->showSyncingTips()V

    :goto_0
    return-void
.end method
