.class Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;
.super Ljava/lang/Object;
.source "ScreenCropView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ResizeDetector"
.end annotation


# instance fields
.field private mResizeEdge:I

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->mResizeEdge:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;-><init>(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V

    return-void
.end method

.method static synthetic access$3200(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->mResizeEdge:I

    return p0
.end method

.method static synthetic access$3202(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->mResizeEdge:I

    return p1
.end method

.method static synthetic access$3300(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;FF)I
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->resolveResizeEdge(FF)I

    move-result p0

    return p0
.end method

.method static synthetic access$3600(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;FF)Landroid/graphics/PointF;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->onFreeResize(FF)Landroid/graphics/PointF;

    move-result-object p0

    return-object p0
.end method

.method private calculateMinSize()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2600(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2500(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRadius(F)F

    move-result v0

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    const/16 v1, 0xc8

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method private checkOtherBoundOffset(IFLandroid/graphics/RectF;)F
    .locals 2

    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p1

    iget p1, p1, Landroid/graphics/RectF;->left:F

    iget p3, p3, Landroid/graphics/RectF;->left:F

    sub-float/2addr p1, p3

    cmpl-float p3, p1, v1

    if-lez p3, :cond_7

    cmpl-float p3, p2, p1

    if-lez p3, :cond_0

    goto :goto_0

    :cond_0
    move p1, p2

    :goto_0
    sub-float/2addr p2, p1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p3

    iget v0, p3, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, p1

    iput v0, p3, Landroid/graphics/RectF;->left:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$1300(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/Matrix;

    move-result-object p3

    neg-float p1, p1

    invoke-virtual {p3, p1, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$1400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V

    goto/16 :goto_4

    :cond_1
    and-int/lit8 v0, p1, 0x10

    if-eqz v0, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p1

    iget p1, p1, Landroid/graphics/RectF;->top:F

    iget p3, p3, Landroid/graphics/RectF;->top:F

    sub-float/2addr p1, p3

    cmpl-float p3, p1, v1

    if-lez p3, :cond_7

    cmpl-float p3, p2, p1

    if-lez p3, :cond_2

    goto :goto_1

    :cond_2
    move p1, p2

    :goto_1
    sub-float/2addr p2, p1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p3

    iget v0, p3, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, p1

    iput v0, p3, Landroid/graphics/RectF;->top:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$1500(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/Matrix;

    move-result-object p3

    neg-float p1, p1

    invoke-virtual {p3, v1, p1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$1600(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V

    goto :goto_4

    :cond_3
    and-int/lit16 v0, p1, 0x100

    if-eqz v0, :cond_5

    iget p1, p3, Landroid/graphics/RectF;->right:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p3

    iget p3, p3, Landroid/graphics/RectF;->right:F

    sub-float/2addr p1, p3

    cmpl-float p3, p1, v1

    if-lez p3, :cond_7

    cmpl-float p3, p2, p1

    if-lez p3, :cond_4

    goto :goto_2

    :cond_4
    move p1, p2

    :goto_2
    sub-float/2addr p2, p1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p3

    iget v0, p3, Landroid/graphics/RectF;->right:F

    add-float/2addr v0, p1

    iput v0, p3, Landroid/graphics/RectF;->right:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$1700(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/Matrix;

    move-result-object p3

    invoke-virtual {p3, p1, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$1800(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V

    goto :goto_4

    :cond_5
    and-int/lit16 p1, p1, 0x1000

    if-eqz p1, :cond_7

    iget p1, p3, Landroid/graphics/RectF;->bottom:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p3

    iget p3, p3, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr p1, p3

    cmpl-float p3, p1, v1

    if-lez p3, :cond_7

    cmpl-float p3, p2, p1

    if-lez p3, :cond_6

    goto :goto_3

    :cond_6
    move p1, p2

    :goto_3
    sub-float/2addr p2, p1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p3

    iget v0, p3, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v0, p1

    iput v0, p3, Landroid/graphics/RectF;->bottom:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$1900(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/Matrix;

    move-result-object p3

    invoke-virtual {p3, v1, p1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2000(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V

    :cond_7
    :goto_4
    return p2
.end method

.method private constraint(FF)F
    .locals 1

    add-float/2addr p2, p1

    mul-float p1, p1, p2

    const/4 v0, 0x0

    cmpg-float p1, p1, v0

    if-gez p1, :cond_0

    return v0

    :cond_0
    return p2
.end method

.method private onFreeResize(FF)Landroid/graphics/PointF;
    .locals 12

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$900(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$1000(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$1100(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->calculateMinSize()I

    move-result v3

    iget v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->mResizeEdge:I

    const/4 v5, 0x1

    and-int/2addr v4, v5

    const/16 v6, 0x100

    const/4 v7, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    const/high16 v9, 0x40000000    # 2.0f

    if-eqz v4, :cond_4

    iget v4, v2, Landroid/graphics/RectF;->left:F

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v5

    iget v5, v5, Landroid/graphics/RectF;->left:F

    sub-float/2addr v4, v5

    iget v5, v0, Landroid/graphics/RectF;->left:F

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->left:F

    sub-float/2addr v5, v10

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->right:F

    iget-object v11, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v11}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v11

    iget v11, v11, Landroid/graphics/RectF;->left:F

    sub-float/2addr v10, v11

    neg-int v11, v3

    int-to-float v11, v11

    invoke-direct {p0, v10, v11}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->constraint(FF)F

    move-result v10

    cmpg-float v11, p1, v4

    if-gez v11, :cond_0

    move p1, v4

    :cond_0
    cmpg-float v4, p1, v5

    if-gez v4, :cond_2

    sub-float p1, v5, p1

    invoke-direct {p0, v6, p1, v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result p1

    cmpl-float v4, p1, v7

    if-lez v4, :cond_1

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v4

    div-float/2addr p1, v4

    sub-float p1, v8, p1

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v4

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v6

    iget v6, v6, Landroid/graphics/RectF;->right:F

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->top:F

    iget-object v11, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v11}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v11

    iget v11, v11, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v10, v11

    div-float/2addr v10, v9

    invoke-virtual {v4, p1, v6, v10}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->performScale(FFF)V

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v4

    iget v6, v4, Landroid/graphics/RectF;->top:F

    sub-float p1, v8, p1

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v10

    invoke-virtual {v10}, Landroid/graphics/RectF;->height()F

    move-result v10

    mul-float v10, v10, p1

    div-float/2addr v10, v9

    add-float/2addr v6, v10

    iput v6, v4, Landroid/graphics/RectF;->top:F

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v4

    iget v6, v4, Landroid/graphics/RectF;->bottom:F

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v10

    invoke-virtual {v10}, Landroid/graphics/RectF;->height()F

    move-result v10

    mul-float p1, p1, v10

    div-float/2addr p1, v9

    sub-float/2addr v6, p1

    iput v6, v4, Landroid/graphics/RectF;->bottom:F

    :cond_1
    move p1, v5

    goto :goto_0

    :cond_2
    cmpl-float v4, p1, v10

    if-lez v4, :cond_3

    move p1, v10

    :cond_3
    :goto_0
    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v4

    iget v5, v4, Landroid/graphics/RectF;->left:F

    add-float/2addr v5, p1

    iput v5, v4, Landroid/graphics/RectF;->left:F

    goto/16 :goto_2

    :cond_4
    iget v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->mResizeEdge:I

    and-int/2addr v4, v6

    if-eqz v4, :cond_9

    iget v4, v2, Landroid/graphics/RectF;->right:F

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v6

    iget v6, v6, Landroid/graphics/RectF;->right:F

    sub-float/2addr v4, v6

    iget v6, v0, Landroid/graphics/RectF;->right:F

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->right:F

    sub-float/2addr v6, v10

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->left:F

    iget-object v11, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v11}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v11

    iget v11, v11, Landroid/graphics/RectF;->right:F

    sub-float/2addr v10, v11

    int-to-float v11, v3

    invoke-direct {p0, v10, v11}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->constraint(FF)F

    move-result v10

    cmpl-float v11, p1, v4

    if-lez v11, :cond_5

    move p1, v4

    :cond_5
    cmpl-float v4, p1, v6

    if-lez v4, :cond_7

    sub-float/2addr p1, v6

    invoke-direct {p0, v5, p1, v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result p1

    cmpl-float v4, p1, v7

    if-lez v4, :cond_6

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v4

    div-float/2addr p1, v4

    sub-float p1, v8, p1

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v5

    iget v5, v5, Landroid/graphics/RectF;->left:F

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->top:F

    iget-object v11, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v11}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v11

    iget v11, v11, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v10, v11

    div-float/2addr v10, v9

    invoke-virtual {v4, p1, v5, v10}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->performScale(FFF)V

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v4

    iget v5, v4, Landroid/graphics/RectF;->top:F

    sub-float p1, v8, p1

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v10

    invoke-virtual {v10}, Landroid/graphics/RectF;->height()F

    move-result v10

    mul-float v10, v10, p1

    div-float/2addr v10, v9

    add-float/2addr v5, v10

    iput v5, v4, Landroid/graphics/RectF;->top:F

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v4

    iget v5, v4, Landroid/graphics/RectF;->bottom:F

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v10

    invoke-virtual {v10}, Landroid/graphics/RectF;->height()F

    move-result v10

    mul-float p1, p1, v10

    div-float/2addr p1, v9

    sub-float/2addr v5, p1

    iput v5, v4, Landroid/graphics/RectF;->bottom:F

    :cond_6
    move p1, v6

    goto :goto_1

    :cond_7
    cmpg-float v4, p1, v10

    if-gez v4, :cond_8

    move p1, v10

    :cond_8
    :goto_1
    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v4

    iget v5, v4, Landroid/graphics/RectF;->right:F

    add-float/2addr v5, p1

    iput v5, v4, Landroid/graphics/RectF;->right:F

    :cond_9
    :goto_2
    iget v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->mResizeEdge:I

    const/16 v5, 0x10

    and-int/2addr v4, v5

    const/16 v6, 0x1000

    if-eqz v4, :cond_e

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v4

    iget v4, v4, Landroid/graphics/RectF;->top:F

    sub-float/2addr v2, v4

    iget v4, v0, Landroid/graphics/RectF;->top:F

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v5

    iget v5, v5, Landroid/graphics/RectF;->top:F

    sub-float/2addr v4, v5

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v5

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->top:F

    sub-float/2addr v5, v10

    neg-int v3, v3

    int-to-float v3, v3

    invoke-direct {p0, v5, v3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->constraint(FF)F

    move-result v3

    cmpg-float v5, p2, v2

    if-gez v5, :cond_a

    move p2, v2

    :cond_a
    cmpg-float v2, p2, v4

    if-gez v2, :cond_c

    sub-float p2, v4, p2

    invoke-direct {p0, v6, p2, v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result p2

    cmpl-float v0, p2, v7

    if-lez v0, :cond_b

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v0

    div-float/2addr p2, v0

    sub-float p2, v8, p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->right:F

    add-float/2addr v1, v2

    div-float/2addr v1, v9

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v0, p2, v1, v2}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->performScale(FFF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v0

    iget v1, v0, Landroid/graphics/RectF;->left:F

    sub-float/2addr v8, p2

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p2

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result p2

    mul-float p2, p2, v8

    div-float/2addr p2, v9

    add-float/2addr v1, p2

    iput v1, v0, Landroid/graphics/RectF;->left:F

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p2

    iget v0, p2, Landroid/graphics/RectF;->right:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    mul-float v8, v8, v1

    div-float/2addr v8, v9

    sub-float/2addr v0, v8

    iput v0, p2, Landroid/graphics/RectF;->right:F

    :cond_b
    move p2, v4

    goto :goto_3

    :cond_c
    cmpl-float v0, p2, v3

    if-lez v0, :cond_d

    move p2, v3

    :cond_d
    :goto_3
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v0

    iget v1, v0, Landroid/graphics/RectF;->top:F

    add-float/2addr v1, p2

    iput v1, v0, Landroid/graphics/RectF;->top:F

    goto/16 :goto_5

    :cond_e
    iget v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->mResizeEdge:I

    and-int/2addr v4, v6

    if-eqz v4, :cond_13

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v4

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v2, v4

    iget v4, v0, Landroid/graphics/RectF;->bottom:F

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v6

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v4, v6

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v6

    iget v6, v6, Landroid/graphics/RectF;->top:F

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v6, v10

    int-to-float v3, v3

    invoke-direct {p0, v6, v3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->constraint(FF)F

    move-result v3

    cmpl-float v6, p2, v2

    if-lez v6, :cond_f

    move p2, v2

    :cond_f
    cmpl-float v2, p2, v4

    if-lez v2, :cond_11

    sub-float/2addr p2, v4

    invoke-direct {p0, v5, p2, v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result p2

    cmpl-float v0, p2, v7

    if-lez v0, :cond_10

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v0

    div-float/2addr p2, v0

    sub-float p2, v8, p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->right:F

    add-float/2addr v1, v2

    div-float/2addr v1, v9

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0, p2, v1, v2}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->performScale(FFF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v0

    iget v1, v0, Landroid/graphics/RectF;->left:F

    sub-float/2addr v8, p2

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p2

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result p2

    mul-float p2, p2, v8

    div-float/2addr p2, v9

    add-float/2addr v1, p2

    iput v1, v0, Landroid/graphics/RectF;->left:F

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p2

    iget v0, p2, Landroid/graphics/RectF;->right:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    mul-float v8, v8, v1

    div-float/2addr v8, v9

    sub-float/2addr v0, v8

    iput v0, p2, Landroid/graphics/RectF;->right:F

    :cond_10
    move p2, v4

    goto :goto_4

    :cond_11
    cmpg-float v0, p2, v3

    if-gez v0, :cond_12

    move p2, v3

    :cond_12
    :goto_4
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v0

    iget v1, v0, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v1, p2

    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    :cond_13
    :goto_5
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$1200(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/PointF;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$1200(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/PointF;

    move-result-object p1

    return-object p1
.end method

.method private resolveResizeEdge(FF)I
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2100(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    const/high16 v2, 0x40400000    # 3.0f

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2100(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)F

    move-result v1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    div-float/2addr v3, v2

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2100(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)F

    move-result v3

    sub-float/2addr v2, v3

    cmpl-float v2, p2, v2

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2100(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)F

    move-result v3

    add-float/2addr v2, v3

    cmpg-float v2, p2, v2

    if-gez v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2100(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)F

    move-result v3

    sub-float/2addr v2, v3

    cmpl-float v2, p1, v2

    if-lez v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->left:F

    add-float/2addr v2, v1

    cmpg-float v2, p1, v2

    if-gez v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v2, v1

    cmpl-float v1, p1, v2

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->right:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2100(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)F

    move-result v2

    add-float/2addr v1, v2

    cmpg-float v1, p1, v1

    if-gez v1, :cond_1

    const/16 v1, 0x100

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2100(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)F

    move-result v3

    sub-float/2addr v2, v3

    cmpl-float v2, p1, v2

    if-lez v2, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->right:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2100(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)F

    move-result v3

    add-float/2addr v2, v3

    cmpg-float p1, p1, v2

    if-gez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p1

    iget p1, p1, Landroid/graphics/RectF;->top:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2100(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)F

    move-result v2

    sub-float/2addr p1, v2

    cmpl-float p1, p2, p1

    if-lez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p1

    iget p1, p1, Landroid/graphics/RectF;->top:F

    add-float/2addr p1, v0

    cmpg-float p1, p2, p1

    if-gez p1, :cond_2

    or-int/lit8 v1, v1, 0x10

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p1

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr p1, v0

    cmpl-float p1, p2, p1

    if-lez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object p1

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2100(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)F

    move-result v0

    add-float/2addr p1, v0

    cmpg-float p1, p2, p1

    if-gez p1, :cond_3

    or-int/lit16 v1, v1, 0x1000

    :cond_3
    :goto_1
    return v1
.end method


# virtual methods
.method protected fixImageBounds(Landroid/graphics/RectF;Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixCallback;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2200(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/Matrix;

    move-result-object v0

    new-instance v1, Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2300(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    invoke-virtual {v1, p1}, Landroid/graphics/RectF;->contains(Landroid/graphics/RectF;)Z

    move-result v2

    if-nez v2, :cond_4

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2, v0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3, v0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v4

    cmpl-float v0, v0, v4

    if-gtz v0, :cond_0

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v4

    cmpl-float v0, v0, v4

    if-lez v0, :cond_1

    :cond_0
    invoke-static {v1, p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->resolveScale(Landroid/graphics/RectF;Landroid/graphics/RectF;)F

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    invoke-virtual {v3, v0, v0, v4, v5}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->access$2400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v3, v1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    :cond_1
    invoke-virtual {v1, p1}, Landroid/graphics/RectF;->contains(Landroid/graphics/RectF;)Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    invoke-static {v1, p1, v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->resolveTranslate(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/PointF;)V

    iget p1, v0, Landroid/graphics/PointF;->x:F

    iget v1, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual {v3, p1, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    const-string p1, "ScreenCropView"

    const-string v1, "fixImageBounds %f,%f"

    iget v4, v0, Landroid/graphics/PointF;->x:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    iget v0, v0, Landroid/graphics/PointF;->y:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-static {p1, v1, v4, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    if-nez p2, :cond_3

    const/4 p2, 0x0

    goto :goto_0

    :cond_3
    new-instance v0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixListener;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-direct {v0, v1, p2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixListener;-><init>(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixCallback;)V

    move-object p2, v0

    :goto_0
    invoke-virtual {p1, v2, v3, p2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->setupImageAnimator(Landroid/graphics/Matrix;Landroid/graphics/Matrix;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mImageAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_1

    :cond_4
    if-eqz p2, :cond_5

    invoke-interface {p2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixCallback;->onDone()V

    :cond_5
    :goto_1
    return-void
.end method
