.class Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;
.super Landroid/support/v4/view/PagerAdapter;
.source "StickerMenuFragment.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StickerPagerAdapter"
.end annotation


# instance fields
.field private mProvider:Lcom/miui/gallery/editor/photo/core/common/provider/AbstractStickerProvider;

.field private mViewMapping:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/support/v7/widget/RecyclerView;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;

    invoke-direct {p0}, Landroid/support/v4/view/PagerAdapter;-><init>()V

    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->mViewMapping:Landroid/util/SparseArray;

    sget-object p1, Lcom/miui/gallery/editor/photo/core/SdkManager;->INSTANCE:Lcom/miui/gallery/editor/photo/core/SdkManager;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->STICKER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/SdkManager;->getProvider(Lcom/miui/gallery/editor/photo/core/Effect;)Lcom/miui/gallery/editor/photo/core/SdkProvider;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/provider/AbstractStickerProvider;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->mProvider:Lcom/miui/gallery/editor/photo/core/common/provider/AbstractStickerProvider;

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    check-cast p3, Landroid/view/View;

    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->mViewMapping:Landroid/util/SparseArray;

    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->remove(I)V

    return-void
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;->access$400(Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 8

    new-instance v0, Lcom/miui/gallery/ui/SimpleRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/ui/SimpleRecyclerView;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;->access$400(Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/common/model/StickerCategory;

    new-instance v2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    invoke-virtual {v0, v2}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-wide v4, v1, Lcom/miui/gallery/editor/photo/core/common/model/StickerCategory;->id:J

    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long p1, v4, v6

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->mProvider:Lcom/miui/gallery/editor/photo/core/common/provider/AbstractStickerProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/common/provider/AbstractStickerProvider;->recent()Ljava/util/List;

    move-result-object p1

    const-string v1, "recent_tag"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->mProvider:Lcom/miui/gallery/editor/photo/core/common/provider/AbstractStickerProvider;

    iget-wide v1, v1, Lcom/miui/gallery/editor/photo/core/common/model/StickerCategory;->id:J

    invoke-virtual {p1, v1, v2}, Lcom/miui/gallery/editor/photo/core/common/provider/AbstractStickerProvider;->list(J)Ljava/util/List;

    move-result-object p1

    :goto_0
    new-instance v1, Lcom/miui/gallery/editor/photo/app/sticker/CategoryDetailAdapter;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lcom/miui/gallery/editor/photo/app/sticker/CategoryDetailAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;->access$500(Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;)Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/app/sticker/CategoryDetailAdapter;->setOnItemClickListener(Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;)V

    new-instance p1, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0601dd

    invoke-direct {p1, v1, v2, v3}, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;-><init>(Landroid/content/res/Resources;II)V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->mViewMapping:Landroid/util/SparseArray;

    invoke-virtual {p1, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

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

.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->mViewMapping:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    if-eqz p1, :cond_0

    const-string v0, "recent_tag"

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/app/sticker/CategoryDetailAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$StickerPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;->access$600(Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;)Lcom/miui/gallery/editor/photo/core/SdkProvider;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/provider/AbstractStickerProvider;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/common/provider/AbstractStickerProvider;->recent()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/app/sticker/CategoryDetailAdapter;->setDataList(Ljava/util/List;)V

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/sticker/CategoryDetailAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method
