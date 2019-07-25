.class public Lcom/miui/gallery/widget/stickyheader/StickyHeaderLinearLayoutManager;
.super Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;
.source "StickyHeaderLinearLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<VH:",
        "Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;",
        ">",
        "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager<",
        "TVH;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/RecyclerView;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method


# virtual methods
.method public needOffsetForHeader(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderLinearLayoutManager;->isReady()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p1

    add-int/lit8 v0, p1, -0x1

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderLinearLayoutManager;->hasDifferentHeader(II)Z

    move-result p1

    return p1

    :cond_2
    :goto_0
    const-string p1, "StickyHeaderLinearLayoutManager"

    const-string v0, "the holder is invalid"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v1
.end method
