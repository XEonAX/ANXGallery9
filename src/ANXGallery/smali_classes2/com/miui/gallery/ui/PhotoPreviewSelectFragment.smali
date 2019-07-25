.class public Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;
.super Lcom/miui/gallery/ui/PhotoPageFragmentBase;
.source "PhotoPreviewSelectFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;
    }
.end annotation


# instance fields
.field private mChoiceManager:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;-><init>()V

    return-void
.end method

.method public static newInstance(Landroid/net/Uri;Landroid/os/Bundle;)Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;
    .locals 1

    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    :cond_0
    const-string v0, "photo_uri"

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;-><init>()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "uri is null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method protected getLayout(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    const v0, 0x7f0b010a

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "PhotoPreviewSelectFragment"

    return-object v0
.end method

.method public getTAG()Ljava/lang/String;
    .locals 1

    const-string v0, "PhotoPreviewSelectFragment"

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onActivityCreated(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;-><init>(Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    const/16 v0, 0x1b

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    if-eq p2, v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mNeedConfirmPassWord:Z

    :goto_0
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method protected onDataSetLoaded(Lcom/miui/gallery/model/BaseDataSet;Z)V
    .locals 4

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onDataSetLoaded(Lcom/miui/gallery/model/BaseDataSet;Z)V

    if-eqz p2, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->initSelected(Lcom/miui/gallery/model/BaseDataSet;)V

    const-string p1, "PhotoPreviewSelectFragment"

    const-string p2, "initialize selection costs %dms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string p2, "assistant_target_package"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "assistant_target_class"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getSelectItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    if-lez v0, :cond_1

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;

    invoke-virtual {v2, v0, v1}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->configTargetIntentBySelected(ILandroid/content/Intent;)V

    new-instance v0, Landroid/content/ComponentName;

    invoke-direct {v0, p1, p2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const/high16 p2, 0x10000

    invoke-virtual {p1, v1, p2}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->onIntentSelected(Landroid/content/Intent;)V

    :cond_1
    return-void
.end method

.method protected onItemSettled(I)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onItemSettled(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/model/BaseDataItem;->getContentDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/TalkBackUtil;->requestAnnouncementEvent(Landroid/view/View;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->isNeedConfirmPassWord(Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mNeedConfirmPassWord:Z

    const/16 v0, 0x1b

    invoke-static {p0, v0}, Lcom/miui/privacy/LockSettingsHelper;->startAuthenticatePasswordActivity(Landroid/app/Fragment;I)V

    :cond_0
    return-void
.end method

.method protected onShared()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onShared()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment$ChoiceManager;->onShared()V

    return-void
.end method

.method public onStop()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onStop()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->mNeedConfirmPassWord:Z

    return-void
.end method

.method protected onViewInflated(Landroid/view/View;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onViewInflated(Landroid/view/View;)V

    const v0, 0x7f0902ae

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setDraggable(Z)V

    return-void
.end method
