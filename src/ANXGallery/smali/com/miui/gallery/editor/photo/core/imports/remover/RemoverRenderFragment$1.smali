.class Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;
.super Ljava/lang/Object;
.source "RemoverRenderFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$RemoverCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRemoveStart()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$200(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->setIsProcessing(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$300(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$300(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;->onMenuEnabled(Z)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$500(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$400(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$ProgressRunnable;

    move-result-object v1

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public removeDone(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$500(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$400(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$ProgressRunnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$600(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {v2, p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$702(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;)Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->recordCurrent()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$300(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$300(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;

    move-result-object p1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$800(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$900(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)I

    move-result v3

    if-eq v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-interface {p1, v2, v1}, Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;->onMenuUpdated(ZZ)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$200(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->setIsProcessing(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$300(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$300(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;

    move-result-object p1

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;->onMenuEnabled(Z)V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Landroid/widget/Button;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setVisibility(I)V

    return-void
.end method
