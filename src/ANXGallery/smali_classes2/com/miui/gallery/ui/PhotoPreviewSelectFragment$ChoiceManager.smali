.class Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;
.super Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;
.source "PhotoPreviewSelectFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChoiceManager"
.end annotation


# instance fields
.field private mCancelBtn:Landroid/widget/Button;

.field private mSelectAllBtn:Landroid/widget/Button;

.field private mTitleView:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->initTopBar()V

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->setUpChooserFragment(IZ)V

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->startActionMode(Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;)Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    return-void
.end method

.method private initTopBar()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b0069

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090297

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mCancelBtn:Landroid/widget/Button;

    const v1, 0x7f090299

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mTitleView:Landroid/widget/TextView;

    const v1, 0x7f090298

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mSelectAllBtn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mCancelBtn:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mSelectAllBtn:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mCancelBtn:Landroid/widget/Button;

    const/4 v3, 0x3

    invoke-static {v1, v2, v3}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Landroid/widget/Button;I)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mSelectAllBtn:Landroid/widget/Button;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Landroid/widget/Button;I)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v1

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Lmiui/app/ActionBar;->setDisplayOptions(I)V

    new-instance v1, Landroid/app/ActionBar$LayoutParams;

    const/4 v2, -0x1

    const/16 v3, 0x13

    invoke-direct {v1, v2, v2, v3}, Landroid/app/ActionBar$LayoutParams;-><init>(III)V

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v2}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lmiui/app/ActionBar;->setCustomView(Landroid/view/View;Landroid/app/ActionBar$LayoutParams;)V

    return-void
.end method


# virtual methods
.method protected getChoiceTitle()Landroid/widget/TextView;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mTitleView:Landroid/widget/TextView;

    return-object v0
.end method

.method protected getContainerId()I
    .locals 1

    const v0, 0x7f090086

    return v0
.end method

.method public initSelected(Lcom/miui/gallery/model/BaseDataSet;)V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "photo_preview_selected_ids"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "photo_preview_selected_positions"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v1

    if-eqz v0, :cond_3

    if-eqz v1, :cond_3

    if-eqz p1, :cond_3

    array-length v2, v0

    array-length v3, v1

    if-ne v2, v3, :cond_2

    new-instance v2, Lcom/miui/gallery/model/BaseDataItem;

    invoke-direct {v2}, Lcom/miui/gallery/model/BaseDataItem;-><init>()V

    const/4 v3, 0x0

    :goto_0
    array-length v4, v0

    if-ge v3, v4, :cond_1

    aget-wide v4, v0, v3

    invoke-virtual {v2, v4, v5}, Lcom/miui/gallery/model/BaseDataItem;->setKey(J)Lcom/miui/gallery/model/BaseDataItem;

    aget v6, v1, v3

    invoke-virtual {p1, v2, v6}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(Lcom/miui/gallery/model/BaseDataItem;I)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_0

    iget-object v7, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v7, v6, v4, v5}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->appendCheck(IJ)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->finishInit()V

    goto :goto_1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "ids and positions not match"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "photo_preview_selected_ids"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "photo_preview_selected_positions"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->finish()V

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getSelectItems()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->chooseAll()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->unChooseAll()V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f090297
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onShared()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->onShared()V

    return-void
.end method

.method protected updateSelectMode()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getSelectItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getCount()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mSelectAllBtn:Landroid/widget/Button;

    invoke-static {v1, v2, v0}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Landroid/widget/Button;I)V

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->updateSelectMode()V

    return-void
.end method
