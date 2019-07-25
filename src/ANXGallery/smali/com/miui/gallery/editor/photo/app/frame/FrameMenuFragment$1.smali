.class Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment$1;
.super Ljava/lang/Object;
.source "FrameMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 0

    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;->onItemClick(Landroid/support/v7/widget/RecyclerView;I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;)Lcom/miui/gallery/editor/photo/app/frame/FrameAdapter;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/miui/gallery/editor/photo/app/frame/FrameAdapter;->setSelection(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;

    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->access$100(Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;I)V

    const/4 p1, 0x1

    return p1
.end method
