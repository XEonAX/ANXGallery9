.class public abstract Lcom/miui/gallery/ui/PhotoPageFragmentBase;
.super Lcom/miui/gallery/ui/BaseBottomMenuFragment;
.source "PhotoPageFragmentBase.java"

# interfaces
.implements Lcom/miui/gallery/adapter/PhotoPageAdapter$OnPreviewedListener;
.implements Lcom/miui/gallery/ui/PhotoPagerHelper$OnImageLoadFinishListener;
.implements Lcom/miui/gallery/ui/PhotoPagerHelper$OnPageChangedListener;
.implements Lcom/miui/gallery/ui/PhotoPagerHelper$OnPageSettledListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaPollingRunnable;,
        Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;,
        Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;,
        Lcom/miui/gallery/ui/PhotoPageFragmentBase$BackgroundLoadListener;,
        Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;,
        Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;
    }
.end annotation


# instance fields
.field private isEntering:Z

.field private isExiting:Z

.field protected mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

.field private mIsShareOngoing:Z

.field private mLastStopMillis:J

.field private mLoadingDialog:Landroid/app/AlertDialog;

.field protected mNeedConfirmPassWord:Z

.field private mNeedShowLoadingDialog:Z

.field protected mPager:Lcom/miui/gallery/widget/ViewPager;

.field protected mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

.field private mPendingLoadPhotos:Z

.field private mPendingUpdateItem:Z

.field private mPhotosLoaderCallBack:Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;

.field private mProcessingMediaLoaderCallback:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;

.field protected mProcessingMediaMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/provider/ProcessingMedia;",
            ">;"
        }
    .end annotation
.end field

.field private mProcessingMediaPollingRunnable:Ljava/lang/Runnable;

