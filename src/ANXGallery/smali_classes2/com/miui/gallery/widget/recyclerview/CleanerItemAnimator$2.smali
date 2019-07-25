.class Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator$2;
.super Ljava/lang/Object;
.source "CleanerItemAnimator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator;->animateRemoveImpl(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator;

.field final synthetic val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator$2;->this$0:Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator;

    iput-object p2, p0, Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator$2;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator$2;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const-string v1, "alpha"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    const-wide/16 v2, 0x15e

    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator$2;->this$0:Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator;

    invoke-static {v2}, Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator;->access$000(Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator;)Landroid/view/animation/Interpolator;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v2, Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator$2$1;

    invoke-direct {v2, p0, v0}, Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator$2$1;-><init>(Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator$2;Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
