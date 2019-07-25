.class Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$3;
.super Ljava/lang/Object;
.source "RemoverMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;
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

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$500(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/app/remover/RemoverAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/remover/RemoverAdapter;->getSelection()I

    move-result p1

    if-ne p1, p3, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$600(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    iget v0, p1, Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;->mType:I

    invoke-static {p2, v0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$702(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;I)I

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$800(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;->setRemoverData(Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$500(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/app/remover/RemoverAdapter;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/miui/gallery/editor/photo/app/remover/RemoverAdapter;->setSelection(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$900(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->getProgress()I

    move-result p2

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;I)I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$1000(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;

    int-to-float p1, p1

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;->setPaintSize(F)V

    const/4 p1, 0x1

    return p1
.end method
