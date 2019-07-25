.class public Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;
.super Lcom/miui/gallery/video/editor/ui/MenuFragment;
.source "FilterAdjustFragment.java"


# instance fields
.field private mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

.field private mCancelView:Landroid/view/View;

.field private mFilterAdjustHeadView:Lcom/miui/gallery/video/editor/widget/FilterAdjustHeadView;

.field private mFilterView:Lcom/miui/gallery/video/editor/widget/FilterView;

.field private mHeadBar:Landroid/support/constraint/ConstraintLayout;

.field private mNoScrollViewPager:Lcom/miui/gallery/editor/photo/widgets/NoScrollViewPager;

.field private mOkView:Landroid/view/View;

.field private mPageAdapter:Lcom/miui/gallery/video/editor/adapter/FilterAdjustPageAdapter;

.field private mSavedSelectedFilterIndex:I

.field private mTitleView:Landroid/widget/TextView;

.field private mViewList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private showFilterView:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->showFilterView:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mSavedSelectedFilterIndex:I

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/widget/FilterView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterView:Lcom/miui/gallery/video/editor/widget/FilterView;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/editor/photo/widgets/NoScrollViewPager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mNoScrollViewPager:Lcom/miui/gallery/editor/photo/widgets/NoScrollViewPager;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method static synthetic access$1800(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method static synthetic access$1900(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$2000(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method static synthetic access$2100(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->recordEventWithEffectChanged()V

    return-void
.end method

.method static synthetic access$2200(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method static synthetic access$2300(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method static synthetic access$2400(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method static synthetic access$2500(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->onExitMode()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mTitleView:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->showFilterView:Z

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/widget/AdjustView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Landroid/support/constraint/ConstraintLayout;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mHeadBar:Landroid/support/constraint/ConstraintLayout;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/widget/FilterAdjustHeadView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterAdjustHeadView:Lcom/miui/gallery/video/editor/widget/FilterAdjustHeadView;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method private doFilterCancel()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-nez v0, :cond_0

    const-string v0, "FilterAdjustFragment"

    const-string v1, "doCancel: videoEditor is null."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->restoreEditState()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    new-instance v1, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$5;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$5;-><init>(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    move-result v0

    return v0
.end method

.method private initData()V
    .locals 3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mViewList:Ljava/util/List;

    new-instance v0, Lcom/miui/gallery/video/editor/widget/FilterView;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/video/editor/widget/FilterView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterView:Lcom/miui/gallery/video/editor/widget/FilterView;

    new-instance v0, Lcom/miui/gallery/video/editor/widget/AdjustView;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/video/editor/widget/AdjustView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mViewList:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterView:Lcom/miui/gallery/video/editor/widget/FilterView;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mViewList:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mTitleView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f10072f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterAdjustHeadView:Lcom/miui/gallery/video/editor/widget/FilterAdjustHeadView;

    iget-boolean v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->showFilterView:Z

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/FilterAdjustHeadView;->selectFilter(Z)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterView:Lcom/miui/gallery/video/editor/widget/FilterView;

    iget v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mSavedSelectedFilterIndex:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/FilterView;->updateSelectedItemPosition(I)V

    new-instance v0, Lcom/miui/gallery/video/editor/adapter/FilterAdjustPageAdapter;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mViewList:Ljava/util/List;

    invoke-direct {v0, v1}, Lcom/miui/gallery/video/editor/adapter/FilterAdjustPageAdapter;-><init>(Ljava/util/List;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mPageAdapter:Lcom/miui/gallery/video/editor/adapter/FilterAdjustPageAdapter;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mNoScrollViewPager:Lcom/miui/gallery/editor/photo/widgets/NoScrollViewPager;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mPageAdapter:Lcom/miui/gallery/video/editor/adapter/FilterAdjustPageAdapter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/NoScrollViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    return-void
.end method

.method private initListener()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterAdjustHeadView:Lcom/miui/gallery/video/editor/widget/FilterAdjustHeadView;

    new-instance v1, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$1;-><init>(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/FilterAdjustHeadView;->setHeadViewClickListener(Lcom/miui/gallery/video/editor/widget/FilterAdjustHeadView$FilterHeadViewClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

    new-instance v1, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$2;-><init>(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/AdjustView;->setIFilterAdjustHeadViewListener(Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

    new-instance v1, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$3;-><init>(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/AdjustView;->setIAdjustEffectChangeListener(Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mOkView:Landroid/view/View;

    new-instance v1, Lcom/miui/gallery/video/editor/fragment/-$$Lambda$FilterAdjustFragment$6OLcGa3DHvX-2b2OC6NJtqtav98;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/fragment/-$$Lambda$FilterAdjustFragment$6OLcGa3DHvX-2b2OC6NJtqtav98;-><init>(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mCancelView:Landroid/view/View;

    new-instance v1, Lcom/miui/gallery/video/editor/fragment/-$$Lambda$FilterAdjustFragment$3YTp_jWmjnPW8cYU6HTlSyDvFk0;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/fragment/-$$Lambda$FilterAdjustFragment$3YTp_jWmjnPW8cYU6HTlSyDvFk0;-><init>(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterView:Lcom/miui/gallery/video/editor/widget/FilterView;

    new-instance v1, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$4;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$4;-><init>(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/FilterView;->setItemSelectedListener(Lcom/miui/gallery/video/editor/widget/FilterView$OnItemSelectedListener;)V

    return-void
.end method

.method public static synthetic lambda$initListener$104(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->doApply()Z

    return-void
.end method

.method public static synthetic lambda$initListener$105(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->doCancel()Z

    return-void
.end method


# virtual methods
.method public doApply()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/AdjustView;->isTracking()Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->getState()I

    move-result v0

    const/16 v2, 0xc8

    if-eq v0, v2, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->saveEditState()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterView:Lcom/miui/gallery/video/editor/widget/FilterView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterView:Lcom/miui/gallery/video/editor/widget/FilterView;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/FilterView;->getSelectedItemPosition()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mSavedSelectedFilterIndex:I

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->recordEventWithApply()V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->onExitMode()V

    const/4 v0, 0x1

    return v0

    :cond_2
    return v1
.end method

.method public doCancel()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/AdjustView;->isTracking()Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->showFilterView:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->doFilterCancel()Z

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/AdjustView;->doCancel()Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->setVideoEditorAdjust(Z)V

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->doFilterCancel()Z

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->recordEventWithCancel()V

    const/4 v0, 0x1

    return v0
.end method

.method public getCurrentEffect()Ljava/util/List;
    .locals 2
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

    iget-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterView:Lcom/miui/gallery/video/editor/widget/FilterView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterView:Lcom/miui/gallery/video/editor/widget/FilterView;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/widget/FilterView;->getFilterCurrentEffect()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/widget/AdjustView;->getAdjustCurrentEffect()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/widget/AdjustView;->clearCurrentEffects()V

    :cond_2
    return-object v0
.end method

.method public getEffectId()I
    .locals 1

    const v0, 0x7f090331

    return v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Lcom/miui/gallery/video/editor/ui/menu/FilterAdjustView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/video/editor/ui/menu/FilterAdjustView;-><init>(Landroid/content/Context;)V

    const p2, 0x7f090130

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/widgets/NoScrollViewPager;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mNoScrollViewPager:Lcom/miui/gallery/editor/photo/widgets/NoScrollViewPager;

    const p2, 0x7f09012c

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/video/editor/widget/FilterAdjustHeadView;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterAdjustHeadView:Lcom/miui/gallery/video/editor/widget/FilterAdjustHeadView;

    const p2, 0x7f090073

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mCancelView:Landroid/view/View;

    const p2, 0x7f0901f9

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mOkView:Landroid/view/View;

    const p2, 0x7f0902fa

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mTitleView:Landroid/widget/TextView;

    const p2, 0x7f090158

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/support/constraint/ConstraintLayout;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mHeadBar:Landroid/support/constraint/ConstraintLayout;

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->initData()V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->initListener()V

    return-object p1
.end method

.method public onDestroyView()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->onDestroyView()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mPageAdapter:Lcom/miui/gallery/video/editor/adapter/FilterAdjustPageAdapter;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iput-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mPageAdapter:Lcom/miui/gallery/video/editor/adapter/FilterAdjustPageAdapter;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterAdjustHeadView:Lcom/miui/gallery/video/editor/widget/FilterAdjustHeadView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterAdjustHeadView:Lcom/miui/gallery/video/editor/widget/FilterAdjustHeadView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/FilterAdjustHeadView;->setHeadViewClickListener(Lcom/miui/gallery/video/editor/widget/FilterAdjustHeadView$FilterHeadViewClickListener;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterView:Lcom/miui/gallery/video/editor/widget/FilterView;

    if-eqz v0, :cond_2

    iput-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mFilterView:Lcom/miui/gallery/video/editor/widget/FilterView;

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

    if-eqz v0, :cond_3

    iput-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->mAdjustView:Lcom/miui/gallery/video/editor/widget/AdjustView;

    :cond_3
    return-void
.end method
