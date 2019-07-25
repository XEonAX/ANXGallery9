.class public Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;
.super Lcom/miui/gallery/editor/photo/app/MenuFragment;
.source "FilterFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/app/MenuFragment<",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;",
        "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
        "Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mCategories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;",
            ">;"
        }
    .end annotation
.end field

.field private mFilterPager:Landroid/support/v4/view/ViewPager;

.field private mHeaderAdapter:Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;

.field private mIsSkySegmentDone:Z

.field private mIsSkySegmentSuccess:Z

.field private mIsSkyToSelect:Z

.field private mItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

.field private mPagerAdapter:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

.field private mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

.field private mSeekBar:Landroid/widget/SeekBar;

.field private mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field private mSelectedItem:Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

.field private mSkyCategory:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

.field private mSkyDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

.field private mSkyHeadIndex:I

.field private mTitle:Landroid/widget/TextView;

.field private mTopPanel:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->FILTER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;-><init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSkyDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$3;-><init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mCategories:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Landroid/widget/SeekBar;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSeekBar:Landroid/widget/SeekBar;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mIsSkySegmentDone:Z

    return p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mIsSkySegmentSuccess:Z

    return p0
.end method

.method static synthetic access$1502(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mIsSkySegmentSuccess:Z

    return p1
.end method

.method static synthetic access$1600(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;Lcom/miui/gallery/editor/photo/core/common/model/FilterData;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->doRender(Lcom/miui/gallery/editor/photo/core/common/model/FilterData;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mIsSkyToSelect:Z

    return p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mIsSkyToSelect:Z

    return p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Landroid/support/v4/view/ViewPager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mFilterPager:Landroid/support/v4/view/ViewPager;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mHeaderAdapter:Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSkyCategory:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSkyHeadIndex:I

    return p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->doSkyTransferProcess()V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->doConfig(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/common/model/FilterData;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSelectedItem:Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    return-object p0
.end method

.method static synthetic access$902(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;Lcom/miui/gallery/editor/photo/core/common/model/FilterData;)Lcom/miui/gallery/editor/photo/core/common/model/FilterData;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSelectedItem:Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    return-object p1
.end method

.method private doConfig(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mPagerAdapter:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->updateProgressValue(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSelectedItem:Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSelectedItem:Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    iput p1, v0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->progress:I

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->clear()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSelectedItem:Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->add(Lcom/miui/gallery/editor/photo/core/Metadata;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->render()V

    return-void
.end method

.method private doRender(Lcom/miui/gallery/editor/photo/core/common/model/FilterData;Ljava/lang/Object;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->clear()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->add(Lcom/miui/gallery/editor/photo/core/Metadata;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->render()V

    return-void
.end method

.method private doSkyTransferProcess()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CheckResult"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$k0ZZJRNgcy_dVB2Afomd53mQzk4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$k0ZZJRNgcy_dVB2Afomd53mQzk4;-><init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)V

    invoke-static {v0}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-static {v1}, Lio/reactivex/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$_j9T15ymd5XQGJB3GuM104MqrK4;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$_j9T15ymd5XQGJB3GuM104MqrK4;-><init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public static synthetic lambda$doSkyTransferProcess$92(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;Lio/reactivex/ObservableEmitter;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {}, Lcom/xiaomi/skytransfer/SkyTranFilter;->getInstance()Lcom/xiaomi/skytransfer/SkyTranFilter;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getPreview()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/skytransfer/SkyTranFilter;->segment(Landroid/graphics/Bitmap;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$doSkyTransferProcess$93(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;Ljava/lang/Integer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mIsSkySegmentDone:Z

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mIsSkySegmentSuccess:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "result"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "photo_editor"

    const-string v1, "sky_filter_result"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mCategories:Ljava/util/List;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mCategories:Ljava/util/List;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSdkProvider:Lcom/miui/gallery/editor/photo/core/SdkProvider;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->list()Ljava/util/List;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    new-instance p1, Lcom/miui/gallery/editor/photo/app/menu/FilterView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/editor/photo/app/menu/FilterView;-><init>(Landroid/content/Context;)V

    const p2, 0x7f090305

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mTopPanel:Landroid/widget/LinearLayout;

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-direct {p2, p3}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSeekBar:Landroid/widget/SeekBar;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSeekBar:Landroid/widget/SeekBar;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {p2, p3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSeekBar:Landroid/widget/SeekBar;

    const/16 p3, 0x64

    invoke-virtual {p2, p3}, Landroid/widget/SeekBar;->setMax(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mTopPanel:Landroid/widget/LinearLayout;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSeekBar:Landroid/widget/SeekBar;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-virtual {p2, p3, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->isSkyEnable()Z

    move-result p2

    const/4 p3, 0x1

    if-eqz p2, :cond_0

    new-instance p2, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    const/4 v0, 0x7

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f1003c0

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f05009a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-direct {p2, v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;-><init>(ILjava/lang/String;I)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSkyCategory:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mCategories:Ljava/util/List;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSkyCategory:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mCategories:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    sub-int/2addr p2, p3

    iput p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSkyHeadIndex:I

    :cond_0
    new-instance p2, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mCategories:Ljava/util/List;

    invoke-direct {p2, v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;-><init>(Ljava/util/List;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mHeaderAdapter:Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;

    const p2, 0x7f090131

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/ui/SimpleRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mHeaderAdapter:Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mHeaderAdapter:Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->setOnItemClickListener(Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;)V

    const p2, 0x7f090130

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/support/v4/view/ViewPager;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mFilterPager:Landroid/support/v4/view/ViewPager;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mFilterPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {p2, p3}, Landroid/support/v4/view/ViewPager;->setOffscreenPageLimit(I)V

    new-instance p2, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;-><init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$1;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mPagerAdapter:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mFilterPager:Landroid/support/v4/view/ViewPager;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mPagerAdapter:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mFilterPager:Landroid/support/v4/view/ViewPager;

    const/4 v0, 0x0

    invoke-virtual {p2, v0, v0}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    const p2, 0x7f0902fa

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mTitle:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mTitle:Landroid/widget/TextView;

    const v0, 0x7f10051d

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->isSkyEnable()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->isSkyAvailable()Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSkyCategory:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;->setDownloadState(I)V

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->getInstance()Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;

    move-result-object p2

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mSkyDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->setDownloadStateListener(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;)V

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->getInstance()Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->startDownloadWithWifi()V

    :cond_1
    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onDestroy()V

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->getInstance()Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->setDownloadStateListener(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;)V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->isSkyAvailable()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->doSkyTransferProcess()V

    :cond_0
    return-void
.end method

.method public showTopPanel(Z)V
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mTopPanel:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-eqz p1, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    :cond_0
    const/16 v3, 0x8

    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setVisibility(I)V

    const v0, 0x7f0a0032

    const v1, 0x7f0a0031

    const/4 v3, 0x0

    const v4, 0x7f060335

    const/4 v5, 0x1

    const/4 v6, 0x2

    if-eqz p1, :cond_2

    new-instance p1, Landroid/animation/ObjectAnimator;

    invoke-direct {p1}, Landroid/animation/ObjectAnimator;-><init>()V

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mTopPanel:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v7}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    sget-object v7, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v8, v6, [F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v9

    aput v9, v8, v2

    aput v3, v8, v5

    invoke-static {v7, v8}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v7

    sget-object v8, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v9, v6, [F

    fill-array-data v9, :array_0

    invoke-static {v8, v9}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    new-array v9, v6, [Landroid/animation/PropertyValuesHolder;

    aput-object v7, v9, v2

    aput-object v8, v9, v5

    invoke-virtual {p1, v9}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    new-instance v7, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v7}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v7}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v7, v1

    invoke-virtual {p1, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    new-instance p1, Landroid/animation/ObjectAnimator;

    invoke-direct {p1}, Landroid/animation/ObjectAnimator;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    invoke-virtual {p1, v1}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    sget-object v1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v7, v6, [F

    aput v3, v7, v2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    neg-float v3, v3

    aput v3, v7, v5

    invoke-static {v1, v7}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v4, v6, [F

    fill-array-data v4, :array_1

    invoke-static {v3, v4}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    new-array v4, v6, [Landroid/animation/PropertyValuesHolder;

    aput-object v1, v4, v2

    aput-object v3, v4, v5

    invoke-virtual {p1, v4}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    goto/16 :goto_2

    :cond_2
    new-instance p1, Landroid/animation/ObjectAnimator;

    invoke-direct {p1}, Landroid/animation/ObjectAnimator;-><init>()V

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    invoke-virtual {p1, v7}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    sget-object v7, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v8, v6, [F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v9

    neg-float v9, v9

    aput v9, v8, v2

    aput v3, v8, v5

    invoke-static {v7, v8}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v7

    sget-object v8, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v9, v6, [F

    fill-array-data v9, :array_2

    invoke-static {v8, v9}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    new-array v9, v6, [Landroid/animation/PropertyValuesHolder;

    aput-object v7, v9, v2

    aput-object v8, v9, v5

    invoke-virtual {p1, v9}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    new-instance v7, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v7}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v7}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v7, v1

    invoke-virtual {p1, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    new-instance p1, Landroid/animation/ObjectAnimator;

    invoke-direct {p1}, Landroid/animation/ObjectAnimator;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->mTopPanel:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v1}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    sget-object v1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v7, v6, [F

    aput v3, v7, v2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    aput v3, v7, v5

    invoke-static {v1, v7}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v4, v6, [F

    fill-array-data v4, :array_3

    invoke-static {v3, v4}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    new-array v4, v6, [Landroid/animation/PropertyValuesHolder;

    aput-object v1, v4, v2

    aput-object v3, v4, v5

    invoke-virtual {p1, v4}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    :goto_2
    return-void

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

    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
