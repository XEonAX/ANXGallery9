.class Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder$1;
.super Ljava/lang/Object;
.source "BurstPhotoPreviewFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;->bindImage(ZLjava/lang/String;Landroid/net/Uri;IILcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder$1;->this$1:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder$1;->this$1:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;

    iget-object p1, p1, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder$1;->this$1:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;

    iget-object v0, v0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->scrollToPosition(I)V

    return-void
.end method
