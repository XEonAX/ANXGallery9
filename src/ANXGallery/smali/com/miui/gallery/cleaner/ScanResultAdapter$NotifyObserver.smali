.class Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;
.super Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;
.source "ScanResultAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cleaner/ScanResultAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NotifyObserver"
.end annotation


# instance fields
.field private mDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

.field final synthetic this$0:Lcom/miui/gallery/cleaner/ScanResultAdapter;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/cleaner/ScanResultAdapter;Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->this$0:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->mDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    return-void
.end method


# virtual methods
.method public getDataObserver()Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->mDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    return-object v0
.end method

.method public getHeaderSize()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->this$0:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/ScanResultAdapter;->access$500(Lcom/miui/gallery/cleaner/ScanResultAdapter;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0
.end method

.method public onChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->mDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onChanged()V

    return-void
.end method

.method public onItemRangeChanged(II)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->mDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->getHeaderSize()I

    move-result v1

    add-int/2addr p1, v1

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeChanged(II)V

    return-void
.end method

.method public onItemRangeChanged(IILjava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->mDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->getHeaderSize()I

    move-result v1

    add-int/2addr p1, v1

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeChanged(IILjava/lang/Object;)V

    return-void
.end method

.method public onItemRangeInserted(II)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->mDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->getHeaderSize()I

    move-result v1

    add-int/2addr p1, v1

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeInserted(II)V

    return-void
.end method

.method public onItemRangeMoved(III)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->mDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeMoved(III)V

    return-void
.end method

.method public onItemRangeRemoved(II)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->mDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/ScanResultAdapter$NotifyObserver;->getHeaderSize()I

    move-result v1

    add-int/2addr p1, v1

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeRemoved(II)V

    return-void
.end method
