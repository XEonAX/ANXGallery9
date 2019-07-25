.class Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;
.super Ljava/lang/Object;
.source "Crop.java"

# interfaces
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScaleListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1502(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2500(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)F

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->mapRadius(F)F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    mul-float v3, v0, v1

    cmpl-float v3, v3, v2

    if-lez v3, :cond_0

    div-float v0, v2, v1

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result p1

    invoke-virtual {v1, v0, v0, v2, p1}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2600(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2600(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;->onChanged()V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->invalidate()V

    const/4 p1, 0x1

    return p1
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2700(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$BoundsFixCallback;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->fixImageBounds(Landroid/graphics/RectF;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$BoundsFixCallback;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2000(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    return-void
.end method
