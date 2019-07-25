.class Lcom/edmodo/cropper/cropwindow/handle/CornerHandleHelper;
.super Lcom/edmodo/cropper/cropwindow/handle/HandleHelper;
.source "CornerHandleHelper.java"


# direct methods
.method constructor <init>(Lcom/edmodo/cropper/cropwindow/edge/Edge;Lcom/edmodo/cropper/cropwindow/edge/Edge;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/edmodo/cropper/cropwindow/handle/HandleHelper;-><init>(Lcom/edmodo/cropper/cropwindow/edge/Edge;Lcom/edmodo/cropper/cropwindow/edge/Edge;)V

    return-void
.end method


# virtual methods
.method updateCropWindow(FFFLandroid/graphics/RectF;F)V
    .locals 8

    invoke-virtual {p0, p1, p2, p3}, Lcom/edmodo/cropper/cropwindow/handle/CornerHandleHelper;->getActiveEdges(FFF)Lcom/edmodo/cropper/cropwindow/edge/EdgePair;

    move-result-object v0

    iget-object v7, v0, Lcom/edmodo/cropper/cropwindow/edge/EdgePair;->primary:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    iget-object v0, v0, Lcom/edmodo/cropper/cropwindow/edge/EdgePair;->secondary:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    move-object v1, v7

    move v2, p1

    move v3, p2

    move-object v4, p4

    move v5, p5

    move v6, p3

    invoke-virtual/range {v1 .. v6}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->adjustCoordinate(FFLandroid/graphics/RectF;FF)V

    invoke-virtual {v0, p3}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->adjustCoordinate(F)V

    invoke-virtual {v0, p4, p5}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->isOutsideMargin(Landroid/graphics/RectF;F)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {v0, p4}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->snapToRect(Landroid/graphics/RectF;)F

    invoke-virtual {v7, p3}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->adjustCoordinate(F)V

    :cond_0
    return-void
.end method
