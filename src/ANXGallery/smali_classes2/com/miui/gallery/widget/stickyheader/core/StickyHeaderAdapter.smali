.class public interface abstract Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;
.super Ljava/lang/Object;
.source "StickyHeaderAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<VH:",
        "Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract getHeaderCount()I
.end method

.method public abstract getHeaderId(I)J
.end method

.method public abstract getHeaderIndex(I)I
.end method

.method public abstract getHeaderViewType(I)I
.end method

.method public abstract getItemPositionInterval(I)[I
.end method

.method public abstract onBindHeaderViewHolder(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TVH;I)V"
        }
    .end annotation
.end method

.method public abstract onCreateHeaderViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)TVH;"
        }
    .end annotation
.end method
