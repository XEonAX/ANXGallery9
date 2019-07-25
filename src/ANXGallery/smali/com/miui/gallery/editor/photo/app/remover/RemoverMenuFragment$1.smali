.class Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$1;
.super Ljava/lang/Object;
.source "RemoverMenuFragment.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;I)I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$100(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->setPaintSize(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$200(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;

    int-to-float p1, p1

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;->setPaintSize(F)V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;I)I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$100(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->setPaintSize(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$100(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$300(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/ui/SimpleRecyclerView;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060339

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

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

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$100(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->dismiss()V

    return-void
.end method
