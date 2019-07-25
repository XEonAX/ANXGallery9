.class Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView$1;
.super Ljava/lang/Object;
.source "StickyHeaderRecyclerView.java"

# interfaces
.implements Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->ensureHeaderClickListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView$1;->this$0:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHeaderClick(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;)Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView$1;->this$0:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    iget-object v0, v0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/OnHeaderClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView$1;->this$0:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    iget-object v0, v0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/OnHeaderClickListener;

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView$1;->this$0:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    iget-object v2, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->getHeaderId()J

    move-result-wide v3

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/miui/gallery/widget/stickyheader/core/OnHeaderClickListener;->onHeaderClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;J)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onHeaderLongClick(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;)Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView$1;->this$0:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    iget-object v0, v0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mHeaderLongClickListener:Lcom/miui/gallery/widget/stickyheader/core/OnHeaderLongClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView$1;->this$0:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    iget-object v0, v0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mHeaderLongClickListener:Lcom/miui/gallery/widget/stickyheader/core/OnHeaderLongClickListener;

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView$1;->this$0:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    iget-object v2, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->getHeaderId()J

    move-result-wide v3

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/miui/gallery/widget/stickyheader/core/OnHeaderLongClickListener;->onHeaderLongClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;J)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
