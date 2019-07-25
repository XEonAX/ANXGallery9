.class Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$TextPagerAdapter;
.super Landroid/support/v4/view/PagerAdapter;
.source "TextMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TextPagerAdapter"
.end annotation


# instance fields
.field private mAdapterList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$TextPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;

    invoke-direct {p0}, Landroid/support/v4/view/PagerAdapter;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$TextPagerAdapter;->mAdapterList:Ljava/util/List;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$TextPagerAdapter;->mAdapterList:Ljava/util/List;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->access$100(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$TextPagerAdapter;->mAdapterList:Ljava/util/List;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->access$300(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
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

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$TextPagerAdapter;->mAdapterList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 3

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$TextPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;-><init>(Landroid/content/Context;)V

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$TextPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$TextPagerAdapter;->mAdapterList:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$TextPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v1, 0x7f0601eb

    invoke-direct {p1, p2, v1, v2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;-><init>(Landroid/content/res/Resources;II)V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

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
