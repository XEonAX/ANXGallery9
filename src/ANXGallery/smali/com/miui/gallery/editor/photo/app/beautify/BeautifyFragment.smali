.class public Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;
.super Lcom/miui/gallery/editor/photo/app/MenuFragment;
.source "BeautifyFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/app/MenuFragment<",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;",
        "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
        "Lcom/miui/gallery/editor/photo/core/common/model/BeautifyData;",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/editor/photo/app/beautify/BeautifyAdapter;

.field private mDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/BeautifyData;",
            ">;"
        }
    .end annotation
.end field

.field private mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

.field private mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

.field private mTitle:Landroid/widget/TextView;

.field private mValues:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->BEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;)Lcom/miui/gallery/editor/photo/app/beautify/BeautifyAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/beautify/BeautifyAdapter;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;)[I
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mValues:[I

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;IIZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->performItemSelect(IIZ)V

    return-void
.end method

.method private doRender(Lcom/miui/gallery/editor/photo/core/Metadata;Ljava/lang/Object;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->clear()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->add(Lcom/miui/gallery/editor/photo/core/Metadata;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->render()V

    return-void
.end method

.method private performItemSelect(IIZ)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mDataList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/model/BeautifyData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/beautify/BeautifyAdapter;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyAdapter;->setSelection(I)V

    if-nez p3, :cond_0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->doRender(Lcom/miui/gallery/editor/photo/core/Metadata;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mSdkProvider:Lcom/miui/gallery/editor/photo/core/SdkProvider;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->list()Ljava/util/List;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mDataList:Ljava/util/List;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Lcom/miui/gallery/editor/photo/app/menu/BeautifyView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/editor/photo/app/menu/BeautifyView;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 8

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mDataList:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    new-array p2, p2, [I

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mValues:[I

    const p2, 0x7f090258

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/ui/SimpleRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    new-instance p2, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mDataList:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0500f8

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-direct {v2, v3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;-><init>(I)V

    invoke-direct {p2, v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyAdapter;-><init>(Landroid/content/Context;Ljava/util/List;Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/beautify/BeautifyAdapter;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/beautify/BeautifyAdapter;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/beautify/BeautifyAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyAdapter;->setOnItemClickListener(Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f060534

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f060532

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    new-instance v0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, v0

    move v2, v3

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;-><init>(IIIIII)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/ui/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    const p2, 0x7f0902fa

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mTitle:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->mTitle:Landroid/widget/TextView;

    const p2, 0x7f100513

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    const/4 p1, 0x0

    const/4 p2, 0x1

    invoke-direct {p0, p2, p1, p1}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->performItemSelect(IIZ)V

    return-void
.end method
