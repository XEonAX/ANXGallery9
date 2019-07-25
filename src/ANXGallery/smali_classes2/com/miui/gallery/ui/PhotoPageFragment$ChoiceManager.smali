.class Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;
.super Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChoiceManager"
.end annotation


# instance fields
.field private mBarsVisibleBeforeSlip:Z

.field private mIsInMultiWindow:Z

.field private mLastOrientation:I

.field private mPhotoChoiceTitle:Lcom/miui/gallery/ui/PhotoChoiceTitle;

.field private mShareTargetIntent:Landroid/content/Intent;

.field private mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

.field private mSlipPending:Z

.field private mSlipRunnable:Ljava/lang/Runnable;

.field private mSlipState:I

.field private mSlipped:Z

.field private mSupportSend:Z

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 4

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mLastOrientation:I

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mShareTargetIntent:Landroid/content/Intent;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getView()Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0902ae

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {v1, p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setOnSlipListener(Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;)V

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getView()Landroid/view/View;

    move-result-object v1

    const v2, 0x7f090217

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/ui/PhotoChoiceTitle;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mPhotoChoiceTitle:Lcom/miui/gallery/ui/PhotoChoiceTitle;

    iget-object v1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v1}, Lcom/miui/gallery/compat/app/ActivityCompat;->isInMultiWindowMode(Landroid/app/Activity;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mIsInMultiWindow:Z

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->onUiOrientationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "com.miui.gallery.extra.photo_enter_choice_mode"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setDraggable(Z)V

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {v2, v3}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setSlippedWhenEnter(Z)V

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v2, "com.miui.gallery.extra.photo_enter_choice_mode"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->setUpChooserFragment(IZ)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mPhotoChoiceTitle:Lcom/miui/gallery/ui/PhotoChoiceTitle;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->getExitButton()Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->getChoiceModeExitButtonClickListener()Landroid/view/View$OnClickListener;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

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
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mPhotoChoiceTitle:Lcom/miui/gallery/ui/PhotoChoiceTitle;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->getVisibility()I

    move-result v0

    if-eq p1, v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mPhotoChoiceTitle:Lcom/miui/gallery/ui/PhotoChoiceTitle;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method private setSlipLayoutDraggable(Z)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSupportSend:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mIsInMultiWindow:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    and-int/2addr p1, v1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setDraggable(Z)V

    return-void
.end method


# virtual methods
.method public getChoiceModeExitButtonClickListener()Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager$2;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;)V

    return-object v0
.end method

.method protected getChoiceTitle()Landroid/widget/TextView;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mPhotoChoiceTitle:Lcom/miui/gallery/ui/PhotoChoiceTitle;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->getTitle()Landroid/widget/TextView;

    move-result-object v0

    return-object v0
.end method

.method protected getContainerId()I
    .locals 1

    const v0, 0x7f090086

    return v0
.end method

