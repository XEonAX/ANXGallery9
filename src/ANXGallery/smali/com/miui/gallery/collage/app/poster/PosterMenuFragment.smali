.class public Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;
.super Lcom/miui/gallery/collage/app/common/CollageMenuFragment;
.source "PosterMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/collage/app/common/CollageMenuFragment<",
        "Lcom/miui/gallery/collage/core/poster/PosterPresenter;",
        "Lcom/miui/gallery/collage/app/common/AbstractPosterFragment;",
        ">;"
    }
.end annotation


# instance fields
.field private mDataInit:Z

.field private mDataReady:Z

.field private mInitDataLoadListener:Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;

.field private mOnItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

.field private mPosterMenuAdapter:Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;

.field private mPosterModels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/collage/core/poster/PosterModel;",
            ">;"
        }
    .end annotation
.end field

.field private mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

.field private mViewReady:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/collage/app/common/CollageMenuFragment;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPosterModels:Ljava/util/List;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mViewReady:Z

    iput-boolean v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mDataReady:Z

    iput-boolean v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mDataInit:Z

    new-instance v0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment$1;-><init>(Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mInitDataLoadListener:Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;

    new-instance v0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment$2;-><init>(Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    return-void
.end method

.method static synthetic access$002(Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mDataReady:Z

    return p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->reloadData()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->notifyDataInit()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;)Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPosterMenuAdapter:Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->onSelectModel(I)V

    return-void
.end method

.method private notifyDataInit()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mViewReady:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mDataReady:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mDataInit:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->onSelectModel(I)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mDataInit:Z

    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPosterMenuAdapter:Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;

    iget-object v1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->setOnItemClickListener(Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method private onSelectModel(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPosterModels:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPosterModels:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/collage/core/poster/PosterModel;

    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    check-cast v0, Lcom/miui/gallery/collage/core/poster/PosterPresenter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/core/poster/PosterPresenter;->getPosterCollageLayout(Lcom/miui/gallery/collage/core/poster/PosterModel;)Lcom/miui/gallery/collage/core/layout/LayoutModel;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->getRenderFragment()Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/collage/app/common/AbstractPosterFragment;

    invoke-virtual {v1, p1, v0}, Lcom/miui/gallery/collage/app/common/AbstractPosterFragment;->onSelectModel(Lcom/miui/gallery/collage/core/poster/PosterModel;Lcom/miui/gallery/collage/core/layout/LayoutModel;)V

    return-void
.end method

.method private reloadData()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPosterModels:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    check-cast v0, Lcom/miui/gallery/collage/core/poster/PosterPresenter;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/core/poster/PosterPresenter;->getPosters()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPosterModels:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPosterMenuAdapter:Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->notifyDataSetChanged()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/collage/app/common/CollageMenuFragment;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    check-cast p1, Lcom/miui/gallery/collage/core/poster/PosterPresenter;

    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mInitDataLoadListener:Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/collage/core/poster/PosterPresenter;->loadDataFromResourceAsync(Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0055

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iput-object p1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iget-object p1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/collage/app/common/CollageMenuFragment;->onDestroy()V

    const-string v0, "PosterMenuFragment"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4

    new-instance p1, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPosterModels:Ljava/util/List;

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070092

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-direct {p1, p2, v0, v1}, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;-><init>(Landroid/content/Context;Ljava/util/List;Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPosterMenuAdapter:Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;

    iget-object p1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPosterMenuAdapter:Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;

    iget-object p2, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    check-cast p2, Lcom/miui/gallery/collage/core/poster/PosterPresenter;

    invoke-virtual {p2}, Lcom/miui/gallery/collage/core/poster/PosterPresenter;->getImageCount()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->setImageCount(I)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p2, v0, v1, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0600bb

    invoke-direct {p2, v0, v2, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;-><init>(Landroid/content/res/Resources;II)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mPosterMenuAdapter:Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->mViewReady:Z

    invoke-direct {p0}, Lcom/miui/gallery/collage/app/poster/PosterMenuFragment;->notifyDataInit()V

    return-void
.end method
