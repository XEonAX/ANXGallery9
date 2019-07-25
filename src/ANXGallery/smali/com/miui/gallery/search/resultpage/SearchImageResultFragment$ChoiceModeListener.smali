.class Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;
.super Ljava/lang/Object;
.source "SearchImageResultFragment.java"

# interfaces
.implements Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChoiceModeListener"
.end annotation


# instance fields
.field private mAddToAlbum:Landroid/view/MenuItem;

.field private mCreativity:Landroid/view/MenuItem;

.field private mDelete:Landroid/view/MenuItem;

.field private mFeedback:Landroid/view/MenuItem;

.field private mMode:Landroid/view/ActionMode;

.field private mSend:Landroid/view/MenuItem;

.field final synthetic this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;-><init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;)Landroid/view/ActionMode;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mMode:Landroid/view/ActionMode;

    return-object p0
.end method

.method private updateMenuState()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object v0, v0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemCount()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mAddToAlbum:Landroid/view/MenuItem;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mDelete:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mCreativity:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mSend:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mFeedback:Landroid/view/MenuItem;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mFeedback:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mAddToAlbum:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mDelete:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mCreativity:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mSend:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mFeedback:Landroid/view/MenuItem;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mFeedback:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public inChoiceMode()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mMode:Landroid/view/ActionMode;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .locals 10

    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result p2

    sparse-switch p2, :sswitch_data_0

    const/4 p1, 0x0

    return p1

    :sswitch_0
    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object v0, v0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getCheckedServerIdList(Landroid/util/SparseBooleanArray;)Ljava/util/ArrayList;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-static {v0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->access$700(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object v1, v1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mQueryText:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-boolean v2, v2, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mInFeedbackTaskMode:Z

    new-instance v3, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$1;

    invoke-direct {v3, p0, p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$1;-><init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;Landroid/view/ActionMode;)V

    invoke-static {v0, v1, v2, p2, v3}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->reportFalsePositiveImages(Landroid/app/Activity;Ljava/lang/String;ZLjava/util/ArrayList;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;)V

    goto/16 :goto_0

    :sswitch_1
    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object v0, v0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getCheckedServerIds(Landroid/util/SparseBooleanArray;)Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-static {v0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->access$1000(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v1

    const-string v2, "SearchImageResultFragmentDeleteMediaDialogFragment"

    new-instance v3, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$3;

    invoke-direct {v3, p0, p1, p2}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$3;-><init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;Landroid/view/ActionMode;Ljava/lang/String;)V

    const-wide/16 v4, -0x1

    const-string v6, ""

    const/4 v7, 0x0

    const/16 v8, 0x1b

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemIds()[J

    move-result-object v9

    invoke-static/range {v1 .. v9}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->delete(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;JLjava/lang/String;II[J)V

    goto :goto_0

    :sswitch_2
    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object p2, p2, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getCheckedServerIds(Landroid/util/SparseBooleanArray;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-static {p2}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->access$800(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$2;-><init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;Ljava/lang/String;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x1

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->isCheckedItemContainVideo()Z

    move-result v5

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemIds()[J

    move-result-object v6

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;IZZZ[J)V

    goto :goto_0

    :sswitch_3
    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    const/4 p2, 0x0

    invoke-static {p1, p2, p2}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->access$1500(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :sswitch_4
    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-static {p2}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->access$1400(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object p2

    new-instance v0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$4;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$4;-><init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;Landroid/view/ActionMode;)V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItems()Ljava/util/List;

    move-result-object p1

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->doProduceCreation(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Ljava/util/List;)V

    const-string p1, "search"

    const-string p2, "produce"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const/4 p1, 0x1

    return p1

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f090017 -> :sswitch_4
        0x7f09001d -> :sswitch_3
        0x7f090026 -> :sswitch_2
        0x7f0900c6 -> :sswitch_1
        0x7f090122 -> :sswitch_0
    .end sparse-switch
.end method

.method public onAllItemsCheckedStateChanged(Landroid/view/ActionMode;Z)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->updateMenuState()V

    return-void
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mMode:Landroid/view/ActionMode;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-static {v0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->access$400(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/BuildUtil;->isMiuiSdkGte15(Landroid/content/Context;)Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->supportFeedback()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Landroid/view/ActionMode;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object p1

    if-eqz v0, :cond_0

    const v0, 0x7f0c000f

    goto :goto_0

    :cond_0
    const v0, 0x7f0c0006

    :goto_0
    invoke-virtual {p1, v0, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    goto :goto_2

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-static {v0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->access$500(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/BuildUtil;->isMiuiSdkGte15(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f0c000e

    goto :goto_1

    :cond_2
    const v0, 0x7f0c0005

    :goto_1
    invoke-virtual {p1}, Landroid/view/ActionMode;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object p1

    invoke-virtual {p1, v0, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    :goto_2
    const p1, 0x7f090122

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mFeedback:Landroid/view/MenuItem;

    const p1, 0x7f090026

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mAddToAlbum:Landroid/view/MenuItem;

    const p1, 0x7f0900c6

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mDelete:Landroid/view/MenuItem;

    const p1, 0x7f090017

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mCreativity:Landroid/view/MenuItem;

    const p1, 0x7f09001d

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mSend:Landroid/view/MenuItem;

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-boolean p1, p1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mInFeedbackTaskMode:Z

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mAddToAlbum:Landroid/view/MenuItem;

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mDelete:Landroid/view/MenuItem;

    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mCreativity:Landroid/view/MenuItem;

    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mSend:Landroid/view/MenuItem;

    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .locals 0

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->mMode:Landroid/view/ActionMode;

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-static {p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->access$600(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-static {p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->access$600(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->showLikelyBar()V

    :cond_0
    return-void
.end method

.method public onItemCheckedStateChanged(Landroid/view/ActionMode;IJZ)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->updateMenuState()V

    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-static {p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->access$600(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-static {p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->access$600(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->hideLikelyBar()V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
