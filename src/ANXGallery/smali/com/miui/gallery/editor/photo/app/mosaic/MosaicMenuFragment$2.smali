.class Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$2;
.super Ljava/lang/Object;
.source "MosaicMenuFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Landroid/widget/ImageView;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setSelected(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$100(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setSelected(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$300(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/app/mosaic/MosaicAdapter;

    move-result-object p1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicAdapter;->setSelection(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$500(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$400(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;->setMosaicData(Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;)V

    return-void
.end method
