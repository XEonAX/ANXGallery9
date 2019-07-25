.class Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;
.super Ljava/lang/Object;
.source "TransitionHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->startTransition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IFF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

.field final synthetic val$zoomFlag:I


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    iput p2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;->val$zoomFlag:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    invoke-static {v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$500(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const-string v0, "TransitionHelper"

    const-string v1, "cur state %s doesn\'t support auto transition"

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    invoke-static {v2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$500(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_0
    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    invoke-static {v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    invoke-static {v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$300(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/support/v7/widget/RecyclerView;

    iget v6, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;->val$zoomFlag:I

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    invoke-static {v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$600(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;

    move-result-object v0

    iget-wide v7, v0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;->mFromAnchorId:J

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    invoke-static {v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$600(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;

    move-result-object v0

    iget-wide v9, v0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;->mToAnchorId:J

    invoke-static/range {v3 .. v10}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$700(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IJJ)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$800(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;I)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    iget v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;->val$zoomFlag:I

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$900(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;FFI)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$100(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;Z)V

    :goto_0
    return-void
.end method
