.class Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$3;
.super Ljava/lang/Object;
.source "MosaicMenuFragment.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


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

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    mul-int/lit8 p2, p2, 0x7e

    int-to-float p1, p2

    const/high16 p2, 0x42c80000    # 100.0f

    div-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    add-int/lit8 p1, p1, 0x23

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$600(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->setPaintSize(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$700(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;->setMosaicPaintSize(I)V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 4

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$600(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$800(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/ui/SimpleRecyclerView;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$900(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)I

    move-result v1

    neg-int v1, v1

    div-int/lit8 v1, v1, 0x2

    const/16 v2, 0x11

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v2, v3, v1}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->showAtLocation(Landroid/view/View;III)V

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$600(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->dismiss()V

    return-void
.end method