.method public initSelected(Lcom/miui/gallery/model/BaseDataSet;)V
    .locals 4

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->isSlipped()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataSet;->getInitPosition()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/model/BaseDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataSet;->getInitPosition()I

    move-result p1

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v2

    const/4 v0, 0x1

    invoke-virtual {v1, p1, v2, v3, v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->setChecked(IJZ)V

    :cond_0
    return-void
.end method

.method public isPendingSlipped()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipState:I

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->isSlipped()Z

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipPending:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mBarsVisibleBeforeSlip:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->isFlingToSlipped()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isSlipped()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->isSlipped()Z

    move-result v0

    return v0
.end method

.method public onBackPressed()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->isSlipped()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setUnSlipped(Z)V

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onMultiWindowModeChanged(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mIsInMultiWindow:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->setSlipLayoutDraggable(Z)V

    :cond_0
    return-void
.end method

.method public onPhotoScale(F)V
    .locals 1

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSupportSend:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->setSlipLayoutDraggable(Z)V

    return-void
.end method

.method protected onShared()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->onShared()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->setUnSlipped(Z)V

    return-void
.end method

.method public onSlipEnd(Z)V
    .locals 7

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipped:Z

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_3

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->onVisibilityChanged(Z)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->setPhotoChoiceTitleVisible(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->unChooseAll()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->finish()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->setSensorEnable(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->tryRestoreOrientation(Z)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v2, "com.miui.gallery.extra.show_menu_after_choice_mode"

    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$200(Lcom/miui/gallery/ui/PhotoPageFragment;Z)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2200(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2200(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->tryChangeStereoBtnVisible(Z)V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mBarsVisibleBeforeSlip:Z

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$200(Lcom/miui/gallery/ui/PhotoPageFragment;Z)V

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mBarsVisibleBeforeSlip:Z

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    const v1, 0x7f10037b

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/TalkBackUtil;->requestAnnouncementEvent(Landroid/view/View;Ljava/lang/String;)V

    const-string p1, "photo"

    const-string v0, "fast_share_mode_exit"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    move-result-object p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->setSensorEnable(Z)V

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/activity/BaseActivity;->setRequestedOrientation(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    if-eqz p1, :cond_5

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v3}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v3

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v4

    invoke-virtual {v2, v3, v4, v5, v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->setChecked(IJZ)V

    :cond_5
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2200(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    move-result-object v2

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2200(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->tryChangeStereoBtnVisible(Z)V

    :cond_6
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    const v4, 0x7f10033b

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/PhotoPageFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/miui/gallery/util/TalkBackUtil;->requestAnnouncementEvent(Landroid/view/View;Ljava/lang/String;)V

    const-string v2, "photo"

    const-string v3, "fast_share_mode_enter"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mShareTargetIntent:Landroid/content/Intent;

    if-eqz v2, :cond_8

    if-eqz p1, :cond_8

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mShareTargetIntent:Landroid/content/Intent;

    const-string v3, "assistant_need_beauty"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPagerHelper;->getCurrentItem()Lcom/miui/gallery/ui/PhotoPageItem;

    move-result-object v1

    instance-of v1, v1, Lcom/miui/gallery/ui/PhotoPageImageItem;

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v2

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4, v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->setRenderChecked(IJZ)V

    :cond_7
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mShareTargetIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->onIntentSelected(Landroid/content/Intent;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mShareTargetIntent:Landroid/content/Intent;

    :cond_8
    if-eqz p1, :cond_9

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getBurstKeys()Ljava/util/List;

    move-result-object v6

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->shouldShowSelectionStar(JZZLjava/util/List;)Z

    move-result p1

    if-eqz p1, :cond_9

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/ui/ImageSelectionTipFragment;->showImageSelectionTipDialogIfNecessary(Landroid/app/Activity;)V

    :cond_9
    :goto_0
    return-void
.end method

.method public onSlipStart()V
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipped:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->onVisibilityChanged(Z)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1200(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mBarsVisibleBeforeSlip:Z

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$200(Lcom/miui/gallery/ui/PhotoPageFragment;Z)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v1, p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->startActionMode(Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;)Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->setPhotoChoiceTitleVisible(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2200(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2200(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->tryChangeStereoBtnVisible(Z)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    const v3, 0x7f10033b

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/PhotoPageFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/TalkBackUtil;->requestAnnouncementEvent(Landroid/view/View;Ljava/lang/String;)V

    const-string v0, "best_image"

    const-string v1, "best_image_count"

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getBestImageCount(Z)I

    move-result v2

    int-to-long v2, v2

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_1
    return-void
.end method

.method public onSlipStateChanged(I)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipState:I

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4900(Lcom/miui/gallery/ui/PhotoPageFragment;Z)V

    :cond_0
    return-void
.end method

.method public onSlipping(F)V
    .locals 0

    return-void
.end method

.method public onUiOrientationChanged(Landroid/content/res/Configuration;)V
    .locals 4

    iget v0, p1, Landroid/content/res/Configuration;->orientation:I

    iget v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mLastOrientation:I

    if-eq v0, v1, :cond_3

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mIsInMultiWindow:Z

    if-nez v0, :cond_2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->setUnSlipped(Z)V

    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    invoke-direct {p0, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->setSlipLayoutDraggable(Z)V

    iget-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipPending:Z

    if-eqz v1, :cond_2

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipPending:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipRunnable:Ljava/lang/Runnable;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipRunnable:Ljava/lang/Runnable;

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->setSlipLayoutDraggable(Z)V

    :cond_2
    :goto_0
    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mLastOrientation:I

    :cond_3
    return-void
.end method

.method public release()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method sendCurrentToShare(Landroid/content/Intent;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mShareTargetIntent:Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setSlipped(Z)V

    return-void
.end method

.method public setSlipped(Z)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mIsInMultiWindow:Z

    const/4 v1, 0x1

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    if-eq v0, v1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/activity/BaseActivity;->setRequestedOrientation(I)V

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipPending:Z

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->setSensorEnable(Z)V

    :cond_0
    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSupportSend:Z

    if-eqz v0, :cond_2

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->setSlipLayoutDraggable(Z)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setSlipped(Z)V

    return-void
.end method

.method public setUnSlipped(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSlipLayout:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setUnSlipped(Z)V

    return-void
.end method

.method public settleItem(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getSupportOperations()I

    move-result p1

    const/4 v0, 0x4

    invoke-static {p1, v0}, Lcom/miui/gallery/util/PhotoOperationsUtil;->isSupportedOptions(II)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSupportSend:Z

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->mSupportSend:Z

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->setSlipLayoutDraggable(Z)V

    :cond_1
    return-void
.end method
