.class public Lcom/miui/gallery/widget/stickyheader/StickyHeaderSpacingDecoration;
.super Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;
.source "StickyHeaderSpacingDecoration.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration<",
        "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;-><init>(Landroid/support/v7/widget/RecyclerView;Z)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic hasHeader(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)Z
    .locals 0

    check-cast p1, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderSpacingDecoration;->hasHeader(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;Landroid/view/View;)Z

    move-result p1

    return p1
.end method

.method protected hasHeader(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;Landroid/view/View;)Z
    .locals 0

    if-eqz p1, :cond_0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object p2

    invoke-virtual {p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->getStickyHeaderLayoutManager()Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->needOffsetForHeader(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
