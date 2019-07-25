.class Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$1;
.super Ljava/lang/Object;
.source "TransitionHelper.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition$OnUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->startAutoTransition(FFI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$1;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onUpdate(FF)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$1;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    invoke-static {v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string p1, "TransitionHelper"

    const-string p2, "from view released while updating transition"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$1;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    invoke-static {p1, v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$100(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;Z)V

    return-void

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$1;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    invoke-static {v2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$200(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;

    move-result-object v2

    invoke-virtual {v2, v0, p1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->updateProgress(Landroid/support/v7/widget/RecyclerView;F)V

    invoke-static {p1, p2}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-nez v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$1;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    const v0, 0x3f7d70a4    # 0.99f

    cmpl-float p2, p2, v0

    if-lez p2, :cond_1

    const/4 v1, 0x1

    :cond_1
    invoke-static {p1, v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$100(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;Z)V

    goto :goto_0

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$1;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    invoke-static {p2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$400(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$1;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    invoke-static {v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$1;->this$0:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    invoke-static {v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->access$300(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)Ljava/lang/ref/WeakReference;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    invoke-interface {p2, v0, v1, p1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;->onTransitionUpdate(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;F)V

    :goto_0
    return-void
.end method
