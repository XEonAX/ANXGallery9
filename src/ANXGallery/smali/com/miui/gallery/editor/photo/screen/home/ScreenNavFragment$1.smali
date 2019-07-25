.class Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$1;
.super Ljava/lang/Object;
.source "ScreenNavFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;)Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$Callback;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;)Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$Callback;

    move-result-object v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;)Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->getSelection()I

    move-result v5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->access$200(Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    invoke-interface/range {v1 .. v6}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$Callback;->OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IILcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;)Z

    move-result p1

    return p1
.end method
