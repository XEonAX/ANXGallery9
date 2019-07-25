.class Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;
.super Landroid/support/v4/view/PagerAdapter;
.source "MovieEditorMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ControllerPagerAdapter"
.end annotation


# instance fields
.field private mAdapters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-direct {p0}, Landroid/support/v4/view/PagerAdapter;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->mAdapters:Ljava/util/List;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->mAdapters:Ljava/util/List;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$100(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->mAdapters:Ljava/util/List;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$200(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->mAdapters:Ljava/util/List;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$300(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    iget-object p3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p3}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$400(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)[Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    move-result-object p3

    aget-object p2, p3, p2

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    return-void
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->mAdapters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 11

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$400(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)[Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    move-result-object v0

    aget-object v0, v0, p2

    if-nez v0, :cond_4

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;-><init>(Landroid/content/Context;)V

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {v2}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$500(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    const v1, 0x7f060381

    const/4 v3, 0x0

    if-nez p2, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->mAdapters:Ljava/util/List;

    invoke-interface {v4, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;

    new-instance v5, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyTemplateItemSelectChangeListener;

    iget-object v6, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-direct {v5, v6, v3}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyTemplateItemSelectChangeListener;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$1;)V

    invoke-virtual {v4, v5}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->setItemSelectChangeListener(Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$ItemSelectChangeListener;)V

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-virtual {v3}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    iget-object v3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-virtual {v3}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f060380

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    :goto_0
    move v6, v1

    move v7, v3

    goto/16 :goto_1

    :cond_0
    const/4 v4, 0x1

    if-ne p2, v4, :cond_1

    iget-object v4, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->mAdapters:Ljava/util/List;

    invoke-interface {v4, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;

    new-instance v5, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyAudioItemSelectChangeListener;

    iget-object v6, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-direct {v5, v6, v3}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyAudioItemSelectChangeListener;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$1;)V

    invoke-virtual {v4, v5}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->setItemSelectChangeListener(Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$ItemSelectChangeListener;)V

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-virtual {v3}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    iget-object v3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-virtual {v3}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f060369

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    goto :goto_0

    :cond_1
    const/4 v1, 0x2

    if-ne p2, v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->mAdapters:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;

    new-instance v4, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;

    iget-object v5, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-direct {v4, v5, v3}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$1;)V

    invoke-virtual {v1, v4}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->setItemSelectChangeListener(Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$ItemSelectChangeListener;)V

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {v1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$300(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->getCallback()Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;)V

    new-instance v1, Landroid/support/v7/widget/DefaultItemAnimator;

    invoke-direct {v1}, Landroid/support/v7/widget/DefaultItemAnimator;-><init>()V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f06037c

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    iget-object v3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-virtual {v3}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f06037b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    goto :goto_0

    :cond_2
    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_1
    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {v1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$400(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)[Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    move-result-object v1

    aput-object v0, v1, p2

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v4, v1

    move v5, v6

    invoke-direct/range {v4 .. v10}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;-><init>(IIIIII)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->mAdapters:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$ControllerPagerAdapter;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {v1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$900(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)I

    move-result v1

    if-ne v1, p2, :cond_3

    goto :goto_2

    :cond_3
    const/4 v2, 0x4

    :goto_2
    invoke-virtual {v0, v2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setVisibility(I)V

    :cond_4
    new-instance p2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {p2, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    if-ne p2, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
