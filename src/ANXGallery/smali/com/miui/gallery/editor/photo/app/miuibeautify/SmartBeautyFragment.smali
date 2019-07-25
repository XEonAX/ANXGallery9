.class public Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;
.super Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;
.source "SmartBeautyFragment.java"


# instance fields
.field private mBeautyLevelAdapter:Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;

.field private mLevelItemList:Lcom/miui/gallery/ui/SimpleRecyclerView;

.field private mListItemClickable:Z

.field private mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mListItemClickable:Z

    new-instance v0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mListItemClickable:Z

    return p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;)Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mBeautyLevelAdapter:Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;

    return-object p0
.end method

.method private initView(Landroid/view/View;)V
    .locals 8

    const v0, 0x7f09005d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/SimpleRecyclerView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mLevelItemList:Lcom/miui/gallery/ui/SimpleRecyclerView;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;

    const v1, 0x7f070184

    const v2, 0x7f070185

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;-><init>(II)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;

    const v1, 0x7f070186

    const v2, 0x7f070187

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;-><init>(II)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;

    const v1, 0x7f070188

    const v2, 0x7f070189

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;-><init>(II)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;

    const v1, 0x7f07018a

    const v2, 0x7f07018b

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;-><init>(II)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;

    const v1, 0x7f07018c

    const v2, 0x7f07018d

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;-><init>(II)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;

    const v1, 0x7f07018e

    const v2, 0x7f07018f

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;-><init>(II)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mBeautyLevelAdapter:Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mLevelItemList:Lcom/miui/gallery/ui/SimpleRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mBeautyLevelAdapter:Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mBeautyLevelAdapter:Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->setOnItemClickListener(Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mBeautyLevelAdapter:Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->notifyDataSetChanged()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment$Callbacks;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f10052e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment$Callbacks;->changeTitle(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-interface {p1, v0, v0, v1}, Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;->OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f060145

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f060143

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mLevelItemList:Lcom/miui/gallery/ui/SimpleRecyclerView;

    new-instance v0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, v0

    move v2, v3

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;-><init>(IIIIII)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    return-void
.end method


# virtual methods
.method public onBeautyProcessEnd()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;->onBeautyProcessEnd()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mListItemClickable:Z

    return-void
.end method

.method public onBeautyProcessStart()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;->onBeautyProcessStart()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->mListItemClickable:Z

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0086

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;->initView(Landroid/view/View;)V

    return-object p1
.end method
