.class Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$5;
.super Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;
.source "EditableListViewWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$5;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    invoke-super {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onChanged()V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$5;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$2200(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V

    return-void
.end method

.method public onItemRangeChanged(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeChanged(II)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$5;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$2200(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V

    return-void
.end method

.method public onItemRangeChanged(IILjava/lang/Object;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeChanged(IILjava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$5;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$2200(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V

    return-void
.end method

.method public onItemRangeInserted(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeInserted(II)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$5;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$2200(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V

    return-void
.end method

.method public onItemRangeMoved(III)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeMoved(III)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$5;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$2200(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V

    return-void
.end method

.method public onItemRangeRemoved(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeRemoved(II)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$5;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$2200(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V

    return-void
.end method
