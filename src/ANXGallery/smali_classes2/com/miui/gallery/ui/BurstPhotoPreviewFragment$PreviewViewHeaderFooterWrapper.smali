.class Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;
.super Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;
.source "BurstPhotoPreviewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PreviewViewHeaderFooterWrapper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper<",
        "Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;",
        "Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-direct {p0, p2}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;-><init>(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic onCreateHeaderFooterViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;->onCreateHeaderFooterViewHolder(Landroid/view/View;)Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    move-result-object p1

    return-object p1
.end method

.method protected onCreateHeaderFooterViewHolder(Landroid/view/View;)Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;
    .locals 1

    new-instance v0, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    invoke-direct {v0, p1}, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;-><init>(Landroid/view/View;)V

    return-object v0
.end method
