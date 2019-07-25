.class public Lcom/miui/gallery/editor/photo/app/PreviewFragment;
.super Landroid/app/Fragment;
.source "PreviewFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnPrepareEditFragmentListener;,
        Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnViewReadyListener;,
        Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;,
        Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnPreDrawListener;
    }
.end annotation


# instance fields
.field private mAnimatorDuration:I

.field mCallbacks:Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;

.field private mCompareButtonDelay:I

.field private mCompareEnable:Z

.field private mCompareRunnable:Ljava/lang/Runnable;

.field private mDismissTipRunnable:Ljava/lang/Runnable;

.field private mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private mHandler:Landroid/os/Handler;

.field private mImageView:Landroid/widget/ImageView;

.field private mIsNear3V4:Z

.field private mIsOnExit:Z

.field private mLoadDone:Z

.field mOnViewReadyListener:Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnViewReadyListener;

.field private mOverwriteBackground:Z

.field private mProgressView:Landroid/view/View;

.field private mRemoveWatermarkEnable:Z

.field private mRemoveWatermarkListener:Landroid/view/View$OnClickListener;

.field private mRemoveWatermarkSelected:Z

.field private mRemoverBtn:Landroid/view/View;

.field private mRemoverBtnEndLine:Landroid/support/constraint/Guideline;

.field private mRemoverBtnTopLine:Landroid/support/constraint/Guideline;

.field private mTipView:Landroid/widget/TextView;

