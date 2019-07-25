.class Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;
.super Ljava/lang/Object;
.source "BurstPhotoFragment.java"

# interfaces
.implements Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;
.implements Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BurstPhotoFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BurstChoiceModeManager"
.end annotation


# instance fields
.field protected mBurstChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

.field private mPhotoChoiceTitle:Lcom/miui/gallery/ui/PhotoChoiceTitle;

.field private mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

.field final synthetic this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BurstPhotoFragment;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0902ae

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    iput-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setOnSlipListener(Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;)V

    invoke-virtual {p1}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getView()Landroid/view/View;

    move-result-object p1

    const v0, 0x7f090217

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/PhotoChoiceTitle;

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mPhotoChoiceTitle:Lcom/miui/gallery/ui/PhotoChoiceTitle;

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mPhotoChoiceTitle:Lcom/miui/gallery/ui/PhotoChoiceTitle;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->getTitle()Landroid/widget/TextView;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->setUpPreviewFragment()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->saveBurstItems(Z)V

    return-void
.end method

.method private saveBurstItems(Z)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/DocumentProviderUtils;->needRequestExternalSDCardPermission(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/DocumentProviderUtils;->startExtSDCardPermissionActivityForResult(Landroid/app/Activity;)V

    return-void

    :cond_0
    new-instance v0, Lcom/miui/gallery/ui/ProcessTask;

    new-instance v1, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;-><init>(Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;Z)V

    invoke-direct {v0, v1}, Lcom/miui/gallery/ui/ProcessTask;-><init>(Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;)V

    new-instance p1, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$5;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$5;-><init>(Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;)V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/ProcessTask;->setCompleteListener(Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/BurstPhotoFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    const v2, 0x7f1000cd

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/ui/ProcessTask;->showProgress(Landroid/app/Activity;Ljava/lang/String;)V

    sget-object p1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/ui/ProcessTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method private setPhotoChoiceTitleVisible(Z)V
    .locals 1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x4

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mPhotoChoiceTitle:Lcom/miui/gallery/ui/PhotoChoiceTitle;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->getVisibility()I

    move-result v0

    if-eq p1, v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mPhotoChoiceTitle:Lcom/miui/gallery/ui/PhotoChoiceTitle;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->setVisibility(I)V

    :cond_1
    return-void
.end method


# virtual methods
.method public discard()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->setPhotoChoiceTitleVisible(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mBurstChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->finish()V

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BurstPhotoFragment;->finish()V

    return-void
.end method

.method public final onAllItemsCheckedStateChanged(Z)V
    .locals 0

    return-void
.end method

.method public onDataSetLoaded(Lcom/miui/gallery/model/BaseDataSet;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "BurstPhotoPreviewFragment"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->setDataSet(Lcom/miui/gallery/model/BaseDataSet;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->updateSelectMode()V

    return-void
.end method

.method public onItemChanged(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "BurstPhotoPreviewFragment"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->scrollToPosition(I)V

    :cond_0
    return-void
.end method

.method public final onItemCheckedStateChanged(IJZ)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->updateSelectMode()V

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object p2

    const-string p3, "BurstPhotoPreviewFragment"

    invoke-virtual {p2, p3}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p2

    if-eqz p2, :cond_0

    check-cast p2, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-virtual {p2, p1, p4}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->setCheckedItem(IZ)V

    :cond_0
    return-void
.end method

.method public onSlipEnd(Z)V
    .locals 4

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->setPhotoChoiceTitleVisible(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/ViewPager;->setCurrentItem(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setDraggable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mBurstChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    iget-object v2, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/BurstPhotoFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v2, v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->setChecked(IJZ)V

    :cond_0
    return-void
.end method

.method public onSlipStart()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->startActionMode(Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;)Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mBurstChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->setPhotoChoiceTitleVisible(Z)V

    return-void
.end method

.method public onSlipStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onSlipping(F)V
    .locals 0

    return-void
.end method

.method public setSlipped(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setSlipped(Z)V

    return-void
.end method

.method protected setUpPreviewFragment()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "BurstPhotoPreviewFragment"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-direct {v1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;-><init>()V

    const v2, 0x7f09021a

    const-string v3, "BurstPhotoPreviewFragment"

    invoke-virtual {v0, v2, v1, v3}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    move-object v0, v1

    :cond_0
    check-cast v0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    iget-object v1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/BurstPhotoFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataSet()Lcom/miui/gallery/model/BaseDataSet;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->setDataSet(Lcom/miui/gallery/model/BaseDataSet;)V

    new-instance v1, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$1;-><init>(Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->setOnItemScrolledListener(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnScrollToPositionListener;)V

    new-instance v1, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$2;-><init>(Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->setOnExitListener(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnExitListener;)V

    return-void
.end method

.method public showSaveDialog()V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mBurstChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getSelectItems()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    const v3, 0x7f1000c9

    invoke-virtual {v2, v3}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f0e0014

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x1

    new-array v7, v6, [Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-virtual {v2, v4, v5, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v6

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    const/high16 v4, 0x1040000

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    new-instance v2, Lmiui/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    iget-object v3, v3, Lcom/miui/gallery/ui/BurstPhotoFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v2, v3}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v3, -0x1

    new-instance v4, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$3;

    invoke-direct {v4, p0, v0}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$3;-><init>(Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;Ljava/util/List;)V

    invoke-virtual {v2, v1, v3, v4}, Lmiui/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method protected updateSelectMode()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mBurstChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mBurstChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getSelectItems()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->mPhotoChoiceTitle:Lcom/miui/gallery/ui/PhotoChoiceTitle;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->getTitle()Landroid/widget/TextView;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    const v4, 0x7f1000ca

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v1

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/BurstPhotoFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getCount()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v5, v0

    invoke-virtual {v3, v4, v5}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
