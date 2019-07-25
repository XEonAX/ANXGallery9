.class public Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;
.super Lcom/miui/gallery/editor/photo/app/MenuFragment;
.source "AdjustMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/app/MenuFragment<",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;",
        "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
        "Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;

.field private mDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;",
            ">;"
        }
    .end annotation
.end field

.field private mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field private mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field private mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

.field private mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

.field private mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field private mTitle:Landroid/widget/TextView;

.field private mTopPanel:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->ADJUST:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment$2;-><init>(Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment$3;-><init>(Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;)Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;IZ)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->performItemSelect(IZ)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->doConfig(I)V

    return-void
.end method

.method private doConfig(I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->getSelection()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const-string p1, "AdjustMenuFragment"

    const-string v0, "no effect rendered, skip"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v0, "AdjustMenuFragment"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AdjustData progress:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mDataList:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->getSelection()I

    move-result v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;

    iput p1, v0, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;->progress:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->remove(Lcom/miui/gallery/editor/photo/core/Metadata;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->add(Lcom/miui/gallery/editor/photo/core/Metadata;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->render()V

    return-void
.end method

.method private doRender(Lcom/miui/gallery/editor/photo/core/Metadata;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->remove(Lcom/miui/gallery/editor/photo/core/Metadata;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->add(Lcom/miui/gallery/editor/photo/core/Metadata;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->render()V

    return-void
.end method

.method private performItemSelect(IZ)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mDataList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;

    if-nez p2, :cond_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->doRender(Lcom/miui/gallery/editor/photo/core/Metadata;)V

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->setSelection(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->isShowing()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->dismiss()V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mTopPanel:Landroid/widget/LinearLayout;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/SeekBar;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mTopPanel:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    :cond_2
    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;->isMid()Z

    move-result p1

    if-nez p1, :cond_3

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;->getMax()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setMax(I)V

    iget p2, v0, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;->progress:I

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setProgress(I)V

    goto :goto_0

    :cond_3
    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;->getMax()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->setMaxValue(I)V

    iget p2, v0, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;->progress:I

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->setCurrentValue(I)V

    :goto_0
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mTopPanel:Landroid/widget/LinearLayout;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-virtual {p2, p1, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    iget v0, v0, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;->progress:I

    const/4 v1, 0x1

    invoke-virtual {p2, p1, v0, v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->onProgressChanged(Landroid/widget/SeekBar;IZ)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mSdkProvider:Lcom/miui/gallery/editor/photo/core/SdkProvider;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->list()Ljava/util/List;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mDataList:Ljava/util/List;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Lcom/miui/gallery/editor/photo/app/menu/AdjustView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/editor/photo/app/menu/AdjustView;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 7

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f090305

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mTopPanel:Landroid/widget/LinearLayout;

    const p2, 0x7f090258

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/ui/SimpleRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    new-instance p2, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mDataList:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0500f8

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-direct {v2, v3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;-><init>(I)V

    invoke-direct {p2, v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;-><init>(Landroid/content/Context;Ljava/util/List;Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->setOnItemClickListener(Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;)V

    const p2, 0x7f0902fa

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mTitle:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mTitle:Landroid/widget/TextView;

    const p2, 0x7f100512

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f060155

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f060152

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    new-instance p2, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p2

    move v1, v2

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;-><init>(IIIIII)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    const v0, 0x7f0b0154

    const/4 v1, 0x0

    invoke-static {p2, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060330

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-direct {p1, p2, v0, v1, v2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;-><init>(Landroid/view/View;ILcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    const/4 p1, 0x0

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->performItemSelect(IZ)V

    return-void
.end method
