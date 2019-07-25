.class Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$1;
.super Ljava/lang/Object;
.source "FilterFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$100(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;->getFilterCategory()I

    move-result p1

    const/4 p2, 0x1

    const/4 v0, 0x7

    if-ne p1, v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->isSkyAvailable()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$202(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;Z)Z

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->getInstance()Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->startDownloadWithCheck(Landroid/app/Activity;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$300(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Landroid/support/v4/view/ViewPager;

    move-result-object p1

    invoke-virtual {p1, p3, p2}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$400(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->setSelectedItemPosition(I)V

    return p2
.end method
