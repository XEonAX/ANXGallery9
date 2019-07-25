.class public Lcom/miui/gallery/video/editor/widget/AdjustView;
.super Landroid/widget/LinearLayout;
.source "AdjustView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;,
        Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/video/editor/adapter/AdjustAdapter;

.field private mAdjustCurrentEffects:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/video/editor/model/AdjustData;",
            ">;"
        }
    .end annotation
.end field

.field private mIAdjustEffectChangeListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;

.field private mIFilterAdjustHeadViewListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;

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

.field private mIsAdjustView:Z

.field private mIsTracking:Z

.field private mRecyclerView:Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView;

.field private mSeekBar:Landroid/widget/SeekBar;

.field private mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field onAdjustItemClickListener:Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$OnItemClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v0, Lcom/miui/gallery/video/editor/widget/AdjustView$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/widget/AdjustView$1;-><init>(Lcom/miui/gallery/video/editor/widget/AdjustView;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    new-instance v0, Lcom/miui/gallery/video/editor/widget/AdjustView$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/widget/AdjustView$2;-><init>(Lcom/miui/gallery/video/editor/widget/AdjustView;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    new-instance v0, Lcom/miui/gallery/video/editor/widget/AdjustView$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/widget/AdjustView$3;-><init>(Lcom/miui/gallery/video/editor/widget/AdjustView;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->onAdjustItemClickListener:Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$OnItemClickListener;

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/widget/AdjustView;->init(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$002(Lcom/miui/gallery/video/editor/widget/AdjustView;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIsTracking:Z

    return p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/video/editor/widget/AdjustView;)Lcom/miui/gallery/video/editor/adapter/AdjustAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/AdjustAdapter;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/video/editor/widget/AdjustView;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mDataList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/video/editor/widget/AdjustView;ILcom/miui/gallery/video/editor/model/AdjustData;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/video/editor/widget/AdjustView;->setEffect(ILcom/miui/gallery/video/editor/model/AdjustData;)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/video/editor/widget/AdjustView;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/AdjustView;->updateHeadBar()V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/video/editor/widget/AdjustView;Lcom/miui/gallery/video/editor/model/AdjustData;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/widget/AdjustView;->performItemSelect(Lcom/miui/gallery/video/editor/model/AdjustData;)V

    return-void
.end method

.method private addNewSeekBar(Lcom/miui/gallery/video/editor/model/AdjustData;)V
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/model/AdjustData;->isMid()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/AdjustView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mSeekBar:Landroid/widget/SeekBar;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/model/AdjustData;->getMax()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMax(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mSeekBar:Landroid/widget/SeekBar;

    iget p1, p1, Lcom/miui/gallery/video/editor/model/AdjustData;->progress:I

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/AdjustView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/model/AdjustData;->getMax()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->setMaxValue(I)V

    iget p1, p1, Lcom/miui/gallery/video/editor/model/AdjustData;->progress:I

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->setCurrentValue(I)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mSeekBar:Landroid/widget/SeekBar;

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIFilterAdjustHeadViewListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIsAdjustView:Z

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIFilterAdjustHeadViewListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mSeekBar:Landroid/widget/SeekBar;

    invoke-interface {p1, v0}, Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;->addSeekBarToHeadBar(Landroid/view/View;)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mSeekBar:Landroid/widget/SeekBar;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 2

    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    const v1, 0x7f0b017d

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/widget/AdjustView;->initData(Landroid/content/Context;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/widget/AdjustView;->initRecyclerView(Landroid/content/Context;)V

    return-void
.end method

.method private initData(Landroid/content/Context;)V
    .locals 4

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mDataList:Ljava/util/List;

    invoke-static {}, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->getAdjustData()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/video/editor/model/FilterAdjustData;

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mDataList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    const v1, 0x7f0b0154

    const/4 v2, 0x0

    invoke-static {p1, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v2, 0x7f060330

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-direct {v0, v1, p1, v2, v3}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;-><init>(Landroid/view/View;ILcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    return-void
.end method

.method private initRecyclerView(Landroid/content/Context;)V
    .locals 8

    const v0, 0x7f090258

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/widget/AdjustView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mRecyclerView:Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView;

    new-instance v0, Lcom/miui/gallery/video/editor/adapter/AdjustAdapter;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mDataList:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/AdjustView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0500f8

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-direct {v2, v3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;-><init>(I)V

    invoke-direct {v0, p1, v1, v2}, Lcom/miui/gallery/video/editor/adapter/AdjustAdapter;-><init>(Landroid/content/Context;Ljava/util/List;Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/AdjustAdapter;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mRecyclerView:Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/AdjustAdapter;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mRecyclerView:Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/AdjustAdapter;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->onAdjustItemClickListener:Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/adapter/AdjustAdapter;->setOnItemClickListener(Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$OnItemClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/AdjustView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f06019d

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/AdjustView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f060198

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mRecyclerView:Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView;

    new-instance v0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, v0

    move v2, v3

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;-><init>(IIIIII)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    return-void
.end method

.method private performItemSelect(Lcom/miui/gallery/video/editor/model/AdjustData;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/AdjustView;->removePreviousSeekBar()V

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/widget/AdjustView;->addNewSeekBar(Lcom/miui/gallery/video/editor/model/AdjustData;)V

    return-void
.end method

.method private removePreviousSeekBar()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;->dismiss()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIFilterAdjustHeadViewListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIFilterAdjustHeadViewListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;

    invoke-interface {v0}, Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;->removeAllViewFromHeadBar()V

    :cond_1
    return-void
.end method

.method private setEffect(ILcom/miui/gallery/video/editor/model/AdjustData;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/AdjustAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/adapter/AdjustAdapter;->getSelection()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIAdjustEffectChangeListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mAdjustCurrentEffects:Ljava/util/HashMap;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mAdjustCurrentEffects:Ljava/util/HashMap;

    :cond_1
    invoke-virtual {p2, p1}, Lcom/miui/gallery/video/editor/model/AdjustData;->setProgress(I)V

    instance-of v0, p2, Lcom/miui/gallery/video/editor/model/FilterAdjustData;

    if-eqz v0, :cond_3

    check-cast p2, Lcom/miui/gallery/video/editor/model/FilterAdjustData;

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mAdjustCurrentEffects:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mAdjustCurrentEffects:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->getLable()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    packed-switch v0, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "not support adjust id: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    iget-object p2, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIAdjustEffectChangeListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;

    invoke-interface {p2, p1}, Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;->adjustVignetteRange(I)V

    goto :goto_0

    :pswitch_1
    iget-object p2, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIAdjustEffectChangeListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;

    invoke-interface {p2, p1}, Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;->adjustSharpness(I)V

    goto :goto_0

    :pswitch_2
    iget-object p2, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIAdjustEffectChangeListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;

    invoke-interface {p2, p1}, Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;->adjustSaturation(I)V

    goto :goto_0

    :pswitch_3
    iget-object p2, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIAdjustEffectChangeListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;

    invoke-interface {p2, p1}, Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;->adjustContrast(I)V

    goto :goto_0

    :pswitch_4
    iget-object p2, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIAdjustEffectChangeListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;

    invoke-interface {p2, p1}, Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;->adjustBrightness(I)V

    :cond_3
    :goto_0
    return-void

    :cond_4
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private updateHeadBar()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIFilterAdjustHeadViewListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIsAdjustView:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIFilterAdjustHeadViewListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;->addFilterViewToHeadBar(Landroid/view/View;)V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/AdjustView;->removePreviousSeekBar()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIFilterAdjustHeadViewListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mSeekBar:Landroid/widget/SeekBar;

    invoke-interface {v0, v1}, Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;->addSeekBarToHeadBar(Landroid/view/View;)V

    :goto_0
    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIsAdjustView:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIsAdjustView:Z

    return-void
.end method


# virtual methods
.method public clearCurrentEffects()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mAdjustCurrentEffects:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mAdjustCurrentEffects:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    :cond_0
    return-void
.end method

.method public doCancel()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mDataList:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mDataList:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    invoke-static {}, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->getAdjustData()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_2

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/video/editor/model/FilterAdjustData;

    if-eqz v1, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mDataList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->getProgress()I

    move-result v2

    invoke-direct {p0, v2, v1}, Lcom/miui/gallery/video/editor/widget/AdjustView;->setEffect(ILcom/miui/gallery/video/editor/model/AdjustData;)V

    goto :goto_0

    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method public getAdjustCurrentEffect()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mAdjustCurrentEffects:Ljava/util/HashMap;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mAdjustCurrentEffects:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_1

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public isTracking()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIsTracking:Z

    return v0
.end method

.method public refreshData()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/AdjustAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mAdapter:Lcom/miui/gallery/video/editor/adapter/AdjustAdapter;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/adapter/AdjustAdapter;->setSelection(I)V

    :cond_0
    return-void
.end method

.method public setIAdjustEffectChangeListener(Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIAdjustEffectChangeListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;

    return-void
.end method

.method public setIFilterAdjustHeadViewListener(Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/AdjustView;->mIFilterAdjustHeadViewListener:Lcom/miui/gallery/video/editor/widget/AdjustView$IFilterAdjustHeadViewListener;

    return-void
.end method
