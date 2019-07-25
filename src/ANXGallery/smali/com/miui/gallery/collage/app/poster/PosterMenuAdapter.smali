.class Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;
.super Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$Adapter;
.source "PosterMenuAdapter.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$Adapter<",
        "Lcom/miui/gallery/collage/app/poster/PosterHolder;",
        ">;",
        "Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

.field private mImageCount:I

.field private mPosterList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/collage/core/poster/PosterModel;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/List;Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/collage/core/poster/PosterModel;",
            ">;",
            "Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$Adapter;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->mContext:Landroid/content/Context;

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    const/4 v0, 0x0

    invoke-direct {p1, v0, p3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;-><init>(ILcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    iput-object p2, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->mPosterList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->mPosterList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getSelection()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->getSelection()I

    move-result v0

    return v0
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/collage/app/poster/PosterHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->onBindViewHolder(Lcom/miui/gallery/collage/app/poster/PosterHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/collage/app/poster/PosterHolder;I)V
    .locals 3

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->mPosterList:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/collage/core/poster/PosterModel;

    iget v2, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->mImageCount:I

    invoke-virtual {p1, v0, v1, v2, p2}, Lcom/miui/gallery/collage/app/poster/PosterHolder;->setPosterModel(Landroid/content/res/Resources;Lcom/miui/gallery/collage/core/poster/PosterModel;II)V

    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/collage/app/poster/PosterHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/collage/app/poster/PosterHolder;
    .locals 1

    new-instance p2, Lcom/miui/gallery/collage/app/poster/PosterHolder;

    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->mContext:Landroid/content/Context;

    invoke-direct {p2, p1, v0}, Lcom/miui/gallery/collage/app/poster/PosterHolder;-><init>(Landroid/view/ViewGroup;Landroid/content/Context;)V

    return-object p2
.end method

.method public onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$Adapter;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method

.method public setImageCount(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->mImageCount:I

    return-void
.end method

.method public setSelection(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/app/poster/PosterMenuAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->setSelection(I)V

    return-void
.end method
