.class Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$1;
.super Ljava/lang/Object;
.source "MosaicMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 0

    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;->onItemClick(Landroid/support/v7/widget/RecyclerView;I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Landroid/widget/ImageView;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setSelected(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$100(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setSelected(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$200(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;I)V

    const/4 p1, 0x1

    return p1
.end method
