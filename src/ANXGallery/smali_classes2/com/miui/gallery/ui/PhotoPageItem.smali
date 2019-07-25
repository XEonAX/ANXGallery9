.class public abstract Lcom/miui/gallery/ui/PhotoPageItem;
.super Landroid/widget/RelativeLayout;
.source "PhotoPageItem.java"

# interfaces
.implements Lcom/miui/gallery/util/photoview/TrimMemoryCallback;
.implements Lcom/miui/gallery/widget/slip/ISlipAnimView;
.implements Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageItem$OnPlayVideoListener;,
        Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;,
        Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;,
        Lcom/miui/gallery/ui/PhotoPageItem$PhotoDisplayer;,
        Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;,
        Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;,
        Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;,
        Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;,
        Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;,
        Lcom/miui/gallery/ui/PhotoPageItem$InitTask;,
        Lcom/miui/gallery/ui/PhotoPageItem$ImageLoadFinishListener;
    }
.end annotation


# static fields
.field private static sDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder; = null

.field private static sMenuBarHeight:I = -0x1

.field private static sStatusBarHeight:I = -0x1

.field private static sStrokeColor:I = -0x80000000


# instance fields
.field private isActionBarVisible:Z

.field private isAnimEntering:Z

.field private isAnimExiting:Z

.field private isCacheImageLoading:Z

.field private isInitialized:Z

.field private isPaused:Z

.field private isSelected:Z

.field private mCacheItem:Lcom/miui/gallery/model/ImageLoadParams;

.field protected mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

.field protected mDataItem:Lcom/miui/gallery/model/BaseDataItem;

.field protected mDownloadManager:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

.field protected mEmptyView:Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;

.field private mExternalCacheLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

.field private mExternalImageLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

.field private mInitTask:Landroid/os/AsyncTask;

.field private mInternalCacheLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

.field private mInternalImageLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

.field private mIsActionBarFirstInit:Z

.field private mMemoryTrimFlags:I

.field protected mOnPlayVideoListener:Lcom/miui/gallery/ui/PhotoPageItem$OnPlayVideoListener;

.field protected mPhotoPageInteractionListener:Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;

.field protected mPhotoView:Luk/co/senab/photoview/PhotoView;

.field private mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

