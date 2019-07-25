.class Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;
.super Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;
.source "ExtendedRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RecyclerViewDataObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;->this$0:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;-><init>(Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;)V

    return-void
.end method

.method private update()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;->this$0:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    iget-object v0, v0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;->this$0:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    iget-object v0, v0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;->this$0:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    invoke-static {v0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->access$100(Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;->this$0:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    invoke-static {v0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->access$200(Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 0

    invoke-super {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onChanged()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;->update()V

    return-void
.end method

.method public onItemRangeChanged(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeChanged(II)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;->update()V

    return-void
.end method

.method public onItemRangeInserted(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeInserted(II)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;->update()V

    return-void
.end method

.method public onItemRangeMoved(III)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeMoved(III)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;->update()V

    return-void
.end method

.method public onItemRangeRemoved(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeRemoved(II)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;->update()V

    return-void
.end method
