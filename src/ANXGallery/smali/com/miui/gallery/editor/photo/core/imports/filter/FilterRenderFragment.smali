.class public Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;
.super Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;
.source "FilterRenderFragment.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Lcom/miui/gallery/editor/photo/core/GLFragment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$ProgressRunnable;,
        Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;,
        Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;,
        Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$FilterContext;
    }
.end annotation


# instance fields
.field private mBeautyBitmap:Landroid/graphics/Bitmap;

.field private mBeautyTask:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;

.field private mCompareBtn:Landroid/widget/Button;

.field private mCompareButtonDelay:I

.field private mCompareEnable:Z

.field private mCompareRunnable:Ljava/lang/Runnable;

.field private mCurrentBitmap:Landroid/graphics/Bitmap;

.field private mEffects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/RenderMetaData;",
            ">;"
        }
    .end annotation
.end field

.field private mFilterContext:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$FilterContext;

.field private mFloatView:Landroid/view/View;

.field private mGLSurfaceView:Landroid/opengl/GLSurfaceView;

.field private mGPUImage:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;

.field private mHandler:Landroid/os/Handler;

.field private mIsRenderOrigin:Z

.field private mIsSkyProcessing:Z

.field private mLastSkyTransferItem:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

.field private mNeedDoRender:Z

.field private mNextSkyTransferItem:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

.field private mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private mProgressBar:Landroid/widget/ProgressBar;

.field private mProgressRunnable:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$ProgressRunnable;

.field private mShowFloatView:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mEffects:Ljava/util/List;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$FilterContext;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$FilterContext;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mFilterContext:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$FilterContext;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareEnable:Z

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$ProgressRunnable;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$ProgressRunnable;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mProgressRunnable:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$ProgressRunnable;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$2;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mLastSkyTransferItem:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;)Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mLastSkyTransferItem:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

    return-object p1
.end method