.field private mTrimMemoryCallback:Lcom/miui/gallery/util/photoview/TrimMemoryCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mInitTask:Landroid/os/AsyncTask;

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mIsActionBarFirstInit:Z

    sget-object p2, Lcom/miui/gallery/ui/PhotoPageItem;->sDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    if-nez p2, :cond_0

    new-instance p2, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {p2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    sget-object v0, Lcom/miui/gallery/Config$BigPhotoConfig;->BIG_PHOTO_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {p2, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->handler(Landroid/os/Handler;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p2

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageItem$PhotoDisplayer;

    invoke-direct {v0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$PhotoDisplayer;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$1;)V

    invoke-virtual {p2, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer(Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    sput-object p1, Lcom/miui/gallery/ui/PhotoPageItem;->sDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    :cond_0
    sget p1, Lcom/miui/gallery/ui/PhotoPageItem;->sStrokeColor:I

    const/high16 p2, -0x80000000

    if-ne p1, p2, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f05002d

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    sput p1, Lcom/miui/gallery/ui/PhotoPageItem;->sStrokeColor:I

    :cond_1
    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/PhotoPageItem;)Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mExternalImageLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/PhotoPageItem;)Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mExternalCacheLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

    return-object p0
.end method

.method static synthetic access$2600(Lcom/miui/gallery/ui/PhotoPageItem;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isActionBarVisible:Z

    return p0
.end method

.method static synthetic access$602(Lcom/miui/gallery/ui/PhotoPageItem;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isAnimEntering:Z

    return p1
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/PhotoPageItem;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->canDoSelected()Z

    move-result p0

    return p0
.end method

.method private canDoSelected()Z
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->isPagerSelected()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->isAnimEntering()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->isPagerSelected()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "PhotoPageItem"

    const-string v2, "canDoSelected %s, isAnimEntering %s, isInitialized %s"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->isAnimEntering()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->isInitialized()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-static {v1, v2, v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    return v0
.end method

.method private displayCacheImage(Lcom/miui/gallery/model/ImageLoadParams;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;)V
    .locals 9

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ofUri(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    move-result-object v1

    sget-object v2, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->UNKNOWN:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    if-ne v1, v2, :cond_0

    sget-object v1, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v1, v0}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/ImageLoadParams;->setPath(Ljava/lang/String;)V

    :cond_0
    move-object v2, v0

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v1

    new-instance v3, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v4}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;Z)V

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem;->getCacheDisplayImageOptions(Lcom/miui/gallery/model/ImageLoadParams;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v4

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getTargetSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v5

    const/4 v7, 0x0

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getRegionRectF()Landroid/graphics/RectF;

    move-result-object v8

    move-object v6, p3

    invoke-virtual/range {v1 .. v8}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;Landroid/graphics/RectF;)V

    return-void
.end method

.method private executeInitTask()V
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isInitialized:Z

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mInitTask:Landroid/os/AsyncTask;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mInitTask:Landroid/os/AsyncTask;

    invoke-virtual {v1, v0}, Landroid/os/AsyncTask;->cancel(Z)Z

    :cond_0
    new-instance v1, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;Lcom/miui/gallery/ui/PhotoPageItem$1;)V

    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mInitTask:Landroid/os/AsyncTask;

    return-void
.end method

.method private getCacheImageLoadingListener()Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mInternalCacheLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageItem$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageItem$2;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mInternalCacheLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

    :cond_0
    new-instance v0, Lcom/miui/gallery/ui/PhotoPageItem$ImageLoadFinishListener;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mInternalCacheLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

    invoke-direct {v0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$ImageLoadFinishListener;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;)V

    return-object v0
.end method

.method private getImageLoadingListener()Lcom/miui/gallery/ui/PhotoPageItem$ImageLoadFinishListener;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mInternalImageLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageItem$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageItem$1;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mInternalImageLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

    :cond_0
    new-instance v0, Lcom/miui/gallery/ui/PhotoPageItem$ImageLoadFinishListener;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mInternalImageLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

    invoke-direct {v0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$ImageLoadFinishListener;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;)V

    return-object v0
.end method

.method private isPathValidate(Ljava/lang/String;)Z
    .locals 0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method private onActionModeChanged(Z)V
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v1, v0}, Luk/co/senab/photoview/PhotoView;->setZoomable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    sget v1, Lcom/miui/gallery/ui/PhotoPageItem;->sStrokeColor:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Luk/co/senab/photoview/PhotoView;->setStroke(II)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v1, v0, v0}, Luk/co/senab/photoview/PhotoView;->setStroke(II)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->displayImage(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->updateFeatures()V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDownloadManager:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->onActionModeChanged(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->onActionModeChanged(Z)V

    return-void
.end method


# virtual methods
.method public addOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoView;->addOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V

    return-void
.end method

.method public animEnter(Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageItem$3;

    invoke-direct {v0, p0, p2}, Lcom/miui/gallery/ui/PhotoPageItem$3;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;)V

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isAnimEntering:Z

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {p2, p1, v0}, Luk/co/senab/photoview/PhotoView;->animEnter(Lcom/miui/gallery/util/photoview/ItemViewInfo;Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;)V

    return-void
.end method

.method public animExit(Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isAnimExiting:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0, p1, p2}, Luk/co/senab/photoview/PhotoView;->animExit(Lcom/miui/gallery/util/photoview/ItemViewInfo;Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDownloadManager:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->release()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->release()V

    return-void
.end method

.method public clearTrimMemoryFlag()V
    .locals 2

    const-string v0, "PhotoPageItem"

    const-string v1, "clearTrimMemoryFlag"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mMemoryTrimFlags:I

    return-void
.end method

.method protected createCheckManager()Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;)V

    return-object v0
.end method

.method protected createDownloadManager()Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;)V

    return-object v0
.end method

.method protected final displayImage(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 8

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mMemoryTrimFlags:I

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isCacheImageLoading:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->isMediaInProcessing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageItem;->isPathValidate(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getThumnailPath()Ljava/lang/String;

    move-result-object v1

    :cond_1
    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageItem;->isPathValidate(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getMicroPath()Ljava/lang/String;

    move-result-object v1

    const/4 v0, 0x1

    :cond_2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    if-nez v0, :cond_3

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageItem;->isPathValidate(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_3
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    sget-object v2, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v2, v1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_4
    move-object v3, v1

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getDisplayImageOptions(Lcom/miui/gallery/model/BaseDataItem;Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v4

    if-nez v0, :cond_6

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->isMediaInProcessing()Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_0

    :cond_5
    const/4 p1, 0x0

    goto :goto_1

    :cond_6
    :goto_0
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getMicroImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object p1

    :goto_1
    move-object v5, p1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->getImageLoadingListener()Lcom/miui/gallery/ui/PhotoPageItem$ImageLoadFinishListener;

    move-result-object v6

    const/4 v7, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/miui/gallery/ui/PhotoPageItem;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;)V

    :cond_7
    return-void

    :cond_8
    :goto_2
    return-void
.end method

.method protected displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;)V
    .locals 7

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    new-instance v2, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-direct {v2, v1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;)V

    return-void
.end method

.method protected doOnMatrixChanged(Landroid/graphics/RectF;)V
    .locals 0

    return-void
.end method

.method protected doOnSelected(ZZZ)V
    .locals 2

    const-string p2, "PhotoPageItem"

    const-string p3, "doOnSelected pos: %s, resumed: %s"

    const v0, 0x7f0902cd

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {p2, p3, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->inAction()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDownloadManager:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->onUnSelected()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->onUnSelected()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDownloadManager:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->onSelected()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->onSelected()V

    :goto_0
    return-void
.end method

.method protected doOnUnSelected(Z)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDownloadManager:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->onUnSelected()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->onUnSelected()V

    return-void
.end method

.method public downloadOrigin()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDownloadManager:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->downloadOrigin()V

    :cond_0
    return-void
.end method

.method public finishActionMode()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->inAction()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->endCheck()V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->onActionModeChanged(Z)V

    :cond_0
    return-void
.end method

.method protected getActionBarHeight()I
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoPageInteractionListener:Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;

    invoke-interface {v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;->getActionBarHeight()I

    move-result v0

    if-lez v0, :cond_0

    return v0

    :cond_0
    sget v0, Lcom/miui/gallery/ui/PhotoPageItem;->sStatusBarHeight:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->getStatusBarHeight(Landroid/content/Context;)I

    move-result v0

    sput v0, Lcom/miui/gallery/ui/PhotoPageItem;->sStatusBarHeight:I

    :cond_1
    sget v0, Lcom/miui/gallery/ui/PhotoPageItem;->sStatusBarHeight:I

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060388

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method protected getCacheDisplayImageOptions(Lcom/miui/gallery/model/ImageLoadParams;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 5

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->isSecret()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getSecretKey()[B

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->secretKey([B)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getFileLength()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_1

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getFileLength()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->fileLength(J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    :goto_0
    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    return-object p1
.end method

.method public getCacheItem()Lcom/miui/gallery/model/ImageLoadParams;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCacheItem:Lcom/miui/gallery/model/ImageLoadParams;

    return-object v0
.end method

.method protected getContentDescriptionForTalkBack()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->isInActionMode()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->getContentDescription()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/model/BaseDataItem;->getContentDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDataItem()Lcom/miui/gallery/model/BaseDataItem;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    return-object v0
.end method

.method protected getDisplayImageOptions(Lcom/miui/gallery/model/BaseDataItem;Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 5

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/ui/PhotoPageItem;->sDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getSecretKey()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->secretKey([B)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/miui/gallery/ui/PhotoPageItem;->sDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->secretKey([B)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    :goto_0
    sget-object v0, Lcom/miui/gallery/ui/PhotoPageItem;->sDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    xor-int/lit8 v1, p2, 0x1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheBigPhoto(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    sget-object v0, Lcom/miui/gallery/ui/PhotoPageItem;->sDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v0, p2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadFromThumbnailCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    const/4 v0, 0x0

    if-nez p2, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ofUri(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    move-result-object p2

    sget-object v1, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    if-eq p2, v1, :cond_1

    sget-object v1, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->UNKNOWN:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    if-eq p2, v1, :cond_1

    sget-object p2, Lcom/miui/gallery/ui/PhotoPageItem;->sDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {p2, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheBigPhoto(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getSize()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p2, v1, v3

    if-lez p2, :cond_2

    sget-object p2, Lcom/miui/gallery/ui/PhotoPageItem;->sDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getSize()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->fileLength(J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    sget-object p1, Lcom/miui/gallery/ui/PhotoPageItem;->sDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    goto :goto_1

    :cond_2
    sget-object p1, Lcom/miui/gallery/ui/PhotoPageItem;->sDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    :goto_1
    sget-object p1, Lcom/miui/gallery/ui/PhotoPageItem;->sDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    return-object p1
.end method

.method protected getMenuBarHeight()I
    .locals 2

    sget v0, Lcom/miui/gallery/ui/PhotoPageItem;->sMenuBarHeight:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoPageInteractionListener:Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;

    invoke-interface {v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;->getMenuBarHeight()I

    move-result v0

    sput v0, Lcom/miui/gallery/ui/PhotoPageItem;->sMenuBarHeight:I

    :cond_0
    sget v0, Lcom/miui/gallery/ui/PhotoPageItem;->sMenuBarHeight:I

    invoke-static {p0}, Lcom/miui/gallery/compat/view/ViewCompat;->getSystemWindowInsetBottom(Landroid/view/View;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getProcessingMedia()Lcom/miui/gallery/provider/ProcessingMedia;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getTrimMemoryCallback()Lcom/miui/gallery/util/photoview/TrimMemoryCallback;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mTrimMemoryCallback:Lcom/miui/gallery/util/photoview/TrimMemoryCallback;

    return-object v0
.end method

.method public hasOverlappingRendering()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected final isActionBarVisible()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isActionBarVisible:Z

    return v0
.end method

.method protected isAnimEntering()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isAnimEntering:Z

    return v0
.end method

.method protected isAnimExiting()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isAnimExiting:Z

    return v0
.end method

.method protected isInActionMode()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->inAction()Z

    move-result v0

    return v0
.end method

.method protected isInitialized()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isInitialized:Z

    return v0
.end method

.method protected isMediaInProcessing()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected isPagerSelected()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isSelected:Z

    return v0
.end method

.method protected isPaused()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isPaused:Z

    return v0
.end method

.method public onActionBarVisibleChanged(Ljava/lang/Boolean;I)V
    .locals 3

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    iput-boolean p2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isActionBarVisible:Z

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDownloadManager:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoView;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p2, v0, v1, v2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->adjustLocation(ZLandroid/graphics/RectF;Z)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->onActionBarVisibleChanged(Z)V

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mIsActionBarFirstInit:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mIsActionBarFirstInit:Z

    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    return-void
.end method

.method public onActivityTransition()V
    .locals 0

    return-void
.end method

.method protected onCacheImageLoadFinish(Z)V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isCacheImageLoading:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->swapItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_0
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDownloadManager:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->isActionBarVisible()Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoView;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->adjustLocation(ZLandroid/graphics/RectF;Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->isActionBarVisible()Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoView;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v1, v2}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->adjustLocation(ZLandroid/graphics/RectF;Z)V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 3

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->cancelDisplayTask(Landroid/widget/ImageView;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->recycleBitmap()V

    invoke-virtual {p0, p0}, Lcom/miui/gallery/ui/PhotoPageItem;->removeOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDownloadManager:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->release()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->release()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->endCheck()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mInitTask:Landroid/os/AsyncTask;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mInitTask:Landroid/os/AsyncTask;

    invoke-virtual {v0, v2}, Landroid/os/AsyncTask;->cancel(Z)Z

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mInitTask:Landroid/os/AsyncTask;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mEmptyView:Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->setVisible(Z)V

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCacheItem:Lcom/miui/gallery/model/ImageLoadParams;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/PhotoPageItem;->setContentDescription(Ljava/lang/CharSequence;)V

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoPageInteractionListener:Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mInternalCacheLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mInternalImageLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mExternalCacheLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mExternalImageLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mOnPlayVideoListener:Lcom/miui/gallery/ui/PhotoPageItem$OnPlayVideoListener;

    iput-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isSelected:Z

    iput-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isInitialized:Z

    iput-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isActionBarVisible:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mIsActionBarFirstInit:Z

    iput-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isAnimEntering:Z

    iput-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isAnimExiting:Z

    iput-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isCacheImageLoading:Z

    iput v2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mMemoryTrimFlags:I

    iput-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isPaused:Z

    invoke-super {p0}, Landroid/widget/RelativeLayout;->onDetachedFromWindow()V

    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    const v0, 0x7f09021e

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Luk/co/senab/photoview/PhotoView;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->createDownloadManager()Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDownloadManager:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->createCheckManager()Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mEmptyView:Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;

    return-void
.end method

.method protected onImageLoadFinish(Lcom/miui/gallery/error/core/ErrorCode;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz p1, :cond_2

    sget-object v2, Lcom/miui/gallery/error/core/ErrorCode;->NO_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    if-eq p1, v2, :cond_2

    sget-object v2, Lcom/miui/gallery/error/core/ErrorCode;->DECODE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    if-ne p1, v2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    :cond_0
    const p1, 0x7f100347

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    move-object v3, v1

    move-object v1, p1

    move-object p1, v3

    goto :goto_0

    :cond_1
    const p1, 0x7f100348

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f070183

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_0

    :cond_2
    move-object p1, v1

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mEmptyView:Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->setTip(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mEmptyView:Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->setIcon(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mEmptyView:Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->setVisible(Z)V

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mEmptyView:Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->setVisible(Z)V

    :goto_1
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    invoke-super/range {p0 .. p5}, Landroid/widget/RelativeLayout;->onLayout(ZIIII)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->inAction()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {p2}, Luk/co/senab/photoview/PhotoView;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->access$2800(Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;Landroid/graphics/RectF;)V

    :cond_0
    return-void
.end method

.method public final onMatrixChanged(Landroid/graphics/RectF;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->isAnimEntering()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->isAnimExiting()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDownloadManager:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->onMatrixChanged(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->onMatrixChanged(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->onMatrixChanged(Landroid/graphics/RectF;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->doOnMatrixChanged(Landroid/graphics/RectF;)V

    :cond_0
    return-void
.end method

.method protected onPageScrollDragging()V
    .locals 0

    return-void
.end method

.method protected onPageScrollIdle()V
    .locals 0

    return-void
.end method

.method protected onPause()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isPaused:Z

    return-void
.end method

.method protected onPostInitialized()V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isInitialized:Z

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->canDoSelected()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v1, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->doOnSelected(ZZZ)V

    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isPaused:Z

    return-void
.end method

.method public final onSelected(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isSelected:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isSelected:Z

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->canDoSelected()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->doOnSelected(ZZZ)V

    :cond_0
    invoke-virtual {p0, p0}, Lcom/miui/gallery/ui/PhotoPageItem;->addOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V

    :cond_1
    return-void
.end method

.method public onSlipping(F)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->isPagerSelected()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->onAlphaChanged(F)V

    :cond_0
    return-void
.end method

.method public onStopTrimMemory(I)V
    .locals 4

    const-string v0, "PhotoPageItem"

    const-string v1, "onStopTrimMemory flag: %d, before: %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mMemoryTrimFlags:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mMemoryTrimFlags:I

    and-int/2addr v0, p1

    if-lez v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mMemoryTrimFlags:I

    xor-int/lit8 p1, p1, -0x1

    and-int/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mMemoryTrimFlags:I

    iget p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mMemoryTrimFlags:I

    if-nez p1, :cond_1

    const-string p1, "PhotoPageItem"

    const-string v0, "reloadData: %s"

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->refreshItem()V

    :cond_1
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 4

    const-string v0, "PhotoPageItem"

    const-string v1, "onTrimMemory flag: %d, before: %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mMemoryTrimFlags:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mMemoryTrimFlags:I

    if-nez v0, :cond_1

    const-string v0, "PhotoPageItem"

    const-string v1, "trimMemory: %s"

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->cancelDisplayTask(Landroid/widget/ImageView;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->recycleBitmap()V

    :cond_1
    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mMemoryTrimFlags:I

    or-int/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mMemoryTrimFlags:I

    return-void
.end method

.method public final onUnSelected(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isSelected:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isSelected:Z

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->doOnUnSelected(Z)V

    invoke-virtual {p0, p0}, Lcom/miui/gallery/ui/PhotoPageItem;->removeOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V

    :cond_0
    return-void
.end method

.method protected recycleBitmap()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Luk/co/senab/photoview/PhotoView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCacheItem:Lcom/miui/gallery/model/ImageLoadParams;

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v1

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCacheItem:Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {v3}, Lcom/miui/gallery/model/ImageLoadParams;->getPath()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCacheItem:Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {v4}, Lcom/miui/gallery/model/ImageLoadParams;->getTargetSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v4

    sget-object v5, Lcom/miui/gallery/Config$ThumbConfig;->THUMBNAIL_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v1, v3, v4, v2, v5}, Lcom/nostra13/universalimageloader/core/ImageLoader;->loadFromMemoryCache(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Landroid/graphics/Bitmap;

    move-result-object v2

    :cond_0
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    if-eq v2, v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->getInstance()Lcom/miui/gallery/util/uil/PhotoReusedBitCache;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->put(Landroid/graphics/Bitmap;)V

    :cond_1
    return-void
.end method

.method public refreshItem()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->swapItem(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method

.method public removeOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoView;->removeOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V

    return-void
.end method

.method public setCacheItem(Lcom/miui/gallery/model/ImageLoadParams;Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCacheItem:Lcom/miui/gallery/model/ImageLoadParams;

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isCacheImageLoading:Z

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mExternalCacheLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

    new-instance p2, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {p2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    sget-object v1, Lcom/miui/gallery/Config$ThumbConfig;->THUMBNAIL_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {p2, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->syncLoadFromThumbCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {p2, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->getCacheImageLoadingListener()Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->displayCacheImage(Lcom/miui/gallery/model/ImageLoadParams;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;)V

    :cond_0
    return-void
.end method

.method public setCloudImageLoadingListener(Lcom/miui/gallery/util/uil/CloudImageLoadingListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDownloadManager:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->setCloudImageLoadingListener(Lcom/miui/gallery/util/uil/CloudImageLoadingListener;)V

    return-void
.end method

.method public setOnBackgroundAlphaChangedListener(Luk/co/senab/photoview/PhotoViewAttacher$OnBackgroundAlphaChangedListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoView;->setOnBackgroundAlphaChangedListener(Luk/co/senab/photoview/PhotoViewAttacher$OnBackgroundAlphaChangedListener;)V

    return-void
.end method

.method public setOnExitListener(Luk/co/senab/photoview/PhotoViewAttacher$OnExitListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoView;->setOnExitListener(Luk/co/senab/photoview/PhotoViewAttacher$OnExitListener;)V

    return-void
.end method

.method public setOnImageLoadFinishListener(Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mExternalImageLoadCallback:Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;

    return-void
.end method

.method public setOnPlayVideoListener(Lcom/miui/gallery/ui/PhotoPageItem$OnPlayVideoListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mOnPlayVideoListener:Lcom/miui/gallery/ui/PhotoPageItem$OnPlayVideoListener;

    return-void
.end method

.method public setOnScaleChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoView;->setOnScaleChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;)V

    return-void
.end method

.method public setOnViewTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoView;->setOnViewTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V

    return-void
.end method

.method public setPhotoPageCallback(Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoPageInteractionListener:Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;

    return-void
.end method

.method public setProcessingMedia(Lcom/miui/gallery/provider/ProcessingMedia;)V
    .locals 0

    return-void
.end method

.method public setTrimMemoryCallback(Lcom/miui/gallery/util/photoview/TrimMemoryCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mTrimMemoryCallback:Lcom/miui/gallery/util/photoview/TrimMemoryCallback;

    return-void
.end method

.method public startActionMode(Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->inAction()Z

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x3

    const/4 v4, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    new-array v3, v3, [Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    aput-object p1, v3, v2

    aput-object p2, v3, v4

    aput-object p3, v3, v1

    invoke-virtual {v0, v3}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->refreshCheck([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    new-array v3, v3, [Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    aput-object p1, v3, v2

    aput-object p2, v3, v4

    aput-object p3, v3, v1

    invoke-virtual {v0, v3}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->startCheck([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V

    invoke-direct {p0, v4}, Lcom/miui/gallery/ui/PhotoPageItem;->onActionModeChanged(Z)V

    :goto_0
    return-void
.end method

.method public swapItem(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->recycleBitmap()V

    :cond_1
    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->isCacheImageLoading:Z

    if-eqz p1, :cond_2

    return-void

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz p1, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->executeInitTask()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->getContentDescriptionForTalkBack()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->updateFeatures()V

    return-void
.end method

.method public swapItem(Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/model/ImageLoadParams;)V
    .locals 1

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mCacheItem:Lcom/miui/gallery/model/ImageLoadParams;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, p2, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->setCacheItem(Lcom/miui/gallery/model/ImageLoadParams;Lcom/miui/gallery/ui/PhotoPageItem$OnImageLoadFinishListener;)V

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->swapItem(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method

.method protected updateFeatures()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v1

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    invoke-virtual {v0, v1}, Luk/co/senab/photoview/PhotoView;->setZoomable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isGif()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0, v2}, Luk/co/senab/photoview/PhotoView;->setRotatable(Z)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->updateSpecialTypeIndicator()V

    return-void
.end method

.method public updateSpecialTypeIndicator()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isSpecialTypeRecognized()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getSpecialTypeFlags()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->parseMTSpecialAITypeDescriptionRes(J)I

    move-result v0

    if-lez v0, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->setTypeIndicatorText(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->access$300(Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;Z)Z

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->setTypeIndicatorText(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem;->mSpecialTypeManager:Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->access$400(Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;Z)Z

    return-void
.end method
