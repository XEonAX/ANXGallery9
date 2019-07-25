.class Lcom/miui/gallery/ui/HomePageFragment$4;
.super Lcom/miui/gallery/widget/recyclerview/transition/TransitionListenerAdapter;
.source "HomePageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/HomePageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/HomePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/HomePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onTransitionEnd(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;Z)V
    .locals 1

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p3}, Lcom/miui/gallery/ui/HomePageFragment;->access$800(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/TwoStageDrawer;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/miui/gallery/widget/TwoStageDrawer;->removeView(Landroid/view/View;)V

    invoke-static {p1, v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->setRecycleChildVisibility(Landroid/support/v7/widget/RecyclerView;I)V

    check-cast p1, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setHeaderVisibility(I)V

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    move-object p1, p2

    check-cast p1, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setHeaderVisibility(I)V

    invoke-static {p2, v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->setRecycleChildVisibility(Landroid/support/v7/widget/RecyclerView;I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$800(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/TwoStageDrawer;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/TwoStageDrawer;->setTargetView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$800(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/TwoStageDrawer;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/TwoStageDrawer;->setScrollableView(Landroid/view/View;)V

    const-string p1, "list_view"

    const-string p2, "list_view_enter_month"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GalleryStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-static {p1, v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->setRecycleChildVisibility(Landroid/support/v7/widget/RecyclerView;I)V

    check-cast p1, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setHeaderVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$800(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/TwoStageDrawer;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/TwoStageDrawer;->removeView(Landroid/view/View;)V

    :goto_0
    return-void
.end method

.method public onTransitionPrepare(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IFF)Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;
    .locals 7

    iget-object p3, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p3}, Lcom/miui/gallery/ui/HomePageFragment;->access$400(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    move-result-object p3

    invoke-virtual {p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->isInActionMode()Z

    move-result p3

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    return-object v0

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p3}, Lcom/miui/gallery/ui/HomePageFragment;->access$500(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    move-result-object p3

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-ne p1, p3, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$600(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$600(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    move-result-object p1

    iget-object p3, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p3}, Lcom/miui/gallery/ui/HomePageFragment;->access$700(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/MediaMonthAdapter;

    move-result-object p3

    invoke-virtual {p1, p3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$600(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    move-result-object p1

    iget-object p3, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p3}, Lcom/miui/gallery/ui/HomePageFragment;->access$700(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/MediaMonthAdapter;

    move-result-object p3

    invoke-virtual {p1, p3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$600(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    move-result-object p1

    new-instance p3, Lcom/miui/gallery/widget/stickyheader/StickyHeaderLinearLayoutManager;

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/HomePageFragment;->access$600(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    move-result-object v3

    invoke-direct {p3, v3}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderLinearLayoutManager;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    invoke-virtual {p1, p3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setStickyHeaderLayoutManager(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$600(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    move-result-object p1

    new-instance p3, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    iget-object v3, v3, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p3, v3}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, p3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$500(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    move-result-object p1

    invoke-static {p1, p4, p5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->findClosestViewUnder(Landroid/support/v7/widget/RecyclerView;FF)Landroid/view/View;

    move-result-object p1

    iget-object p3, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p3}, Lcom/miui/gallery/ui/HomePageFragment;->access$500(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->getChildAdapterPositionForExternal(Landroid/view/View;)I

    move-result p3

    if-ne p3, v1, :cond_2

    const-string p2, "HomePageFragment"

    const-string p3, "can\'t find the position of item %s"

    invoke-static {p2, p3, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0

    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p1

    iget-object p4, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p4}, Lcom/miui/gallery/ui/HomePageFragment;->access$000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/HomePageAdapter;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/miui/gallery/adapter/HomePageAdapter;->packageFuzzyMatchItem(I)Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;

    move-result-object p3

    iget-object p4, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p4}, Lcom/miui/gallery/ui/HomePageFragment;->access$700(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/MediaMonthAdapter;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->findFuzzyMatchItem(Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;)Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;

    move-result-object p4

    if-nez p4, :cond_3

    const-string p1, "HomePageFragment"

    const-string p2, "can\'t find fuzzy math item from month adapter, maybe the data hasn\'t loaded"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_3
    iget-object p5, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p5}, Lcom/miui/gallery/ui/HomePageFragment;->access$700(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/MediaMonthAdapter;

    move-result-object p5

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/HomePageFragment;->access$500(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->getWidth()I

    move-result v3

    iget v4, p4, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mPosition:I

    iget-wide v5, p4, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mId:J

    invoke-virtual {p5, v3, v4, v5, v6}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->estimateItemFrame(IIJ)Landroid/graphics/Rect;

    move-result-object p5

    if-nez p5, :cond_4

    const-string p1, "HomePageFragment"

    const-string p2, "can\'t find estimate item, maybe the data hasn\'t loaded"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_4
    iget p5, p5, Landroid/graphics/Rect;->top:I

    sub-int/2addr p1, p5

    goto/16 :goto_1

    :cond_5
    iget-object p3, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p3}, Lcom/miui/gallery/ui/HomePageFragment;->access$600(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    move-result-object p3

    if-ne p1, p3, :cond_9

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$600(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    move-result-object p1

    invoke-static {p1, p4, p5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->findClosestViewUnder(Landroid/support/v7/widget/RecyclerView;FF)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/MonthView;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/MonthView;->getLeft()I

    move-result p3

    int-to-float p3, p3

    sub-float/2addr p4, p3

    invoke-virtual {p1}, Lcom/miui/gallery/ui/MonthView;->getTop()I

    move-result p3

    int-to-float p3, p3

    sub-float/2addr p5, p3

    invoke-virtual {p1, p4, p5}, Lcom/miui/gallery/ui/MonthView;->findClosestMatchItemUnder(FF)Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;

    move-result-object p3

    iget-wide p4, p3, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mId:J

    invoke-virtual {p1, p4, p5}, Lcom/miui/gallery/ui/MonthView;->getItemFrame(J)Landroid/graphics/Rect;

    move-result-object p4

    invoke-virtual {p1}, Lcom/miui/gallery/ui/MonthView;->getTop()I

    move-result p1

    iget p4, p4, Landroid/graphics/Rect;->bottom:I

    add-int/2addr p1, p4

    iget-object p4, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p4}, Lcom/miui/gallery/ui/HomePageFragment;->access$000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/HomePageAdapter;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/miui/gallery/adapter/HomePageAdapter;->findFuzzyMatchItem(Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;)Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;

    move-result-object p4

    if-nez p4, :cond_6

    const-string p1, "HomePageFragment"

    const-string p2, "can\'t find fuzzy math item from home adapter, maybe the data hasn\'t loaded"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_6
    iget-object p5, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p5}, Lcom/miui/gallery/ui/HomePageFragment;->access$500(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    move-result-object p5

    invoke-virtual {p5}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->getChildCount()I

    move-result p5

    if-lez p5, :cond_7

    iget-object p5, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p5}, Lcom/miui/gallery/ui/HomePageFragment;->access$500(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    move-result-object p5

    invoke-virtual {p5, v2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    :cond_7
    if-eqz v0, :cond_8

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result p5

    goto :goto_0

    :cond_8
    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p5

    iget-object p5, p5, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual {p5}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getHeight()I

    move-result p5

    :goto_0
    sub-int/2addr p1, p5

    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result p1

    goto :goto_1

    :cond_9
    move-object p3, v0

    move-object p4, p3

    const/4 p1, 0x0

    :goto_1
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object p5

    if-nez p5, :cond_a

    iget-object p5, p0, Lcom/miui/gallery/ui/HomePageFragment$4;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p5}, Lcom/miui/gallery/ui/HomePageFragment;->access$800(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/TwoStageDrawer;

    move-result-object p5

    invoke-virtual {p5, p2, v2}, Lcom/miui/gallery/widget/TwoStageDrawer;->addView(Landroid/view/View;I)V

    :cond_a
    const/4 p5, 0x4

    invoke-virtual {p2, p5}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    if-eqz p4, :cond_b

    iget p5, p4, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mPosition:I

    if-eq p5, v1, :cond_b

    move-object p5, p2

    check-cast p5, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    iget v0, p4, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mPosition:I

    invoke-virtual {p5, v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->scrollToPositionWithOffset(II)V

    :cond_b
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->invalidateItemDecorations()V

    new-instance p1, Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;

    iget-wide p2, p3, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mId:J

    iget-wide p4, p4, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mId:J

    invoke-direct {p1, p2, p3, p4, p5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;-><init>(JJ)V

    return-object p1
.end method

.method public onTransitionUpdate(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;F)V
    .locals 3

    move-object p3, p1

    check-cast p3, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    invoke-virtual {p3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->getHeaderVisibility()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-nez v0, :cond_0

    invoke-static {p1, v2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->setRecycleChildVisibility(Landroid/support/v7/widget/RecyclerView;I)V

    invoke-virtual {p3, v2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setHeaderVisibility(I)V

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    :cond_0
    move-object p1, p2

    check-cast p1, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->getHeaderVisibility()I

    move-result p3

    if-eqz p3, :cond_1

    invoke-virtual {p2, v2}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    invoke-virtual {p1, v1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setHeaderVisibility(I)V

    invoke-static {p2, v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->setRecycleChildVisibility(Landroid/support/v7/widget/RecyclerView;I)V

    :cond_1
    return-void
.end method
