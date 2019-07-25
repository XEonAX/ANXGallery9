.class public Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;
.super Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseMenuFragment;
.source "ScreenTextMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseMenuFragment<",
        "Lcom/miui/gallery/editor/photo/screen/text/IScreenTextOperation;",
        ">;"
    }
.end annotation


# instance fields
.field private mBubbleItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

.field private mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

.field private mScreenTextBubbleAdapter:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextBubbleAdapter;

.field private mTextDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/TextData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseMenuFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment$1;-><init>(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->mBubbleItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;)Lcom/miui/gallery/editor/photo/screen/text/ScreenTextBubbleAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->mScreenTextBubbleAdapter:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextBubbleAdapter;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;)Lcom/miui/gallery/editor/photo/screen/base/IScreenOperation;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->mScreenOperation:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperation;

    return-object p0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseMenuFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/text/TextManager;->getScreenTextBubbleData()Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->mTextDataList:Ljava/util/List;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0135

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 8

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseMenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f09022b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextBubbleAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->mTextDataList:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->mScreenOperation:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperation;

    check-cast v1, Lcom/miui/gallery/editor/photo/screen/text/IScreenTextOperation;

    invoke-interface {v1}, Lcom/miui/gallery/editor/photo/screen/text/IScreenTextOperation;->getCurrentMenuItemIndex()I

    move-result v1

    invoke-direct {p1, p2, v0, v1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextBubbleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->mScreenTextBubbleAdapter:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextBubbleAdapter;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->mScreenTextBubbleAdapter:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextBubbleAdapter;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->mBubbleItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextBubbleAdapter;->setOnItemClickListener(Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->mScreenTextBubbleAdapter:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextBubbleAdapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f060408

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->mTextDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    int-to-float v0, v0

    mul-float p2, p2, v0

    sub-float/2addr p1, p2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f060409

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->mTextDataList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    int-to-float v1, v1

    mul-float p2, p2, v1

    sub-float/2addr p1, p2

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p1, p2

    float-to-int v2, p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    float-to-int v4, p1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p2

    move v3, v4

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;-><init>(IIIIII)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    return-void
.end method
