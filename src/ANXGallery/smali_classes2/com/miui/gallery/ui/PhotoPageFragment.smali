.class public Lcom/miui/gallery/ui/PhotoPageFragment;
.super Lcom/miui/gallery/ui/PhotoPageFragmentBase;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;,
        Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;,
        Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$BurstPhotoManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;,
        Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$VoiceAssistantReceiver;,
        Lcom/miui/gallery/ui/PhotoPageFragment$PhotoRefreshReceiver;,
        Lcom/miui/gallery/ui/PhotoPageFragment$ScreenBroadcastReceiver;,
        Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$AccelerometerRotationChangedListener;,
        Lcom/miui/gallery/ui/PhotoPageFragment$OrientationChangedListener;,
        Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;,
        Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;,
        Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;
    }
.end annotation


# instance fields
.field private isFromCamera:Z

.field private mAlphaChangedListener:Lcom/miui/gallery/ui/PhotoPagerHelper$OnAlphaChangedListener;

.field private mAlwaysShowMenubar:Z

.field private mBurstPhotoManager:Lcom/miui/gallery/ui/PhotoPageFragment$BurstPhotoManager;

.field private mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

.field private mDataLoaded:Z

.field private mDownloadListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

.field private mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

.field private mEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;

.field private mFavoritesManager:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

.field private mFromRecommendFacePage:Z

.field private mHasSendDismissCast:Z

.field private mIsNightMode:Z

.field private mIsSupportFordBurst:Z

.field private mMaskManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

.field private mMeituEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;

.field private mMenuManager:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

.field private mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;

.field private mNFCManager:Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;

.field private mOnExitListener:Lcom/miui/gallery/ui/PhotoPagerHelper$OnExitListener;

.field private mOnPhotoMatrixChangeListener:Lcom/miui/gallery/ui/PhotoPagerHelper$OnDisplayRectChangedListener;

.field private mOnPhotoScaleChangeListener:Lcom/miui/gallery/ui/PhotoPagerHelper$OnScaleChangedListener;

.field private mOnSingleTapListener:Lcom/miui/gallery/ui/PhotoPagerHelper$OnSingleTapListener;

.field private mOrientationManager:Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

.field private mPhotoRefreshReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoRefreshReceiver;

.field private mPreviewMode:Z

.field private mProjectManager:Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

.field private mRefocusManager:Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;

.field private mScreenReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$ScreenBroadcastReceiver;

.field private mShowSecretInAddDialog:Z

.field private mSmartVideoGuideManager:Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;

.field private mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

.field private mStartWhenLocked:Z

.field private mStartWhenLockedAndSecret:Z

.field private mTheme:I

.field private mThemeManager:Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;

.field private mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

.field private mUserShowBarIndex:I

.field private mVideoPlayerManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

.field private mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

.field private mVoiceAssistantReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$VoiceAssistantReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mUserShowBarIndex:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTheme:I

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$6;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$6;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOnExitListener:Lcom/miui/gallery/ui/PhotoPagerHelper$OnExitListener;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$7;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$7;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAlphaChangedListener:Lcom/miui/gallery/ui/PhotoPagerHelper$OnAlphaChangedListener;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$8;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$8;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOnSingleTapListener:Lcom/miui/gallery/ui/PhotoPagerHelper$OnSingleTapListener;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$9;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$9;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOnPhotoScaleChangeListener:Lcom/miui/gallery/ui/PhotoPagerHelper$OnScaleChangedListener;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$10;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$10;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOnPhotoMatrixChangeListener:Lcom/miui/gallery/ui/PhotoPagerHelper$OnDisplayRectChangedListener;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$11;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$11;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDownloadListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/PhotoPageFragment;)I
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBarHeight()I

    move-result p0

    return p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/ui/PhotoPageFragment;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isActionBarVisible()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/ui/PhotoPageFragment;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isTransparentTheme()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mThemeManager:Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;

    return-object p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isPreviewMode()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/ui/PhotoPageFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mUserShowBarIndex:I

    return p0
.end method

