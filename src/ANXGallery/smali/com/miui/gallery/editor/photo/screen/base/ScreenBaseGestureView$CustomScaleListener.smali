.class Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;
.super Ljava/lang/Object;
.source "ScreenBaseGestureView.java"

# interfaces
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CustomScaleListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;-><init>(Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;)V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->mState:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$State;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$State;->BY_CHILD:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$State;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->access$300(Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;)Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->access$300(Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;)Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;->onScale(Landroid/view/ScaleGestureDetector;)Z

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    sget-object v2, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$State;->SCALE_MOVE:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$State;

    iput-object v2, v1, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->mState:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$State;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->access$200(Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;)Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;

    move-result-object v1

    if-nez v1, :cond_1

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v1, v0, v1

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget v2, v2, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mMaxWidthScale:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result p1

    invoke-virtual {v1, v0, v2, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->performScale(FFF)V

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->mState:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$State;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$State;->BY_CHILD:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$State;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->access$300(Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;)Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->access$300(Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;)Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;->onScaleBegin(Landroid/view/ScaleGestureDetector;)Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$State;->SCALE_MOVE:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$State;

    iput-object v0, p1, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->mState:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$State;

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->mState:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$State;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$State;->BY_CHILD:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$State;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->access$300(Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;)Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$CustomScaleListener;->this$0:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->access$300(Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;)Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;->onScaleEnd(Landroid/view/ScaleGestureDetector;)V

    :cond_0
    return-void
.end method
