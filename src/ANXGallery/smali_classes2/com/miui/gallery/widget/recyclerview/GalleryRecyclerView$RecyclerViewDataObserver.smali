.class Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;
.super Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;
.source "GalleryRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RecyclerViewDataObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;->this$0:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;-><init>(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;)V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    invoke-super {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onChanged()V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;->this$0:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-static {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->access$100(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;)V

    return-void
.end method

.method public onItemRangeChanged(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeChanged(II)V

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;->this$0:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->access$100(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;)V

    return-void
.end method

.method public onItemRangeChanged(IILjava/lang/Object;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeChanged(IILjava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;->this$0:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->access$100(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;)V

    return-void
.end method

.method public onItemRangeInserted(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeInserted(II)V

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;->this$0:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->access$100(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;)V

    return-void
.end method

.method public onItemRangeMoved(III)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeMoved(III)V

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;->this$0:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->access$100(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;)V

    return-void
.end method

.method public onItemRangeRemoved(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeRemoved(II)V

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;->this$0:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->access$100(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;)V

    return-void
.end method
