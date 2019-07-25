.class public Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;
.super Lcom/miui/gallery/editor/photo/app/MenuFragment;
.source "FrameMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/app/MenuFragment<",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractFrameFragment;",
        "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
        "Lcom/miui/gallery/editor/photo/core/common/model/FrameData;",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractFrameFragment;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mFrameAdapter:Lcom/miui/gallery/editor/photo/app/frame/FrameAdapter;

.field private mFrameDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/FrameData;",
            ">;"
        }
    .end annotation
.end field

.field private mItemStatusArray:Landroid/util/SparseIntArray;

.field private mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

.field private mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

.field private mSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

.field private mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->FRAME:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mItemStatusArray:Landroid/util/SparseIntArray;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment$2;-><init>(Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;)Lcom/miui/gallery/editor/photo/app/frame/FrameAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mFrameAdapter:Lcom/miui/gallery/editor/photo/app/frame/FrameAdapter;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->onSelect(I)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method

.method private onSelect(I)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mFrameDataList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/model/FrameData;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractFrameFragment;

    iget v2, v0, Lcom/miui/gallery/editor/photo/core/common/model/FrameData;->width:I

    int-to-float v2, v2

    iget v3, v0, Lcom/miui/gallery/editor/photo/core/common/model/FrameData;->height:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/common/model/FrameData;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractFrameFragment;->setRatio(FLjava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->getMax()I

    move-result v1

    invoke-virtual {p0, p1, v1}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->getStatus(II)I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->setProgress(I)V

    return-void
.end method


# virtual methods
.method public getStatus(II)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mItemStatusArray:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseIntArray;->get(II)I

    move-result p1

    return p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Lcom/miui/gallery/editor/photo/app/menu/FrameView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/editor/photo/app/menu/FrameView;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 8

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f0902fa

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    const v0, 0x7f10051f

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    const p2, 0x7f090258

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/ui/SimpleRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    const p2, 0x7f09028f

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    new-instance p1, Ljava/util/ArrayList;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mSdkProvider:Lcom/miui/gallery/editor/photo/core/SdkProvider;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->list()Ljava/util/List;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mFrameDataList:Ljava/util/List;

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;-><init>(Landroid/content/Context;)V

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/app/frame/FrameAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mFrameDataList:Ljava/util/List;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Lcom/miui/gallery/editor/photo/app/frame/FrameAdapter;-><init>(Ljava/util/List;Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mFrameAdapter:Lcom/miui/gallery/editor/photo/app/frame/FrameAdapter;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mFrameAdapter:Lcom/miui/gallery/editor/photo/app/frame/FrameAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/app/frame/FrameAdapter;->setOnItemClickListener(Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mFrameAdapter:Lcom/miui/gallery/editor/photo/app/frame/FrameAdapter;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0601a5

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0601a4

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    new-instance v0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, v0

    move v2, v3

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;-><init>(IIIIII)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V

    invoke-direct {p0, p2}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->onSelect(I)V

    return-void
.end method

.method public putStatus(II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->mItemStatusArray:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseIntArray;->put(II)V

    return-void
.end method
