.class Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment$1;
.super Ljava/lang/Object;
.source "BeautifyFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->access$000(Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;)Lcom/miui/gallery/editor/photo/app/beautify/BeautifyAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyAdapter;->getSelection()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p3, :cond_0

    return p2

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->access$100(Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;)[I

    move-result-object v0

    aget v0, v0, p3

    const/4 v1, 0x0

    invoke-static {p1, p3, v0, v1}, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;->access$200(Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;IIZ)V

    return p2
.end method
