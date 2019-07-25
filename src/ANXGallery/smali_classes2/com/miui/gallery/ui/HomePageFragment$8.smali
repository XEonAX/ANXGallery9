.class Lcom/miui/gallery/ui/HomePageFragment$8;
.super Ljava/lang/Object;
.source "HomePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/HomePageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mAddToAlbum:Landroid/view/MenuItem;

.field private mDelete:Landroid/view/MenuItem;

.field private mProduce:Landroid/view/MenuItem;

.field private mSend:Landroid/view/MenuItem;

.field final synthetic this$0:Lcom/miui/gallery/ui/HomePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/HomePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private updateMenuState()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/HomePageFragment;->access$400(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->getCheckedItemCount()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->mDelete:Landroid/view/MenuItem;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->mAddToAlbum:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->mProduce:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->mSend:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->mDelete:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->mAddToAlbum:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->mProduce:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->mSend:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :goto_0
    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .locals 9

    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result p2

    const v0, 0x7f090017

    if-eq p2, v0, :cond_3

    const v0, 0x7f09001d

    if-eq p2, v0, :cond_2

    const v0, 0x7f090026

    if-eq p2, v0, :cond_1

    const v0, 0x7f0900c6

    if-eq p2, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    iget-object v0, p2, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-string v1, "HomePageFragmentDeleteMediaDialogFragment"

    new-instance v2, Lcom/miui/gallery/ui/HomePageFragment$8$2;

    invoke-direct {v2, p0, p1}, Lcom/miui/gallery/ui/HomePageFragment$8$2;-><init>(Lcom/miui/gallery/ui/HomePageFragment$8;Landroid/view/ActionMode;)V

    const-wide/16 v3, -0x1

    const-string v5, ""

    const/4 v6, 0x1

    const/16 v7, 0x1a

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1600(Lcom/miui/gallery/ui/HomePageFragment;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->ListToArray(Ljava/util/List;)[J

    move-result-object v8

    invoke-static/range {v0 .. v8}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->delete(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;JLjava/lang/String;II[J)V

    goto :goto_0

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    iget-object v0, p2, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v1, Lcom/miui/gallery/ui/HomePageFragment$8$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/ui/HomePageFragment$8$1;-><init>(Lcom/miui/gallery/ui/HomePageFragment$8;Landroid/view/ActionMode;)V

    const/4 v2, 0x1

    const/4 v3, 0x1

    const/4 v4, 0x1

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$400(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->isCheckedItemContainVideo()Z

    move-result v5

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1600(Lcom/miui/gallery/ui/HomePageFragment;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->ListToArray(Ljava/util/List;)[J

    move-result-object v6

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;IZZZ[J)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    const/4 p2, 0x0

    invoke-static {p1, p2, p2}, Lcom/miui/gallery/ui/HomePageFragment;->access$1400(Lcom/miui/gallery/ui/HomePageFragment;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v0, Lcom/miui/gallery/ui/HomePageFragment$8$3;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/ui/HomePageFragment$8$3;-><init>(Lcom/miui/gallery/ui/HomePageFragment$8;Landroid/view/ActionMode;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$400(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->getCheckedItems()Ljava/util/List;

    move-result-object p1

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->doProduceCreation(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Ljava/util/List;)V

    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public onAllItemsCheckedStateChanged(Landroid/view/ActionMode;Z)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment$8;->updateMenuState()V

    return-void
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/util/BuildUtil;->isMiuiSdkGte15(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f0c000e

    goto :goto_0

    :cond_0
    const v0, 0x7f0c0005

    :goto_0
    invoke-virtual {p1}, Landroid/view/ActionMode;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object p1

    invoke-virtual {p1, v0, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const p1, 0x7f090026

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->mAddToAlbum:Landroid/view/MenuItem;

    const p1, 0x7f0900c6

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->mDelete:Landroid/view/MenuItem;

    const p1, 0x7f090017

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->mProduce:Landroid/view/MenuItem;

    const p1, 0x7f09001d

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->mSend:Landroid/view/MenuItem;

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/HomePageTopBarController;

    move-result-object p1

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/HomePageTopBarController;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/HomePageTopBarController;->setEnable(Z)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1500(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/TopSearchBarController;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1500(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/TopSearchBarController;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/TopSearchBarController;->onPause()V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1500(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/TopSearchBarController;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/TopSearchBarController;->setEnable(Z)V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/HomePageFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/ui/ImageSelectionTipFragment;->showImageSelectionTipDialogIfNecessary(Landroid/app/Activity;)V

    const-string p1, "home"

    const-string v0, "action_mode_create"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "best_image"

    const-string v0, "best_image_count"

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getBestImageCount(Z)I

    move-result p2

    int-to-long v1, p2

    invoke-static {p1, v0, v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    const/4 p1, 0x1

    return p1
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/HomePageTopBarController;

    move-result-object p1

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/HomePageTopBarController;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/HomePageTopBarController;->setEnable(Z)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1500(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/TopSearchBarController;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1500(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/TopSearchBarController;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/TopSearchBarController;->onResume()V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$8;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1500(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/TopSearchBarController;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/TopSearchBarController;->setEnable(Z)V

    :cond_1
    return-void
.end method

.method public onItemCheckedStateChanged(Landroid/view/ActionMode;IJZ)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment$8;->updateMenuState()V

    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
