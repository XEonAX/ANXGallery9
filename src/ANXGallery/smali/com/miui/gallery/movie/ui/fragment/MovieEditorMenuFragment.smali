.class public Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;
.super Landroid/app/Fragment;
.source "MovieEditorMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/movie/ui/listener/MenuActivityListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;,
        Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyAudioItemSelectChangeListener;,
        Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyTemplateItemSelectChangeListener;,
        Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;
    }
.end annotation


# instance fields
.field private mAudioAdapter:Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;

.field private mAudioResourceRequest:Lcom/miui/gallery/movie/net/AudioResourceRequest;

.field private mContext:Landroid/content/Context;

.field private mCurrentTabPos:I

.field private mDeleteClicked:Z

.field private mDurationRadioGroup:Landroid/widget/RadioGroup;

.field private mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

.field private mIsShortVideo:Z

.field private mLongRadioButton:Landroid/widget/RadioButton;

.field private mMenuFragmentListener:Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

.field private mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

.field private mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

.field private mRecyclerViews:[Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

.field private mShortRadioButton:Landroid/widget/RadioButton;

.field private mSingleClickListener:Lcom/miui/gallery/listener/SingleClickListener;

.field private mStoryMovieCardId:J

.field private mTemplateAdapter:Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;

.field private mTemplateResourceRequest:Lcom/miui/gallery/movie/net/TemplateResourceRequest;

.field private mViewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$1;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mSingleClickListener:Lcom/miui/gallery/listener/SingleClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMenuFragmentListener:Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mTemplateAdapter:Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/entity/MovieInfo;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/core/MovieManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->resetMovieShareData()V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/entity/MovieResource;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->downloadResource(Lcom/miui/gallery/movie/entity/MovieResource;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/entity/MovieResource;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->notifyResourceAdapter(Lcom/miui/gallery/movie/entity/MovieResource;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mDeleteClicked:Z

    return p0
.end method

.method static synthetic access$1502(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mDeleteClicked:Z

    return p1
.end method

.method static synthetic access$1600(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mStoryMovieCardId:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mAudioAdapter:Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/adapter/EditAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)[Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mRecyclerViews:[Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mCurrentTabPos:I

    return p0
.end method

.method private checkChangeLongVideo()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object v0, v0, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x5

    if-le v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-boolean v0, v0, Lcom/miui/gallery/movie/entity/MovieInfo;->isShortVideo:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private downloadResource(Lcom/miui/gallery/movie/entity/MovieResource;)V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/movie/utils/MovieDownloadManager;->getInstance()Lcom/miui/gallery/movie/utils/MovieDownloadManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$2;

    invoke-direct {v2, p0, p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$2;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/entity/MovieResource;)V

    invoke-virtual {v0, v1, p1, v2}, Lcom/miui/gallery/movie/utils/MovieDownloadManager;->downloadResourceWithCheck(Landroid/app/Activity;Lcom/miui/gallery/movie/entity/MovieResource;Lcom/miui/gallery/movie/ui/listener/MovieDownloadListener;)V

    return-void
.end method

.method private initView(Landroid/view/View;)V
    .locals 4

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mContext:Landroid/content/Context;

    new-instance v0, Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mTemplateAdapter:Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mTemplateAdapter:Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;

    invoke-static {}, Lcom/miui/gallery/movie/ui/factory/TemplateFactory;->getLocalTemplateEntities()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;->setList(Ljava/util/List;)V

    const v0, 0x7f09024d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RadioButton;

    iput-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mShortRadioButton:Landroid/widget/RadioButton;

    const v1, 0x7f09024c

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioButton;

    iput-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mLongRadioButton:Landroid/widget/RadioButton;

    const/4 v2, 0x3

    new-array v2, v2, [Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iput-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mRecyclerViews:[Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    new-instance v2, Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;

    iget-object v3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mAudioAdapter:Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mAudioAdapter:Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;

    invoke-static {}, Lcom/miui/gallery/movie/ui/factory/AudioFactory;->getAllLocalAudios()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;->setList(Ljava/util/List;)V

    new-instance v2, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    iget-object v3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->refreshEditAdapter()V

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    new-instance v3, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$9bDc5TzKJuDrCTvlbsKSVi81Pt8;

    invoke-direct {v3, p0}, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$9bDc5TzKJuDrCTvlbsKSVi81Pt8;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V

    invoke-virtual {v2, v3}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->setOnActionListener(Lcom/miui/gallery/movie/ui/adapter/EditAdapter$OnActionListener;)V

    const v2, 0x7f090346

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager;

    iput-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mViewPager:Landroid/support/v4/view/ViewPager;

    new-instance v3, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;

    invoke-direct {v3, p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V

    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    const v2, 0x7f09024f

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioGroup;

    new-instance v3, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$Zka2s_uEMaFa1NEluEq_lQR_wH0;

    invoke-direct {v3, p0}, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$Zka2s_uEMaFa1NEluEq_lQR_wH0;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V

    invoke-virtual {v2, v3}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    const v2, 0x7f0900ef

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioGroup;

    iput-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mDurationRadioGroup:Landroid/widget/RadioGroup;

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mDurationRadioGroup:Landroid/widget/RadioGroup;

    iget-object v3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-boolean v3, v3, Lcom/miui/gallery/movie/entity/MovieInfo;->isShortVideo:Z

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    const v0, 0x7f09024c

    :goto_0
    invoke-virtual {v2, v0}, Landroid/widget/RadioGroup;->check(I)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-boolean v0, v0, Lcom/miui/gallery/movie/entity/MovieInfo;->isShortVideo:Z

    invoke-direct {p0, v0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->refreshRadioButtonState(Z)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mDurationRadioGroup:Landroid/widget/RadioGroup;

    new-instance v1, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$jVyTMO5UzrgoKoabagJhvQqHt6g;

    invoke-direct {v1, p0}, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$jVyTMO5UzrgoKoabagJhvQqHt6g;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    iget v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mCurrentTabPos:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->onTabSelect(I)V

    const v0, 0x7f09006e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mSingleClickListener:Lcom/miui/gallery/listener/SingleClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f09006d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mSingleClickListener:Lcom/miui/gallery/listener/SingleClickListener;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->loadTemplate()V

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->loadAudio()V

    return-void
.end method

.method public static synthetic lambda$initView$120(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object v0, v0, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/movie/utils/MovieStatUtils;->statEditorMove(I)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/movie/core/MovieManager;->moveImage(II)V

    return-void
.end method

.method public static synthetic lambda$initView$121(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Landroid/widget/RadioGroup;I)V
    .locals 4

    const/4 p1, 0x1

    const v0, 0x7f090249

    const v1, 0x7f09024b

    const/4 v2, 0x0

    if-ne p2, v1, :cond_0

    invoke-direct {p0, v2}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->onTabSelect(I)V

    goto :goto_0

    :cond_0
    const v3, 0x7f09024a

    if-ne p2, v3, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->onTabSelect(I)V

    goto :goto_0

    :cond_1
    if-ne p2, v0, :cond_2

    const/4 v3, 0x2

    invoke-direct {p0, v3}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->onTabSelect(I)V

    :cond_2
    :goto_0
    iget-object v3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMenuFragmentListener:Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    if-ne p2, v0, :cond_3

    goto :goto_1

    :cond_3
    const/4 p1, 0x0

    :goto_1
    invoke-interface {v3, p1}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->setShowDeleteMode(Z)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mDurationRadioGroup:Landroid/widget/RadioGroup;

    if-ne p2, v1, :cond_4

    goto :goto_2

    :cond_4
    const/4 v2, 0x4

    :goto_2
    invoke-virtual {p1, v2}, Landroid/widget/RadioGroup;->setVisibility(I)V

    return-void
.end method

.method public static synthetic lambda$initView$122(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Landroid/widget/RadioGroup;I)V
    .locals 1

    const/4 p1, 0x0

    const v0, 0x7f09024d

    if-ne p2, v0, :cond_3

    iget-boolean p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mIsShortVideo:Z

    if-eqz p2, :cond_0

    return-void

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    const/4 v0, 0x1

    invoke-static {p2, p1, v0}, Lcom/miui/gallery/movie/utils/MovieStatUtils;->statDurationClick(Lcom/miui/gallery/movie/entity/MovieInfo;ZZ)V

    iput-boolean v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mIsShortVideo:Z

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/entity/MovieInfo;->changeToShortVideo()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->refreshEditAdapter()V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object p2, p2, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/movie/core/MovieManager;->resetImage(Ljava/util/List;Z)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/movie/core/MovieManager;->setIsShortVideo(Z)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/core/MovieManager;->replay()V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-boolean p1, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->isFromStory:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMenuFragmentListener:Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    invoke-interface {p1}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->updateStorySha1Data()V

    :cond_2
    invoke-direct {p0, v0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->refreshRadioButtonState(Z)V

    goto :goto_2

    :cond_3
    const v0, 0x7f09024c

    if-ne p2, v0, :cond_7

    iget-boolean p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mIsShortVideo:Z

    if-nez p2, :cond_4

    return-void

    :cond_4
    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    invoke-static {p2, p1, p1}, Lcom/miui/gallery/movie/utils/MovieStatUtils;->statDurationClick(Lcom/miui/gallery/movie/entity/MovieInfo;ZZ)V

    iput-boolean p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mIsShortVideo:Z

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    invoke-virtual {p2}, Lcom/miui/gallery/movie/entity/MovieInfo;->backToLongVideo()Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->refreshEditAdapter()V

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object v0, v0, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-virtual {p2, v0, p1}, Lcom/miui/gallery/movie/core/MovieManager;->resetImage(Ljava/util/List;Z)V

    goto :goto_1

    :cond_5
    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/movie/core/MovieManager;->setIsShortVideo(Z)V

    :goto_1
    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {p2}, Lcom/miui/gallery/movie/core/MovieManager;->replay()V

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-boolean p2, p2, Lcom/miui/gallery/movie/entity/MovieInfo;->isFromStory:Z

    if-eqz p2, :cond_6

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMenuFragmentListener:Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    invoke-interface {p2}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->updateStorySha1Data()V

    :cond_6
    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->refreshRadioButtonState(Z)V

    :cond_7
    :goto_2
    return-void
.end method

.method static synthetic lambda$loadAudio$128(Lcom/miui/gallery/util/OptionalResult;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/util/OptionalResult;->getIncludeNull()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    invoke-static {}, Lcom/miui/gallery/movie/ui/factory/AudioFactory;->getAllLocalAudios()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz p0, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/movie/utils/MovieUtils;->checkResourceExist(Ljava/util/List;)V

    const/4 v1, 0x1

    invoke-interface {v0, v1, p0}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    :cond_0
    return-object v0
.end method

.method public static synthetic lambda$loadAudio$129(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mAudioAdapter:Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;->setList(Ljava/util/List;)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mAudioAdapter:Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method static synthetic lambda$loadTemplate$123(Lcom/miui/gallery/util/OptionalResult;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/util/OptionalResult;->getIncludeNull()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    invoke-static {}, Lcom/miui/gallery/movie/ui/factory/TemplateFactory;->getLocalTemplateEntities()Ljava/util/List;

    move-result-object v0

    if-eqz p0, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/movie/utils/MovieUtils;->checkResourceExist(Ljava/util/List;)V

    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    return-object v0
.end method

.method public static synthetic lambda$loadTemplate$127(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {p1}, Lio/reactivex/Observable;->fromIterable(Ljava/lang/Iterable;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$rP9cmn-ejj9AaL4iPWOoHtFPlQA;

    invoke-direct {v1, p0}, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$rP9cmn-ejj9AaL4iPWOoHtFPlQA;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->filter(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$zK2LnpH8-FIMqt0fKAdfdp-WJ0w;

    invoke-direct {v1, p0}, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$zK2LnpH8-FIMqt0fKAdfdp-WJ0w;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->filter(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$lBmv0tGhvpUa1ri_Womo2X74hR8;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$lBmv0tGhvpUa1ri_Womo2X74hR8;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mTemplateAdapter:Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;->setList(Ljava/util/List;)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mTemplateAdapter:Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public static synthetic lambda$notifyResourceAdapter$130(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/entity/MovieResource;)V
    .locals 3

    instance-of p1, p1, Lcom/miui/gallery/movie/entity/TemplateResource;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mTemplateAdapter:Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mTemplateAdapter:Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;->getItemCount()I

    move-result v1

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1, v0, v1, v2}, Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;->notifyItemRangeChanged(IILjava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mAudioAdapter:Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mAudioAdapter:Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;->getItemCount()I

    move-result v1

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1, v0, v1, v2}, Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;->notifyItemRangeChanged(IILjava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static synthetic lambda$null$124(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/entity/TemplateResource;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object p1, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->template:Ljava/lang/String;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object p1, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->template:Ljava/lang/String;

    const-string v0, "movieAssetsNormal"

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public static synthetic lambda$null$125(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/entity/TemplateResource;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p1, Lcom/miui/gallery/movie/entity/TemplateResource;->pathKey:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object v0, v0, Lcom/miui/gallery/movie/entity/MovieInfo;->template:Ljava/lang/String;

    iget-object p1, p1, Lcom/miui/gallery/movie/entity/TemplateResource;->pathKey:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public static synthetic lambda$null$126(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Ljava/util/List;Lcom/miui/gallery/movie/entity/TemplateResource;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object v0, v0, Lcom/miui/gallery/movie/entity/MovieInfo;->template:Ljava/lang/String;

    iput-object v0, p2, Lcom/miui/gallery/movie/entity/TemplateResource;->pathKey:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mTemplateAdapter:Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;

    invoke-interface {p1, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;->setSelectedItemPositionWithoutNotify(I)V

    return-void
.end method

.method private loadAudio()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/movie/net/AudioResourceRequest;

    invoke-direct {v0}, Lcom/miui/gallery/movie/net/AudioResourceRequest;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mAudioResourceRequest:Lcom/miui/gallery/movie/net/AudioResourceRequest;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mAudioResourceRequest:Lcom/miui/gallery/movie/net/AudioResourceRequest;

    invoke-static {v0}, Lcom/miui/gallery/net/NetApi;->create(Lcom/miui/gallery/net/BaseGalleryRequest;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$JlMwHyXObiT00VVMxPR2txIxHsg;->INSTANCE:Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$JlMwHyXObiT00VVMxPR2txIxHsg;

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$UOfWHNcCdvTeNpgtniZI5nqTEs4;

    invoke-direct {v1, p0}, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$UOfWHNcCdvTeNpgtniZI5nqTEs4;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method private loadTemplate()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/movie/net/TemplateResourceRequest;

    invoke-direct {v0}, Lcom/miui/gallery/movie/net/TemplateResourceRequest;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mTemplateResourceRequest:Lcom/miui/gallery/movie/net/TemplateResourceRequest;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mTemplateResourceRequest:Lcom/miui/gallery/movie/net/TemplateResourceRequest;

    invoke-static {v0}, Lcom/miui/gallery/net/NetApi;->create(Lcom/miui/gallery/net/BaseGalleryRequest;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$23jZtsJVOf0_yBGkkiGpAr6Yo10;->INSTANCE:Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$23jZtsJVOf0_yBGkkiGpAr6Yo10;

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$pJZppbpaoD1Z0lGJEFWb9ZkJWZA;

    invoke-direct {v1, p0}, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$pJZppbpaoD1Z0lGJEFWb9ZkJWZA;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method private notifyResourceAdapter(Lcom/miui/gallery/movie/entity/MovieResource;)V
    .locals 2

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Scheduler;->createWorker()Lio/reactivex/Scheduler$Worker;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$6M79r08JTv7KvVYHxb6hD52fUXg;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$6M79r08JTv7KvVYHxb6hD52fUXg;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/entity/MovieResource;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Scheduler$Worker;->schedule(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method private onTabSelect(I)V
    .locals 4

    iput p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mCurrentTabPos:I

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mRecyclerViews:[Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    array-length v2, v2

    if-ge v1, v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mRecyclerViews:[Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    aget-object v2, v2, v1

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mRecyclerViews:[Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    aget-object v2, v2, v1

    if-ne p1, v1, :cond_0

    const/4 v3, 0x0

    goto :goto_1

    :cond_0
    const/4 v3, 0x4

    :goto_1
    invoke-virtual {v2, v3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setVisibility(I)V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1, p1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mViewPager:Landroid/support/v4/view/ViewPager;

    const/4 v2, 0x2

    if-eq p1, v2, :cond_3

    const/4 v0, 0x1

    :cond_3
    invoke-virtual {v1, v0}, Landroid/support/v4/view/ViewPager;->setClipChildren(Z)V

    return-void
.end method

.method private refreshEditAdapter()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object v1, v1, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->setList(Ljava/util/List;)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->notifyDataSetChanged()V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-boolean v0, v0, Lcom/miui/gallery/movie/entity/MovieInfo;->isShortVideo:Z

    iput-boolean v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mIsShortVideo:Z

    return-void
.end method

.method private refreshRadioButtonState(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mShortRadioButton:Landroid/widget/RadioButton;

    invoke-virtual {v0, p1}, Landroid/widget/RadioButton;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mLongRadioButton:Landroid/widget/RadioButton;

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p1}, Landroid/widget/RadioButton;->setSelected(Z)V

    return-void
.end method

.method private resetMovieShareData()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMenuFragmentListener:Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMenuFragmentListener:Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    invoke-interface {v0}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->resetShareData()V

    :cond_0
    return-void
.end method


# virtual methods
.method public clearEditorAdapterSelected()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->setSelectedItemPosition(I)V

    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 6

    invoke-super {p0, p1, p2, p3}, Landroid/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    const v0, 0x7f100488

    const v1, 0x7f09024c

    const/4 v2, 0x0

    const/4 v3, -0x1

    const/4 v4, 0x7

    if-ne p1, v4, :cond_1

    if-ne p2, v3, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mContext:Landroid/content/Context;

    invoke-static {p1, p3}, Lcom/miui/gallery/movie/utils/MovieUtils;->getImageFromClipData(Landroid/content/Context;Landroid/content/Intent;)Ljava/util/List;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object p2, p2, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->checkChangeLongVideo()Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/entity/MovieInfo;->discardToLongVideo()Z

    iput-boolean v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mIsShortVideo:Z

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mDurationRadioGroup:Landroid/widget/RadioGroup;

    invoke-virtual {p1, v1}, Landroid/widget/RadioGroup;->check(I)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mContext:Landroid/content/Context;

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object p2, p2, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-virtual {p1, p2, v2}, Lcom/miui/gallery/movie/core/MovieManager;->resetImage(Ljava/util/List;Z)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/core/MovieManager;->replay()V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/movie/core/MovieManager;->addImage(Ljava/util/List;)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object p2, p2, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->setList(Ljava/util/List;)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->notifyDataSetChanged()V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-virtual {p1, v3}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->setSelectedItemPosition(I)V

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->resetMovieShareData()V

    goto/16 :goto_4

    :cond_1
    const/16 v4, 0x3e8

    const/4 v5, 0x1

    if-ne p1, v4, :cond_5

    if-ne p2, v3, :cond_5

    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object p1

    if-nez p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ConvertFilepathUtil;->getPath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_2
    invoke-virtual {p1, v2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/miui/gallery/util/ConvertFilepathUtil;->getPath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    :goto_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_4

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/movie/core/MovieManager;->isSupportVideo(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_3

    new-instance p2, Lcom/miui/gallery/movie/entity/AudioResource;

    invoke-direct {p2, p1}, Lcom/miui/gallery/movie/entity/AudioResource;-><init>(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object p3, p2, Lcom/miui/gallery/movie/entity/AudioResource;->nameKey:Ljava/lang/String;

    iput-object p3, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->audio:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/movie/core/MovieManager;->setAudio(Lcom/miui/gallery/movie/entity/AudioResource;)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mAudioAdapter:Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mAudioAdapter:Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;

    invoke-virtual {p2}, Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;->getItemCount()I

    move-result p2

    sub-int/2addr p2, v5

    invoke-virtual {p1, p2}, Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;->setSelectedItemPosition(I)V

    goto :goto_2

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const p2, 0x7f100774

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    :cond_4
    :goto_2
    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->resetMovieShareData()V

    goto :goto_4

    :cond_5
    if-ne p1, v5, :cond_8

    if-ne p2, v3, :cond_8

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mContext:Landroid/content/Context;

    invoke-static {p1, p3}, Lcom/miui/gallery/movie/utils/MovieUtils;->getImageFromClipData(Landroid/content/Context;Landroid/content/Intent;)Ljava/util/List;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object p2, p2, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->clear()V

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object p2, p2, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object p1, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    const/4 p2, 0x5

    if-le p1, p2, :cond_7

    iget-boolean p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mIsShortVideo:Z

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mContext:Landroid/content/Context;

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    :cond_6
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/entity/MovieInfo;->discardToLongVideo()Z

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mDurationRadioGroup:Landroid/widget/RadioGroup;

    invoke-virtual {p1, v1}, Landroid/widget/RadioGroup;->check(I)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object p2, p2, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-virtual {p1, p2, v2}, Lcom/miui/gallery/movie/core/MovieManager;->resetImage(Ljava/util/List;Z)V

    goto :goto_3

    :cond_7
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/entity/MovieInfo;->discardToShortVideo()Z

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object p2, p2, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-virtual {p1, p2, v5}, Lcom/miui/gallery/movie/core/MovieManager;->resetImage(Ljava/util/List;Z)V

    :goto_3
    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->refreshEditAdapter()V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-virtual {p1, v3}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->setSelectedItemPosition(I)V

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->resetMovieShareData()V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMenuFragmentListener:Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    invoke-interface {p1}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->updateStorySha1Data()V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/core/MovieManager;->replay()V

    :cond_8
    :goto_4
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/Fragment;->onAttach(Landroid/content/Context;)V

    instance-of v0, p1, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMenuFragmentListener:Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMenuFragmentListener:Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    invoke-interface {p1}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->getMovieManager()Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMenuFragmentListener:Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    invoke-interface {p1}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->getMovieInfo()Lcom/miui/gallery/movie/entity/MovieInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-boolean p1, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->isFromStory:Z

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-wide/16 v0, 0x0

    if-eqz p1, :cond_0

    const-string v2, "card_id"

    invoke-virtual {p1, v2, v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    :cond_0
    iput-wide v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mStoryMovieCardId:J

    :cond_1
    return-void
.end method

.method public onCreateAnimator(IZI)Landroid/animation/Animator;
    .locals 4

    new-instance p1, Landroid/animation/ObjectAnimator;

    invoke-direct {p1}, Landroid/animation/ObjectAnimator;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-virtual {p3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f0602cb

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz p2, :cond_0

    sget-object p2, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v0, v0, [F

    int-to-float p3, p3

    aput p3, v0, v3

    aput v1, v0, v2

    invoke-static {p2, v0}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p2

    new-array p3, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object p2, p3, v3

    invoke-virtual {p1, p3}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    new-instance p2, Lmiui/view/animation/QuarticEaseOutInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/QuarticEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0a001b

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    int-to-long p2, p2

    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0a001c

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    int-to-long p2, p2

    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getView()Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, v1}, Landroid/view/View;->setAlpha(F)V

    new-instance p2, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$3;

    invoke-direct {p2, p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$3;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V

    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    goto :goto_0

    :cond_0
    sget-object p2, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v0, v0, [F

    aput v1, v0, v3

    int-to-float p3, p3

    aput p3, v0, v2

    invoke-static {p2, v0}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p2

    new-array p3, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object p2, p3, v3

    invoke-virtual {p1, p3}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    new-instance p2, Lmiui/view/animation/QuarticEaseOutInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/QuarticEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0a001d

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    int-to-long p2, p2

    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    :goto_0
    return-object p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Lcom/miui/gallery/movie/ui/fragment/MovieEditMenuView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/movie/ui/fragment/MovieEditMenuView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->initView(Landroid/view/View;)V

    return-object p1
.end method

.method public onDeleteClick()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->getItemCount()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, 0x3

    if-gt v0, v2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mContext:Landroid/content/Context;

    const v1, 0x7f10048d

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->getSelectedItemPosition()I

    move-result v0

    if-ltz v0, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object v2, v2, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-object v2, v2, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMenuFragmentListener:Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    invoke-interface {v2}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->getMovieManager()Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/miui/gallery/movie/core/MovieManager;->removeImageAtIndex(I)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    const/4 v2, -0x1

    invoke-virtual {v0, v2}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->setSelectedItemPosition(I)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->notifyDataSetChanged()V

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->resetMovieShareData()V

    iput-boolean v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mDeleteClicked:Z

    :cond_1
    return-void
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mTemplateResourceRequest:Lcom/miui/gallery/movie/net/TemplateResourceRequest;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mTemplateResourceRequest:Lcom/miui/gallery/movie/net/TemplateResourceRequest;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/net/TemplateResourceRequest;->cancel()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mAudioResourceRequest:Lcom/miui/gallery/movie/net/AudioResourceRequest;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mAudioResourceRequest:Lcom/miui/gallery/movie/net/AudioResourceRequest;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/net/AudioResourceRequest;->cancel()V

    :cond_1
    invoke-static {}, Lcom/miui/gallery/movie/utils/MovieDownloadManager;->getInstance()Lcom/miui/gallery/movie/utils/MovieDownloadManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/movie/utils/MovieDownloadManager;->cancelAll()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/Fragment;->onHiddenChanged(Z)V

    if-nez p1, :cond_2

    iget-boolean p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mIsShortVideo:Z

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-boolean v0, v0, Lcom/miui/gallery/movie/entity/MovieInfo;->isShortVideo:Z

    if-eq p1, v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->refreshEditAdapter()V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mDurationRadioGroup:Landroid/widget/RadioGroup;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mMovieInfo:Lcom/miui/gallery/movie/entity/MovieInfo;

    iget-boolean v0, v0, Lcom/miui/gallery/movie/entity/MovieInfo;->isShortVideo:Z

    if-eqz v0, :cond_0

    const v0, 0x7f09024d

    goto :goto_0

    :cond_0
    const v0, 0x7f09024c

    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/RadioGroup;->check(I)V

    :cond_1
    iget-boolean p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mDeleteClicked:Z

    if-eqz p1, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->refreshEditAdapter()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mDeleteClicked:Z

    :cond_2
    return-void
.end method

.method public onResumeClick()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->mEditAdapter:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->setSelectedItemPosition(I)V

    return-void
.end method