.field private mValueAnimator:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mLoadDone:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mIsOnExit:Z

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCompareEnable:Z

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoveWatermarkEnable:Z

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoveWatermarkSelected:Z

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment$2;-><init>(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoveWatermarkListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment$3;-><init>(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCompareRunnable:Ljava/lang/Runnable;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment$4;-><init>(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mDismissTipRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)Landroid/widget/ImageView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->updateRemoverBtnLocation()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoverBtn:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoveWatermarkSelected:Z

    return p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/editor/photo/app/PreviewFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoveWatermarkSelected:Z

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->dismissTip()V

    return-void
.end method

.method private dismissTip()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mDismissTipRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mTipView:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mTipView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-static {v0}, Landroid/transition/TransitionManager;->beginDelayedTransition(Landroid/view/ViewGroup;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mTipView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method public static synthetic lambda$onViewCreated$85(Lcom/miui/gallery/editor/photo/app/PreviewFragment;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCompareEnable:Z

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mOverwriteBackground:Z

    if-eqz p1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 p2, 0x3

    if-eq p1, p2, :cond_1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCompareRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCompareRunnable:Ljava/lang/Runnable;

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCompareButtonDelay:I

    int-to-long v0, v0

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    :cond_1
    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCompareRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;

    invoke-interface {p2}, Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;->onLoadPreview()Landroid/graphics/Bitmap;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_2
    :goto_1
    const/4 p1, 0x0

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static synthetic lambda$prepareShowEditFragment$87(Lcom/miui/gallery/editor/photo/app/PreviewFragment;Landroid/support/constraint/ConstraintLayout$LayoutParams;Landroid/animation/ValueAnimator;)V
    .locals 0

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/support/constraint/ConstraintLayout$LayoutParams;->setMarginStart(I)V

    invoke-virtual {p1, p2}, Landroid/support/constraint/ConstraintLayout$LayoutParams;->setMarginEnd(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private refreshRemoveButtonStatus()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoverBtn:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoverBtn:Landroid/view/View;

    iget-boolean v1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoveWatermarkEnable:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoverBtn:Landroid/view/View;

    iget-boolean v1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoveWatermarkSelected:Z

    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    :cond_1
    return-void
.end method

.method private showCompareButtonTip()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$PhotoEditor;->shouldCompareTipShow()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f100516

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->showTip(I)V

    :cond_0
    return-void
.end method

.method private showTip(I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mTipView:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mOverwriteBackground:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mTipView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mTipView:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    invoke-static {p1}, Landroid/transition/TransitionManager;->beginDelayedTransition(Landroid/view/ViewGroup;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mTipView:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mDismissTipRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mDismissTipRunnable:Ljava/lang/Runnable;

    const-wide/16 v1, 0xbb8

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$PhotoEditor;->setCompareTipShow()V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method private updateRemoverBtnLocation()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;->onLoadPreview()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->setBitmapRatio(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/MiscUtil;->checkNavigationBarShow(Landroid/content/Context;Landroid/view/Window;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mIsNear3V4:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0601f6

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f06018c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0601f7

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f06018d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    goto :goto_0

    :cond_2
    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mIsNear3V4:Z

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0601f8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f06018e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0601f9

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f06018f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoverBtnTopLine:Landroid/support/constraint/Guideline;

    invoke-virtual {v2, v0}, Landroid/support/constraint/Guideline;->setGuidelineBegin(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoverBtnEndLine:Landroid/support/constraint/Guideline;

    invoke-virtual {v0, v1}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method


# virtual methods
.method public enableComparison(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCompareEnable:Z

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCompareEnable:Z

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->showCompareButtonTip()V

    :cond_0
    return-void
.end method

.method public isRunningPreviewAnimator()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mValueAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mValueAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    const p3, 0x7f0b011a

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/constraint/ConstraintLayout;

    const p2, 0x7f090228

    invoke-virtual {p1, p2}, Landroid/support/constraint/ConstraintLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    const p2, 0x7f09025c

    invoke-virtual {p1, p2}, Landroid/support/constraint/ConstraintLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoverBtn:Landroid/view/View;

    const p2, 0x7f090233

    invoke-virtual {p1, p2}, Landroid/support/constraint/ConstraintLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mProgressView:Landroid/view/View;

    const p2, 0x7f0902f9

    invoke-virtual {p1, p2}, Landroid/support/constraint/ConstraintLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mTipView:Landroid/widget/TextView;

    const p2, 0x7f09025e

    invoke-virtual {p1, p2}, Landroid/support/constraint/ConstraintLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/support/constraint/Guideline;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoverBtnTopLine:Landroid/support/constraint/Guideline;

    const p2, 0x7f09025d

    invoke-virtual {p1, p2}, Landroid/support/constraint/ConstraintLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/support/constraint/Guideline;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoverBtnEndLine:Landroid/support/constraint/Guideline;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    const p3, 0x7f10055b

    invoke-static {p2, p3}, Lcom/miui/gallery/compat/view/ViewCompat;->setTransitionName(Landroid/view/View;I)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    const-string p3, "overwrite_background"

    invoke-virtual {p2, p3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    iput-boolean p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mOverwriteBackground:Z

    :cond_0
    iget-boolean p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mOverwriteBackground:Z

    if-eqz p2, :cond_1

    new-instance p2, Landroid/util/TypedValue;

    invoke-direct {p2}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-virtual {p3}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p3

    const v0, 0x1010031

    const/4 v1, 0x1

    invoke-virtual {p3, v0, p2, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    iget p2, p2, Landroid/util/TypedValue;->data:I

    invoke-virtual {p3, p2}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoverBtn:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p2

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {p2, p3}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0a0037

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mAnimatorDuration:I

    return-object p1
.end method

.method public onDetach()V
    .locals 2

    invoke-super {p0}, Landroid/app/Fragment;->onDetach()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method

.method public onExit(Z)V
    .locals 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mIsOnExit:Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;->onLoadPreview()Landroid/graphics/Bitmap;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;->onLoadPreviewOriginal()Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz p1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    if-ne v1, v2, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    if-ne p1, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 0

    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->dismissTip()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    invoke-super {p0, p1, p2}, Landroid/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a000f

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCompareButtonDelay:I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mOnViewReadyListener:Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnViewReadyListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnPreDrawListener;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnPreDrawListener;-><init>(Lcom/miui/gallery/editor/photo/app/PreviewFragment;Lcom/miui/gallery/editor/photo/app/PreviewFragment$1;)V

    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->showForLoadDown()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->refreshRemoveButtonStatus()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoverBtn:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoveWatermarkListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    new-instance p2, Lcom/miui/gallery/editor/photo/app/-$$Lambda$PreviewFragment$nsvkixMvIKgk3F81oyNXPnSvJvI;

    invoke-direct {p2, p0}, Lcom/miui/gallery/editor/photo/app/-$$Lambda$PreviewFragment$nsvkixMvIKgk3F81oyNXPnSvJvI;-><init>(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)V

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method public prepareShowEditFragment(Lcom/miui/gallery/editor/photo/core/Effect;Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnPrepareEditFragmentListener;)V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06016f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/constraint/ConstraintLayout$LayoutParams;

    const/4 v2, 0x2

    new-array v2, v2, [I

    const/4 v3, 0x0

    aput v3, v2, v3

    const/4 v3, 0x1

    aput v0, v2, v3

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mValueAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mValueAnimator:Landroid/animation/ValueAnimator;

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mAnimatorDuration:I

    int-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mValueAnimator:Landroid/animation/ValueAnimator;

    new-instance v2, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mValueAnimator:Landroid/animation/ValueAnimator;

    new-instance v2, Lcom/miui/gallery/editor/photo/app/-$$Lambda$PreviewFragment$9T5imptqnC_YXmDiezFWi1c8434;

    invoke-direct {v2, p0, v1}, Lcom/miui/gallery/editor/photo/app/-$$Lambda$PreviewFragment$9T5imptqnC_YXmDiezFWi1c8434;-><init>(Lcom/miui/gallery/editor/photo/app/PreviewFragment;Landroid/support/constraint/ConstraintLayout$LayoutParams;)V

    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mValueAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/miui/gallery/editor/photo/app/PreviewFragment$5;

    invoke-direct {v1, p0, p2, p1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment$5;-><init>(Lcom/miui/gallery/editor/photo/app/PreviewFragment;Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnPrepareEditFragmentListener;Lcom/miui/gallery/editor/photo/core/Effect;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mValueAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public refreshPreview(Landroid/graphics/Bitmap;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mIsOnExit:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method

.method public setBitmapRatio(Landroid/graphics/Bitmap;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr v0, p1

    const/high16 p1, 0x3f400000    # 0.75f

    sub-float p1, v0, p1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const/high16 v1, 0x3f100000    # 0.5625f

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mIsNear3V4:Z

    return-void
.end method

.method public setLoadDone(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mLoadDone:Z

    return-void
.end method

.method public setRemoveWatermarkEnable(Z)V
    .locals 1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoveWatermarkEnable:Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoverBtn:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mRemoverBtn:Landroid/view/View;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method public showForLoadDown()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mLoadDone:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mImageView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;

    invoke-interface {v1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;->onLoadPreview()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;->isPreviewChanged()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->enableComparison(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mProgressView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->updateRemoverBtnLocation()V

    :cond_0
    return-void
.end method
