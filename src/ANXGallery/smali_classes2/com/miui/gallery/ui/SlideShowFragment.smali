.class public Lcom/miui/gallery/ui/SlideShowFragment;
.super Lcom/miui/gallery/ui/BaseFragment;
.source "SlideShowFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/SlideShowFragment$SlideLoaderCallBack;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/adapter/SlideShowAdapter;

.field private mLoadDuration:I

.field private mLoaderCallBack:Lcom/miui/gallery/ui/SlideShowFragment$SlideLoaderCallBack;

.field private mSlideHandler:Landroid/os/Handler;

.field private mSlideView:Lcom/miui/gallery/widget/SlideShowView;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseFragment;-><init>()V

    const/16 v0, 0x7d0

    iput v0, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mLoadDuration:I

    new-instance v0, Lcom/miui/gallery/ui/SlideShowFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/SlideShowFragment$1;-><init>(Lcom/miui/gallery/ui/SlideShowFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mSlideHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/SlideShowFragment;Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/SlideShowFragment;->showPendingItem(Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/SlideShowFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/SlideShowFragment;->loadNextBitmap()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/SlideShowFragment;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mSlideHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/SlideShowFragment;)Lcom/miui/gallery/adapter/SlideShowAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mAdapter:Lcom/miui/gallery/adapter/SlideShowAdapter;

    return-object p0
.end method

.method private getSlideDuration()I
    .locals 2

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$SlideShow;->getSlideShowInterval()I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    const/16 v1, 0xdac

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    add-int/lit16 v1, v0, -0x1f4

    iput v1, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mLoadDuration:I

    return v0
.end method

.method private loadNextBitmap()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mAdapter:Lcom/miui/gallery/adapter/SlideShowAdapter;

    new-instance v1, Lcom/miui/gallery/ui/SlideShowFragment$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/SlideShowFragment$3;-><init>(Lcom/miui/gallery/ui/SlideShowFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/SlideShowAdapter;->nextBitmap(Lcom/miui/gallery/threadpool/FutureListener;)V

    return-void
.end method

.method private setResult(Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;)V
    .locals 13

    const-string v0, "SlideShowFragment"

    const-string v1, "setResult %d"

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;->getIndex()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mAdapter:Lcom/miui/gallery/adapter/SlideShowAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;->getIndex()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/SlideShowAdapter;->getBaseDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getPathDisplayBetter()Ljava/lang/String;

    move-result-object v4

    new-instance v12, Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v2

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v5, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    const/4 v6, 0x0

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;->getIndex()I

    move-result v7

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getMimeType()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getSecretKey()[B

    move-result-object v9

    const-wide/16 v10, -0x1

    move-object v1, v12

    invoke-direct/range {v1 .. v11}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;[BJ)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlideShowFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "photo_transition_data"

    invoke-virtual {v0, v1, v12}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlideShowFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "photo_init_position"

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;->getIndex()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlideShowFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "photo_count"

    iget-object v1, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mAdapter:Lcom/miui/gallery/adapter/SlideShowAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/adapter/SlideShowAdapter;->getCount()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-void
.end method

.method private showPendingItem(Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;)V
    .locals 3

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mSlideView:Lcom/miui/gallery/widget/SlideShowView;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/widget/SlideShowView;->next(Landroid/graphics/Bitmap;I)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/SlideShowFragment;->setResult(Lcom/miui/gallery/adapter/SlideShowAdapter$ShowItem;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mSlideHandler:Landroid/os/Handler;

    const/4 v0, 0x1

    iget v1, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mLoadDuration:I

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlideShowFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlideShowFragment;->isResumed()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlideShowFragment;->finish()V

    :cond_2
    return-void
.end method

.method public static showSlideShowFragment(Lcom/miui/gallery/activity/BaseActivity;Landroid/os/Bundle;)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/SlideShowFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/SlideShowFragment;-><init>()V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/SlideShowFragment;->setArguments(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, p1, v1, v2}, Lcom/miui/gallery/activity/BaseActivity;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ZZ)V

    return-void
.end method


# virtual methods
.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "slide_show"

    return-object v0
.end method

.method protected getThemeRes()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/ui/SlideShowFragment$SlideLoaderCallBack;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/ui/SlideShowFragment$SlideLoaderCallBack;-><init>(Lcom/miui/gallery/ui/SlideShowFragment;Lcom/miui/gallery/ui/SlideShowFragment$1;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mLoaderCallBack:Lcom/miui/gallery/ui/SlideShowFragment$SlideLoaderCallBack;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlideShowFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    const-string v0, "SlideShowFragment"

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlideShowFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mLoaderCallBack:Lcom/miui/gallery/ui/SlideShowFragment$SlideLoaderCallBack;

    invoke-virtual {p1, v0, v1, v2}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3

    const/4 p3, 0x0

    const v0, 0x7f0b015f

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0902ad

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/SlideShowView;

    iput-object p2, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mSlideView:Lcom/miui/gallery/widget/SlideShowView;

    new-instance p2, Lcom/miui/gallery/adapter/SlideShowAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlideShowFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "photo_transition_data"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlideShowFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "photo_init_position"

    invoke-virtual {v1, v2, p3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p3

    invoke-direct {p2, v0, p3}, Lcom/miui/gallery/adapter/SlideShowAdapter;-><init>(Lcom/miui/gallery/model/ImageLoadParams;I)V

    iput-object p2, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mAdapter:Lcom/miui/gallery/adapter/SlideShowAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mSlideView:Lcom/miui/gallery/widget/SlideShowView;

    invoke-direct {p0}, Lcom/miui/gallery/ui/SlideShowFragment;->getSlideDuration()I

    move-result p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/SlideShowView;->setSlideDuration(I)V

    iget-object p2, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mSlideView:Lcom/miui/gallery/widget/SlideShowView;

    new-instance p3, Lcom/miui/gallery/ui/SlideShowFragment$2;

    invoke-direct {p3, p0}, Lcom/miui/gallery/ui/SlideShowFragment$2;-><init>(Lcom/miui/gallery/ui/SlideShowFragment;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/SlideShowView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-object p1
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onPause()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlideShowFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SystemUiUtil;->showSystemBars(Landroid/view/View;)V

    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onResume()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlideShowFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SystemUiUtil;->hideSystemBars(Landroid/view/View;)V

    return-void
.end method

.method public onStart()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onStart()V

    iget-object v0, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mAdapter:Lcom/miui/gallery/adapter/SlideShowAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/SlideShowAdapter;->resume()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/SlideShowFragment;->loadNextBitmap()V

    return-void
.end method

.method public onStop()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onStop()V

    iget-object v0, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mAdapter:Lcom/miui/gallery/adapter/SlideShowAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/SlideShowAdapter;->pause()V

    iget-object v0, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mSlideView:Lcom/miui/gallery/widget/SlideShowView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/SlideShowView;->release()V

    iget-object v0, p0, Lcom/miui/gallery/ui/SlideShowFragment;->mSlideHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    return-void
.end method
