.class public Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;
.super Lcom/miui/gallery/collage/app/common/CollageMenuFragment;
.source "StitchingMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/collage/app/common/CollageMenuFragment<",
        "Lcom/miui/gallery/collage/core/stitching/StitchingPresenter;",
        "Lcom/miui/gallery/collage/app/common/AbstractStitchingFragment;",
        ">;"
    }
.end annotation


# instance fields
.field private mDataInit:Z

.field private mDataReady:Z

.field private mInitDataLoadListener:Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;

.field private mOnItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

.field private mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

.field private mStitchingAdapter:Lcom/miui/gallery/collage/app/stitching/StitchingAdapter;

.field private mStitchingModelList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/collage/core/stitching/StitchingModel;",
            ">;"
        }
    .end annotation
.end field

.field private mViewReady:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/collage/app/common/CollageMenuFragment;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mStitchingModelList:Ljava/util/List;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mViewReady:Z

    iput-boolean v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mDataReady:Z

    iput-boolean v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mDataInit:Z

    new-instance v0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment$1;-><init>(Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mInitDataLoadListener:Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;

    new-instance v0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment$2;-><init>(Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    return-void
.end method

.method static synthetic access$002(Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mDataReady:Z

    return p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->reloadData()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->notifyDataInit()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;)Lcom/miui/gallery/collage/app/stitching/StitchingAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mStitchingAdapter:Lcom/miui/gallery/collage/app/stitching/StitchingAdapter;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->onSelectModel(I)V

    return-void
.end method

.method private notifyDataInit()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mViewReady:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mDataReady:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mDataInit:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->onSelectModel(I)V

    iget-object v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mStitchingAdapter:Lcom/miui/gallery/collage/app/stitching/StitchingAdapter;

    iget-object v1, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/app/stitching/StitchingAdapter;->setOnItemClickListener(Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mDataInit:Z

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method private onSelectModel(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mStitchingModelList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mStitchingModelList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/collage/core/stitching/StitchingModel;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->getRenderFragment()Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/collage/app/common/AbstractStitchingFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/app/common/AbstractStitchingFragment;->onSelectModel(Lcom/miui/gallery/collage/core/stitching/StitchingModel;)V

    return-void
.end method

.method private reloadData()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mStitchingModelList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    check-cast v0, Lcom/miui/gallery/collage/core/stitching/StitchingPresenter;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/core/stitching/StitchingPresenter;->getStitching()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mStitchingModelList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mStitchingAdapter:Lcom/miui/gallery/collage/app/stitching/StitchingAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/app/stitching/StitchingAdapter;->notifyDataSetChanged()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/collage/app/common/CollageMenuFragment;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    check-cast p1, Lcom/miui/gallery/collage/core/stitching/StitchingPresenter;

    iget-object v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mInitDataLoadListener:Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/collage/core/stitching/StitchingPresenter;->loadDataFromResourceAsync(Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0058

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4

    check-cast p1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iput-object p1, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    new-instance p1, Lcom/miui/gallery/collage/app/stitching/StitchingAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mStitchingModelList:Ljava/util/List;

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070092

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-direct {p1, p2, v0, v1}, Lcom/miui/gallery/collage/app/stitching/StitchingAdapter;-><init>(Landroid/content/Context;Ljava/util/List;Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mStitchingAdapter:Lcom/miui/gallery/collage/app/stitching/StitchingAdapter;

    iget-object p1, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p2, v0, v1, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0600bb

    invoke-direct {p2, v0, v2, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;-><init>(Landroid/content/res/Resources;II)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mStitchingAdapter:Lcom/miui/gallery/collage/app/stitching/StitchingAdapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->mViewReady:Z

    invoke-direct {p0}, Lcom/miui/gallery/collage/app/stitching/StitchingMenuFragment;->notifyDataInit()V

    return-void
.end method
