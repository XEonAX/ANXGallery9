.class Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$1;
.super Ljava/lang/Object;
.source "DoodleMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 0

    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;->onItemClick(Landroid/support/v7/widget/RecyclerView;I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->access$100(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;->setDoodleData(Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->access$200(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;->getSelection()I

    move-result p1

    if-ne p3, p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->access$200(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;->setSelection(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->access$200(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleAdapter;->notifyDataSetChanged()V

    const/4 p1, 0x1

    return p1
.end method
