.class Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$1;
.super Ljava/lang/Object;
.source "StickyHeaderGridRecyclerView.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;


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

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z
    .locals 10

    move-object v0, p0

    iget-object v1, v0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    iget-object v1, v1, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    move v2, p3

    invoke-virtual {v1, p3}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->decryptPosition(I)I

    move-result v5

    iget-object v1, v0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    iget-object v1, v1, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v1, v5}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isExtraPosition(I)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return v2

    :cond_0
    iget-object v1, v0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-static {v1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->access$000(Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-static {v1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->access$000(Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

    move-result-object v2

    move-object v3, p1

    move-object v4, p2

    move-wide v6, p4

    move/from16 v8, p6

    move/from16 v9, p7

    invoke-interface/range {v2 .. v9}, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;->onItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z

    move-result v1

    return v1

    :cond_1
    return v2
.end method
