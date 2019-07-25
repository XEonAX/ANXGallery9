.class public Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;
.super Lcom/miui/gallery/editor/photo/app/MenuFragment;
.source "DoodleMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/app/MenuFragment<",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;",
        "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
        "Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

.field private mDoodleDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;",
            ">;"
        }
    .end annotation
.end field

.field private mDoodlePaintView:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;

.field private mDooodleAdapter:Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;

.field private mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mMenuItemParent:Landroid/widget/LinearLayout;

.field private mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

.field private mOnSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field private mOperationClickListener:Landroid/view/View$OnClickListener;

.field private mOperationPanel:Landroid/view/View;

.field private mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

.field private mPaintViewSelectClickListener:Landroid/view/View$OnClickListener;

.field private mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

.field private mRevert:Landroid/view/View;

.field private mRevoke:Landroid/view/View;

.field private mTitleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->DOODLE:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$2;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/doodle/-$$Lambda$DoodleMenuFragment$ECQv8ge3lJJynIE_Nf3vtpwFwww;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/doodle/-$$Lambda$DoodleMenuFragment$ECQv8ge3lJJynIE_Nf3vtpwFwww;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/doodle/-$$Lambda$DoodleMenuFragment$cB22V5HcCm4Ln_CI534r18lYAMs;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/doodle/-$$Lambda$DoodleMenuFragment$cB22V5HcCm4Ln_CI534r18lYAMs;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mOperationClickListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/doodle/-$$Lambda$DoodleMenuFragment$IkVcgPK6_57hBk2AtHYbye9kCfA;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/doodle/-$$Lambda$DoodleMenuFragment$IkVcgPK6_57hBk2AtHYbye9kCfA;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mPaintViewSelectClickListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$3;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mOnSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mDoodleDataList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mDooodleAdapter:Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mDoodlePaintView:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;

    return-object p0
.end method

.method private initRecyclerView()V
    .locals 10

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    invoke-virtual {v2, v0}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0601af

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    new-instance v2, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v3, v2

    move v4, v5

    invoke-direct/range {v3 .. v9}, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;-><init>(IIIIII)V

    invoke-virtual {v0, v2}, Lcom/miui/gallery/ui/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mSdkProvider:Lcom/miui/gallery/editor/photo/core/SdkProvider;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->list()Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mDoodleDataList:Ljava/util/List;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mDoodleDataList:Ljava/util/List;

    invoke-direct {v0, v2, v3}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mDooodleAdapter:Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mDooodleAdapter:Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mDooodleAdapter:Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;->setOnItemClickListener(Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mDooodleAdapter:Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;->setSelection(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mDooodleAdapter:Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public static synthetic lambda$new$88(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->refreshOperationPanel()V

    return-void
.end method

.method public static synthetic lambda$new$89(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;Landroid/view/View;)V
    .locals 0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;->doRevoke()V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;->doRevert()V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f0901fe
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic lambda$new$90(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;Landroid/view/View;)V
    .locals 1

    check-cast p1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->updateInnerRadiusPercent()V

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->getPaintType()Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;

    move-result-object p1

    iget p1, p1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;->paintSize:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;->setPaintSize(F)V

    return-void
.end method

.method private refreshOperationPanel()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mTitleView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mOperationPanel:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mRevoke:Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;->canRevoke()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mRevert:Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;->canRevert()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Lcom/miui/gallery/editor/photo/app/menu/DoodleView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/editor/photo/app/menu/DoodleView;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f0902fa

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mTitleView:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mTitleView:Landroid/widget/TextView;

    const v0, 0x7f10051c

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    const p2, 0x7f0900e6

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mDoodlePaintView:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mDoodlePaintView:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mPaintViewSelectClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f0901fd

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mOperationPanel:Landroid/view/View;

    const p2, 0x7f0901ff

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mRevoke:Landroid/view/View;

    const p2, 0x7f0901fe

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mRevert:Landroid/view/View;

    const p2, 0x7f090258

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/ui/SimpleRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mRevoke:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mOperationClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mRevert:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mOperationClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mOperationPanel:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mRevoke:Landroid/view/View;

    const v1, 0x3fe66666    # 1.8f

    invoke-static {p2, v0, v1}, Lcom/miui/gallery/util/MiscUtil;->enlargeTouchArea(Landroid/view/View;Landroid/view/View;F)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mOperationPanel:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mRevert:Landroid/view/View;

    invoke-static {p2, v0, v1}, Lcom/miui/gallery/util/MiscUtil;->enlargeTouchArea(Landroid/view/View;Landroid/view/View;F)V

    const p2, 0x7f0900a6

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->COLORS:[I

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;-><init>([I)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    const p2, 0x7f0901cf

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mMenuItemParent:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->initRecyclerView()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const p2, 0x7f0b006b

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060330

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mOnSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-direct {p2, p1, v0, v1, v2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;-><init>(Landroid/view/View;ILcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getMax()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setProgress(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getColor()I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setThumbColor(I)V

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/GradientDrawable;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getColor()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;->setOperationUpdateListener(Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;)V

    return-void
.end method
