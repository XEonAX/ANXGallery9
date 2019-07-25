.class Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;
.super Landroid/support/v4/view/PagerAdapter;
.source "FilterFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FilterPagerAdapter"
.end annotation


# instance fields
.field private mFilterAdapters:[Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;

.field private mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-direct {p0}, Landroid/support/v4/view/PagerAdapter;-><init>()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$100(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    new-array p1, p1, [Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->mFilterAdapters:[Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;

    new-instance p1, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;-><init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;-><init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->doSelectSky(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;I)V

    return-void
.end method

.method static synthetic access$1400(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->doSelectRender(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;I)V

    return-void
.end method

.method private clearOtherSelector()V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->mFilterAdapters:[Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;

    array-length v2, v2

    if-ge v1, v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$300(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Landroid/support/v4/view/ViewPager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v2

    if-eq v1, v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->mFilterAdapters:[Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;

    aget-object v2, v2, v1

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$900(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$900(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->isNone()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->mFilterAdapters:[Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;

    aget-object v2, v2, v1

    invoke-virtual {v2, v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->setSelectedIndex(I)V

    goto :goto_1

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->mFilterAdapters:[Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->clearSelected()V

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private doSelectRender(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    iget v1, p1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->progress:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$1600(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;Lcom/miui/gallery/editor/photo/core/common/model/FilterData;Ljava/lang/Object;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->setSelectedIndex(I)V

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p3, p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$902(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;Lcom/miui/gallery/editor/photo/core/common/model/FilterData;)Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->isInEditMode()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->isNone()Z

    move-result p2

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$1000(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Landroid/widget/SeekBar;

    move-result-object p2

    iget p1, p1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->progress:I

    invoke-virtual {p2, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->clearOtherSelector()V

    return-void
.end method

.method private doSelectSky(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$1500(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const p2, 0x7f1003ef

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->doSelectRender(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;I)V

    :goto_0
    return-void
.end method

.method private findSelected(Ljava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/FilterData;",
            ">;)I"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$900(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$900(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->isNone()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_2

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$900(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$900(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    move-result-object v0

    iget v0, v0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->progress:I

    iput v0, p1, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->progress:I

    return v1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, -0x1

    return p1

    :cond_3
    :goto_1
    return v1
.end method

.method private getCurrentAdapter()Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->mFilterAdapters:[Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$300(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Landroid/support/v4/view/ViewPager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    check-cast p3, Landroid/view/View;

    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    return-void
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$100(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 7

    new-instance v0, Lcom/miui/gallery/ui/SimpleRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/ui/SimpleRecyclerView;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$100(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;->getFilterDatas()Ljava/util/List;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v3, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    new-instance v2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    invoke-virtual {v0, v2}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    new-instance v2, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;

    iget v5, v1, Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;->highlighColor:I

    iget v6, v1, Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;->subHighlighColor:I

    iget v1, v1, Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;->subItemSize:I

    invoke-direct {v2, v3, v5, v6, v1}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;-><init>(Ljava/util/List;III)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {v2, v1}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->setOnItemClickListener(Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;)V

    invoke-direct {p0, v3}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->findSelected(Ljava/util/List;)I

    move-result v1

    invoke-virtual {v2, v1}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->setSelectedIndex(I)V

    invoke-virtual {v0, v2}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    new-instance v1, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v5, 0x7f060196

    invoke-direct {v1, v3, v5, v4}, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;-><init>(Landroid/content/res/Resources;II)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->mFilterAdapters:[Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;

    aput-object v2, p1, p2

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V

    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public updateProgressValue(I)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->getCurrentAdapter()Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->update(I)V

    :cond_0
    return-void
.end method
