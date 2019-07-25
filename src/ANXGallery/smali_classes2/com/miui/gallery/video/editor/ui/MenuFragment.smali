.class public abstract Lcom/miui/gallery/video/editor/ui/MenuFragment;
.super Landroid/app/Fragment;
.source "MenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IMenuFragment;


# static fields
.field private static sAnimAppearDelay:I

.field private static sAnimAppearDuration:I

.field private static sAnimDisappearDuration:I

.field private static sAnimOffset:I


# instance fields
.field protected mCallback:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;

.field protected mContext:Landroid/content/Context;

.field protected mIDownloadListener:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;

.field protected mModuleFactory:Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;

.field protected mResourceDownloadManager:Lcom/miui/gallery/video/editor/manager/DownloadManager;

.field private mSamplerManager:Lcom/miui/gallery/video/editor/manager/SamplerManager;

.field private mUnzipTaskManager:Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;

.field protected mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;-><init>(Lcom/miui/gallery/video/editor/ui/MenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mIDownloadListener:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/video/editor/ui/MenuFragment;)Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mUnzipTaskManager:Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;

    return-object p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/video/editor/ui/MenuFragment;Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;)Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mUnzipTaskManager:Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;

    return-object p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/video/editor/ui/MenuFragment;Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->showNetworkConfirmDialog(Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V

    return-void
.end method

.method private initAnimatorData()V
    .locals 2

    sget v0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->sAnimOffset:I

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060518

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sput v0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->sAnimOffset:I

    :cond_0
    sget v0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->sAnimAppearDuration:I

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a006b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    sput v0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->sAnimAppearDuration:I

    :cond_1
    sget v0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->sAnimDisappearDuration:I

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a006c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    sput v0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->sAnimDisappearDuration:I

    :cond_2
    sget v0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->sAnimAppearDelay:I

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a006a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    sput v0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->sAnimAppearDelay:I

    :cond_3
    return-void
.end method

.method private mapIdToStatCate(I)Ljava/lang/String;
    .locals 0

    sparse-switch p1, :sswitch_data_0

    const-string p1, "video_editor_unknown"

    return-object p1

    :sswitch_0
    const-string p1, "video_editor_text"

    return-object p1

    :sswitch_1
    const-string p1, "video_editor_clip"

    return-object p1

    :sswitch_2
    const-string p1, "video_editor_smart_effect"

    return-object p1

    :sswitch_3
    const-string p1, "video_editor_filter"

    return-object p1

    :sswitch_4
    const-string p1, "video_editor_audio"

    return-object p1

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f09032c -> :sswitch_4
        0x7f090331 -> :sswitch_3
        0x7f090338 -> :sswitch_2
        0x7f09033e -> :sswitch_1
        0x7f090341 -> :sswitch_0
    .end sparse-switch
.end method

.method private showNetworkConfirmDialog(Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f100729

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f100728

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f100721

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f100726

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/ui/ConfirmDialog;->showConfirmDialog(Landroid/app/FragmentManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V

    return-void
.end method


# virtual methods
.method public cancelRequest()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mUnzipTaskManager:Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mUnzipTaskManager:Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->setListener(Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IUnzipFileListener;)V

    iput-object v1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mUnzipTaskManager:Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mResourceDownloadManager:Lcom/miui/gallery/video/editor/manager/DownloadManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mResourceDownloadManager:Lcom/miui/gallery/video/editor/manager/DownloadManager;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/manager/DownloadManager;->cancelAll()V

    iput-object v1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mResourceDownloadManager:Lcom/miui/gallery/video/editor/manager/DownloadManager;

    :cond_1
    return-void
.end method

.method public loadResourceData()V
    .locals 0

    return-void
.end method

.method public notifyDateSetChanged(I)V
    .locals 0

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Fragment;->onAttach(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mContext:Landroid/content/Context;

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->initAnimatorData()V

    invoke-static {}, Lcom/miui/gallery/video/editor/manager/SamplerManager;->create()Lcom/miui/gallery/video/editor/manager/SamplerManager;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mSamplerManager:Lcom/miui/gallery/video/editor/manager/SamplerManager;

    return-void
.end method

.method public onCreateAnimator(IZI)Landroid/animation/Animator;
    .locals 4

    new-instance p1, Landroid/animation/ObjectAnimator;

    invoke-direct {p1}, Landroid/animation/ObjectAnimator;-><init>()V

    const/4 p3, 0x1

    const/4 v0, 0x0

    const/4 v1, 0x2

    if-eqz p2, :cond_1

    sget-object p2, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v2, v1, [F

    sget v3, Lcom/miui/gallery/video/editor/ui/MenuFragment;->sAnimOffset:I

    int-to-float v3, v3

    aput v3, v2, v0

    const/4 v3, 0x0

    aput v3, v2, p3

    invoke-static {p2, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p2

    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v3, v1, [F

    fill-array-data v3, :array_0

    invoke-static {v2, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v2

    new-array v1, v1, [Landroid/animation/PropertyValuesHolder;

    aput-object p2, v1, v0

    aput-object v2, v1, p3

    invoke-virtual {p1, v1}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    new-instance p2, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getView()Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getView()Landroid/view/View;

    move-result-object p2

    const/4 p3, 0x4

    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    sget p2, Lcom/miui/gallery/video/editor/ui/MenuFragment;->sAnimAppearDelay:I

    int-to-long p2, p2

    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    sget p2, Lcom/miui/gallery/video/editor/ui/MenuFragment;->sAnimAppearDuration:I

    int-to-long p2, p2

    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance p2, Lcom/miui/gallery/video/editor/ui/MenuFragment$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment$1;-><init>(Lcom/miui/gallery/video/editor/ui/MenuFragment;)V

    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    goto :goto_0

    :cond_1
    sget-object p2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v1, v1, [F

    fill-array-data v1, :array_1

    invoke-static {p2, v1}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p2

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-array p3, p3, [Landroid/animation/PropertyValuesHolder;

    aput-object p2, p3, v0

    invoke-virtual {p1, p3}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    sget p2, Lcom/miui/gallery/video/editor/ui/MenuFragment;->sAnimDisappearDuration:I

    int-to-long p2, p2

    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    :goto_0
    return-object p1

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public onDetach()V
    .locals 1

    invoke-super {p0}, Landroid/app/Fragment;->onDetach()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mCallback:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;

    return-void
.end method

.method public onDownlaodCompleted(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;I)V
    .locals 0

    return-void
.end method

.method protected onExitMode()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mCallback:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mCallback:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;

    invoke-interface {v0}, Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;->showNavEditMenu()V

    :cond_0
    return-void
.end method

.method public onPlayButtonClicked()V
    .locals 0

    return-void
.end method

.method public onVideoLoadCompleted()V
    .locals 0

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->updatePalyBtnView()V

    return-void
.end method

.method protected recordEventWithApply()V
    .locals 5

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getCurrentEffect()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "effect"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getEffectId()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mapIdToStatCate(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "save_detail"

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {}, Lcom/miui/gallery/video/editor/manager/SmartVideoJudgeManager;->isAvailable()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mSamplerManager:Lcom/miui/gallery/video/editor/manager/SamplerManager;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getEffectId()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mapIdToStatCate(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "save_detail"

    invoke-virtual {v2, v3, v4, v0}, Lcom/miui/gallery/video/editor/manager/SamplerManager;->recordEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :cond_2
    :goto_1
    const-string v1, "effect"

    const-string v2, "none"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getEffectId()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mapIdToStatCate(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "save_detail"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {}, Lcom/miui/gallery/video/editor/manager/SmartVideoJudgeManager;->isAvailable()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mSamplerManager:Lcom/miui/gallery/video/editor/manager/SamplerManager;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getEffectId()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mapIdToStatCate(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "save_detail"

    invoke-virtual {v1, v2, v3, v0}, Lcom/miui/gallery/video/editor/manager/SamplerManager;->recordEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getEffectId()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mapIdToStatCate(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "save"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected recordEventWithCancel()V
    .locals 5

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getCurrentEffect()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "effect"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getEffectId()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mapIdToStatCate(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "save_detail"

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {}, Lcom/miui/gallery/video/editor/manager/SmartVideoJudgeManager;->isAvailable()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mSamplerManager:Lcom/miui/gallery/video/editor/manager/SamplerManager;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getEffectId()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mapIdToStatCate(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "save_detail"

    invoke-virtual {v2, v3, v4, v0}, Lcom/miui/gallery/video/editor/manager/SamplerManager;->recordEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :cond_2
    :goto_1
    const-string v1, "effect"

    const-string v2, "none"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getEffectId()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mapIdToStatCate(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "save_detail"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {}, Lcom/miui/gallery/video/editor/manager/SmartVideoJudgeManager;->isAvailable()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mSamplerManager:Lcom/miui/gallery/video/editor/manager/SamplerManager;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getEffectId()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mapIdToStatCate(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "save_detail"

    invoke-virtual {v1, v2, v3, v0}, Lcom/miui/gallery/video/editor/manager/SamplerManager;->recordEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getEffectId()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mapIdToStatCate(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "save"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected recordEventWithEffectChanged()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getEffectId()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mapIdToStatCate(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "enter"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setCallBack(Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mCallback:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mCallback:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;

    invoke-interface {p1}, Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;->getVideoEditor()Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-void
.end method

.method public updateLastFragment(Lcom/miui/gallery/video/editor/ui/MenuFragment;)V
    .locals 0

    return-void
.end method

.method public updatePalyBtnView()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mCallback:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mCallback:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;

    invoke-interface {v0}, Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;->updatePalyBtnView()V

    :cond_0
    return-void
.end method

.method public updateVoiceState(Z)V
    .locals 0

    return-void
.end method
