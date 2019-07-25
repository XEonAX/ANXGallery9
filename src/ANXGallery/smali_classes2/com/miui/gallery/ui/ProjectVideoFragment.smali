.class public Lcom/miui/gallery/ui/ProjectVideoFragment;
.super Landroid/app/Fragment;
.source "ProjectVideoFragment.java"

# interfaces
.implements Lcom/miui/gallery/projection/ProjectionVideoController$OnFinishListener;


# instance fields
.field private mRemoteVideoControl:Lcom/miui/gallery/projection/ProjectionVideoController;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method

.method private setResult()V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ProjectVideoFragment;->getTargetFragment()Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    const/16 v1, 0x19

    const/4 v2, -0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public static showProjectVideoFragment(Lcom/miui/gallery/activity/BaseActivity;Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/ProjectVideoFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/ProjectVideoFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "photo_data_item"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    invoke-virtual {v0, v1}, Landroid/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p1, p1}, Lcom/miui/gallery/activity/BaseActivity;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ZZ)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ProjectVideoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "photo_data_item"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->getFileTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getTitle()Ljava/lang/String;

    move-result-object p1

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/ui/ProjectVideoFragment;->mRemoteVideoControl:Lcom/miui/gallery/projection/ProjectionVideoController;

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/projection/ConnectController;->getCurConnectedDevice()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, p1, v2}, Lcom/miui/gallery/projection/ProjectionVideoController;->startPlay(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b011c

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/projection/ProjectionVideoController;

    iput-object p1, p0, Lcom/miui/gallery/ui/ProjectVideoFragment;->mRemoteVideoControl:Lcom/miui/gallery/projection/ProjectionVideoController;

    iget-object p1, p0, Lcom/miui/gallery/ui/ProjectVideoFragment;->mRemoteVideoControl:Lcom/miui/gallery/projection/ProjectionVideoController;

    invoke-virtual {p1}, Lcom/miui/gallery/projection/ProjectionVideoController;->initView()V

    iget-object p1, p0, Lcom/miui/gallery/ui/ProjectVideoFragment;->mRemoteVideoControl:Lcom/miui/gallery/projection/ProjectionVideoController;

    return-object p1
.end method

.method public onDestroy()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/ProjectVideoFragment;->setResult()V

    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    return-void
.end method

.method public onFinish()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ProjectVideoFragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ProjectVideoFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ProjectVideoFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->popBackStack()V

    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/ProjectVideoFragment;->mRemoteVideoControl:Lcom/miui/gallery/projection/ProjectionVideoController;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/projection/ProjectionVideoController;->setOnFinishListener(Lcom/miui/gallery/projection/ProjectionVideoController$OnFinishListener;)V

    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/ui/ProjectVideoFragment;->mRemoteVideoControl:Lcom/miui/gallery/projection/ProjectionVideoController;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->setOnFinishListener(Lcom/miui/gallery/projection/ProjectionVideoController$OnFinishListener;)V

    return-void
.end method
