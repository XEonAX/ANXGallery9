.class public Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;
.super Lcom/miui/gallery/collage/app/common/CollageMenuFragment;
.source "LayoutMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/collage/app/common/CollageMenuFragment<",
        "Lcom/miui/gallery/collage/core/layout/LayoutPresenter;",
        "Lcom/miui/gallery/collage/app/common/AbstractLayoutFragment;",
        ">;"
    }
.end annotation


# instance fields
.field private mCollageMargin:Lcom/miui/gallery/collage/render/CollageMargin;

.field private mCollageRatio:Lcom/miui/gallery/collage/render/CollageRatio;

.field private mDataInit:Z

.field private mDataLoadListener:Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;

.field private mDataReady:Z

.field private mLayoutMenuAdapter:Lcom/miui/gallery/collage/app/layout/LayoutMenuAdapter;

.field private mLayoutModels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/collage/core/layout/LayoutModel;",
            ">;"
        }
    .end annotation
.end field

.field private mMarginClickListener:Landroid/view/View$OnClickListener;

.field private mMarginImageView:Landroid/widget/ImageView;

.field private mMarginWrapper:Landroid/view/View;

.field private mOnItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

.field private mRatioClickListener:Landroid/view/View$OnClickListener;

.field private mRatioImageView:Landroid/widget/ImageView;

.field private mRatioWrapper:Landroid/view/View;

.field private mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

.field private mViewReady:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/collage/app/common/CollageMenuFragment;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mLayoutModels:Ljava/util/List;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mViewReady:Z

    iput-boolean v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mDataReady:Z

    iput-boolean v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mDataInit:Z

    sget-object v0, Lcom/miui/gallery/collage/render/CollageMargin;->NONE:Lcom/miui/gallery/collage/render/CollageMargin;

    iput-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mCollageMargin:Lcom/miui/gallery/collage/render/CollageMargin;

    sget-object v0, Lcom/miui/gallery/collage/render/CollageRatio;->RATIO_3_4:Lcom/miui/gallery/collage/render/CollageRatio;

    iput-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mCollageRatio:Lcom/miui/gallery/collage/render/CollageRatio;

    new-instance v0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment$1;-><init>(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mMarginClickListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment$2;-><init>(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mRatioClickListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment$3;-><init>(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    new-instance v0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment$4;-><init>(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mDataLoadListener:Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;)Lcom/miui/gallery/collage/render/CollageMargin;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mCollageMargin:Lcom/miui/gallery/collage/render/CollageMargin;

    return-object p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;Lcom/miui/gallery/collage/render/CollageMargin;)Lcom/miui/gallery/collage/render/CollageMargin;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mCollageMargin:Lcom/miui/gallery/collage/render/CollageMargin;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;)Landroid/widget/ImageView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mMarginImageView:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;)Lcom/miui/gallery/collage/render/CollageRatio;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mCollageRatio:Lcom/miui/gallery/collage/render/CollageRatio;

    return-object p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;Lcom/miui/gallery/collage/render/CollageRatio;)Lcom/miui/gallery/collage/render/CollageRatio;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mCollageRatio:Lcom/miui/gallery/collage/render/CollageRatio;

    return-object p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;)Landroid/widget/ImageView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mRatioImageView:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;)Lcom/miui/gallery/collage/app/layout/LayoutMenuAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mLayoutMenuAdapter:Lcom/miui/gallery/collage/app/layout/LayoutMenuAdapter;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->onSelectModel(I)V

    return-void
.end method

.method static synthetic access$602(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mDataReady:Z

    return p1
.end method

.method static synthetic access$700(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->reloadData()V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->notifyDataInit()V

    return-void
.end method

.method private notifyDataInit()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mViewReady:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mDataReady:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mDataInit:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->onSelectModel(I)V

    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mLayoutMenuAdapter:Lcom/miui/gallery/collage/app/layout/LayoutMenuAdapter;

    iget-object v1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/app/layout/LayoutMenuAdapter;->setOnItemClickListener(Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mMarginWrapper:Landroid/view/View;

    iget-object v1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mMarginClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mRatioWrapper:Landroid/view/View;

    iget-object v1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mRatioClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mDataInit:Z

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method private onSelectModel(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mLayoutModels:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mLayoutModels:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/collage/core/layout/LayoutModel;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->getRenderFragment()Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/collage/app/common/AbstractLayoutFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/app/common/AbstractLayoutFragment;->onSelectModel(Lcom/miui/gallery/collage/core/layout/LayoutModel;)V

    return-void
.end method

.method private reloadData()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mLayoutModels:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    check-cast v0, Lcom/miui/gallery/collage/core/layout/LayoutPresenter;

    iget-object v1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    check-cast v1, Lcom/miui/gallery/collage/core/layout/LayoutPresenter;

    invoke-virtual {v1}, Lcom/miui/gallery/collage/core/layout/LayoutPresenter;->getImageCount()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/core/layout/LayoutPresenter;->getLayouts(I)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mLayoutModels:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mLayoutMenuAdapter:Lcom/miui/gallery/collage/app/layout/LayoutMenuAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuAdapter;->notifyDataSetChanged()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/collage/app/common/CollageMenuFragment;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mPresenter:Lcom/miui/gallery/collage/core/CollagePresenter;

    check-cast p1, Lcom/miui/gallery/collage/core/layout/LayoutPresenter;

    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mDataLoadListener:Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/collage/core/layout/LayoutPresenter;->loadDataFromResourceAsync(Lcom/miui/gallery/collage/core/CollagePresenter$DataLoadListener;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0051

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4

    const p2, 0x7f09009f

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mMarginWrapper:Landroid/view/View;

    const p2, 0x7f09009c

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mMarginImageView:Landroid/widget/ImageView;

    const p2, 0x7f0900a2

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mRatioWrapper:Landroid/view/View;

    const p2, 0x7f0900a0

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mRatioImageView:Landroid/widget/ImageView;

    const p2, 0x7f09009a

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iput-object p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    new-instance p1, Lcom/miui/gallery/collage/app/layout/LayoutMenuAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mLayoutModels:Ljava/util/List;

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070092

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-direct {p1, p2, v0, v1}, Lcom/miui/gallery/collage/app/layout/LayoutMenuAdapter;-><init>(Landroid/content/Context;Ljava/util/List;Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mLayoutMenuAdapter:Lcom/miui/gallery/collage/app/layout/LayoutMenuAdapter;

    iget-object p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p2, v0, v1, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0600bb

    invoke-direct {p2, v0, v2, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;-><init>(Landroid/content/res/Resources;II)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mLayoutMenuAdapter:Lcom/miui/gallery/collage/app/layout/LayoutMenuAdapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->mViewReady:Z

    invoke-direct {p0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->notifyDataInit()V

    return-void
.end method
