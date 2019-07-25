.class public Lcom/miui/gallery/video/editor/widget/FilterView;
.super Landroid/widget/LinearLayout;
.source "FilterView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/editor/widget/FilterView$OnItemSelectedListener;,
        Lcom/miui/gallery/video/editor/widget/FilterView$MyFilterItemSelectChangeListener;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;

.field private mFilters:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/video/editor/Filter;",
            ">;"
        }
    .end annotation
.end field

.field private mItemSelectedListener:Lcom/miui/gallery/video/editor/widget/FilterView$OnItemSelectedListener;

.field private mLinearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field private mSingleChoiceRecycleView:Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mFilters:Ljava/util/ArrayList;

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/widget/FilterView;->init(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/video/editor/widget/FilterView;)Lcom/miui/gallery/video/editor/widget/FilterView$OnItemSelectedListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mItemSelectedListener:Lcom/miui/gallery/video/editor/widget/FilterView$OnItemSelectedListener;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/video/editor/widget/FilterView;)Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mSingleChoiceRecycleView:Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    return-object p0
.end method

.method private init(Landroid/content/Context;)V
    .locals 2

    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    const v1, 0x7f0b0183

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/FilterView;->initData()V

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/widget/FilterView;->initRecyclerView(Landroid/content/Context;)V

    return-void
.end method

.method private initRecyclerView(Landroid/content/Context;)V
    .locals 4

    const v0, 0x7f090258

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/widget/FilterView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mSingleChoiceRecycleView:Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mLinearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mSingleChoiceRecycleView:Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mLinearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    new-instance v0, Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mFilters:Ljava/util/ArrayList;

    invoke-direct {v0, p1, v2}, Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;

    new-instance v0, Lcom/miui/gallery/video/editor/widget/FilterView$MyFilterItemSelectChangeListener;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/miui/gallery/video/editor/widget/FilterView$MyFilterItemSelectChangeListener;-><init>(Lcom/miui/gallery/video/editor/widget/FilterView;Lcom/miui/gallery/video/editor/widget/FilterView$1;)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;->setItemSelectChangeListener(Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$ItemSelectChangeListener;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mSingleChoiceRecycleView:Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mSingleChoiceRecycleView:Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    new-instance v0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/FilterView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f060196

    invoke-direct {v0, v2, v3, v1}, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;-><init>(Landroid/content/res/Resources;II)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mSingleChoiceRecycleView:Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method


# virtual methods
.method public getFilterCurrentEffect()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/FilterView;->getSelectedFilter()Lcom/miui/gallery/video/editor/Filter;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/Filter;->getLabel()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSelectedFilter()Lcom/miui/gallery/video/editor/Filter;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;->getSelectedItemPosition()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;->getFilter(I)Lcom/miui/gallery/video/editor/Filter;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getSelectedItemPosition()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;->getSelectedItemPosition()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public initData()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->getFilterData()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mFilters:Ljava/util/ArrayList;

    return-void
.end method

.method public setItemSelectedListener(Lcom/miui/gallery/video/editor/widget/FilterView$OnItemSelectedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mItemSelectedListener:Lcom/miui/gallery/video/editor/widget/FilterView$OnItemSelectedListener;

    return-void
.end method

.method public updateSelectedItemPosition(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, -0x1

    if-ne p1, v0, :cond_2

    invoke-static {}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->isRTLDirection()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mFilters:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;->setSelectedItemPosition(I)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;->setSelectedItemPosition(I)V

    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/FilterView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/adapter/FilterRecyclerViewAdapter;->setSelectedItemPosition(I)V

    return-void
.end method
