.class public Lcom/miui/gallery/video/editor/adapter/VideoNavAdapter;
.super Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;
.source "VideoNavAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter<",
        "Lcom/miui/gallery/video/editor/adapter/VideoNavHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mNavigatorData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/video/editor/model/MenuFragmentData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/video/editor/model/MenuFragmentData;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/video/editor/adapter/VideoNavAdapter;->mNavigatorData:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/VideoNavAdapter;->mNavigatorData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/video/editor/adapter/VideoNavHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/video/editor/adapter/VideoNavAdapter;->onBindViewHolder(Lcom/miui/gallery/video/editor/adapter/VideoNavHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/video/editor/adapter/VideoNavHolder;I)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/VideoNavAdapter;->mNavigatorData:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/video/editor/model/MenuFragmentData;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/adapter/VideoNavHolder;->bind(Lcom/miui/gallery/video/editor/model/MenuFragmentData;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/video/editor/adapter/VideoNavAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/video/editor/adapter/VideoNavHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/video/editor/adapter/VideoNavHolder;
    .locals 3

    new-instance p2, Lcom/miui/gallery/video/editor/adapter/VideoNavHolder;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/adapter/VideoNavAdapter;->getInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b005f

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/miui/gallery/video/editor/adapter/VideoNavHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method
