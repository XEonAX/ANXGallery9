.class Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;
.super Ljava/lang/Object;
.source "PhotoPageImageItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageImageItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HigherDefinitionManager"
.end annotation


# instance fields
.field private mCurActionBarHeight:I

.field private mDefaultMarginTop:I

.field private mDefinitionStateView:Landroid/widget/TextView;

.field private mHandler:Landroid/os/Handler;

.field private mHasHdViewDisplayed:Z

.field private mHideDefinitionRunnable:Ljava/lang/Runnable;

.field private mIsEverEnterHd:Z

.field private mIsHdPhoto:Z

.field private mOnScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

.field private mParams:Landroid/view/ViewGroup$MarginLayoutParams;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mHandler:Landroid/os/Handler;

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mHideDefinitionRunnable:Ljava/lang/Runnable;

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$3;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$3;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mOnScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageItem;Lcom/miui/gallery/ui/PhotoPageImageItem$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->hideDefinitionText()V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)Landroid/view/ViewGroup$MarginLayoutParams;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mParams:Landroid/view/ViewGroup$MarginLayoutParams;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->changeToMidScale()V

    return-void
.end method

.method static synthetic access$1600(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->exitHigherDefinition()V

    return-void
.end method

.method static synthetic access$1700(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->changeToHigherDefinition()V

    return-void
.end method

.method private changeToHigherDefinition()V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mHasHdViewDisplayed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f10043e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mHasHdViewDisplayed:Z

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mIsEverEnterHd:Z

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->showDefinitionText()V

    :cond_0
    return-void
.end method

.method private changeToMidScale()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    const v1, 0x7f100313

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->showDefinitionText()V

    return-void
.end method

.method private exitHigherDefinition()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mHasHdViewDisplayed:Z

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->hideDefinitionText()V

    return-void
.end method

.method private hideDefinitionText()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method private initHdTextView()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b00ff

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    const v1, 0x7f090157

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mParams:Landroid/view/ViewGroup$MarginLayoutParams;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06026d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefaultMarginTop:I

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mParams:Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefaultMarginTop:I

    iget v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mCurActionBarHeight:I

    add-int/2addr v1, v2

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mParams:Landroid/view/ViewGroup$MarginLayoutParams;

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xe

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->requestLayout()V

    :cond_0
    return-void
.end method

.method private showDefinitionText()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mHideDefinitionRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mHideDefinitionRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method private translateByActionBarVisibility(I)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefaultMarginTop:I

    iget v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mCurActionBarHeight:I

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Landroid/view/animation/TranslateAnimation;

    int-to-float p1, p1

    const/4 v2, 0x0

    invoke-direct {v1, v2, v2, v2, p1}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v2, 0x10e0001

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    int-to-long v2, p1

    invoke-virtual {v1, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    new-instance p1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {p1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v1, p1}, Landroid/view/animation/TranslateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const/4 p1, 0x1

    invoke-virtual {v1, p1}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$2;

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$2;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;I)V

    invoke-virtual {v1, p1}, Landroid/view/animation/TranslateAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mParams:Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->requestLayout()V

    :goto_0
    return-void
.end method


# virtual methods
.method public onActionBarVisibleChanged(Ljava/lang/Boolean;I)V
    .locals 1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, p2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mCurActionBarHeight:I

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mIsHdPhoto:Z

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->translateByActionBarVisibility(I)V

    goto :goto_1

    :cond_2
    neg-int p1, p2

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->translateByActionBarVisibility(I)V

    :goto_1
    return-void
.end method

.method public onSelected()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mIsHdPhoto:Z

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getWidth()I

    move-result v0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v3}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v3

    const/16 v4, 0x1770

    if-lt v3, v4, :cond_1

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v3

    const/16 v4, 0xfa0

    if-lt v3, v4, :cond_1

    const/4 v1, 0x1

    :cond_1
    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mIsHdPhoto:Z

    move v1, v2

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    iget-boolean v3, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mIsHdPhoto:Z

    invoke-virtual {v2, v0, v1, v3}, Luk/co/senab/photoview/PhotoView;->setHDState(IIZ)V

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mIsHdPhoto:Z

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->initHdTextView()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mOnScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

    invoke-virtual {v0, v1}, Luk/co/senab/photoview/PhotoView;->setOnScaleStageChangedListener(Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Luk/co/senab/photoview/PhotoView;->setOnScaleStageChangedListener(Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;)V

    :goto_1
    return-void
.end method

.method public onUnSelected()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->release()V

    return-void
.end method

.method public release()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->clearAnimation()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mDefinitionStateView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mHideDefinitionRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mIsHdPhoto:Z

    if-eqz v0, :cond_1

    const-string v0, "photo"

    const-string v1, "photo_hd_satisfy_count"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mIsEverEnterHd:Z

    if-eqz v0, :cond_1

    const-string v0, "photo"

    const-string v1, "photo_hd_enter_count"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mIsHdPhoto:Z

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mHasHdViewDisplayed:Z

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->mIsEverEnterHd:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Luk/co/senab/photoview/PhotoView;->setOnScaleStageChangedListener(Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;)V

    return-void
.end method
