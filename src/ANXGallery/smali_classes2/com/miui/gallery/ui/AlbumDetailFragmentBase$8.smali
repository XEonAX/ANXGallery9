.class Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;
.super Ljava/lang/Object;
.source "AlbumDetailFragmentBase.java"

# interfaces
.implements Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AlbumDetailFragmentBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mAddToAlbum:Landroid/view/MenuItem;

.field private mCreativity:Landroid/view/MenuItem;

.field private mDelete:Landroid/view/MenuItem;

.field private mMode:Landroid/view/ActionMode;

.field private mRemoveSecret:Landroid/view/MenuItem;

.field private mSend:Landroid/view/MenuItem;

.field final synthetic this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;)Landroid/view/ActionMode;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mMode:Landroid/view/ActionMode;

    return-object p0
.end method

.method private isMenuItemVisible(Landroid/view/MenuItem;)Z
    .locals 0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/view/MenuItem;->isVisible()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private updateMenuState()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemCount()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mDelete:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mDelete:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mAddToAlbum:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mAddToAlbum:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mCreativity:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mCreativity:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mRemoveSecret:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mRemoveSecret:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mSend:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mSend:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mDelete:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mDelete:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mAddToAlbum:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mAddToAlbum:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_6
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mCreativity:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mCreativity:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_7
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mRemoveSecret:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mRemoveSecret:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_8
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mSend:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mSend:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_9
    :goto_0
    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .locals 8

    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result p2

    const/4 v0, 0x1

    sparse-switch p2, :sswitch_data_0

    const/4 p1, 0x0

    return p1

    :sswitch_0
    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v1, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8$3;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8$3;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;Landroid/view/ActionMode;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    invoke-static {p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->access$600(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->ListToArray(Ljava/util/List;)[J

    move-result-object p1

    invoke-static {p2, v1, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->removeFromSecretAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[J)V

    goto :goto_0

    :sswitch_1
    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    invoke-static {p2, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->access$700(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;Landroid/view/ActionMode;)V

    goto :goto_0

    :sswitch_2
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    iget-object v1, p1, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v2, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8$1;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;)V

    const/4 v3, 0x0

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isVirtualAlbum()Z

    move-result p1

    xor-int/lit8 v4, p1, 0x1

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    invoke-static {p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->access$500(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;)Z

    move-result v5

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->isCheckedItemContainVideo()Z

    move-result v6

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    invoke-static {p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->access$600(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->ListToArray(Ljava/util/List;)[J

    move-result-object v7

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;IZZZ[J)V

    goto :goto_0

    :sswitch_3
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    const/4 p2, 0x0

    invoke-static {p1, p2, p2}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->access$800(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :sswitch_4
    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v1, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8$2;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;Landroid/view/ActionMode;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItems()Ljava/util/List;

    move-result-object p1

    invoke-static {p2, v1, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->doProduceCreation(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Ljava/util/List;)V

    :goto_0
    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f090017 -> :sswitch_4
        0x7f09001d -> :sswitch_3
        0x7f090026 -> :sswitch_2
        0x7f0900c6 -> :sswitch_1
        0x7f090260 -> :sswitch_0
    .end sparse-switch
.end method

.method public onAllItemsCheckedStateChanged(Landroid/view/ActionMode;Z)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->updateMenuState()V

    return-void
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mMode:Landroid/view/ActionMode;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isSecretAlbum()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/ActionMode;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object p1

    const v0, 0x7f0c000a

    invoke-virtual {p1, v0, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const p1, 0x7f090260

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mRemoveSecret:Landroid/view/MenuItem;

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/util/BuildUtil;->isMiuiSdkGte15(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, 0x7f0c000e

    goto :goto_0

    :cond_1
    const v0, 0x7f0c0005

    :goto_0
    invoke-virtual {p1}, Landroid/view/ActionMode;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object p1

    invoke-virtual {p1, v0, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const p1, 0x7f090026

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mAddToAlbum:Landroid/view/MenuItem;

    const p1, 0x7f090017

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mCreativity:Landroid/view/MenuItem;

    :goto_1
    const p1, 0x7f0900c6

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mDelete:Landroid/view/MenuItem;

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mCreativity:Landroid/view/MenuItem;

    const/4 v0, 0x1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mCreativity:Landroid/view/MenuItem;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isVideoAlbum()Z

    move-result v1

    xor-int/2addr v1, v0

    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mDelete:Landroid/view/MenuItem;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mDelete:Landroid/view/MenuItem;

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_3
    const p1, 0x7f09001d

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->mSend:Landroid/view/MenuItem;

    const-string p1, "album_detail"

    const-string p2, "action_mode_create"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->onEnterActionMode()V

    return v0
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .locals 0

    return-void
.end method

.method public onItemCheckedStateChanged(Landroid/view/ActionMode;IJZ)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;->updateMenuState()V

    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
