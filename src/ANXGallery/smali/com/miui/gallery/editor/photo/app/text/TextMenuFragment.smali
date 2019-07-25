.class public Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;
.super Lcom/miui/gallery/editor/photo/app/MenuFragment;
.source "TextMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$TextPagerAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/app/MenuFragment<",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;",
        "Lcom/miui/gallery/editor/photo/core/common/provider/AbstractTextProvider;",
        ">;"
    }
.end annotation


# instance fields
.field private mBubbleItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

.field private mRadioGroup:Landroid/widget/RadioGroup;

.field private mTextBubbleAdapter:Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

.field private mTextWatermarkAdapter:Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

.field private mViewPager:Landroid/support/v4/view/ViewPager;

.field private mWatermarkItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->TEXT:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$2;-><init>(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mBubbleItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$3;-><init>(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mWatermarkItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)Landroid/support/v4/view/ViewPager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mViewPager:Landroid/support/v4/view/ViewPager;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mTextBubbleAdapter:Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mTextWatermarkAdapter:Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Lcom/miui/gallery/editor/photo/app/menu/WaterMarkView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/editor/photo/app/menu/WaterMarkView;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    new-instance p2, Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mSdkProvider:Lcom/miui/gallery/editor/photo/core/SdkProvider;

    check-cast v1, Lcom/miui/gallery/editor/photo/core/common/provider/AbstractTextProvider;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/common/provider/AbstractTextProvider;->list()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p2, v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mTextBubbleAdapter:Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mTextBubbleAdapter:Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mBubbleItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;->setOnItemClickListener(Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;)V

    new-instance p2, Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mSdkProvider:Lcom/miui/gallery/editor/photo/core/SdkProvider;

    check-cast v1, Lcom/miui/gallery/editor/photo/core/common/provider/AbstractTextProvider;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/common/provider/AbstractTextProvider;->listWatermark()Ljava/util/List;

    move-result-object v1

    const/4 v3, -0x1

    invoke-direct {p2, v0, v1, v3}, Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mTextWatermarkAdapter:Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mTextWatermarkAdapter:Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mWatermarkItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;->setOnItemClickListener(Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;)V

    const p2, 0x7f0902fa

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    const v0, 0x7f10055a

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    const p2, 0x7f09024f

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/RadioGroup;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mRadioGroup:Landroid/widget/RadioGroup;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mRadioGroup:Landroid/widget/RadioGroup;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)V

    invoke-virtual {p2, v0}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mRadioGroup:Landroid/widget/RadioGroup;

    const v0, 0x7f090248

    invoke-virtual {p2, v0}, Landroid/widget/RadioGroup;->check(I)V

    const p2, 0x7f090346

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v4/view/ViewPager;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mViewPager:Landroid/support/v4/view/ViewPager;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPager;->setOffscreenPageLimit(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mViewPager:Landroid/support/v4/view/ViewPager;

    new-instance p2, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$TextPagerAdapter;

    invoke-direct {p2, p0}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$TextPagerAdapter;-><init>(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)V

    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {p1, v2, v2}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    return-void
.end method
