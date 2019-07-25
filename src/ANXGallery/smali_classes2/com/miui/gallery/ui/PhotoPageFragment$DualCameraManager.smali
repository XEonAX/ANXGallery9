.class Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DualCameraManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$ParsePhotoTask;,
        Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$SaveDualPhotoTask;
    }
.end annotation


# instance fields
.field private mAppearAnim:Landroid/view/animation/Animation;

.field private mDisapperAnim:Landroid/view/animation/Animation;

.field private mDualCameraEnter:Landroid/view/ViewGroup;

.field private mDualWrapper:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

.field private mParseState:I

.field private mParseTask:Landroid/os/AsyncTask;

.field private mSaveTask:Landroid/os/AsyncTask;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mParseState:I

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getView()Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0900ee

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewStub;

    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0900ed

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualCameraEnter:Landroid/view/ViewGroup;

    invoke-static {}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->getInstance()Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualWrapper:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    return-void
.end method

.method static synthetic access$5600(Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->resolveSupportFunc()V

    return-void
.end method

.method static synthetic access$5700(Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;)Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualWrapper:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    return-object p0
.end method

.method static synthetic access$5802(Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mParseState:I

    return p1
.end method

.method static synthetic access$5900(Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->setStereoBtnVisible(Z)V

    return-void
.end method

.method private appearView(Landroid/view/View;Z)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->getAppearAnim()Landroid/view/animation/Animation;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    return-void
.end method

.method private cancelParseTask()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mParseTask:Landroid/os/AsyncTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mParseTask:Landroid/os/AsyncTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mParseTask:Landroid/os/AsyncTask;

    const-string v0, "PhotoPageFragment"

    const-string v1, "cancelParseTask"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private disappearView(Landroid/view/View;Z)V
    .locals 1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->getDisappearAnim()Landroid/view/animation/Animation;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    return-void
.end method

.method private getAppearAnim()Landroid/view/animation/Animation;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mAppearAnim:Landroid/view/animation/Animation;

    if-nez v0, :cond_0

    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mAppearAnim:Landroid/view/animation/Animation;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mAppearAnim:Landroid/view/animation/Animation;

    const-wide/16 v1, 0x190

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mAppearAnim:Landroid/view/animation/Animation;

    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mAppearAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mAppearAnim:Landroid/view/animation/Animation;

    return-object v0
.end method

.method private getDisappearAnim()Landroid/view/animation/Animation;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDisapperAnim:Landroid/view/animation/Animation;

    if-nez v0, :cond_0

    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDisapperAnim:Landroid/view/animation/Animation;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDisapperAnim:Landroid/view/animation/Animation;

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDisapperAnim:Landroid/view/animation/Animation;

    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDisapperAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDisapperAnim:Landroid/view/animation/Animation;

    return-object v0
.end method

.method private isExternalEnvOK(Lcom/miui/gallery/model/BaseDataItem;)Z
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->isDualCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getSupportOperations()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "support_operation_mask"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    and-int/2addr p1, v0

    const/16 v0, 0x200

    invoke-static {p1, v0}, Lcom/miui/gallery/util/PhotoOperationsUtil;->isSupportedOptions(II)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private isLightStereoPhoto(Lcom/miui/gallery/model/BaseDataItem;)Z
    .locals 0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private resolveSupportFunc()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualCameraEnter:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualWrapper:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    invoke-virtual {v1}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->resolveExtraFuncs()Ljava/util/List;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_1

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualCameraEnter:Landroid/view/ViewGroup;

    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v4, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    :cond_0
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualCameraEnter:Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_2

    :cond_2
    return-void
.end method

.method private sendParseTask(Ljava/lang/String;)V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->cancelParseTask()V

    const-string v0, "PhotoPageFragment"

    const-string v1, "excute parse task %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$ParsePhotoTask;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$ParsePhotoTask;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$ParsePhotoTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mParseTask:Landroid/os/AsyncTask;

    return-void
.end method

.method private setStereoBtnVisible(Z)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->clearAnim()V

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualCameraEnter:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualCameraEnter:Landroid/view/ViewGroup;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1200(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->showMoreFuncExceptRefocus(Z)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualCameraEnter:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result p1

    const/16 v0, 0x8

    if-eq p1, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualCameraEnter:Landroid/view/ViewGroup;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public clearAnim()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->isDualCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualWrapper:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    invoke-virtual {v0}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->resolveExtraFuncs()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const v2, 0x7f09025b

    if-eq v1, v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualCameraEnter:Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->clearAnimation()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public hideMoreFuncExceptRefocus(Z)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->isDualCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualCameraEnter:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualWrapper:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    invoke-virtual {v0}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->resolveExtraFuncs()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const v2, 0x7f09025b

    if-eq v1, v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualCameraEnter:Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-direct {p0, v1, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->disappearView(Landroid/view/View;Z)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public isDualCamera()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualWrapper:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    invoke-virtual {v0}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->isExtraCamera()Z

    move-result v0

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->isDualCamera()Z

    move-result v0

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mParseState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2900(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3000(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v1, 0x7f09011f

    if-eq p1, v1, :cond_3

    const v1, 0x7f090141

    if-eq p1, v1, :cond_2

    const v1, 0x7f09025b

    if-eq p1, v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3700(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v1

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/util/IntentUtil;->startRefocusAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Fragment;Z)V

    const-string p1, "photo"

    const-string v0, "view_refocus"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3700(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v1

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/util/IntentUtil;->startFreeViewAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Fragment;Z)V

    const-string p1, "photo"

    const-string v0, "view_free_view"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3700(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v1

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/util/IntentUtil;->startFancyColorAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Fragment;Z)V

    const-string p1, "photo"

    const-string v0, "view_fancy_color"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    :goto_0
    return-void
.end method

.method public onDestory()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->cancelParseTask()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mSaveTask:Landroid/os/AsyncTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mSaveTask:Landroid/os/AsyncTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mSaveTask:Landroid/os/AsyncTask;

    :cond_0
    return-void
.end method

.method public onDualPhotoEdited(Landroid/content/Intent;)V
    .locals 3

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_2

    const-string v0, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mSaveTask:Landroid/os/AsyncTask;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mSaveTask:Landroid/os/AsyncTask;

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    :cond_1
    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$SaveDualPhotoTask;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$SaveDualPhotoTask;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;)V

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$SaveDualPhotoTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mSaveTask:Landroid/os/AsyncTask;

    :cond_2
    return-void
.end method

.method public pause()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->clearAnim()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualWrapper:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0, v1}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->stop(Landroid/content/Context;)V

    return-void
.end method

.method public resume()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualWrapper:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v2, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;)V

    invoke-virtual {v0, v1, v2}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->start(Landroid/content/Context;Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;)V

    return-void
.end method

.method public settleItem(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 2

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mParseState:I

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->isDualCamera()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->cancelParseTask()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->isSlipped()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->isExternalEnvOK(Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->isLightStereoPhoto(Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->sendParseTask(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iput v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mParseState:I

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->setStereoBtnVisible(Z)V

    goto :goto_0

    :cond_1
    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->setStereoBtnVisible(Z)V

    :cond_2
    :goto_0
    return-void
.end method

.method public showMoreFuncExceptRefocus(Z)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->isDualCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualCameraEnter:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualWrapper:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    invoke-virtual {v0}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->resolveExtraFuncs()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const v2, 0x7f09025b

    if-eq v1, v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mDualCameraEnter:Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-direct {p0, v1, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->appearView(Landroid/view/View;Z)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public tryChangeStereoBtnVisible(Z)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->isDualCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mParseState:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->setStereoBtnVisible(Z)V

    goto :goto_0

    :pswitch_1
    if-nez p1, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->setStereoBtnVisible(Z)V

    goto :goto_0

    :pswitch_2
    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->settleItem(Lcom/miui/gallery/model/BaseDataItem;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->setStereoBtnVisible(Z)V

    :cond_1
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public updateItem(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->mParseState:I

    return-void
.end method
