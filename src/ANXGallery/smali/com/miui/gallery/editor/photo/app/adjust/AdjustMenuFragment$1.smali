.class Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment$1;
.super Ljava/lang/Object;
.source "AdjustMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;)Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->getSelection()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p3, :cond_0

    return p2

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;

    const/4 v0, 0x0

    invoke-static {p1, p3, v0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;->access$100(Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;IZ)V

    return p2
.end method
