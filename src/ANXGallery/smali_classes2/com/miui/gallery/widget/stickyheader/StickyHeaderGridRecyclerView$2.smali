.class Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$2;
.super Ljava/lang/Object;
.source "StickyHeaderGridRecyclerView.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$2;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemLongClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJ)Z
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$2;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    iget-object v0, v0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0, p3}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->decryptPosition(I)I

    move-result v4

    iget-object p3, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$2;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    iget-object p3, p3, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p3, v4}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isExtraPosition(I)Z

    move-result p3

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    return v0

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$2;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-static {p3}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->access$100(Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

    move-result-object p3

    if-eqz p3, :cond_1

    iget-object p3, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$2;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-static {p3}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->access$100(Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

    move-result-object v1

    move-object v2, p1

    move-object v3, p2

    move-wide v5, p4

    invoke-interface/range {v1 .. v6}, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;->onItemLongClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJ)Z

    move-result p1

    return p1

    :cond_1
    return v0
.end method
