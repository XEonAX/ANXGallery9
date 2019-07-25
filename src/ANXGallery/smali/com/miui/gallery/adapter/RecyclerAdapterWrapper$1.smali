.class Lcom/miui/gallery/adapter/RecyclerAdapterWrapper$1;
.super Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;
.source "RecyclerAdapterWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;-><init>(Landroid/support/v7/widget/RecyclerView$Adapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper$1;->this$0:Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper$1;->this$0:Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;->notifyDataSetChanged()V

    return-void
.end method

.method public onItemRangeChanged(II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper$1;->this$0:Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;->onHandleWrappedAdapterItemRangeChanged(II)V

    return-void
.end method

.method public onItemRangeInserted(II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper$1;->this$0:Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;->onHandleWrappedAdapterItemRangeInserted(II)V

    return-void
.end method

.method public onItemRangeMoved(III)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper$1;->this$0:Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;->onHandleWrappedAdapterItemRangeMoved(III)V

    return-void
.end method

.method public onItemRangeRemoved(II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper$1;->this$0:Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;->onHandleWrappedAdapterItemRangeRemoved(II)V

    return-void
.end method
