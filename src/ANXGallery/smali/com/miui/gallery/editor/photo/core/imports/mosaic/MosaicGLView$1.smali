.class Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;
.super Ljava/lang/Object;
.source "MosaicGLView.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$FeatureGesListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mIsFirst:Z

.field public mMatrixValues:[F

.field private mPaintingItem:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;

.field private mPoint:[F

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 p1, 0x9

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mMatrixValues:[F

    const/4 p1, 0x2

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mPoint:[F

    return-void
.end method

.method private addPoint([FZ)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Landroid/graphics/RectF;

    move-result-object v0

    const/4 v1, 0x0

    aget v2, p1, v1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$100(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)F

    move-result v3

    sub-float/2addr v2, v3

    iput v2, v0, Landroid/graphics/RectF;->left:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Landroid/graphics/RectF;

    move-result-object v0

    aget v2, p1, v1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$100(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)F

    move-result v3

    add-float/2addr v2, v3

    iput v2, v0, Landroid/graphics/RectF;->right:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Landroid/graphics/RectF;

    move-result-object v0

    const/4 v2, 0x1

    aget v3, p1, v2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$100(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)F

    move-result v4

    sub-float/2addr v3, v4

    iput v3, v0, Landroid/graphics/RectF;->top:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Landroid/graphics/RectF;

    move-result-object v0

    aget p1, p1, v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$100(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)F

    move-result v3

    add-float/2addr p1, v3

    iput p1, v0, Landroid/graphics/RectF;->bottom:F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Landroid/graphics/RectF;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$1100(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)[F

    move-result-object v0

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$1200(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$1300(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-static {p1, v0, v3, v4}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->generateVertexPositionToBitmap(Landroid/graphics/RectF;[FFF)V

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$1100(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)[F

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;-><init>([F)V

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$900(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    move-result-object p2

    invoke-virtual {p2, p1, v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->drawRect(Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;Z)V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$900(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    move-result-object p2

    invoke-virtual {p2, p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->drawRect(Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;Z)V

    :goto_0
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mPaintingItem:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;->add(Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->requestRender()V

    return-void
.end method


# virtual methods
.method public onActionUp(FF)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mPaintingItem:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$800(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mPaintingItem:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$700(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p1, p2, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->record(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$900(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$800(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->capture(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->requestRender()V

    :cond_0
    return-void
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object p1

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mMatrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mMatrixValues:[F

    const/4 v0, 0x0

    aget p1, p1, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$200(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$300(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float v1, v1, v2

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    div-float/2addr v1, p1

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$102(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;F)F

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mPaintingItem:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mIsFirst:Z

    return p1
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 0

    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)V
    .locals 1

    iget-boolean p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mIsFirst:Z

    const/4 p4, 0x0

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object p3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mPoint:[F

    invoke-virtual {p3, p1, v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->convertPointToBitmapCoordinate(Landroid/view/MotionEvent;[F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mPoint:[F

    const/4 p3, 0x1

    invoke-direct {p0, p1, p3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->addPoint([FZ)V

    iput-boolean p4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mIsFirst:Z

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$600(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object p1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mPoint:[F

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->convertPointToBitmapCoordinate(Landroid/view/MotionEvent;[F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mPoint:[F

    invoke-direct {p0, p1, p4}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->addPoint([FZ)V

    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;->access$400(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mPoint:[F

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->convertPointToBitmapCoordinate(Landroid/view/MotionEvent;[F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->mPoint:[F

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$1;->addPoint([FZ)V

    return-void
.end method
