.class Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$6;
.super Ljava/lang/Object;
.source "Crop.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$6;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$6;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$6;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$6;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$6;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1100(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)I

    move-result v0

    add-int/lit8 v0, v0, -0x5a

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1102(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;I)I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$6;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/Matrix;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$6;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$6;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/Matrix;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/Matrix;->reset()V

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
