.class Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$2;
.super Ljava/lang/Object;
.source "MatrixTransition.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$2;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$2;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;->access$002(Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;[Landroid/graphics/Matrix;)[Landroid/graphics/Matrix;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$2;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;->access$100(Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;)Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$MatrixUpdateListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$2;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;->access$100(Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;)Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$MatrixUpdateListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$MatrixUpdateListener;->onAnimationEnd()V

    :cond_0
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$2;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;->access$002(Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;[Landroid/graphics/Matrix;)[Landroid/graphics/Matrix;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$2;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;->access$100(Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;)Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$MatrixUpdateListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$2;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;->access$100(Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;)Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$MatrixUpdateListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$MatrixUpdateListener;->onAnimationEnd()V

    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$2;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;->access$100(Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;)Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$MatrixUpdateListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$2;->this$0:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;->access$100(Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;)Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$MatrixUpdateListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$MatrixUpdateListener;->onAnimationStart()V

    :cond_0
    return-void
.end method
