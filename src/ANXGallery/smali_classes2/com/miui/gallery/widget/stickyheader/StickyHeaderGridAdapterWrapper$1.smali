.class Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;
.super Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;
.source "StickyHeaderGridAdapterWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;-><init>(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$Adapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;-><init>()V

    return-void
.end method

.method private encryptItemCount(II)I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->encryptPosition(I)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    add-int/2addr p1, p2

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {v1, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->encryptPosition(I)I

    move-result p1

    sub-int/2addr p1, v0

    add-int/lit8 p1, p1, 0x1

    return p1
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->generateData()V

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->notifyDataSetChanged()V

    return-void
.end method

.method public onItemRangeChanged(II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->encryptPosition(I)I

    move-result v0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->encryptItemCount(II)I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->generateData()V

    iget-object p2, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p2, v0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->notifyItemRangeChanged(II)V

    return-void
.end method

.method public onItemRangeChanged(IILjava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->encryptPosition(I)I

    move-result v0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->encryptItemCount(II)I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->generateData()V

    iget-object p2, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p2, v0, p1, p3}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->notifyItemRangeChanged(IILjava/lang/Object;)V

    return-void
.end method

.method public onItemRangeInserted(II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->encryptPosition(I)I

    move-result v0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->encryptItemCount(II)I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->generateData()V

    iget-object p2, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p2, v0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->notifyItemRangeInserted(II)V

    return-void
.end method

.method public onItemRangeMoved(III)V
    .locals 0

    iget-object p3, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p3, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->encryptPosition(I)I

    move-result p1

    iget-object p3, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p3, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->encryptPosition(I)I

    move-result p2

    iget-object p3, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p3}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->generateData()V

    iget-object p3, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p3, p1, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->notifyItemMoved(II)V

    return-void
.end method

.method public onItemRangeRemoved(II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->encryptPosition(I)I

    move-result v0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->encryptItemCount(II)I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->generateData()V

    iget-object p2, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;->this$0:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p2, v0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->notifyItemRangeRemoved(II)V

    return-void
.end method