.method static synthetic access$1702(Lcom/miui/gallery/ui/PhotoPageFragment;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mUserShowBarIndex:I

    return p1
.end method

.method static synthetic access$1800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    return-object p0
.end method

.method static synthetic access$1900(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mProjectManager:Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/PhotoPageFragment;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->setActionBarVisible(Z)V

    return-void
.end method

.method static synthetic access$2000(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMaskManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    return-object p0
.end method

.method static synthetic access$2100(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMenuManager:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    return-object p0
.end method

.method static synthetic access$2200(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    return-object p0
.end method

.method static synthetic access$2300(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    return-object p0
.end method

.method static synthetic access$2400(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mNFCManager:Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;

    return-object p0
.end method

.method static synthetic access$2500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    return-object p0
.end method

.method static synthetic access$2700(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageFragment;->doDownloadOrigin(Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;)V

    return-void
.end method

.method static synthetic access$2800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDownloadListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    return-object p0
.end method

.method static synthetic access$2900(Lcom/miui/gallery/ui/PhotoPageFragment;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->needDismissKeyGuard()Z

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->doOnTransitEnd()V

    return-void
.end method

.method static synthetic access$3000(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->dismissKeyGuard()V

    return-void
.end method

.method static synthetic access$3100(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getItemClickEventCategory(Lcom/miui/gallery/model/BaseDataItem;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3200(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mFavoritesManager:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    return-object p0
.end method

.method static synthetic access$3400(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->prohibitOperateProcessingItem(Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$3500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMeituEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;

    return-object p0
.end method

.method static synthetic access$3600(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;

    return-object p0
.end method

.method static synthetic access$3700(Lcom/miui/gallery/ui/PhotoPageFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mStartWhenLocked:Z

    return p0
.end method

.method static synthetic access$4300(Lcom/miui/gallery/ui/PhotoPageFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mShowSecretInAddDialog:Z

    return p0
.end method

.method static synthetic access$4302(Lcom/miui/gallery/ui/PhotoPageFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mShowSecretInAddDialog:Z

    return p1
.end method

.method static synthetic access$4400(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->downloadOrigin()V

    return-void
.end method

.method static synthetic access$4600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mStartWhenLockedAndSecret:Z

    return p0
.end method

.method static synthetic access$4700(Lcom/miui/gallery/ui/PhotoPageFragment;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isFromCamera()Z

    move-result p0

    return p0
.end method

.method static synthetic access$4800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOrientationManager:Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    return-object p0
.end method

.method static synthetic access$4900(Lcom/miui/gallery/ui/PhotoPageFragment;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->refreshTheme(Z)V

    return-void
.end method

.method static synthetic access$5000(Lcom/miui/gallery/ui/PhotoPageFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->finishActivity(I)V

    return-void
.end method

.method static synthetic access$6200(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->hideActionBarView()V

    return-void
.end method

.method static synthetic access$6300(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->showActionBarView()V

    return-void
.end method

.method static synthetic access$701(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->doExit()V

    return-void
.end method

.method static synthetic access$7200(Lcom/miui/gallery/ui/PhotoPageFragment;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->activityAlive()Z

    move-result p0

    return p0
.end method

.method static synthetic access$7700(Lcom/miui/gallery/ui/PhotoPageFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->isFromCamera:Z

    return p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->onBarsCreated()V

    return-void
.end method

.method static synthetic access$8500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPlayerManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageTopBar;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

    return-object p0
.end method

.method private activityAlive()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private alwaysShowMenubar()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAlwaysShowMenubar:Z

    return v0
.end method

.method private configViewLayout(Landroid/view/View;)V
    .locals 9

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x1

    const v2, 0x7f080007

    invoke-virtual {v0, v2, v1, v1}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v2

    const v3, 0x7f080006

    invoke-virtual {v0, v3, v1, v1}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v3

    const v4, 0x7f080004

    invoke-virtual {v0, v4, v1, v1}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v1

    const v4, 0x7f0902ae

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    const v5, 0x7f090217

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/ui/PhotoChoiceTitle;

    const v6, 0x7f090086

    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getRealScreenHeight()I

    move-result v6

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getRealScreenWidth()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getRealScreenHeight()I

    move-result v7

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getRealScreenWidth()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    int-to-float v6, v6

    mul-float v2, v2, v6

    float-to-int v2, v2

    mul-float v1, v1, v6

    float-to-int v1, v1

    invoke-virtual {v5}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    iput v2, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v4, v2}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setFixedSideSlipDistance(I)V

    const p1, 0x7f06038d

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    const v1, 0x7f06056e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    const v2, 0x7f06056f

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-float p1, p1

    const/high16 v2, 0x40000000    # 2.0f

    mul-float p1, p1, v2

    int-to-float v2, v7

    div-float/2addr p1, v2

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float p1, v2, p1

    int-to-float v0, v0

    mul-float v0, v0, v2

    int-to-float v1, v1

    div-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1, v3}, Lcom/miui/gallery/widget/ViewPager;->setHeightSlipRatio(F)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/widget/ViewPager;->setWidthSlipRatio(F)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/ViewPager;->setMarginSlipRatio(F)V

    return-void
.end method

.method private createBars()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$4;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageTopBar;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v1, v2, v0}, Lcom/miui/gallery/ui/PhotoPageTopBar;-><init>(Landroid/content/Context;Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isShowBarsWhenEntering()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    if-nez v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->setHasOptionsMenu(Z)V

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageTopBar;->getView()Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/ui/PhotoPageFragment$5;

    invoke-direct {v2, p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$5;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Z)V

    invoke-virtual {v1, v2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    new-instance v0, Landroid/app/ActionBar$LayoutParams;

    const/16 v1, 0x13

    const/4 v2, -0x1

    invoke-direct {v0, v2, v2, v1}, Landroid/app/ActionBar$LayoutParams;-><init>(III)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageTopBar;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lmiui/app/ActionBar;->setCustomView(Landroid/view/View;Landroid/app/ActionBar$LayoutParams;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f07020a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isShowBarsWhenEntering()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->setActionBarVisible(Z)V

    :cond_1
    return-void
.end method

.method private dismissKeyGuard()V
    .locals 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mHasSendDismissCast:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "xiaomi.intent.action.SHOW_SECURE_KEYGUARD"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method private doDataSetLoaded(Lcom/miui/gallery/model/BaseDataSet;Z)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDataLoaded:Z

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->initSelected(Lcom/miui/gallery/model/BaseDataSet;)V

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mProjectManager:Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mProjectManager:Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->updateSet(Lcom/miui/gallery/model/BaseDataSet;)V

    :cond_1
    return-void
.end method

.method private doDownloadOrigin(Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;)V
    .locals 4

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$14;

    invoke-direct {v0, p0, p1, p3, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$14;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;Lcom/miui/gallery/sdk/download/DownloadType;)V

    new-instance p3, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getSize()J

    move-result-wide v2

    invoke-direct {p3, v1, p2, v2, v3}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;-><init>(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;J)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p1}, Lcom/miui/gallery/ui/DownloadFragment;->newInstance(Ljava/util/ArrayList;)Lcom/miui/gallery/ui/DownloadFragment;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/DownloadFragment;->setOnDownloadListener(Lcom/miui/gallery/ui/DownloadFragment$OnDownloadListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p2

    const-string p3, "DownloadFragment"

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/ui/DownloadFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private doOnItemChanged(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->refreshTopBar(Lcom/miui/gallery/model/BaseDataItem;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mFavoritesManager:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mFavoritesManager:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->updateItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSmartVideoGuideManager:Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSmartVideoGuideManager:Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->updateItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->updateItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMaskManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMaskManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->refreshMask(Z)V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->updateItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->updateItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_5
    return-void
.end method

.method private doOnItemSettled(I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    if-eqz v0, :cond_9

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMenuManager:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMenuManager:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->settleItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mProjectManager:Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mProjectManager:Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    invoke-virtual {v1, v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->settleItem(Lcom/miui/gallery/model/BaseDataItem;I)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOrientationManager:Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOrientationManager:Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->settleItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mNFCManager:Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mNFCManager:Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;->settleItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->settleItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->settleItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_5
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->settleItem()V

    :cond_6
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isActionBarVisible()Z

    move-result v1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBarHeight()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lcom/miui/gallery/ui/PhotoPagerHelper;->onActionBarVisibleChanged(ZI)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result v1

    const/16 v2, 0x2000

    if-eqz v1, :cond_7

    and-int/2addr p1, v2

    if-nez p1, :cond_8

    const-string p1, "PhotoPageFragment"

    const-string v1, "add FLAG_SECURE"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/Window;->addFlags(I)V

    goto :goto_0

    :cond_7
    and-int/2addr p1, v2

    if-eqz p1, :cond_8

    const-string p1, "PhotoPageFragment"

    const-string v1, "clear FLAG_SECURE"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/Window;->clearFlags(I)V

    :cond_8
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/model/BaseDataItem;->getContentDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/TalkBackUtil;->requestAnnouncementEvent(Landroid/view/View;Ljava/lang/String;)V

    :cond_9
    return-void
.end method

.method private doOnPause()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOrientationManager:Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOrientationManager:Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->pause()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->pause()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mProjectManager:Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mProjectManager:Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->disableRemoteControl()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$VoiceAssistantReceiver;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$VoiceAssistantReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$VoiceAssistantReceiver;

    :cond_3
    return-void
.end method

.method private doOnResume()V
    .locals 4

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isActionBarVisible()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/miui/gallery/util/SystemUiUtil;->setSystemBarsVisibility(ZLandroid/view/View;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOrientationManager:Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOrientationManager:Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->resume()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->resume()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mProjectManager:Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mProjectManager:Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->enableRemoteControl()V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isNeedConfirmPassWord(Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result v0

    if-eqz v0, :cond_4

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mNeedConfirmPassWord:Z

    const/16 v0, 0x1b

    invoke-static {p0, v0}, Lcom/miui/privacy/LockSettingsHelper;->startAuthenticatePasswordActivity(Landroid/app/Fragment;I)V

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$VoiceAssistantReceiver;

    if-nez v0, :cond_5

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$VoiceAssistantReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$VoiceAssistantReceiver;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$VoiceAssistantReceiver;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$VoiceAssistantReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "com.miui.gallery.action.VOICE_ASSISTANT_SHARE"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPlayerManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPlayerManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->onResume()V

    :cond_6
    return-void
.end method

.method private doOnTransitEnd()V
    .locals 4

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->delayDoAfterTransit()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isTransparentTheme()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.miu.gallery.action.ENTER_PHOTO_PAGE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isPreviewMode()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->setActionBarVisible(Z)V

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->createBars()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->supportProjection()Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mProjectManager:Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    :cond_2
    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOrientationManager:Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mNFCManager:Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    invoke-direct {v0, p0, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mRefocusManager:Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;

    invoke-static {}, Lcom/miui/gallery/video/editor/manager/SmartVideoJudgeManager;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSmartVideoGuideManager:Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;

    :cond_3
    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    invoke-direct {v0, p0, v2, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPlayerManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

    invoke-direct {v0, p0, v2, v3}, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;Lcom/miui/gallery/ui/PhotoPageTopBar;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMeituEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mIsSupportFordBurst:Z

    if-eqz v0, :cond_4

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$BurstPhotoManager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$BurstPhotoManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mBurstPhotoManager:Lcom/miui/gallery/ui/PhotoPageFragment$BurstPhotoManager;

    :cond_4
    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->isSupportNewVideoPlayer()Z

    move-result v0

    if-eqz v0, :cond_5

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    :cond_5
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->doOnResume()V

    :cond_6
    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDataLoaded:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataSet()Lcom/miui/gallery/model/BaseDataSet;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->doDataSetLoaded(Lcom/miui/gallery/model/BaseDataSet;Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->doOnItemChanged(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->doOnItemSettled(I)V

    :cond_7
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mThemeManager:Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mThemeManager:Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->setBackgroundAlpha(F)V

    :cond_8
    return-void
.end method

.method private downloadOrigin()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->getCurrentItem()Lcom/miui/gallery/ui/PhotoPageItem;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->downloadOrigin()V

    :cond_0
    return-void
.end method

.method private finishActivity(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isTransparentTheme()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.action.EXIT_PHOTO_PAGE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "photo_result_code"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    :cond_1
    return-void
.end method

.method private fromRecommendFacePage()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mFromRecommendFacePage:Z

    return v0
.end method

.method private getActionBarHeight()I
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getHeight()I

    move-result v0

    if-lez v0, :cond_0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->getStatusBarHeight(Landroid/content/Context;)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060388

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private getItemClickEventCategory(Lcom/miui/gallery/model/BaseDataItem;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "photo_secret"

    return-object p1

    :cond_0
    const-string p1, "photo"

    return-object p1
.end method

.method private hideActionBarView()V
    .locals 2

    const-string v0, "PhotoPageFragment"

    const-string v1, "hideActionBarView"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageTopBar;->isShowing()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageTopBar;->hide()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->hideBottomMenu()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMaskManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMaskManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->hideMaskImmediately()V

    :cond_1
    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method private inPreviewMode()Z
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isActionBarVisible()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->isPendingSlipped()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isActionBarVisible()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/app/ActionBar;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isFromCamera()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->isFromCamera:Z

    return v0
.end method

.method private isNaviBarShown()Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-ne v3, v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/compat/view/ViewCompat;->getSystemWindowInsetLeft(Landroid/view/View;)I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/compat/view/ViewCompat;->getSystemWindowInsetRight(Landroid/view/View;)I

    move-result v0

    if-lez v0, :cond_1

    :cond_0
    const/4 v1, 0x1

    :cond_1
    return v1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/compat/view/ViewCompat;->getSystemWindowInsetBottom(Landroid/view/View;)I

    move-result v0

    if-lez v0, :cond_3

    const/4 v1, 0x1

    :cond_3
    return v1
.end method

.method private isPreviewMode()Z
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->fromRecommendFacePage()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPreviewMode:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private isSecureKeyguard()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-string v1, "keyguard"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isKeyguardSecure()Z

    move-result v0

    return v0
.end method

.method private isShowBarsWhenEntering()Z
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "photo_uri"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/UriUtil;->isNetUri(Landroid/net/Uri;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->alwaysShowMenubar()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "com.miui.gallery.extra.show_bars_when_enter"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "com.miui.gallery.extra.photo_enter_choice_mode"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isPreviewMode()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isFromCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x1

    :cond_2
    :goto_0
    return v2
.end method

.method private isStatUserShowMenuBar()Z
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isFromCamera()Z

    move-result v0

    return v0
.end method

.method private isTransparentTheme()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTheme:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private needDismissKeyGuard()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mStartWhenLocked:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mStartWhenLockedAndSecret:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mHasSendDismissCast:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static newInstance(Landroid/net/Uri;Ljava/lang/String;Landroid/os/Bundle;I)Lcom/miui/gallery/ui/PhotoPageFragment;
    .locals 1

    if-nez p2, :cond_0

    new-instance p2, Landroid/os/Bundle;

    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    :cond_0
    const-string v0, "key_theme"

    invoke-virtual {p2, v0, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    if-eqz p0, :cond_1

    const-string p3, "photo_uri"

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p3, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    if-eqz p1, :cond_2

    const-string p0, "mime_type"

    invoke-virtual {p2, p0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    new-instance p0, Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;-><init>()V

    invoke-virtual {p0, p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method

.method private onActionBarVisibilityChanged(Z)V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-virtual {v2, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->showMoreFuncExceptRefocus(Z)V

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mFavoritesManager:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mFavoritesManager:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->show()V

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSmartVideoGuideManager:Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSmartVideoGuideManager:Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;

    invoke-virtual {v2, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->onActionBarVisibilityChanged(Z)V

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-virtual {v2, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->hideMoreFuncExceptRefocus(Z)V

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isExiting()Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mFavoritesManager:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mFavoritesManager:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->hide()V

    :cond_4
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSmartVideoGuideManager:Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSmartVideoGuideManager:Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;

    invoke-virtual {v2, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->onActionBarVisibilityChanged(Z)V

    :cond_5
    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->onActionBarVisibilityChanged()V

    :cond_6
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMaskManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMaskManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    invoke-virtual {v2, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->refreshMask(Z)V

    :cond_7
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    if-eqz v1, :cond_8

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->onActionBarVisibilityChanged(Z)V

    :cond_8
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isExiting()Z

    move-result v1

    if-nez v1, :cond_b

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->refreshTheme(Z)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBarHeight()I

    move-result v2

    invoke-virtual {v1, p1, v2}, Lcom/miui/gallery/ui/PhotoPagerHelper;->onActionBarVisibleChanged(ZI)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/miui/gallery/util/SystemUiUtil;->setSystemBarsVisibility(ZLandroid/view/View;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isNaviBarShown()Z

    move-result v1

    if-eqz v1, :cond_b

    if-eqz p1, :cond_a

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mIsNightMode:Z

    if-eqz p1, :cond_9

    const/high16 v0, -0x1000000

    goto :goto_1

    :cond_9
    const/4 v0, -0x1

    :cond_a
    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1, v0}, Lcom/miui/gallery/compat/view/WindowCompat;->setNavigationBarColor(Landroid/view/Window;I)V

    :cond_b
    return-void
.end method

.method private onBarsCreated()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMaskManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->refreshTopBar(Lcom/miui/gallery/model/BaseDataItem;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isShowBarsWhenEntering()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/miui/gallery/compat/app/ActionBarCompat;->setShowHideAnimationEnabled(Landroid/app/ActionBar;Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/app/ActionBar;->hide()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/miui/gallery/compat/app/ActionBarCompat;->setShowHideAnimationEnabled(Landroid/app/ActionBar;Z)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->setActionBarVisible(Z)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/miui/gallery/compat/app/ActionBarCompat;->setShowHideAnimationEnabled(Landroid/app/ActionBar;Z)V

    invoke-direct {p0, v2}, Lcom/miui/gallery/ui/PhotoPageFragment;->setActionBarVisible(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/miui/gallery/compat/app/ActionBarCompat;->setShowHideAnimationEnabled(Landroid/app/ActionBar;Z)V

    :goto_0
    return-void
.end method

.method private parseArguments()Z
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    const-string v2, "photo_uri"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    return v1

    :cond_0
    const-string v2, "from_MiuiCamera"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->isFromCamera:Z

    iget-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->isFromCamera:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    const-string v2, "StartActivityWhenLocked"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mStartWhenLocked:Z

    iget-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mStartWhenLocked:Z

    if-eqz v2, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isSecureKeyguard()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    iput-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mStartWhenLockedAndSecret:Z

    :cond_2
    const-string v2, "key_theme"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTheme:I

    const-string v2, "photo_always_show_menubar"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAlwaysShowMenubar:Z

    const-string v2, "from_recommend_face_page"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mFromRecommendFacePage:Z

    const-string v2, "photo_preview_mode"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPreviewMode:Z

    const-string v2, "unford_burst"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/2addr v0, v3

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mIsSupportFordBurst:Z

    return v3

    :cond_3
    return v1
.end method

.method private prohibitOperateProcessingItem(Lcom/miui/gallery/model/BaseDataItem;)Z
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->isProcessingMedia(Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v0, 0x7f1004cc

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private refreshTheme(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mThemeManager:Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->inPreviewMode()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mThemeManager:Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->setDarkTheme(ZZ)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mThemeManager:Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->setLightTheme(ZZ)V

    :cond_1
    :goto_0
    return-void
.end method

.method private refreshTopBar(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/model/BaseDataItem;->getViewTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageTopBar;->setTitle(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/model/BaseDataItem;->getViewSubTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageTopBar;->setSubTitle(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getLocation()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/ui/PhotoPageTopBar;->setLocation(Landroid/content/Context;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private setActionBarVisible(Z)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isActionBarVisible()Z

    move-result v0

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->isSlipped()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isPreviewMode()Z

    move-result v0

    if-eqz v0, :cond_2

    return-void

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/app/ActionBar;->show()V

    goto :goto_0

    :cond_3
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->alwaysShowMenubar()Z

    move-result v0

    if-eqz v0, :cond_4

    return-void

    :cond_4
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/app/ActionBar;->hide()V

    :goto_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->onActionBarVisibilityChanged(Z)V

    return-void
.end method

.method private showActionBarView()V
    .locals 2

    const-string v0, "PhotoPageFragment"

    const-string v1, "showActionBarView"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageTopBar;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mTopBar:Lcom/miui/gallery/ui/PhotoPageTopBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageTopBar;->show()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->showBottomMenu()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMaskManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMaskManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->showMaskImmediately()V

    :cond_1
    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method private statUserShowMenuBar()V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iget v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mUserShowBarIndex:I

    if-ltz v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v2, "isUserShowMenuBar"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v1, :cond_1

    const-string v1, "showBarIndex"

    iget v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mUserShowBarIndex:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    const-string v1, "photo"

    const-string v2, "photo_user_show_menu_bar"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private supportProjection()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/GalleryUtils;->needImpunityDeclaration()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method


# virtual methods
.method protected delayDoAfterTransit()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "PhotoPageFragment"

    const-string v1, "delayDoAfterTransit but not added"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isFromCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageFragment$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$2;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->doOnTransitEnd()V

    :goto_0
    return-void
.end method

.method protected doExit()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isTransparentTheme()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getInstance()Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->isItemVisible(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getInstance()Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->viewToPosition(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageFragment$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$3;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->doExit()V

    :goto_0
    return-void
.end method

.method protected downloadOrigin(Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;)V
    .locals 8

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f100321

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f100322

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x104000a

    const/high16 v5, 0x1040000

    new-instance v6, Lcom/miui/gallery/ui/PhotoPageFragment$12;

    invoke-direct {v6, p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$12;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;)V

    new-instance v7, Lcom/miui/gallery/ui/PhotoPageFragment$13;

    invoke-direct {v7, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$13;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMenuManager:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->access$2600(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Ljava/lang/String;ZZ)V

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-direct {p0, p1, v0, p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->doDownloadOrigin(Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;)V

    :goto_0
    return-void
.end method

.method public finish()V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->finishActivity(I)V

    return-void
.end method

.method protected getItemViewInfo(I)Lcom/miui/gallery/util/photoview/ItemViewInfo;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isTransparentTheme()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getInstance()Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getItemViewInfo(I)Lcom/miui/gallery/util/photoview/ItemViewInfo;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method protected getLayout(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getInstance()Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getPageLayout()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0b0100

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public getPageItem()Lcom/miui/gallery/ui/PhotoPageItem;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->getCurrentItem()Lcom/miui/gallery/ui/PhotoPageItem;

    move-result-object v0

    return-object v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "photo"

    return-object v0
.end method

.method protected getPhotoPageInteractionListener()Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    return-object v0
.end method

.method public getPhotoView()Landroid/widget/ImageView;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->getCurrentItem()Lcom/miui/gallery/ui/PhotoPageItem;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f09021e

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getTAG()Ljava/lang/String;
    .locals 1

    const-string v0, "PhotoPageFragment"

    return-object v0
.end method

.method protected getThemeRes()I
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isTransparentTheme()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f1100a9

    return v0

    :cond_0
    const v0, 0x7f1100a8

    return v0
.end method

.method public onActivityReenter(ILandroid/content/Intent;)V
    .locals 1

    if-eqz p2, :cond_2

    const-string p1, "extra_photo_edit_type"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "extra_photo_editor_type_common"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;->onActivityReenter(Landroid/content/Intent;)V

    goto :goto_0

    :cond_0
    const-string v0, "extra_photo_editor_type_refocus"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mRefocusManager:Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mRefocusManager:Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;->onActivityReenter(Landroid/content/Intent;)V

    goto :goto_0

    :cond_1
    const-string v0, "extra_photo_editor_type_re_pick"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->onActivityReenter(Landroid/content/Intent;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    const/4 v0, -0x1

    const/4 v1, 0x0

    sparse-switch p1, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    if-ne p2, v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mBurstPhotoManager:Lcom/miui/gallery/ui/PhotoPageFragment$BurstPhotoManager;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mBurstPhotoManager:Lcom/miui/gallery/ui/PhotoPageFragment$BurstPhotoManager;

    invoke-virtual {v0, p3}, Lcom/miui/gallery/ui/PhotoPageFragment$BurstPhotoManager;->onActivityResult(Landroid/content/Intent;)V

    goto/16 :goto_0

    :sswitch_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMeituEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMeituEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;

    invoke-virtual {v0, p2, p3}, Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;->onActivityResult(ILandroid/content/Intent;)V

    goto :goto_0

    :sswitch_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;

    invoke-virtual {v0, p2, p3}, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->onActivityResult(ILandroid/content/Intent;)V

    goto :goto_0

    :sswitch_3
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPlayerManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPlayerManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    invoke-virtual {v0, p2, p3}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->onActivityResult(ILandroid/content/Intent;)V

    goto :goto_0

    :sswitch_4
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mRefocusManager:Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mRefocusManager:Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;

    invoke-virtual {v0, p2, p3}, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;->onActivityResult(ILandroid/content/Intent;)V

    goto :goto_0

    :sswitch_5
    if-ne p2, v0, :cond_0

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mNeedConfirmPassWord:Z

    goto :goto_0

    :cond_0
    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->finishActivity(I)V

    goto :goto_0

    :sswitch_6
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-virtual {v0, p3}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->onDualPhotoEdited(Landroid/content/Intent;)V

    goto :goto_0

    :sswitch_7
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;

    invoke-virtual {v0, p2, p3}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;->onActivityResult(ILandroid/content/Intent;)V

    :cond_1
    if-eqz p3, :cond_2

    const-string v0, "photo_secret_finish"

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->finishActivity(I)V

    goto :goto_0

    :cond_2
    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mNeedConfirmPassWord:Z

    goto :goto_0

    :sswitch_8
    if-eq p2, v0, :cond_3

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->finishActivity(I)V

    goto :goto_0

    :cond_3
    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mNeedConfirmPassWord:Z

    goto :goto_0

    :sswitch_9
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mProjectManager:Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mProjectManager:Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->exitSlideShow()V

    :cond_4
    :goto_0
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onActivityResult(IILandroid/content/Intent;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPagerHelper;->onActivityResult(IILandroid/content/Intent;)V

    return-void

    :sswitch_data_0
    .sparse-switch
        0x18 -> :sswitch_9
        0x1b -> :sswitch_8
        0x1e -> :sswitch_7
        0x25 -> :sswitch_6
        0x26 -> :sswitch_5
        0x2c -> :sswitch_4
        0x2d -> :sswitch_3
        0x32 -> :sswitch_2
        0x33 -> :sswitch_1
        0x34 -> :sswitch_0
    .end sparse-switch
.end method

.method public onBackPressed()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->onBackPressed()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->doExit()V

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOrientationManager:Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOrientationManager:Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->onUiOrientationChanged(Landroid/content/res/Configuration;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->onUiOrientationChanged(Landroid/content/res/Configuration;)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->onOrientationChanged()V

    :cond_2
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->parseArguments()Z

    move-result v0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onCreate(Landroid/os/Bundle;)V

    if-nez v0, :cond_0

    const-string p1, "PhotoPageFragment"

    const-string v0, "params error %s"

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->finish()V

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isFromCamera()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mStartWhenLocked:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v1, 0x80000

    invoke-virtual {p1, v1}, Landroid/view/Window;->addFlags(I)V

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageFragment$ScreenBroadcastReceiver;

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ScreenBroadcastReceiver;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mScreenReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$ScreenBroadcastReceiver;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mScreenReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$ScreenBroadcastReceiver;

    const-string v2, "android.intent.action.SCREEN_OFF"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/util/ReceiverUtils;->registerReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;[Ljava/lang/String;)V

    :cond_1
    new-instance p1, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoRefreshReceiver;

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoRefreshReceiver;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPhotoRefreshReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoRefreshReceiver;

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.miui.gallery.SAVE_TO_CLOUD"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPhotoRefreshReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoRefreshReceiver;

    invoke-virtual {v0, v1, p1}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isNightMode(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mIsNightMode:Z

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isPreviewMode()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-interface {p1}, Landroid/view/Menu;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v2, 0x7f0c0009

    invoke-virtual {v0, v2, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "support_operation_mask"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    :cond_1
    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    invoke-direct {v0, p0, p1, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Landroid/view/Menu;I)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMenuManager:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Landroid/view/Menu;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mFavoritesManager:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    const/4 p1, 0x1

    return p1
.end method

.method protected onDataSetLoaded(Lcom/miui/gallery/model/BaseDataSet;Z)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onDataSetLoaded(Lcom/miui/gallery/model/BaseDataSet;Z)V

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->doDataSetLoaded(Lcom/miui/gallery/model/BaseDataSet;Z)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->getInstance()Lcom/miui/gallery/util/uil/PhotoReusedBitCache;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->initFirstCacheBitmap()V

    invoke-static {}, Lcom/miui/gallery/util/photoview/TileReusedBitCache;->getInstance()Lcom/miui/gallery/util/photoview/TileReusedBitCache;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/TileReusedBitCache;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mScreenReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$ScreenBroadcastReceiver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mScreenReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$ScreenBroadcastReceiver;

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ReceiverUtils;->safeUnregisterReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)Z

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPhotoRefreshReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoRefreshReceiver;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPhotoRefreshReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoRefreshReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDualCameraManager:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->onDestory()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;->onDestroy()V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mFavoritesManager:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mFavoritesManager:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->onDestroy()V

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPlayerManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPlayerManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->onDestroy()V

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->onDestroy()V

    :cond_6
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->onDestroy()V

    :cond_7
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMeituEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMeituEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;->onDestroy()V

    :cond_8
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->onDestroy()V

    :cond_9
    invoke-static {}, Lcom/miui/gallery/data/CacheOfAllFacesInOnePhoto;->getInstance()Lcom/miui/gallery/data/CacheOfAllFacesInOnePhoto;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/data/CacheOfAllFacesInOnePhoto;->clearCache()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isStatUserShowMenuBar()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->statUserShowMenuBar()V

    :cond_a
    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onDestroy()V

    return-void
.end method

.method public onDestroyView()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onDestroyView()V

    invoke-static {}, Lcom/miui/gallery/ui/PhotoPagerSamplingStatHelper;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mProjectManager:Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mProjectManager:Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->release()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOrientationManager:Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOrientationManager:Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->release()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMaskManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMaskManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->release()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->release()V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mRefocusManager:Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mRefocusManager:Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mRefocusManager:Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSmartVideoGuideManager:Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mSmartVideoGuideManager:Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->release()V

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mNFCManager:Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mNFCManager:Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;->release()V

    :cond_6
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDataLoaded:Z

    return-void
.end method

.method protected onExiting()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isFromCamera()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setDisplayShowCustomEnabled(Z)V

    :cond_0
    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->setActionBarVisible(Z)V

    return-void
.end method

.method public onImageLoadFinish(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;->onImageLoadFinish(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mRefocusManager:Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mRefocusManager:Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;->onImageLoadFinish(Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->onImageLoadFinish(Ljava/lang/String;)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMeituEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMeituEditorManager:Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;->onImageLoadFinish(Ljava/lang/String;)V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPlayerManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPlayerManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->onImageLoadFinish(Ljava/lang/String;)V

    :cond_4
    return-void
.end method

.method protected onItemChanged(I)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onItemChanged(I)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->doOnItemChanged(I)V

    return-void
.end method

.method protected onItemSettled(I)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onItemSettled(I)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->doOnItemSettled(I)V

    return-void
.end method

.method public onMultiWindowModeChanged(Z)V
    .locals 3

    const-string v0, "PhotoPageFragment"

    const-string v1, "isInMultiWindowMode: %b"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->onMultiWindowModeChanged(Z)V

    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMenuManager:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->onMenuItemClick(Landroid/view/MenuItem;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onPageScrollStateChanged(I)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onPageScrollStateChanged(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->onPageScrollStateChanged(I)V

    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 1

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onPageScrolled(IFI)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->onPageScrolled(IFI)V

    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onPause()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->doOnPause()V

    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMenuManager:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mMenuManager:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->settleItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onResume()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->doOnResume()V

    return-void
.end method

.method protected onShared()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onShared()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mChoiceManager:Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->onShared()V

    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onStart()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->onStart()V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mNeedConfirmPassWord:Z

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onStop()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mVideoPreviewManager:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->onStop()V

    :cond_0
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onTrimMemory(I)V

    const/16 v0, 0x14

    if-ne p1, v0, :cond_0

    const-string v0, "PhotoPageFragment"

    const-string v1, "onTrimMemory level:%d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->getInstance()Lcom/miui/gallery/util/uil/PhotoReusedBitCache;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->clear()V

    invoke-static {}, Lcom/miui/gallery/util/photoview/TileReusedBitCache;->getInstance()Lcom/miui/gallery/util/photoview/TileReusedBitCache;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/TileReusedBitCache;->clear()V

    :cond_0
    return-void
.end method

.method protected onViewInflated(Landroid/view/View;)V
    .locals 4

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onViewInflated(Landroid/view/View;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->configViewLayout(Landroid/view/View;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->setHasOptionsMenu(Z)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->fromRecommendFacePage()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/activity/BaseActivity;->setRequestedOrientation(I)V

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOnSingleTapListener:Lcom/miui/gallery/ui/PhotoPagerHelper$OnSingleTapListener;

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/PhotoPagerHelper;->setOnTapListener(Lcom/miui/gallery/ui/PhotoPagerHelper$OnSingleTapListener;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOnPhotoScaleChangeListener:Lcom/miui/gallery/ui/PhotoPagerHelper$OnScaleChangedListener;

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/PhotoPagerHelper;->setOnScaleChangedListener(Lcom/miui/gallery/ui/PhotoPagerHelper$OnScaleChangedListener;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOnPhotoMatrixChangeListener:Lcom/miui/gallery/ui/PhotoPagerHelper$OnDisplayRectChangedListener;

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/PhotoPagerHelper;->setOnDisplayRectChangedListener(Lcom/miui/gallery/ui/PhotoPagerHelper$OnDisplayRectChangedListener;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mDownloadListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/PhotoPagerHelper;->setOnDownloadListener(Lcom/miui/gallery/util/uil/CloudImageLoadingListener;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mOnExitListener:Lcom/miui/gallery/ui/PhotoPagerHelper$OnExitListener;

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/PhotoPagerHelper;->setOnExitListener(Lcom/miui/gallery/ui/PhotoPagerHelper$OnExitListener;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAlphaChangedListener:Lcom/miui/gallery/ui/PhotoPagerHelper$OnAlphaChangedListener;

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/PhotoPagerHelper;->setOnAlphaChangedListener(Lcom/miui/gallery/ui/PhotoPagerHelper$OnAlphaChangedListener;)V

    const v1, 0x7f0902ae

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setDraggable(Z)V

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;

    const v3, 0x7f09021b

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/IMultiThemeView;

    invoke-direct {v1, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;-><init>(Lcom/miui/gallery/widget/IMultiThemeView;)V

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mThemeManager:Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isFromCamera()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isPreviewMode()Z

    move-result p1

    if-eqz p1, :cond_2

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mThemeManager:Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;

    invoke-virtual {p1, v0, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->setDarkTheme(ZZ)V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mThemeManager:Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->setBackgroundAlpha(F)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isShowBarsWhenEntering()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SystemUiUtil;->setLayoutFullScreen(Landroid/view/View;Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Lcom/android/internal/WindowCompat;->setCutoutModeShortEdges(Landroid/view/Window;)V

    return-void
.end method