.method static synthetic access$1102(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCurrentBitmap:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mIsRenderOrigin:Z

    return p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Landroid/graphics/Bitmap;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->renderBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method static synthetic access$1402(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mIsSkyProcessing:Z

    return p1
.end method

.method static synthetic access$1500(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->doSkyNextProcess()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)Landroid/widget/ProgressBar;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mProgressBar:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)Landroid/opengl/GLSurfaceView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGLSurfaceView:Landroid/opengl/GLSurfaceView;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->renderCompareOrigin(Z)V

    return-void
.end method

.method static synthetic access$802(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mBeautyBitmap:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->doRenderAfterBeauty()V

    return-void
.end method

.method private createFloatView()V
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mShowFloatView:Z

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    new-instance v1, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v1}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    const/16 v2, 0x3ea

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->type:I

    const/4 v2, 0x1

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->format:I

    const/16 v3, 0x28

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/4 v3, -0x1

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v3, -0x2

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    const/16 v3, 0x30

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mFloatView:Landroid/view/View;

    invoke-interface {v0, v3, v1}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput-boolean v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mShowFloatView:Z

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/WindowCompat;->isNotch(Landroid/app/Activity;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/WindowCompat;->getTopNotchHeight(Landroid/app/Activity;)I

    move-result v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/miui/gallery/util/MiscUtil;->checkNavigationBarShow(Landroid/content/Context;Landroid/view/Window;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->isNear3V4()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060190

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f06018c

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060191

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f06018d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->isNear3V4()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060192

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f06018e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060193

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f06018f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    :goto_0
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareBtn:Landroid/widget/Button;

    invoke-virtual {v3}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    add-int/2addr v1, v0

    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    invoke-virtual {v3, v2}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareBtn:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_4
    return-void
.end method

.method private doRender()V
    .locals 5

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mEffects:Ljava/util/List;

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;-><init>(Ljava/util/List;)V

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;->isPortraitBeauty()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/miui/arcsoftbeauty/ArcsoftBeautyJni;->idBeautyAvailable()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mBeautyBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;

    invoke-direct {v0, p0, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mBeautyTask:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mBeautyTask:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v3, v4, [Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-virtual {v0, v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->doRenderAfterBeauty()V

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;->isSkyTransfer()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;->instantiateSky()Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->isEmpty()Z

    move-result v0

    xor-int/2addr v0, v4

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->enableComparison(Z)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->renderBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    :cond_2
    iget-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mIsSkyProcessing:Z

    if-eqz v1, :cond_3

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mNextSkyTransferItem:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

    goto :goto_0

    :cond_3
    iput-boolean v4, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mIsSkyProcessing:Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;

    invoke-direct {v1, p0, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$1;)V

    sget-object v3, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v4, v4, [Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

    aput-object v0, v4, v2

    invoke-virtual {v1, v3, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    :cond_4
    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;->instantiate()Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->renderBitmap(Landroid/graphics/Bitmap;Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;)V

    instance-of v1, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/IFilterEmptyValidate;

    if-eqz v1, :cond_5

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/IFilterEmptyValidate;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/IFilterEmptyValidate;->isEmpty()Z

    move-result v0

    xor-int/2addr v4, v0

    :cond_5
    invoke-virtual {p0, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->enableComparison(Z)V

    :goto_0
    return-void
.end method

.method private doRenderAfterBeauty()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mEffects:Ljava/util/List;

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;-><init>(Ljava/util/List;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->isAdded()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;->isPortraitBeauty()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;->instantiate()Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mBeautyBitmap:Landroid/graphics/Bitmap;

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->renderBitmap(Landroid/graphics/Bitmap;Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;)V

    instance-of v0, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/EmptyGPUImageFilter;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->enableComparison(Z)V

    :cond_1
    return-void
.end method

.method private doSkyNextProcess()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mNextSkyTransferItem:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mIsSkyProcessing:Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$1;)V

    sget-object v3, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mNextSkyTransferItem:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

    aput-object v5, v0, v4

    invoke-virtual {v1, v3, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mNextSkyTransferItem:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

    :cond_0
    return-void
.end method

.method public static synthetic lambda$enableComparison$81(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v0, 0x1

    if-nez p1, :cond_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->renderCompareOrigin(Z)V

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-eq v0, p1, :cond_1

    const/4 p1, 0x3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p2

    if-ne p1, p2, :cond_2

    :cond_1
    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->renderCompareCurrent(Z)V

    :cond_2
    :goto_0
    return v0
.end method

.method public static synthetic lambda$onCreateView$79(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mFilterContext:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$FilterContext;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$FilterContext;->surfaceCreated()V

    return-void
.end method

.method public static synthetic lambda$onViewCreated$80(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareEnable:Z

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 p2, 0x3

    const/4 v1, 0x1

    if-eq p1, p2, :cond_1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mIsRenderOrigin:Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareRunnable:Ljava/lang/Runnable;

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareButtonDelay:I

    int-to-long v2, v0

    invoke-virtual {p1, p2, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    :cond_1
    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->renderCompareCurrent(Z)V

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mIsRenderOrigin:Z

    :goto_0
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private removeFloatView()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mShowFloatView:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mFloatView:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mShowFloatView:Z

    :cond_0
    return-void
.end method

.method private renderBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/EmptyGPUImageFilter;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/EmptyGPUImageFilter;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->renderBitmap(Landroid/graphics/Bitmap;Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;)V

    return-void
.end method

.method private renderBitmap(Landroid/graphics/Bitmap;Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGPUImage:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->setImage(Landroid/graphics/Bitmap;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGPUImage:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->setFilter(Lcom/miui/filtersdk/filter/base/GPUImageFilter;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGPUImage:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->requestRender()V

    return-void
.end method

.method private renderCompareCurrent(Z)V
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mEffects:Ljava/util/List;

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;-><init>(Ljava/util/List;)V

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;->isSkyTransfer()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCurrentBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCurrentBitmap:Landroid/graphics/Bitmap;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->renderBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->render()V

    :goto_0
    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareBtn:Landroid/widget/Button;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setSelected(Z)V

    :cond_1
    return-void
.end method

.method private renderCompareOrigin(Z)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->renderBitmap(Landroid/graphics/Bitmap;)V

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareBtn:Landroid/widget/Button;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setSelected(Z)V

    :cond_0
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string v0, "page"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mEffect:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "photo_editor"

    const-string v1, "compare_button_touch"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public add(Lcom/miui/gallery/editor/photo/core/Metadata;Ljava/lang/Object;)V
    .locals 0

    instance-of p2, p1, Lcom/miui/gallery/editor/photo/core/common/model/RenderMetaData;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mEffects:Ljava/util/List;

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/model/RenderMetaData;

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public clear()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mEffects:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method

.method public enableComparison(Z)V
    .locals 1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareEnable:Z

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareEnable:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareBtn:Landroid/widget/Button;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareBtn:Landroid/widget/Button;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/-$$Lambda$FilterRenderFragment$yXmH0huSN2z9P7akx9IWjTGGbd8;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/-$$Lambda$FilterRenderFragment$yXmH0huSN2z9P7akx9IWjTGGbd8;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareBtn:Landroid/widget/Button;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public getGLContext()Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mFilterContext:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$FilterContext;

    return-object v0
.end method

.method public hideProgressView()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mProgressRunnable:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$ProgressRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mProgressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method

.method public isEmpty()Z
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mEffects:Ljava/util/List;

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;-><init>(Ljava/util/List;)V

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;->instantiate()Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    move-result-object v0

    instance-of v0, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/EmptyGPUImageFilter;

    return v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    const/4 p3, 0x0

    const v0, 0x7f0b0083

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    const v0, 0x7f090145

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/opengl/GLSurfaceView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGLSurfaceView:Landroid/opengl/GLSurfaceView;

    const v0, 0x7f1003aa

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGPUImage:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGPUImage:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;

    invoke-virtual {v1, v0, v0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->setBackgroundColor(FFF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGPUImage:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->setImage(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGPUImage:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGLSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->setGLSurfaceView(Landroid/opengl/GLSurfaceView;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGLSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/-$$Lambda$FilterRenderFragment$BiHgfNyGSupQTp_9xu6_5NT936g;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/-$$Lambda$FilterRenderFragment$BiHgfNyGSupQTp_9xu6_5NT936g;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/opengl/GLSurfaceView;->postDelayed(Ljava/lang/Runnable;J)Z

    const v0, 0x7f0b0070

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mFloatView:Landroid/view/View;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mFloatView:Landroid/view/View;

    const p3, 0x7f0900aa

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareBtn:Landroid/widget/Button;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mFloatView:Landroid/view/View;

    const p3, 0x7f090232

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ProgressBar;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mProgressBar:Landroid/widget/ProgressBar;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGLSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {p1}, Landroid/opengl/GLSurfaceView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {p1, p3}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mNeedDoRender:Z

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->doRender()V

    :cond_0
    return-object p2
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mBeautyTask:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mBeautyTask:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;->cancel(Z)Z

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGPUImage:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->deleteImage()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCurrentBitmap:Landroid/graphics/Bitmap;

    return-void
.end method

.method protected onExport()Lcom/miui/gallery/editor/photo/core/RenderData;
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mEffects:Ljava/util/List;

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method public onPause()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->onPause()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->removeFloatView()V

    return-void
.end method

.method public onResume()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->onResume()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->createFloatView()V

    return-void
.end method

.method protected onSample()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mEffects:Ljava/util/List;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mEffects:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mEffects:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/editor/photo/core/common/model/RenderMetaData;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "V9-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/core/common/model/RenderMetaData;->name:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0

    :cond_2
    :goto_1
    return-object v0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a000f

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mCompareButtonDelay:I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGLSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance p2, Lcom/miui/gallery/editor/photo/core/imports/filter/-$$Lambda$FilterRenderFragment$FunmblKwrTLP1BF8VBW2PvmQgaY;

    invoke-direct {p2, p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/-$$Lambda$FilterRenderFragment$FunmblKwrTLP1BF8VBW2PvmQgaY;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V

    invoke-virtual {p1, p2}, Landroid/opengl/GLSurfaceView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method public remove(Lcom/miui/gallery/editor/photo/core/Metadata;)V
    .locals 1

    instance-of v0, p1, Lcom/miui/gallery/editor/photo/core/common/model/RenderMetaData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mEffects:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mEffects:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public render()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGPUImage:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mNeedDoRender:Z

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->doRender()V

    :goto_0
    return-void
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGPUImage:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mGPUImage:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->setImage(Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method

.method public showProgressView()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mProgressRunnable:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$ProgressRunnable;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    const-string p1, "FilterRenderFragment"

    const-string v0, "surfaceCreated"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->mFilterContext:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$FilterContext;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$FilterContext;->surfaceDestroyed()V

    return-void
.end method