.field private mShowLoadingDialogRunnable:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->isExiting:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->isEntering:Z

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mNeedShowLoadingDialog:Z

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Ljava/lang/Runnable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mShowLoadingDialogRunnable:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$1102(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mShowLoadingDialogRunnable:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mNeedShowLoadingDialog:Z

    return p0
.end method

.method static synthetic access$1202(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mNeedShowLoadingDialog:Z

    return p1
.end method

.method static synthetic access$1400(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Landroid/app/AlertDialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mLoadingDialog:Landroid/app/AlertDialog;

    return-object p0
.end method

.method static synthetic access$1402(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mLoadingDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$1500(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mProcessingMediaLoaderCallback:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;

    return-object p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->isExiting:Z

    return p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Ljava/lang/Runnable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mProcessingMediaPollingRunnable:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Ljava/lang/Runnable;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getProcessingMediaPollingRunnable()Ljava/lang/Runnable;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPendingLoadPhotos:Z

    return p0
.end method

.method static synthetic access$602(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPendingLoadPhotos:Z

    return p1
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->startToLoadPhotos()V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPendingUpdateItem:Z

    return p0
.end method

.method static synthetic access$802(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPendingUpdateItem:Z

    return p1
.end method

.method private cancelBackgroundLoad()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v0

    instance-of v1, v0, Lcom/miui/gallery/loader/BaseLoader;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/miui/gallery/loader/BaseLoader;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/loader/BaseLoader;->setBackgroundLoadListener(Lcom/miui/gallery/loader/BaseLoader$OnLoadCompleteListener;)V

    :cond_1
    return-void
.end method

.method private dismissLoadingDialog()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mLoadingDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mLoadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mLoadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mLoadingDialog:Landroid/app/AlertDialog;

    :cond_0
    return-void
.end method

.method private getProcessingMediaPollingRunnable()Ljava/lang/Runnable;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mProcessingMediaPollingRunnable:Ljava/lang/Runnable;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaPollingRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaPollingRunnable;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Lcom/miui/gallery/ui/PhotoPageFragmentBase$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mProcessingMediaPollingRunnable:Ljava/lang/Runnable;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mProcessingMediaPollingRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method private startToLoadPhotos()V
    .locals 4

    const-string v0, "PhotoPageFragmentBase"

    const-string v1, "startToLoadPhotos"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPhotosLoaderCallBack:Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;

    const/4 v3, 0x2

    invoke-virtual {v0, v3, v1, v2}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method

.method private startToLoadProcessingMedias()V
    .locals 4

    const-string v0, "PhotoPageFragmentBase"

    const-string v1, "startToLoadProcessingMedias"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mProcessingMediaLoaderCallback:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mProcessingMediaLoaderCallback:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;

    const/4 v3, 0x1

    invoke-virtual {v0, v3, v1, v2}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    iput-boolean v3, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPendingLoadPhotos:Z

    :cond_0
    return-void
.end method


# virtual methods
.method protected delayDoAfterTransit()V
    .locals 0

    return-void
.end method

.method protected doExit()V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->isExiting:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->isExiting:Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onExiting()V

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$2;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getItemViewInfo(I)Lcom/miui/gallery/util/photoview/ItemViewInfo;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->doExitTransition(Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->finish()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->isExiting:Z

    :cond_1
    return-void
.end method

.method public finish()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    :cond_0
    return-void
.end method

.method protected getEnterViewInfo(I)Lcom/miui/gallery/util/photoview/ItemViewInfo;
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "photo_enter_transit"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "photo_enter_transit"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getItemViewInfo(I)Lcom/miui/gallery/util/photoview/ItemViewInfo;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected getImageLoadParams()Lcom/miui/gallery/model/ImageLoadParams;
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "photo_transition_data"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/model/ImageLoadParams;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v3, "from_MiuiCamera"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v2, 0x1

    :cond_0
    invoke-virtual {v0, v2}, Lcom/miui/gallery/model/ImageLoadParams;->setFromCamera(Z)V

    :cond_1
    return-object v0
.end method

.method protected getInitCount()I
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "photo_count"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v3, "from_MiuiCamera"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method protected getItemViewInfo(I)Lcom/miui/gallery/util/photoview/ItemViewInfo;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method protected abstract getLayout(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
.end method

.method protected getPhotoAdapter()Lcom/miui/gallery/adapter/PhotoPageAdapter;
    .locals 7

    new-instance v6, Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getInitCount()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getImageLoadParams()Lcom/miui/gallery/model/ImageLoadParams;

    move-result-object v2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v3, "photo_init_position"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getEnterViewInfo(I)Lcom/miui/gallery/util/photoview/ItemViewInfo;

    move-result-object v3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getPhotoPageInteractionListener()Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;

    move-result-object v5

    move-object v0, v6

    move-object v4, p0

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/adapter/PhotoPageAdapter;-><init>(ILcom/miui/gallery/model/ImageLoadParams;Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/adapter/PhotoPageAdapter$OnPreviewedListener;Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;)V

    return-object v6
.end method

.method protected getPhotoPageInteractionListener()Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)V

    return-object v0
.end method

.method protected abstract getTAG()Ljava/lang/String;
.end method

.method protected isEntering()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->isEntering:Z

    return v0
.end method

.method protected isExiting()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->isExiting:Z

    return v0
.end method

.method protected isNeedConfirmPassWord(Lcom/miui/gallery/model/BaseDataItem;)Z
    .locals 7

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mIsShareOngoing:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mNeedConfirmPassWord:Z

    if-eqz v0, :cond_1

    iget-wide v3, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mLastStopMillis:J

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-lez v0, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mLastStopMillis:J

    sub-long/2addr v3, v5

    const-wide/16 v5, 0x3a98

    cmp-long v0, v3, v5

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mNeedConfirmPassWord:Z

    iput-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mIsShareOngoing:Z

    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mNeedConfirmPassWord:Z

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    return v1
.end method

.method protected isProcessingMedia(Lcom/miui/gallery/model/BaseDataItem;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mProcessingMediaMap:Ljava/util/Map;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mProcessingMediaMap:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method protected loadInBackground()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {v0}, Landroid/content/Loader;->isStarted()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Landroid/content/Loader;->onContentChanged()V

    goto :goto_0

    :cond_2
    instance-of v1, v0, Lcom/miui/gallery/loader/BaseLoader;

    if-eqz v1, :cond_3

    check-cast v0, Lcom/miui/gallery/loader/BaseLoader;

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$BackgroundLoadListener;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPhotosLoaderCallBack:Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;

    invoke-direct {v1, v2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$BackgroundLoadListener;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/loader/BaseLoader;->setBackgroundLoadListener(Lcom/miui/gallery/loader/BaseLoader$OnLoadCompleteListener;)V

    invoke-virtual {v0}, Lcom/miui/gallery/loader/BaseLoader;->forceLoad()V

    :cond_3
    :goto_0
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "photo_uri"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "PhotoPageFragmentBase"

    const-string v0, "photo uri should not be null %s"

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->finish()V

    return-void

    :cond_0
    new-instance p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Lcom/miui/gallery/ui/PhotoPageFragmentBase$1;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mProcessingMediaLoaderCallback:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Lcom/miui/gallery/ui/PhotoPageFragmentBase$1;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPhotosLoaderCallBack:Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->startToLoadProcessingMedias()V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->onActivityResult(IILandroid/content/Intent;)V

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onShared()V

    :cond_0
    return-void
.end method

.method protected onContentChanged()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Loader;->onContentChanged()V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->restoreState(Landroid/os/Bundle;)V

    :cond_0
    return-void
.end method

.method protected onDataSetLoaded(Lcom/miui/gallery/model/BaseDataSet;Z)V
    .locals 0

    return-void
.end method

.method public onDestroyView()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->onDestroyView()V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mProcessingMediaPollingRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->destroyLoader(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->destroyLoader(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/ViewPager;->removeAllViews()V

    return-void
.end method

.method public onDetach()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->onDetach()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mShowLoadingDialogRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mShowLoadingDialogRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->dismissLoadingDialog()V

    return-void
.end method

.method protected onExiting()V
    .locals 0

    return-void
.end method

.method public onImageLoadFinish(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getLayout(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f09021c

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/ViewPager;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f06056e

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/ViewPager;->setPageMargin(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getPhotoAdapter()Lcom/miui/gallery/adapter/PhotoPageAdapter;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    new-instance p2, Lcom/miui/gallery/ui/PhotoPagerHelper;

    iget-object p3, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-direct {p2, p3}, Lcom/miui/gallery/ui/PhotoPagerHelper;-><init>(Lcom/miui/gallery/widget/ViewPager;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {p2, p0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->setOnPageChangedListener(Lcom/miui/gallery/ui/PhotoPagerHelper$OnPageChangedListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {p2, p0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->setOnPageSettledListener(Lcom/miui/gallery/ui/PhotoPagerHelper$OnPageSettledListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {p2, p0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->setOnImageLoadFinishListener(Lcom/miui/gallery/ui/PhotoPagerHelper$OnImageLoadFinishListener;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onViewInflated(Landroid/view/View;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    iget-object p3, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/ViewPager;->setAdapter(Lcom/miui/gallery/widget/PagerAdapter;)V

    return-object p1
.end method

.method protected onItemChanged(I)V
    .locals 0

    return-void
.end method

.method protected onItemSettled(I)V
    .locals 0

    return-void
.end method

.method public final onPageChanged(I)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPendingUpdateItem:Z

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onItemChanged(I)V

    :cond_0
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public final onPageSettled(I)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPendingUpdateItem:Z

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onItemSettled(I)V

    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->onPause()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->dismissLoadingDialog()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mNeedShowLoadingDialog:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->onPause()V

    return-void
.end method

.method public final onPreviewed()V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->isEntering:Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->delayDoAfterTransit()V

    iget-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPendingUpdateItem:Z

    if-eqz v1, :cond_0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPendingUpdateItem:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPagerHelper;->setPageChanged(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPagerHelper;->setPageSettled(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataSet()Lcom/miui/gallery/model/BaseDataSet;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onDataSetLoaded(Lcom/miui/gallery/model/BaseDataSet;Z)V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->onResume()V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->saveState(Landroid/os/Bundle;)V

    return-void
.end method

.method protected onShared()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mIsShareOngoing:Z

    return-void
.end method

.method public onStart()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->onStart()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->onStart()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->cancelBackgroundLoad()V

    return-void
.end method

.method public onStop()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->onStop()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->onStop()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mLastStopMillis:J

    return-void
.end method

.method protected onViewInflated(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public onViewStateRestored(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->onViewStateRestored(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "photo_init_position"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "photo_init_position"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v2, "photo_count"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-ltz p1, :cond_0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/widget/ViewPager;->setCurrentItem(IZ)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "photo_init_position"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method protected restoreState(Landroid/os/Bundle;)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "photo_init_position"

    const-string v2, "photo_init_position"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "photo_count"

    const-string v2, "photo_count"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p1, "photo_enter_transit"

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    const-string p1, "photo_transition_data"

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method protected saveState(Landroid/os/Bundle;)V
    .locals 2

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    if-eqz v0, :cond_0

    const-string v0, "photo_init_position"

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    if-eqz v0, :cond_1

    const-string v0, "photo_count"

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getCount()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :cond_1
    return-void
.end method
