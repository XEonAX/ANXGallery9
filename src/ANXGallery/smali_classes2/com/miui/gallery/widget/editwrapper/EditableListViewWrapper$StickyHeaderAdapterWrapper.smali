.class Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;
.super Ljava/lang/Object;
.source "EditableListViewWrapper.java"

# interfaces
.implements Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StickyHeaderAdapterWrapper"
.end annotation


# instance fields
.field private mWrapped:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

.field final synthetic this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;->mWrapped:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    return-void
.end method


# virtual methods
.method public getHeaderCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;->mWrapped:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderCount()I

    move-result v0

    return v0
.end method

.method public getHeaderId(I)J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;->mWrapped:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getHeaderIndex(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;->mWrapped:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderIndex(I)I

    move-result p1

    return p1
.end method

.method public getHeaderViewType(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;->mWrapped:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderViewType(I)I

    move-result p1

    return p1
.end method

.method public getItemPositionInterval(I)[I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;->mWrapped:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getItemPositionInterval(I)[I

    move-result-object p1

    return-object p1
.end method

.method public onBindHeaderViewHolder(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;->mWrapped:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->onBindHeaderViewHolder(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;I)V

    iget-object p1, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    instance-of v0, p1, Lcom/miui/gallery/ui/CheckableView;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/ui/CheckableView;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {v0, p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$1900(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;Lcom/miui/gallery/ui/CheckableView;I)V

    :cond_0
    return-void
.end method

.method public onCreateHeaderViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;->mWrapped:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->onCreateHeaderViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object p1

    return-object p1
.end method
