.class Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$3;
.super Ljava/lang/Object;
.source "TextMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 2

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->access$300(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

    move-result-object p2

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;->getItemData(I)Lcom/miui/gallery/editor/photo/core/common/model/TextData;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->access$400(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->access$100(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;->getItemCount()I

    move-result v1

    add-int/2addr v1, p3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->add(Lcom/miui/gallery/editor/photo/core/Metadata;Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->access$300(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

    move-result-object p2

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;->setSelection(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->access$100(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;

    move-result-object p2

    const/4 v0, -0x1

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/text/TextBubbleAdapter;->setSelection(I)V

    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;->onItemClick(Landroid/support/v7/widget/RecyclerView;I)V

    const/4 p1, 0x1

    return p1
.end method
